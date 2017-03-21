/**
 * Created by gaord on 2017/3/1.
 */
package game.frameworks.uicontainer.mediator
{
	import game.frameworks.uicontainer.NotifyUIConst;
	import game.frameworks.uicontainer.view.UIPanelLayer;
	import game.view.ui.uieditor.RoleInfoPanel_UI;

	import org.robotlegs.mvcs.Mediator;

	import tl.core.GPUResProvider;

	public class UIPanelLayerMediator extends Mediator
	{
		[Inject]
		public var ui:UIPanelLayer;

		public function UIPanelLayerMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			ui.initAppUI();
			ui.initDialogs();
			ui.initViews();

			addContextListener(NotifyUIConst.UI_SHOW_ROLE, showRoleInfoPanel);
		}

		private function showRoleInfoPanel():void
		{
			GPUResProvider.getInstance().preloadUIDependencies(RoleInfoPanel_UI, function ():void
			{
				ui.showPanel(UIPanelLayer.ROLE_INFO_PANEL);
			});
		}
	}
}
