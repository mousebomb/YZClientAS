/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.gameLoading.command
{
	import game.frameworks.NotifyConst;
	import game.frameworks.system.command.LoadMapCmd;
	import game.frameworks.uicontainer.view.mainUI.LoadingUI;

	import org.robotlegs.mvcs.Command;
	/**全屏加载界面*/
	public class LoadingCmd extends Command
	{
		private static var ui:LoadingUI
		public function LoadingCmd()
		{
			super();
		}
		override public function execute():void
		{
			if(!ui)
			{
				ui = new LoadingUI();
			}
			contextView.addChild(ui);
		}
	}
}
