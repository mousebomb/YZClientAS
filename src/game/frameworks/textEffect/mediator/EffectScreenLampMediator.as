/**
 * Created by Administrator on 2017/3/6.
 */
package game.frameworks.textEffect.mediator
{
	import game.frameworks.textEffect.view.EffectScreenLamp;

	import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;

	import tool.StageFrame;
	/**走马灯*/
	public class EffectScreenLampMediator extends Mediator
	{
		[Inject]
		public var view: EffectScreenLamp;
		public function EffectScreenLampMediator()
		{
			super();
		}

		override public function onRemove():void
		{
			super.onRemove();
		}

		override public function onRegister():void
		{
			onResize();
			eventMap.mapListener(view.stage,Event.RESIZE, onResize);
		}
		private function onResize(event:* = null):void
		{
			view.x = StageFrame.stage.stageWidth - view.myWidth >> 1;
		}

	}
}
