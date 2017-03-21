/**
 * Created by Administrator on 2017/3/10.
 */
package game.frameworks.functionOpen.mediator
{
    import game.frameworks.uicontainer.NotifyUIConst;

    import org.robotlegs.mvcs.Mediator;

    import starling.events.Event;

    /**功能开放*/
    public class FunctionOpenMediator extends Mediator
    {
        public function FunctionOpenMediator()
        {
            super();
        }
        override public function onRegister():void
        {
            addContextListener(NotifyUIConst.UI_OPEN_FUNCTION, onFunctionOpen)
        }
        /**开放新功能*/
        private function onFunctionOpen(event:Event):void
        {

        }
    }
}
