/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**物品消耗数据表*/
	public class CsvBlessVO
	{
		/**#合成物品id*/
		public var ID:String;
		/**名称*/
		public var Name:String;
		/**类型*/
		public var Type:int;
		/**需要金币*/
		public var NeedGold:int;
		/**需要魔晶*/
		public var NeedMoney:int;
		/**需要等级*/
		public var NeedPlayerLevel:int;
		/**需要物品*/
		public var NeedItems:Array;
		/**合成后物品ID*/
		public var NextID:int;
		/**失败奖励*/
		public var FailReward:Array;
		/**促销ID*/
		public var PromotionsID:int;
		/**等级*/
		public var BlessLv:int;
		/**最小值*/
		public var BlessMin:int;
		/**最大值*/
		public var BlessMax:int;
		/**暴击率*/
		public var Fdiie:int;
		/**比例*/
		public var BlessProp:int;
		/**概率*/
		public var SucessProp:int;
		/**钱*/
		public var MabeRmb:int;
		/**次数*/
		public var Times:int;
		/**攻击*/
		public var Attack:int;
		/**防御*/
		public var Defense:int;
		/**生命值*/
		public var CurHp:int;
		/**暴击*/
		public var Crit:int;
		/**韧性*/
		public var Tenacity:int;
		/**附加伤害*/
		public var AppendHurt:int;
		/**卓越攻击*/
		public var OutAttack:int;
		/**攻击加成*/
		public var AttackPerc:int;
		/**无视防御*/
		public var LgnoreDefense:int;
		/**吸收伤害*/
		public var AbsorbHurt:int;
		/**防御成功率*/
		public var DefenseSuccess:int;
		/**防御加成*/
		public var DefensePerc:int;
		/**减伤比例*/
		public var OutHurtPerc:int;
		/**吸血*/
		public var Vampire:int;
		/**移动速度*/
		public var MoveSpeed:int;
		/**私有数据*/
		public var PrivateData:Array;
		/**说明*/
		public var ItemExp:String;

	}
}
