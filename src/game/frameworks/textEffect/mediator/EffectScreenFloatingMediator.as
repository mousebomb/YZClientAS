/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.textEffect.mediator
{
    import game.frameworks.textEffect.view.EffectScreenFloating;

    import org.robotlegs.mvcs.Mediator;

    import starling.events.Event;

    import tool.StageFrame;
    /**飘字提示*/
    public class EffectScreenFloatingMediator extends Mediator
    {
        [Inject]
        public var view: EffectScreenFloating;
        public function EffectScreenFloatingMediator()
        {
            super();
        }

        override public function onRegister():void
        {
            onResize();
            eventMap.mapListener(view.stage,Event.RESIZE, onResize);
        }
        private function onResize(event:* = null):void
        {
            view.x = StageFrame.stage.stageWidth - 300 >> 1;
            view.y = StageFrame.stage.stageHeight - 200;
        }
    }
}
