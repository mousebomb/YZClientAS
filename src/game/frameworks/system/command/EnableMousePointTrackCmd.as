/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.command
{
	import game.frameworks.system.mediator.MousePointTrackMediator;
	import game.frameworks.system.view.MousePointTrack;

	import org.robotlegs.mvcs.Command;

	/** 开启3D鼠标探测针 用于调试bug  只会执行一次 */
	public class EnableMousePointTrackCmd extends Command
	{
		public function EnableMousePointTrackCmd()
		{
			super();
		}


		override public function execute():void
		{
			if (mediatorMap.hasMapping(MousePointTrack)) return;
			mediatorMap.mapView(MousePointTrack, MousePointTrackMediator, null, false, false);
			var mpt:MousePointTrack = new MousePointTrack();
			Main.view3D.scene.addChild(mpt);
			mediatorMap.createMediator(mpt);
		}
	}
}
