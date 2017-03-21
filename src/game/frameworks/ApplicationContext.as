/**
 * Created by gaord on 2017/2/4.
 */
package game.frameworks
{
	import game.frameworks.system.command.StartupCmd;
	import game.utils.FrameworkUtil;

	import org.robotlegs.base.ContextEventType;
	import org.robotlegs.mvcs.Context;

	import starling.display.DisplayObjectContainer;

	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer = null)
		{
			super(contextView, false);
			FrameworkUtil.appContext = this;
		}

		override public function startup():void
		{
			commandMap.execute(StartupCmd);

			super.startup();

		}
	}
}
