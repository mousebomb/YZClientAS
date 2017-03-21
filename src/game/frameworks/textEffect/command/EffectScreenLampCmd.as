/**
 * Created by Administrator on 2017/3/6.
 */
package game.frameworks.textEffect.command
{
	import game.frameworks.textEffect.view.EffectScreenLamp;

	import org.robotlegs.mvcs.Command;

	import starling.events.Event;
	/**走马灯*/
	public class EffectScreenLampCmd extends Command
	{
		[Inject]
		public static var view: EffectScreenLamp;
		[Inject]
		public var event: Event;
		public function EffectScreenLampCmd()
		{
			super();
		}
		override public function execute():void
		{
			if(!view)
			{
				view = new EffectScreenLamp()
			}
			var data:String = event.data as String ;
			view.Label = data;
			contextView.addChild(view);
		}
	}
}
