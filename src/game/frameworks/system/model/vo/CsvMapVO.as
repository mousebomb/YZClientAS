/**
 * Created by Administrator on 2017/3/2.
 */

package game.frameworks.system.model.vo
{
	/**地图数据表*/
	public class CsvMapVO
	{
		/**编号*/
		public var MapId:String;
		/**名称*/
		public var Name:String;
		/**Xml文件名*/
		public var XmlName:String;
		/**图片名*/
		public var ImageName:String;
		/**场景音乐*/
		public var Music:String;
		/**跳转点序列*/
		public var JumpPoints:Array;
		/**复活点序列*/
		public var RevivePoints:Array;
		/**所属章节*/
		public var Section:int;
		/**章节名字*/
		public var SectionName:String;
		/**场景类型*/
		public var Type:int;
		/**难度等级*/
		public var Difflevel:int;
		/**开放等级*/
		public var OpenLevel:int;
		/**前置条件*/
		public var PreCondition:Array;
		/**消耗体力*/
		public var NeedSp:int;
		/**消耗魔晶*/
		public var NeedRmb:int;
		/**次数限制*/
		public var Count:int;
		/**购买次数*/
		public var BuyTimes:Array;
		/**副本结束时间*/
		public var CloseTime:int;
		/**副本目标*/
		public var KillTarget:Array;
		/**副本产出*/
		public var Output:Array;
		/**通关结算界面奖励*/
		public var Reward:Array;
		/**首次通关奖励*/
		public var FirstReward:Array;
		/**场景介绍*/
		public var Desc:String;
		/**副本人数*/
		public var PersonNum:Array;
		/**定时刷怪*/
		public var CreateMonster:Array;
		/**最低战斗力*/
		public var FightPowerMin:int;
		/**系列副本*/
		public var Series:Array;
		/**关卡怪物*/
		public var StageMonster:Array;
		/**动态跳转点*/
		public var DynamicJumpPoints:Array;
		/**复活道具*/
		public var Revive:int;
		/**主角光照参数*/
		public var LightProp:Array;
		/**加载介绍*/
		public var LoadDesc:String;
		/**私有数据*/
		public var selfdata:String;
		/**构装技能*/
		public var PackageSkill:int;
		/**是否显示复活界面*/
		public var isShowResurgence:int;
		/**通关结算界面*/
		public var ClearanceInterface:int;
		/**首次通关礼包发放*/
		public var FirstPassRewardSend:int;
		/**允许自动挂机*/
		public var AllowAutomatic:Array;
		/**副本提示*/
		public var Prompt:String;
		/**玩家离线的保留时间*/
		public var OfflineKeepTime:int;
		/**是否不区分阵营 默认0区分不同阵营，1不区分（只针对玩家和招唤物）*/
		public var noShowArmy:int;
		/**入场券*/
		public var Ticket:Array;
		/**是否可以上坐骑*/
		public var CanRide:int;
		/**是否限制使用宠物(血脉宠物/战姬宠物/技能宠物)*/
		public var LimitPet:Array;
		/**场景缓存资源*/
		public var ResList:Array;
		/**寻路飞鞋*/
		public var Pathfinding:Array;
		/**自动清理背包*/
		public var AutoCleanPackage:int;
		/**自动分解*/
		public var AutoResolved:int;
		/**是否Roll*/
		public var CanRoll:int;
		/**Roll物品品质*/
		public var RollQuality:int;
		/**退出场景自动战斗*/
		public var autoWar:int;
	}
}
