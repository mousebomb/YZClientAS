/**
 * Created by gaord on 2017/2/27.
 */
package game.frameworks.uicontainer.view
{
    import game.frameworks.chat.view.MainChatPanel;
    import game.frameworks.quest.view.QuestPanel;
    import game.frameworks.uicontainer.view.mainUI.MainActivityIcon;
    import game.frameworks.uicontainer.view.mainUI.MainToolBar;
    import game.view.ui.uieditor.MainRoleInfo;
    import game.view.ui.uieditor.MainSkillPanel;
    import game.view.ui.uieditor.MainWorldMap;

    import starling.display.Sprite;

    // 基础层  底部UI； 右上角活动UI等容器

	public class UIBaseLayer extends Sprite
	{
		public var roleInfo:MainRoleInfo;
		public var mainActivityIcon:MainActivityIcon;
		public var mainWorldMap:MainWorldMap;
		public var mainTaskPanel:QuestPanel;
		public var mainToolBar:MainToolBar;
		public var mainSkillPanel:MainSkillPanel;
		public var mainChatPanel:MainChatPanel;
		private var _isInit:Boolean;			//初始化标志
		public function UIBaseLayer()
		{
			super();
		}
		/**初始化主界面*/
		public function createMainUI():void
		{
			if(_isInit) return;
			_isInit = true;

            roleInfo = new MainRoleInfo() ;
			this.addChild(roleInfo);

			mainActivityIcon = new MainActivityIcon();
			this.addChild(mainActivityIcon);

			mainWorldMap = new MainWorldMap();
			this.addChild(mainWorldMap);

			mainTaskPanel = new QuestPanel();
			this.addChild(mainTaskPanel);

			mainToolBar = new MainToolBar() ;
			this.addChild(mainToolBar);

			mainSkillPanel = new MainSkillPanel();
			this.addChild(mainSkillPanel);

			mainChatPanel = new MainChatPanel();
			this.addChild(mainChatPanel);
		}

	}
}
