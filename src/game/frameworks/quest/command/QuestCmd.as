/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.quest.command
{
    import game.frameworks.quest.model.QuestModel;
    import game.frameworks.quest.service.QuestService;

    import org.robotlegs.mvcs.Command;

	public class QuestCmd extends Command
	{
		[Inject]
		public var service: QuestService;
		public function QuestCmd()
		{
			super();
		}

        override public function execute():void
        {
			service.init();
        }
	}
}
