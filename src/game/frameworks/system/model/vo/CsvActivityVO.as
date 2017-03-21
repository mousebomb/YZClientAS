/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**活动数据表*/
	public class CsvActivityVO
	{
		/**#编号*/
		public var Id:String;
		/**活动名称*/
		public var Name:String;
		/**活动类型*/
		public var Type:int;
		/**前置活动Id*/
		public var PreActId:int;
		/**模型物品id*/
		public var modelId:String;
		/**图标资源包*/
		public var IconPack:String;
		/**按钮皮肤|贴标 */
		public var ButtonSkin:String;
		/**图片名*/
		public var ImageName:String;
		/**活动说明*/
		public var Direction:String;
		/**排序优先级*/
		public var Weights:int;
		/**活动开始时间*/
		public var StartTime:String;
		/**活动结束时间*/
		public var EndTime:String;
		/**开服天数*/
		public var OpenDate:Array;
		/**每周执行*/
		public var DayExecute:Array;
		/**每日执行次数*/
		public var DailyReset:int;
		/**奖励级别*/
		public var RewardLevel:int;
		/**标准1*/
		public var MajorKey1:String;
		/**标准1值*/
		public var MajorKeyValue1:int;
		/**标准2*/
		public var MajorKey2:String;
		/**标准2值*/
		public var MajorKeyValue2:int;
		/**标准3*/
		public var MajorKey3:String;
		/**标准3值*/
		public var MajorKeyValue3:int;
		/**奖品1条件*/
		public var MinorKey1:String;
		/**条件1值*/
		public var MinorKeyValue1:int;
		/**奖品1ID*/
		public var Reward1:Array;
		/**奖品1数量*/
		public var RewardNum1:int;
		/**奖品2条件*/
		public var MinorKey2:String;
		/**条件2值*/
		public var MinorKeyValue2:int;
		/**奖品2ID*/
		public var Reward2:Array;
		/**奖品2数量*/
		public var RewardNum2:int;
		/**奖品3条件*/
		public var MinorKey3:String;
		/**条件3值*/
		public var MinorKeyValue3:int;
		/**奖品3ID*/
		public var Reward3:Array;
		/**奖品3数量*/
		public var RewardNum3:int;
		/**奖品4条件*/
		public var MinorKey4:String;
		/**条件4值*/
		public var MinorKeyValue4:int;
		/**奖品4ID*/
		public var Reward4:Array;
		/**奖品4数量*/
		public var RewardNum4:int;
		/**奖品5条件*/
		public var MinorKey5:String;
		/**条件5值*/
		public var MinorKeyValue5:int;
		/**奖品5ID*/
		public var Reward5:Array;
		/**奖品5数量*/
		public var RewardNum5:int;
		/**启用状态*/
		public var OnOff:Array;
		/**是否需要前端显示当前*/
		public var IsShowContent:int;
		/**奖励是否一直可以领*/
		public var NoRewardInterval:int;
		/**奖励是否其他系统发放*/
		public var ExternalReward:int;
		/**可领取时需要显示领取状态*/
		public var isNeedEffect:int;
		/**私有数据*/
		public var privateData:Array;
		/**日常活动时间*/
		public var dailyActivityTime:String;
		/**活动地图id*/
		public var activityMapId:int;
		/**活动等级*/
		public var activityLevel:int;
		/**结束后奖励开放天数*/
		public var RewardReserveDays:int;
		/**兑换类型绑定数据*/
		public var ExchangeData:Array;
		/**活动Buff*/
		public var BuffId:Array;
		/**活动开放效果*/
		public var OpenEffect:Array;
	}
}
