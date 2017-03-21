/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.command
{
    import game.frameworks.system.model.vo.StepType;
    import game.frameworks.system.service.LoginTaskService;
    import game.frameworks.system.service.StatsService;

    import org.robotlegs.mvcs.Command;

    public class CsvLoadedCmd extends Command
    {
        public function CsvLoadedCmd()
        {
            super();
        }


        [Inject]
        public var stats:StatsService;
        [Inject]
        public var loginTaskService:LoginTaskService;
        override public function execute():void
        {
            //csv loaded
            stats.scendStepToScever(StepType.step_9);
            //
            loginTaskService.onCsvLoaded();
        }
    }
}
