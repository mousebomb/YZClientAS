package game.frameworks.chat.model
{
	public class PopMenuVo
	{
		/**
		 * 名字
		 * 
		 */
		public var name:String;
		
		public var x:Number;
		
		public var y:Number;
		
		public var actorID:int;
		
		/**
		 * 种族角色模型id
		 */
		public var raceId:String;
		
		/**
		 * 用于存放各种通讯数据；
		 * 
		 */
		public var data:Object;
		public var gameWorldId:int;
		/**服务器id		 */		
		public var worldId:int;
		public var playerName:String;		//玩家名字数据
		public var campIconStr:String;		//阵营图标数据
		public var vipIconStr:String;		//黄钻图标数据
		public var lineID:int;				//服务端分线
        /**
         * nameArr：主要填写内容数值即可：0:"创建队伍;
         * 1:发布招募 ;    2: 退出队伍 ;   3: 查看信息;  4:加为好友;
         * 5:私聊;   6:赠送礼物      ;7.转让队长;  8: 请离队伍;
         * 9: 邀请入队;   10:申请入队;
         * 11:跟随  ;  ,12:"炫      耀",   13:"出      售",14:"穿戴装备",15:"打造装备",16:"使      用
         * 17:“赠送物品”     ；18;“拜为导师”    ；19;“收为徒弟”   ；20;“背叛师门”
         * ；21;“逐出师门”;   22：召集, 23:发布悬赏;24,"送礼",25:复制名称，26：约战  27：转移指挥权
		 */
        public var nameIdArr:Array = [];
		/**用于规范定制下拉列表的 数据*/
		public function PopMenuVo()
		{
			
		}
	}
}