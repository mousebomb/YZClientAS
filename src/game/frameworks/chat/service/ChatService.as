/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.chat.service
{
	import game.frameworks.NotifyConst;
    import game.frameworks.chat.model.ChatModel;

    import org.robotlegs.mvcs.Actor;

	import tl.Net.MsgKey;

	import tl.Net.Socket.Connect;
	import tl.Net.Socket.Order;

	public class ChatService extends Actor
	{
		[Inject]
		public var connect:Connect;
		[Inject]
		public var chatModel: ChatModel;
		public function ChatService()
		{
			super();
		}

		public function init():void
		{
			connect.addOrderCallBack(""+MsgKey.MsgType_Client+""+MsgKey.MsgId_Chat_Message,onMsg);
			connect.addOrderCallBack(""+MsgKey.MsgType_Client+""+MsgKey.MsgId_Chat_ShowItem,onChatItem);
			connect.addOrderCallBack(""+MsgKey.MsgType_Client+""+MsgKey.MsgId_Common_SystemTips,onSystemTips);
		}
		/**聊天消息*/
		private function onMsg(order:Order):void
		{

		}
		/**聊天物品展示*/
		private function onChatItem(order:Order):void
		{

		}

		/**系统提示 uint nInfoPos, const utf8* text, ushort nMsgBoxVerifyType(默认0; nInfoPos=InfoPos_MsgBoxVerify时使用)*/
		private function onSystemTips(order:Order):void
		{
			var id:int 		= order.readInt();
			var text:String = order.readUTF();
			var type:int 	= order.readShort();
			switch (type)
			{
				case 0 :
					dispatchWith(NotifyConst.SHOW_SCREEN_LAMP, false, '<a href="">谁谁谁</a>通过官方充值系统充值了魔晶。<a href="">我要充值</a> ');
					break;
				case 1 :
                    dispatchWith(NotifyConst.SHOW_SCREEN_FLOATING, false, '通过官方充值系统充值了魔晶。 ');
					break;
				case 2 :
					break;

			}
		}
	}
}
