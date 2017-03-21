/**
 * Created by gaord on 2017/2/27.
 */
package game.frameworks.system.command
{
	import game.frameworks.NotifyConst;
	import game.frameworks.system.model.LoginTaskModel;
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.LoginTaskService;
	import game.frameworks.system.service.StatsService;
	import game.frameworks.uicontainer.view.UIBaseLayer;
	import game.frameworks.uicontainer.view.UIPanelLayer;

	import org.robotlegs.mvcs.Command;

	import tl.core.GPUResProvider;

	public class LoadUICmd extends Command
	{
		public function LoadUICmd()
		{
			super();
		}


		[Inject]
		public var stats:StatsService;

		[Inject]
		public var gpuRes:GPUResProvider;
		[Inject]
		public var loginTaskService:LoginTaskService;

		/** 初始化 UI 层级 */
		override public function execute():void
		{
			dispatchWith(NotifyConst.SHOW_LOADING_UI,false);
			dispatchWith(NotifyConst.CLOSE_CREATE_ROLE,false);
			// start ui load
			stats.scendStepToScever(StepType.step_15);
			// 加载基础界面需要的
			gpuRes.preloadUITextureAtlas(["source_activityIcon_11", "source_interface_0", "source_toolBar_11"], onFinish);
		}

		private function onFinish():void
		{
			stats.scendStepToScever(StepType.step_16);
			//标记初始资源完成 告知服务器
			loginTaskService.onInitResLoaded();
			//
			commandMap.execute(FakeEnterGameCmd);
		}
	}
}
