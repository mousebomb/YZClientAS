/**
 * Created by gaord on 2017/3/4.
 */
package game.frameworks.system.command
{
	import game.frameworks.NotifyConst;
	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.MouseCursorManage;
	import game.frameworks.system.service.StatsService;

	import org.robotlegs.mvcs.Command;

	import starling.display.Sprite;

	import tl.core.GPUResProvider;

	public class LoadFirstUICmd extends Command
	{


		[Inject]
		public var stats:StatsService;

		[Inject]
		public var gpuRes:GPUResProvider;

		public function LoadFirstUICmd()
		{
			super();
		}

		override public function execute():void
		{
			// 加载最初UI资源
			App.init(contextView as Sprite);
			gpuRes.preloadUITextureAtlas(["loadingBg"], onFinish);
			MouseCursorManage.getInstance();

			stats.scendStepToScever(StepType.step_4);


		}

		private function onFinish():void
		{
			stats.scendStepToScever(StepType.step_5);

			dispatchWith(NotifyConst.FIRSTUI_LOADED);
			dispatchWith(NotifyConst.SHOW_LOADING_UI);
		}
	}
}
