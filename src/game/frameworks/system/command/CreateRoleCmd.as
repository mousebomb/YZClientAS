/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.command
{
    import game.frameworks.NotifyConst;
    import game.view.ui.uieditor.CreateRole_UI;

    import org.robotlegs.mvcs.Command;

    public class CreateRoleCmd extends Command
    {
        public function CreateRoleCmd()
        {
            super();
        }


        override public function execute():void
        {

            // 关闭加载画面
            dispatchWith(NotifyConst.CLOSE_LOADING_UI);

            contextView.addChild(new CreateRole_UI());
        }
    }
}
