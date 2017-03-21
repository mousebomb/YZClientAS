/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.uicontainer.mediator
{
	import game.frameworks.uicontainer.NotifyUIConst;
	import game.view.ui.uieditor.MainSkillPanel;

	import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;

	import tool.StageFrame;

	/**主界面技能播放*/
	public class MainSkillPanelMediator extends Mediator
	{
		[Inject]
		public var ui: MainSkillPanel;
		public function MainSkillPanelMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			onResize(null);
			eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
			eventMap.mapListener(ui.roleInfoBtn, Event.SELECT, onRoleInfoBtnClick);
		}

		private function onRoleInfoBtnClick(e:Event):void
		{
            dispatchWith(NotifyUIConst.UI_SHOW_ROLE);
		}

		private function onResize(event:Event):void
		{
			ui.x = StageFrame.stage.stageWidth - ui.width >> 1;
			ui.y = StageFrame.stage.stageHeight - ui.height;
		}
	}
}
