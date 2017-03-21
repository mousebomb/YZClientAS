/**
 * Created by gaord on 2017/3/1.
 */
package game.frameworks.system.service
{
	import flash.geom.Point;

	import game.frameworks.NotifyConst;

	import game.frameworks.system.model.GameMapModel;
	import game.frameworks.system.model.MyselfModel;
	import game.utils.FrameworkUtil;

	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Actor;

	import tl.core.bevtree.BevNode;
	import tl.core.bevtree.BevNodePreconditionOR;
	import tl.core.bevtree.BevNodePrioritySelector;
	import tl.core.bevtree.BevNodeSequenceSync;

	import tool.StageFrame;

	/** 玩家主角AI行为树  */
	public class MyselfAIService extends Actor
	{
		[Inject]
		public var myselfModel:MyselfModel;
		[Inject]
		public var mapModel:GameMapModel;
		[Inject]
		public var mapService:GameMapService;

		[Inject]
		public var injector:IInjector;

		// 行为树
		private var _bevTreeRoot:BevNode;
		//AI输入数据
		private var _bevInput:AIInputData;

		public function MyselfAIService()
		{
			super();
		}



		// #pragma mark --  外部调用快捷方式  ------------------------------------------------------------
		/**
		 * 3D交互:用户发起点击地面移动 统一采用服务器坐标 所以和显示坐标不同
		 * @param x
		 * @param z (转换成服务器坐标++) */
		public function moveTo(x:Number, z:Number):void
		{
			_bevInput._curTargetEarth        = new Point(x, z);
			_bevInput.curTargetEarthDistance = 0;


			if( _bevInput.movingOneStep )
			{
				_bevInput.movingOneStep = false;
				var curPoint:Point = new Point( myselfModel.vo.WEntity_PosX, myselfModel.vo.WEntity_PosY );
				FrameworkUtil.dispatchEventWith(NotifyConst.AI_MOVE_END,false,curPoint);
			}

		}
		/**
		 * 玩家被动移动（服务器告知） 击退／冲锋／传送后
		 *  要停止当前一格的移动
		 */
		public function clearMoveStep():void
		{
			//			Debugger.bombTrace( "MyselfAIModel/clearMoveStep()", "" );
			_bevInput.movingOneStep = false;
		}

		/**
		 * 停止移动目标
		 */
		public function stopMove():void
		{
			//			Debugger.bevTreeTrace("MyselfAIModel/stopMove()" ,[].join(" , "));
			// 不要再执行移动了
			_bevInput.curTargetEarth = null;
		}


		/** 清除AI的欲望，以设置新的欲望 */
		private function clearWants():void
		{
			trace(StageFrame.renderIdx,"[MyselfAIService]/clearWants");
			//停止攻击和自动攻击
			_bevInput.curTargetCreature = null;
//			_bevInput.myselfModel.autoAtk = false;
			// 标记玩家不再自动战斗某一个特定id
			_bevInput.curAutoBattleForNpcDetailedId = -1;
			// 明确访问就不需要这id了
			_bevInput.curLookingForNpcDetailedId = -1;
//			// 明确采集就不需要id
//			_bevInput.curLookingForMapObjGroupId = -1;
//			_bevInput.curLookingForMapObjImageId = -1;
//			//
//			_bevInput.ydtbEndTime = 0;
			//清空对地技能
			_bevInput.earthSkill = null;
			_bevInput.earthSkillPsn = null;
			//清空移动
			_bevInput.curTargetEarth = null;
//			//置空要访问的动态物件
//			_bevInput.curTargetMapObj = null;
			// 就不捡东西了
			_bevInput.curTargetDropItem = null;
		}

		private var _paused:Boolean = true;
		/**
		 * 是否暂停行为树的ai判定
		 */
		public function get paused():Boolean
		{
			return _paused;
		}

		public function set paused(value:Boolean):void
		{
			if (value == _paused) return;
			_paused = value;
			if (_paused)
				StageFrame.removeActorFun(onEnterFrame);
			else
				StageFrame.addActorFun(onEnterFrame);
		}

		/**
		 * 某些行为需要执行完毕后立即再检测行为AI，则调用validateThisFrame
		 * 如 move一格End
		 */
		private var _validateNow:Boolean = false;

		public function validateThisFrame():void
		{
			_validateNow = true;
		}

		private function onEnterFrame():void
		{
			_bevInput.curTime     = StageFrame.curTime;
			_bevInput.curF        = StageFrame.renderIdx;
			_bevInput.isDoingTask = true;
			if (_bevTreeRoot.evaluate(_bevInput))
			{
				_bevTreeRoot.tick(_bevInput, null);
			}

			if (_validateNow)
			{
				_validateNow      = false;
				_bevInput.curTime = StageFrame.curTime;
				_bevInput.curF    = StageFrame.renderIdx;
				if (_bevTreeRoot.evaluate(_bevInput))
				{
					_bevTreeRoot.tick(_bevInput, null);
				}
			}
		}


		/**初始化行为树*/
		[PostConstruct]
		public function initBehaiveTree():void
		{
			/* ------------------- # 绝对不要对这棵树进行自动排版格式化调整缩进 # ---------------- */
			_bevInput           = injector.instantiate(AIInputData);
			_bevInput.aiService = this;

			paused       = false;
			//
			_bevTreeRoot = new BevNodePrioritySelector("root");
//			// 被动操作（服务器移动）击退
//			_bevTreeRoot.addChild(new AIDoNothing().setPrecondition(new AIIsBackMoving()));
			// 要么完成移动一格（持续一段时间内完成） 正在移动中的不可拆分步骤
			_bevTreeRoot.addChild(new AIMoveOneStep().setPrecondition(new AIIsMovingOneStep()));
			// 要么是死亡和负面效果
			_bevTreeRoot.addChild(new AIDoNothing().setPrecondition(new BevNodePreconditionOR(new AIIsDead, new AIIsDingShen)));
			//巡城状态
			//使用技能中不可移动

			// 要么处理移动（1、点击空地 2、前往目标对象）
			_bevTreeRoot.addChild(new BevNodeSequenceSync("moveEarth").setPrecondition(new AIHasEarthTarget)
					.addChild(new AIFindPath2Earth())
					.addChild(new AIBeginMoveOneStep())
			);
			// 要么傻站着
			_bevTreeRoot.addChild( new AIStand );
		}

	}
}

import com.demonsters.debugger.MonsterDebugger;

import flash.geom.Point;

import game.frameworks.NotifyConst;

import game.frameworks.NotifyConst;

import game.frameworks.NotifyConst;

import game.frameworks.NotifyConst;
import game.frameworks.quest.model.QuestModel;
import game.frameworks.system.model.CsvDataModel;
import game.frameworks.system.model.GameMapModel;
import game.frameworks.system.model.MyselfModel;
import game.frameworks.system.model.UserModel;
import game.frameworks.system.model.vo.CsvSkillVO;
import game.frameworks.system.model.vo.MyselfVO;
import game.frameworks.system.service.MyselfAIService;
import game.utils.FrameworkUtil;
import game.utils.GameRuleUtil;

import starling.utils.MathUtil;

import tl.core.bevtree.BevNodeInputParam;
import tl.core.bevtree.BevNodeOutputParam;
import tl.core.bevtree.BevNodePrecondition;
import tl.core.bevtree.BevNodeTerminal;
import tl.core.mapnode.Node;
import tl.core.role.Role;
import tl.core.terrain.TLMapVO;
import tl.utils.HPointUtil;

import tool.DebugHelper;

import tool.StageFrame;

/**
 * AI 计算中用到的所有数据
 */
class AIInputData extends BevNodeInputParam
{

	[Inject]
	public var myselfVO:MyselfVO;
	[Inject]
	public var csvModel:CsvDataModel;
	// 背包 / 技能
	[Inject]
	public var mapModel:GameMapModel;
	[Inject]
	public var userModel:UserModel;
	[Inject]
	public var myselfModel:MyselfModel;
	[Inject]
	public var questModel:QuestModel;

	public var aiService:MyselfAIService;

	// #2 各项参数
	// 当前行为分析的时刻(免掉每个内部调用getTimer())
	public var curTime:int;
	// 当前第几帧
	public var curF:int;
	// 点怪物后，当前目标对象
	public var curTargetCreature:Role;
	/** 当前拾取物品 */
			   public var curTargetDropItem:*;
	// 如果是打怪，则有当前尝试释放之技能
	public var userSkill:CsvSkillVO;
	// 插入的玩家hotkey释放技能
	public var insertSkill:CsvSkillVO;
	public var insertTargetCreature:Role;
	/** 玩家的对地技能 */
			   public var earthSkill:CsvSkillVO;
	public var earthSkillPsn:Point;
	// 点地面后，当前目标地点
	public var _curTargetEarth:Point;
	/** 标记当前的自动战斗是autoMove发起的目标(detailedNpcId) 还是玩家手动挂机的(-1) */
			   public var curAutoBattleForNpcDetailedId:Number = -1;

	public var lastUseGeneralTime:uint = 0;

	public var isDoingTask:Boolean = true;//玩家正在做任务
	public var lastDoTaskTime:uint = 0;

	public function get curTargetEarth():Point
	{
		return _curTargetEarth;
	}

	public function set curTargetEarth(v:Point):void
	{
		_curTargetEarth = v;
	}

	// 前往目标地点，地点半径（进入此距离内都算抵达，精确移动就是0，找附近的NPC就可用visitdistance）
	public var curTargetEarthDistance:int     = 0;
	// 每个行为都有一定的硬直时间 ; 硬直 存储结束时间
	public var yingZhiEndTime:int;
	// 自动战斗中 找附近的敌人，为防止没找到敌人时一直找，锁死行为，所以要休息下再进行此行为
	public var allow2FindNearestEnemyTime:int = 0;
	// 当前一格移动 （锁定操作 必须一格走完）
	public var movingOneStep:Boolean          = false;
	// 当前要访问的NPC，不知道具体对象，只知道静态id
	public var curLookingForNpcDetailedId:int;


}

/**
 * 死亡 或 其他，不操作
 */
class AIDoNothing extends BevNodeTerminal
{

	override protected function doExecute(input:BevNodeInputParam, output:BevNodeOutputParam):int
	{
//				Debugger.bevTreeTrace("AIDoNothing" ,"" ,"doExecute");
		return BRS_EXECUTING;
	}
}
/**
 * 是否死亡状态
 */
class AIIsDead extends BevNodePrecondition
{
	override public function evaluate(input:BevNodeInputParam):Boolean
	{
		var ip:AIInputData = AIInputData(input);
		return ip.myselfVO.Creature_CurHp == 0;
	}
}
/** 是否不可移动 ，定身了  155天罗地网 */
class AIIsDingShen extends BevNodePrecondition
{

	override public function evaluate(input:BevNodeInputParam):Boolean
	{
		var ip:AIInputData = AIInputData(input);
		return false;
//		return ip.myselfVO.stateList[State.STATE_TIANLUODIWANG];
	}
}
/**
 * 有空地目标/可前往的目标
 */
class AIHasEarthTarget extends BevNodePrecondition
{
	override public function evaluate(input:BevNodeInputParam):Boolean
	{
		var ip:AIInputData = AIInputData(input);
		return ip.curTargetEarth != null;
	}
}
/**
 * 寻找抵达目的地的路径
 */
class AIFindPath2Earth extends BevNodeTerminal
{
	override protected function doExecute(input:BevNodeInputParam, output:BevNodeOutputParam):int
	{
//		trace(StageFrame.curTime,"[AIFindPath2Earth]/doExecute");
		var ip:AIInputData    = AIInputData(input);
		//		var t1 :int = getTimer();
		var myselfVO:MyselfVO   = ip.myselfVO;
		var targetEarth:Point = ip.curTargetEarth;
		// 如果当前位置已经是终点 不用移动了
		if(myselfVO.WEntity_PosX==targetEarth.x &&  myselfVO.WEntity_PosY==targetEarth.y)
		{
			//清除目标，免得反复尝试
			ip.curTargetEarth = null;
			return BRS_FINISH;
		}
		// 如果路径在移动中变化 需要重算路径 否则直接跳过
		if (AIUtil.hasDestChanged(ip, targetEarth.x, targetEarth.y) == false) return BRS_FINISH;

		/** 计算路径 到距离终点最近的可行走点 */
		var paths:Vector.<Node> = ip.mapModel.autoGetPath(myselfVO.WEntity_PosX, myselfVO.WEntity_PosY, targetEarth.x, targetEarth.y);
		if (paths == null || paths.length == 0)
		{
			MonsterDebugger.trace("[AIFindPath2Earth]/doExecute()" , [myselfVO.WEntity_PosX, myselfVO.WEntity_PosY, targetEarth.x, targetEarth.y],"BevTree","寻路失败 清除目标",0xFF0000);
			// 寻路失败 清除目标，免得反复尝试
			ip.curTargetEarth = null;
		}
		else
		{
			// 因为寻了的路 包含当前格子，但是如果是微移动（1格内），要走 ，多格就直接从下一格开始
			if(paths.length>1)
			{
				paths.shift();
			}
            MonsterDebugger.trace("[AIFindPath2Earth]/doExecute()" , [myselfVO.WEntity_PosX, myselfVO.WEntity_PosY, targetEarth.x, targetEarth.y,paths],"BevTree","寻路成功",0xFF0000);
			//
			ip.myselfModel.inMovingPath = paths;
			//玩家点击不可走到的区域后 修正的最接近的可抵达坐标
			var destPoint:Node          = paths[paths.length - 1];
			ip.curTargetEarth.setTo(destPoint.pointX, destPoint.pointY);
		}
		FrameworkUtil.dispatchEventWith(NotifyConst.FIND_PATH, false, paths);
		return BRS_FINISH;
	}
}
/**
 * 向目标路径移动一格
 */
class AIBeginMoveOneStep extends BevNodeTerminal
{
	override protected function doEnter(input:BevNodeInputParam):void
	{
		super.doEnter(input);
		var ip:AIInputData = AIInputData(input);
		//Debugger.bevTreeTrace("AIBeginMoveOneStep" ,"" ,"doEnter");
		//		trace("AIMoveOneStep/doEnter()");
		var paths:Vector.<Node> = ip.myselfModel.inMovingPath;
		if (paths && paths.length)
		{
			// 开始移动
			var myselfVO:MyselfVO   = ip.myselfVO;
			AIMoveOneStep.fromX     = myselfVO.WEntity_PosX;
			AIMoveOneStep.fromY     = myselfVO.WEntity_PosY;
			AIMoveOneStep.nextPoint = paths.shift();
			FrameworkUtil.dispatchEventWith(NotifyConst.AI_MOVE_BEGIN, false, new Point(AIMoveOneStep.nextPoint.pointX,AIMoveOneStep.nextPoint.pointY));
            MonsterDebugger.trace("[AIBeginMoveOneStep]/doEnter()" , paths,"BevTree","",0xFF0000);
			// 计算移动耗时
			AIMoveOneStep.beginTime = ip.curTime;
			//			AIMoveOneStep.duration = myselfVO.moveSpd * .5;

			var distance :Number = HPointUtil.getTowPointDisTance( new Point(AIMoveOneStep.fromX,AIMoveOneStep.fromY ),new Point(AIMoveOneStep.nextPoint.pointX,AIMoveOneStep.nextPoint.pointY));
//			trace(StageFrame.renderIdx,"[AIBeginMoveOneStep]/doEnter",distance ,myselfVO.moveSpeed);
			AIMoveOneStep.duration = GameRuleUtil.moveDurationMS(myselfVO.moveSpeed,distance);
			ip.movingOneStep       = true;
			//			trace(ip.curTime,ip.f,"AIBeginMoveOneStep AI_MOVE_BEGIN");
//			trace(StageFrame.renderIdx,"[AIBeginMoveOneStep]/doEnter AI_MOVE_BEGIN");
			if (ip.myselfVO.castingMovingSkillEndTime > ip.curTime)
			{
				AIMoveOneStep.startedByMovingSkill = true;
			}
		}
		else
		{
			// 无路径可移动
//			ip.myselfModel.inAutoFinPathClickCount = 0;
//			ip.myselfModel.inAutoFindPath          = false;
		}
	}

}
class AIMoveOneStep extends BevNodeTerminal
{
	// 起始格子
	internal static var fromX:Number;
	internal static var fromY:Number;
	// 下个格子
	internal static var nextPoint:Node;
	// 开始移动时刻
	internal static var beginTime:int;
	// 移动持续时间 ms
	internal static var duration:Number;
	// 开始移动时 是否是技能移动 用来实现 角色技能移动 技能动作放完直接换"走"动作
	internal static var startedByMovingSkill:Boolean = false;

	override protected function doExecute(input:BevNodeInputParam, output:BevNodeOutputParam):int
	{
		var ip:AIInputData = AIInputData(input);
		// 控制移动的补间 计算坐标
		var deltaMs:int       = ip.curTime - beginTime;
		var myselfVO:MyselfVO = ip.myselfVO;
		if (isNaN(duration))
		{
			//			Debugger.bombTrace("AIMoveOneStep/doExecute()" ,"isNaN(duration)");
			ip.movingOneStep = false;
			return BRS_FINISH;
		}
		if (deltaMs < duration)
		{
			// # 还在一格移动中
			var tweenPoint:Point = HPointUtil.calcPointInLine(fromX, fromY, nextPoint.pointX, nextPoint.pointY, deltaMs, duration);
			if (startedByMovingSkill && ip.myselfVO.castingMovingSkillEndTime <= ip.curTime)
			{
				// 从"技能"动作切到普通"run"动作
				FrameworkUtil.dispatchEventWith(NotifyConst.AI_SKILLMOVE2MOVE, false,tweenPoint);
				startedByMovingSkill = false;
			}
			FrameworkUtil.dispatchEventWith(NotifyConst.AI_MOVE, false,tweenPoint);
			return BRS_EXECUTING;
		}
		else
		{
			// # 一格移动完成
			var paths:Vector.<Node> = ip.myselfModel.inMovingPath;
			if (paths && paths.length == 0)
			{
				// # 移动到路径最后FINISH
				// 算出来的path走完最后一格了
				// 清空移动
				ip.myselfModel.inMovingPath = null;
				//				// 清空AI的移动 应该再判断寻路的地方清空，因为这里paths数据可能数据不能反映玩家目标
				//				ip.curTargetEarth = null;
				FrameworkUtil.dispatchEventWith(NotifyConst.FIND_PATH,false,paths);
			}
			else
			{
				//				Debugger.bombTrace("AIMoveOneStep/doExecute()" ,"移动一格FINISH");
			}
			FrameworkUtil.dispatchEventWith(NotifyConst.AI_MOVE_END,false, new Point(nextPoint.pointX,nextPoint.pointY));
			ip.aiService.validateThisFrame();
			ip.movingOneStep = false;
//			trace(StageFrame.renderIdx,"[AIMoveOneStep]/doExecute AIMoveOneStep MOVE_END",nextPoint.pointX,nextPoint.pointY);
			return BRS_FINISH;
		}
	}

	public function toString():String
	{
		return "[AIMoveOneStep] 前往"+nextPoint.pointX + ","+nextPoint.pointY;
	}

}

/**
 * 最近一格移动是否在走
 */
class AIIsMovingOneStep extends BevNodePrecondition
{
	override public function evaluate(input:BevNodeInputParam):Boolean
	{
		var ip:AIInputData = AIInputData(input);
		//		trace(ip.f , "AIIsMoving");
		return ip.movingOneStep;
	}
}
class AIUtil
{

	//	private static const POINT_HELPER :Point = new Point();
	/** #2447 根据终点是否相同 判断是否要重新计算路径 */
	public static function hasDestChanged( ip:AIInputData, targetPosX:Number, targetPosY:Number ):Boolean
	{
		/** #2447 根据终点是否相同 判断是否要重新计算路径 */
		var hasChangedDest:Boolean = false;
		var destPointOfOldPath:Node;
		var oldPaths:Vector.<Node> = ip.myselfModel.inMovingPath;
		if( oldPaths == null || oldPaths.length == 0 )
			hasChangedDest = true;
		else
		{
			destPointOfOldPath = oldPaths[oldPaths.length - 1];
			hasChangedDest = (destPointOfOldPath.pointX != targetPosX || destPointOfOldPath.pointY != targetPosY)
		}
//		if(hasChangedDest == false )
//		{
////			trace(ip.curTime,"AIUtil/hasDestChanged() 终点相同 否要重新计算路径");
//			// 将来若地图发生了通断变化，则加入一个强制刷新的变量 变化后强制刷新下
//		}else{
//			trace(ip.curTime,"AIUtil/hasDestChanged() 重新计算路径");
//		}
		return hasChangedDest;
	}
}
/**
 * 傻站着
 */
class AIStand extends BevNodeTerminal
{
	override protected function doEnter( input:BevNodeInputParam ):void
	{
		super.doEnter(input);
		//Debugger.bevTreeTrace("AIStand" ,"" ,"doEnter");
		//		trace("AIStand/doEnter() !!!!!!!");
		FrameworkUtil.dispatchEventWith( NotifyConst.AI_STAND,false ) ;
	}

	override protected function doExecute( input:BevNodeInputParam, output:BevNodeOutputParam ):int
	{
		var ip:AIInputData = AIInputData( input );
		ip.isDoingTask = false;
		return BRS_EXECUTING;
	}
}