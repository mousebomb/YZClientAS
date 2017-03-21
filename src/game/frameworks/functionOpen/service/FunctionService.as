/**
 * Created by Administrator on 2017/3/10.
 */
package game.frameworks.functionOpen.service
{
    import game.frameworks.functionOpen.model.FunctionOpenModel;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.MsgKey;

    import tl.Net.Socket.Connect;
    import tl.Net.Socket.Order;

    public class FunctionService extends Actor
    {

        [Inject]
        public var connect:Connect;
        [Inject]
        public var model: FunctionOpenModel;
        public function FunctionService()
        {
            super();
        }
        public function init():void
        {
            connect.addOrderCallBack(""+MsgKey.MsgType_Client+""+MsgKey.MsgId_Common_OpenFunction,onMsgId_Common_OpenFunction);
            connect.addOrderCallBack(""+MsgKey.MsgType_Client+""+MsgKey.MsgId_Common_OpenFunctionNew,onMsgId_Common_OpenFunctionNew);
        }
        /**功能开放*/
        private function onMsgId_Common_OpenFunction(order:Order):void
        {
            model.updateOpenFunction(order);
        }
        /**添加新功能*/
        private function onMsgId_Common_OpenFunctionNew(order:Order):void
        {
            model.openFunctionNew(order)
        }
    }
}
