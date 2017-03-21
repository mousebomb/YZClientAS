/**
 * Created by gaord on 2016/12/15.
 */
package game.frameworks.system.command
{
	import game.frameworks.Config;
	import game.frameworks.NotifyConst;
	import game.frameworks.system.model.CsvDataModel;
	import game.frameworks.system.model.LoginTaskModel;
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.LoginTaskService;
	import game.frameworks.system.service.StatsService;

	import org.robotlegs.mvcs.Command;

	import tool.StageFrame;

	/**开始加载setting文件   然后加载最初所有必要的资源 */
	public class LoadSettingsCmd extends Command
	{
		public function LoadSettingsCmd()
		{
		}

		[Inject]
		public var csvModel:CsvDataModel;
		[Inject]
		public var stats:StatsService;
		[Inject]
		public var loginTaskService:LoginTaskService;

		override public function execute():void
		{
			Config.PROJECT_URL = "./assets/";

			// 处理 setting.xml config
			loginTaskService.loadSettingsXML();

			stats.scendStepToScever(StepType.step_2);



			// 加载最初角色资源
		}




	}
}
