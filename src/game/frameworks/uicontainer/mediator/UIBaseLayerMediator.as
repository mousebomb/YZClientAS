/**
 * Created by gaord on 2017/2/27.
 */
package game.frameworks.uicontainer.mediator
{
	import game.frameworks.uicontainer.view.UIBaseLayer;

	import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;

	public class UIBaseLayerMediator extends Mediator
	{
		public function UIBaseLayerMediator()
		{
			super();
		}

		[Inject]
		public var ui:UIBaseLayer;


		override public function onRegister():void
		{
			ui.createMainUI();

		}
	}
}
