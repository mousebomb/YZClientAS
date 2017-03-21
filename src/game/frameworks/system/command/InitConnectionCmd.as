/**
 * Created by gaord on 2017/3/2.
 */
package game.frameworks.system.command
{
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.StatsService;
	import game.frameworks.system.service.SystemService;

	import org.robotlegs.mvcs.Command;

/** 开始链接服务器 */
	public class InitConnectionCmd extends Command
	{

		public function InitConnectionCmd()
		{
			super();
		}

		[Inject]
		public var systemService:SystemService;

		[Inject]
		public var stats:StatsService;
		override public function execute():void
		{
			stats.scendStepToScever(StepType.step_6);

			systemService.init();
		}
	}
}
