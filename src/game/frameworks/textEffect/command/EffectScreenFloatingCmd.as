/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.textEffect.command
{
    import game.frameworks.textEffect.view.EffectScreenFloating;
    
    import org.robotlegs.mvcs.Command;
    
    import starling.events.Event;
    /**飘字提示*/
    public class EffectScreenFloatingCmd extends Command
	{
        [Inject]
        public static var view: EffectScreenFloating
        [Inject]
        public var event: Event;
		public function EffectScreenFloatingCmd()
		{
			super();
		}
        override public function execute():void
        {
            if(!view)
            {
                view = new EffectScreenFloating();
            }
            var data:String = event.data as String ;
			view.showEffect(data)
            contextView.addChild(view);
        }
	}
}
