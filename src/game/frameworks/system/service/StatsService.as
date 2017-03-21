/**
 * Created by gaord on 2017/3/4.
 */
package game.frameworks.system.service
{
	import org.robotlegs.mvcs.Actor;

	import tool.StageFrame;

	/** 行为统计*/
	public class StatsService extends Actor
	{
		public function StatsService()
		{
			super();
		}


		/** 保存当前步骤(统计？) */
		public function scendStepToScever(step:int):void
		{
			trace(StageFrame.renderIdx, "[StatsService]/scendStepToScever", step);
//			if(ExternalInterface.available)
//				ExternalInterface.call('proleurlHttp', _parameters.user, step, _parameters.worldid)
		}
	}
}
