/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**物品数据表*/
	public class CsvItemVO
	{
		/**#物品编号*/
		public var Id:String;
		/**图标资源包*/
		public var IconPack:String;
		/**图标类名*/
		public var IconName:String;
		/**模型名*/
		public var ModelName:String;
		/**物品名称*/
		public var Name:String;
		/**物品类型*/
		public var Type:int;
		/**物品说明*/
		public var ItemExp:String;
		/**产出说明*/
		public var OutputExp:String;
		/**使用说明*/
		public var UseExp:String;
		/**等级限制*/
		public var LevelLimit:int;
		/**职业限制*/
		public var JobLimit:int;
		/**绑定规则*/
		public var BindRule:Array;
		/**穿戴位置*/
		public var Position:int;
		/**叠加上限*/
		public var OverlapCount:int;
		/**物品品质*/
		public var Quality:int;
		/**强化等级*/
		public var StrongLv:int;
		/**凹槽数量*/
		public var GrooveNum:int;
		/**技能ID*/
		public var SkillId:int;
		/**套装ID列表*/
		public var SetList:Array;
		/**物品价值*/
		public var ItemValue:int;
		/**出售价格*/
		public var SellPrice:int;
		/**过期时间*/
		public var ExpiredTime:int;
		/**私有数据*/
		public var PrivateData:Array;
		/**镶嵌数据*/
		public var EmbedData:Array;
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
		public var Vampire:Array;
		/**宝石等级*/
		public var Gemrank:int;
		/**参数算式*/
		public var Prop1:int;
		/**强化特效*/
		public var StrengEffect:Array;
		/**获取途径*/
		public var material:Array;
		/**批量使用*/
		public var useType:int;
		/**是否能交易、上架摆滩*/
		public var ProhibitedTransaction:int;
		/**图标标签*/
		public var IconTab:int;
	}
}
