/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.model
{
	import org.robotlegs.mvcs.Actor;

	/** 框架辅助 特殊整合 */
	public class FrameworkModel extends Actor
	{
		public function FrameworkModel()
		{
			super();
		}

		/** 鼠标当前是否正在UI上 (跳过3D层功能) */
		public var isUIHovering :Boolean ;
	}
}
