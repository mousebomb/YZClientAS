/**
 * Created by gaord on 2017/3/8.
 */
package game.frameworks.uicontainer.mediator
{
    import game.frameworks.system.model.FrameworkModel;
    import game.frameworks.uicontainer.view.GameUIRoot;

    import org.robotlegs.mvcs.Mediator;

    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    import tool.DebugHelper;
    import tool.StageFrame;

    public class UIRootMediator extends Mediator
	{
		public function UIRootMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			addViewListener(TouchEvent.TOUCH, onUIRootTouch);


		}

		[Inject]
		public var frameworkModel:FrameworkModel;

		private function onUIRootTouch(e:TouchEvent):void
		{
			var touch:Touch;
			touch = e.getTouch(viewComponent as GameUIRoot);
			if (!touch)
			{
                frameworkModel.isUIHovering = false;
//                DebugHelper.debugVal("isUIHovering", false);
            }
			if (touch)
			{
                if (touch.phase == TouchPhase.ENDED)
                {
                    frameworkModel.isUIHovering = false;
//                    DebugHelper.debugVal("isUIHovering", false);
                } else
                {
                    frameworkModel.isUIHovering = true;
//                    DebugHelper.debugVal("isUIHovering", touch.phase);
                }
			}
		}
	}
}
