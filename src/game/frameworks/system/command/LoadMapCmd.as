/**
 * Created by gaord on 2017/2/6.
 */
package game.frameworks.system.command
{
	import game.frameworks.system.service.GameMapService;

	import org.robotlegs.mvcs.Command;

	import starling.events.Event;

	/** 要求加载地图并切换 */
	public class LoadMapCmd extends Command
	{
		public function LoadMapCmd()
		{
		}

		[Inject]
		public var mapService:GameMapService;

		[Inject]
		public var e:Event;

		override public function execute():void
		{
			mapService.startLoadMap(e.data as String,false );
		}
	}
}
