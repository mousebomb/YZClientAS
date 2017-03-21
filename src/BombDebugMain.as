/**
 * Created by gaord on 2017/3/8.
 */
package
{
	import com.demonsters.debugger.MonsterDebugger;

	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import game.frameworks.Config;

	import game.frameworks.NotifyConst;
	import game.utils.FrameworkUtil;

	[SWF (width=1280,height=768)]
	public class BombDebugMain extends Main
	{
		public function BombDebugMain()
		{
			super();
			MonsterDebugger.enabled= true;

		}


		override protected function onRootCreated(event:*):void
		{
			super.onRootCreated(event);


			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownDebug);



		}

		private function onKeyDownDebug(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.NUMPAD_SUBTRACT)
			{
				// 开启测试鼠标探针
				FrameworkUtil.dispatchEventWith(NotifyConst.ENABLE_MOUSE_POINT_TRACK);
			}
		}
	}
}
