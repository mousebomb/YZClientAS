/**
 * Created by rhett on 2017/3/21.
 */
package game.frameworks.system.command
{
    import game.frameworks.NotifyConst;
    import game.frameworks.system.model.MyselfModel;

    import org.robotlegs.mvcs.Command;

    public class FakeEnterGameCmd extends Command
    {
        public function FakeEnterGameCmd()
        {
            super();
        }

        [Inject]
        public var myselfModel : MyselfModel;

        override public function execute():void
        {
            myselfModel.createTestPlayer();


            dispatchWith(NotifyConst.ENTER_GAME,false);
            dispatchWith(NotifyConst.LOAD_MAP,false,"map001");
        }
    }
}
