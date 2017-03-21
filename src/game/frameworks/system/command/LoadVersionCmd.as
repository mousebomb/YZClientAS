/**
 * Created by gaord on 2017/3/4.
 */
package game.frameworks.system.command
{
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.LoginTaskService;
	import game.frameworks.system.service.StatsService;

	import org.robotlegs.mvcs.Command;

	public class LoadVersionCmd extends Command
	{
		public function LoadVersionCmd()
		{
			super();
		}

		[Inject]
		public var stats:StatsService;

		[Inject]
		public var loginTaskService:LoginTaskService;

		override public function execute():void
		{
			stats.scendStepToScever(StepType.step_3);
			loginTaskService.loadVersion();

		}
	}
}
