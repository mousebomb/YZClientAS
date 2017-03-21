/**
 * Created by gaord on 2017/3/7.
 */
package game.frameworks.system.mediator
{
    import com.demonsters.debugger.MonsterDebugger;
    import com.greensock.TweenLite;

    import flash.geom.Point;

	import game.frameworks.NotifyConst;
	import game.frameworks.system.model.GameMapModel;
	import game.frameworks.system.model.MyselfModel;
	import game.frameworks.system.model.vo.MyselfVO;
	import game.frameworks.system.view.Myself;

	import org.robotlegs.mvcs.Mediator;

	import tl.core.role.ActionName;

    import tool.StageFrame;

    public class MyselfMediator extends Mediator
	{
		[Inject]
		public var myselfModel:MyselfModel;
		[Inject]
		public var mapModel:GameMapModel;
		[Inject]
		public var myself:Myself;
		[Inject]
		public var myselfVO:MyselfVO;

		public function MyselfMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			onSCCreatePlayer( null );

			addContextListener(NotifyConst.SC_CREATE_PLAYER, onSCCreatePlayer);
			addContextListener(NotifyConst.AI_SKILLMOVE2MOVE, onAIMove);
			addContextListener(NotifyConst.AI_MOVE, onAIMove);
			addContextListener(NotifyConst.AI_MOVE_END, onAIMoveEnd);
			addContextListener(NotifyConst.AI_MOVE_BEGIN, onAIMoveBegin);
			addContextListener(NotifyConst.AI_STAND, onAIStand);

			addContextListener(NotifyConst.MAP_VO_INITED, onMAP_VO_INITED);
            addContextListener(NotifyConst.SC_ENTERMAP,onSC_ENTERMAP);
		}
        /** 主角进入地图 此时地图一定可用 */
        private function onSC_ENTERMAP( n: * ):void
        {
           // TODO del debug only
            debugMapHook();
           // TODO ENDOF debug only 
            myself.x = myselfVO.x;
            myself.z = myselfVO.z;
            myself.y = mapModel.getHeightWithRigidBody(myselfVO.x, myselfVO.z);
        }

		private function onMAP_VO_INITED(n:*):void
		{
			myself.y = mapModel.getHeightWithRigidBody(myselfVO.x, myselfVO.z);
		}

		private function onAIStand(n:*):void
		{
			myself.bodyUnit.playAction(ActionName.stand);
            StageFrame.stage.frameRate = 30;
		}

		private function onAIMoveBegin(n:*):void
		{
            StageFrame.stage.frameRate = 60;
            var p:Point = n.data;
			// 朝向
			var angle:Number = Math.atan2(p.y - myselfVO.WEntity_PosY, p.x - myselfVO.WEntity_PosX) / Math.PI * 180;
            if(angle- myself.rotationY > 180) myself.rotationY +=360;
            if(angle- myself.rotationY < -180) myself.rotationY -=360;
            TweenLite.killTweensOf(myself);
            TweenLite.to(myself,0.5,{rotationY:angle});
			//			//# 通知服务器移动;
//			trace(StageFrame.renderIdx, "[MyselfMediator]/onAIMoveBegin", angle);
			myself.bodyUnit.playAction(ActionName.run);
            MonsterDebugger.trace("[MyselfMediator]/onAIMoveBegin()" , [myselfVO,p],"bomb","angle="+angle,0x990000);
		}

		private function onAIMoveEnd(n:*):void
		{
			var p:Point = n.data;
			validateMovePosition(p.x,p.y);
            MonsterDebugger.trace("[MyselfMediator]/onAIMoveEnd()" , p,"bomb","",0x990000);
		}

		/** 更新移动 */
		private function onAIMove(n:*):void
		{
			var node:Point = n.data;
			validateMovePosition(node.x, node.y);
            MonsterDebugger.trace("[MyselfMediator]/onAIMove()" , node,"bomb","",0x990000);
		}

		private function validateMovePosition(x:uint, y:uint):void
		{
			myselfVO.WEntity_PosX = x;
			myselfVO.WEntity_PosY = y;
//			trace(StageFrame.renderIdx, "[MyselfMediator]/validateMovePosition", myselfVO.WEntity_PosX, myselfVO.WEntity_PosY);
			myself.x = myselfVO.x;
			myself.z = myselfVO.z;
			myself.y = mapModel.getHeightWithRigidBody(myselfVO.x, myselfVO.z);
		}

		private function onSCCreatePlayer(n:*):void
		{
			// 再次监听到，说明vo发生变化
			myself.actor3DInIt(myselfVO);
			// TODO del debug only
            debugMapHook();
			// TODO ENDOF debug only
			myself.x = myselfVO.x;
			myself.z = myselfVO.z;
			if (mapModel.mapVO)
			{
				myself.y = mapModel.getHeightWithRigidBody(myselfVO.x, myselfVO.z);
			}
			MonsterDebugger.trace("[MyselfMediator]/onSCCreatePlayer()" , [myself.x,myself.z,myself.y],"bomb","",0x990000);
		}


        private function debugMapHook():void
        {
            if(mapModel.mapVO && mapModel.mapVO.funcPoints[0])
            {
                myselfModel.vo.WEntity_PosX=mapModel.mapVO.funcPoints[0].tileX*32;
                myselfModel.vo.WEntity_PosY=mapModel.mapVO.funcPoints[0].tileY*32;
            }else
            {
                myselfModel.vo.WEntity_PosX = 180 * 32;
                myselfModel.vo.WEntity_PosY = 362 * 32;
//                myselfModel.vo.WEntity_PosX = -10000 ;
//                myselfModel.vo.WEntity_PosY = -10000 ;
            }

        }

	}
}
