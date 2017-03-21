/**
 * Created by Administrator on 2017/3/9.
 */
package game.frameworks.chat.mediator
{
    import com.greensock.easing.Strong;

    import game.frameworks.chat.view.FaceIcons;
    import game.frameworks.chat.view.richText.TextMovieClip;
    import game.frameworks.system.service.MouseCursorManage;
    import game.frameworks.uicontainer.NotifyUIConst;

    import org.robotlegs.mvcs.Mediator;

    import starling.events.Event;

    import tool.StageFrame;

    /**表情动画*/
    public class FaceIconsMediator extends Mediator
    {
        [Inject]
        public var ui: FaceIcons;
        public function FaceIconsMediator()
        {
            super();
        }

        override public function onRegister():void
        {
            onResize(null);
            eventMap.mapListener(ui.stage, Event.RESIZE, onResize);
            eventMap.mapListener(ui, Event.TRIGGERED, onClickUI)
        }
        private function onClickUI(event:Event):void
        {
            if(event.target is TextMovieClip)
            {
                var data:Object = event.data ;
                dispatchWith(NotifyUIConst.UI_ADD_FACEICONS, false, data);
                MouseCursorManage.getInstance().showCursor();
                ui.hideFace();
                if(ui.parent)
                {
                    ui.parent.removeChild(ui);
                }
            }
        }

        private function onResize(event:Event):void
        {
            ui.x = 400;
            ui.y = StageFrame.stage.stageHeight - ui.myHeight - 100;
        }
    }
}
