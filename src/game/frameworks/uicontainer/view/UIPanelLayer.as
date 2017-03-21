/**
 * Created by gaord on 2017/3/1.
 */
package game.frameworks.uicontainer.view
{
    import game.view.ui.uieditor.RoleInfoPanel_UI;

    import starling.display.Sprite;

    public class UIPanelLayer extends Sprite
    {
        //角色信息界面
        public static const ROLE_INFO_PANEL:String = "ROLE_INFO_PANEL";

        public var roleInfoPanel:RoleInfoPanel_UI;

        public function UIPanelLayer()
        {
            super();
        }

        /**
         * Dialog层和tip层添加到Panel中
         */
        public function initAppUI():void
        {
            addChild(App.dialog);
            addChild(App.tip);
//			addChild(App.log);
        }

        /**
         * 初始化dialogs
         */
        public function initDialogs():void
        {
        }

        /**
         * 初始化View   View需要addChild
         */
        public function initViews():void
        {
        }

        public function showPanel(panelName:String):void
        {
            switch (panelName)
            {
                case ROLE_INFO_PANEL:
                    roleInfoPanel = roleInfoPanel || new RoleInfoPanel_UI();
                    roleInfoPanel.show();
                    break;
                default:
                    break;
            }

        }
    }
}
