/** *
 * Created by gaord on 2017/3/1.
 */
package game.frameworks.system.model.vo
{
	public class CsvBuffVO
	{
		/** #状态编号 */
		public var Id:String;
		/** 状态名称 */
		public var Name:String;
		/** 状态描述 */
		public var Desc:String;
		/** 资源包 */
		public var Pack:String;
		/** 图标类名 */
		public var ClassName:String;
		/** 特效图层 */
		public var EffectLyer:int;
		/** 特效添加 */
		public var EffectAdd:int;
		/** 特效持续 */
		public var EffectHold:int;
		/** 特效移除 */
		public var EffectRemove:int;
		/** 状态等级 */
		public var Level:int;
		/** 有益标志 */
		public var Helpful:int;
		/** 最大叠加次数 */
		public var OverlapTimes:int;
		/** 效果列表 */
		public var EffectList:Array;
		/** 持续时间 */
		public var LastTime:int;
		/** 跳跃间隔 */
		public var JumpInterval:int;
		/** 光环范围 */
		public var AuraRange:int;
		/** 友方光环BUFF */
		public var FriendAuraBuff:int;
		/** 敌方光环BUFF */
		public var EnemyAuraBuff:int;
		/** 互斥 */
		public var Mutexs:Array;
		/** 取消方式 */
		public var EndType:int;
		/** 私有数据 */
		public var PrivateData:Array;
	}
}
