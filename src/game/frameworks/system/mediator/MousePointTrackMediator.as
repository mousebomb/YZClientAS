/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.mediator
{
	import away3d.events.MouseEvent3D;

	import game.frameworks.system.view.MousePointTrack;

	import org.robotlegs.mvcs.Mediator;

	public class MousePointTrackMediator extends Mediator
	{
		public function MousePointTrackMediator()
		{
			super();
		}


		[Inject]
		public var view:MousePointTrack;

		override public function onRegister():void
		{

			eventMap.mapListener(view.parent, MouseEvent3D.MOUSE_MOVE, onMouseMoveAll, MouseEvent3D);
			eventMap.mapListener(view.parent, MouseEvent3D.MOUSE_OUT, onMouseOutAnything, MouseEvent3D);
			eventMap.mapListener(view.parent, MouseEvent3D.MOUSE_OVER, onMouseOverAnything, MouseEvent3D);
		}

		/// 探测指示

		private function onMouseOutAnything(event:MouseEvent3D):void
		{
			view.updateAABB(null);
		}

		private function onMouseOverAnything(event:MouseEvent3D):void
		{
			view.updateAABB(event);
		}

		private function onMouseMoveAll(event:MouseEvent3D):void
		{
			view.update(event);
		}
	}
}
