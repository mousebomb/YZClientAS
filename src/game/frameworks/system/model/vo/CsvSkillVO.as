/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**技能数据表*/
	public class CsvSkillVO
	{
		/**技能编号*/
		public var Id:String;
		/**技能名称*/
		public var Name:String;
		/**技能说明*/
		public var Desc:String;
		/**技能等级*/
		public var Level:int;
		/**技能类型*/
		public var Type:int;
		/**系*/
		public var series:Array;
		/**私有数据*/
		public var PrivateData:Array;
		/**学习条件*/
		public var MasterConds:Array;
		/**施放条件*/
		public var CastConds:Array;
		/**引导时间*/
		public var LeadTime:int;
		/**是否显示进度条*/
		public var ShowProgress:int;
		/**施法时间*/
		public var CastTime:int;
		/**持续时间*/
		public var LastTime:int;
		/**作用间隔*/
		public var EffectInterval:int;
		/**是否需要引导*/
		public var NeedLead:int;
		/**作用范围*/
		public var Range:int;
		/**范围参数*/
		public var RangeParams:Array;
		/**组合技*/
		public var Combo:Array;
		/**飞行物速度*/
		public var FlyerSpeed:int;
		/**目标类型*/
		public var TargetType:int;
		/**目标个数*/
		public var TargetsCount:int;
		/**改变位置*/
		public var ChangePos:int;
		/**物理效果*/
		public var Physical:Array;
		/**加成比例*/
		public var BaseValue:int;
		/**附加数值*/
		public var ExtraValue:int;
		/**冷却时间*/
		public var CoolDown:int;
		/**附加状态及几率*/
		public var Buff:Array;
		/**威胁值*/
		public var Threat:int;
		/**图标资源包*/
		public var IconPack:String;
		/**图标类名*/
		public var IconName:String;
		/**附带振屏*/
		public var EarthQuake:Array;
		/**闪光效果*/
		public var FlashLight:Array;
		/**技能动作*/
		public var Action:String;
		/**自身特效*/
		public var MyEffect:Array;
		/**飞行特效*/
		public var MiddleEffect:Array;
		/**受击特效*/
		public var StruckEffect:Array;
		/**范围特效*/
		public var RangeEffect:Array;
		/**施法特效*/
		public var CastEffect:Array;
		/**武器效果*/
		public var WeaponEffect:Array;
		/**自身音效*/
		public var MySound:String;
		/**过程音效*/
		public var MiddleSound:String;
		/**目标音效*/
		public var StruckSound:String;
		/**范围音效*/
		public var RangeSound:String;
	}
}
