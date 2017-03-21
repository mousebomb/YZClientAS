/**
 * Created by gaord on 2017/3/4.
 */
package game.frameworks.system.command
{
	import game.frameworks.Config;
	import game.frameworks.system.model.CsvDataModel;
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.StatsService;

	import org.robotlegs.mvcs.Command;

	import tl.core.GPUResProvider;

	import tool.StageFrame;

	public class LoadCsvCmd extends Command
	{
		public function LoadCsvCmd()
		{
			super();
		}

		[Inject]
		public var csvModel:CsvDataModel;


		[Inject]
		public var stats:StatsService;
		[Inject]
		public var gpuRes:GPUResProvider;

		override public function execute():void
		{
			stats.scendStepToScever(StepType.step_7);

			stats.scendStepToScever(StepType.step_8);

			/** 加载csv **/
			csvModel.init();
		}
	}
}
