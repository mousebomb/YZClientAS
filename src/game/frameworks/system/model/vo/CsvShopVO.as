/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**商店数据表*/
	public class CsvShopVO
	{
		/**#商品编号*/
		public var ID:String;
		/**商店编号*/
		public var ShopId:int;
		/**商店名称*/
		public var ShopName:String;
		/**物品ID*/
		public var ItemId:int;
		/**物品名*/
		public var ItemName:String;
		/**出售类型*/
		public var Type:Array;
		/**排序权重*/
		public var Order:int;
		/**出售图标*/
		public var SellIcon:String;
		/**全服限量*/
		public var WorldLimit:int;
		/**个人限购*/
		public var PersonLimit:int;
		/**VIP等级*/
		public var VipLv:int;
		/**VIP卡*/
		public var VipCard:int;
		/**折扣率*/
		public var Discount :Array;
		/**币种*/
		public var MoneyType:Array;
		/**价格*/
		public var Price:Array;
		/**达到购买条件/数量*/
		public var BuyCondition:Array;
		/**上架类型*/
		public var UpShopType:int;
		/**上架日期*/
		public var UpShopTime:Array;
		/**刷新模式*/
		public var Refresh:int;
		/**开放条件*/
		public var OpenCondition:Array;
		/**商店模版*/
		public var ShopStyle:int;
		/**限时打折类型*/
		public var OnSaleType:int;
		/**限时打折日期*/
		public var OnSaleTime:Array;
		/**限时打折折扣*/
		public var OnSaleDiscount:int;
		/**是否主城成员折扣*/
		public var IsCastleDisc:int;
		/**购买CD*/
		public var CDTime:int;
		/**CD类型*/
		public var CDType:int;
	}
}
