/**
 * Created by gaord on 2017/3/1.
 */
package game.frameworks.system.service
{
    import com.demonsters.debugger.MonsterDebugger;

    import flash.external.ExternalInterface;

    import game.frameworks.NotifyConst;
    import game.frameworks.system.model.LoginTaskModel;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.MsgKey;
    import tl.Net.Socket.Connect;
    import tl.Net.Socket.ConnetEvent;
    import tl.Net.Socket.Order;

    import tool.StageFrame;

    /** 基本通信处理 ； 3D世界 系统的协议处理 */
	public class SystemService extends Actor
	{
		public function SystemService()
		{
			super();
		}

		// #pragma mark --  通信  ------------------------------------------------------------

		[Inject]
		public var connect:Connect;
		[Inject]
		public var loginTaskModel:LoginTaskModel;

		public function init():void
		{
			connect.InIt(loginTaskModel.settingsConf);

			connect.addEventListener(ConnetEvent.ConnetLost, onConnLost);
			connect.addEventListener(ConnetEvent.ConnetSuccess, onConnectSucc);
			connect.addOrderCallBack("" + MsgKey.MsgType_Gateway + MsgKey.MsgId_Gateway_NotifyDisconnect, onNotifyDisconnect);
			connect.addOrderCallBack("" + MsgKey.MsgType_Gateway + MsgKey.MsgId_Gateway_Ping, onPing);
			connect.addOrderCallBack("" + MsgKey.MsgType_Login + MsgKey.MsgId_Login_SwitchState, onSwitchState);
			connect.addOrderCallBack("" + MsgKey.MsgType_Login + MsgKey.MsgId_Login_LoginResponse, onResponse);
			connect.addOrderCallBack("" + MsgKey.MsgType_Login + MsgKey.MsgId_Login_Timestamp, onTimestamp);
			connect.addOrderCallBack("" + MsgKey.MsgType_Login + MsgKey.MsgId_Network_Reconnect, onReconnect);

			connect.addOrderCallBack("" + MsgKey.MsgType_Gateway + MsgKey.MsgId_Gateway_Handshake, onShakeHand);


		}

		private function onShakeHand(order:Order):void
		{
			trace(StageFrame.renderIdx, "[SystemService]/onShakeHand");
			connect.setHoldRand(order.readInt());
		}

		private function onConnLost(event:ConnetEvent):void
		{
			// 派发通知 让UI处理弹框，点击后可调用我的 reLogin();
			dispatchWith(NotifyConst.SC_CONN_LOST);
		}

		private function onConnectSucc(event:ConnetEvent):void
		{
			dispatchWith(NotifyConst.SC_CONN_SUCC, false);
		}

        private var date:Date;
		private function onPing(order:Order):void
		{
            date = new Date();
            connect.sendServer(MsgKey.MsgType_Gateway, MsgKey.MsgId_Gateway_PingReply, [date.time.toString()]);
		}

		private function onResponse(order:Order):void
		{
            //var _Order:Order=e.data as Order;
            var _args:Array=order.GetBodyArray([MsgKey._int,MsgKey._String]);
            if(_args[0]==1){
                //MyTool.getInstance().serveId = int(_args[1]);
            }
            else
            {
                dispatchWith(NotifyConst.SC_LOGIN_RESPONSE,false , _args[1]);
            }
		}

		private function onTimestamp(order:Order):void
		{

		}

		private function onReconnect(order:Order):void
		{
			var id:int = order.readByte();
			if(id == 0) return;
			loginTaskModel.settingsConf.LogicServer=order.readUTF();
			loginTaskModel.settingsConf.LogicPort=order.readInt();
			connect.disconnect();
			connect.InIt(loginTaskModel.settingsConf);
		}

		private function onSwitchState(order:Order):void
		{
			var _int:int = order.readInt();
			dispatchWith(NotifyConst.SC_SWITCH_STATE, false, _int);
		}

		private function onNotifyDisconnect(order:Order):void
		{

		}

		/** 被调用，重新连接 */
		public function reLogin():void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call('relogin')
				//ExternalInterface.call("function onRefreshSocket() {location.reload() ;}")
			}
		}

	}
}
