/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.uicontainer.mediator
{
	import game.view.ui.uieditor.MainWorldMap;

	import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;

	import tool.StageFrame;

	/**世界地图*/
	public class MainWorldMapMediator extends Mediator
	{
		[Inject]
		public var ui: MainWorldMap;
		public function MainWorldMapMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			onResize(null);
			eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
			trace(StageFrame.renderIdx,"MainWorldMapMediator/onRegister", '世界地图创建');
		}

		private function onResize(event:Event):void
		{
			ui.x = StageFrame.stage.stageWidth - ui.width ;
		}
	}
}
