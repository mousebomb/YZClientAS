/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.view
{
	import game.frameworks.system.helpers.GameEntityPriority;

	import tl.core.role.Role;

	public class Myself extends Role
	{
		public function Myself()
		{
			super();
			// 主角优先级高
			loadPriority = GameEntityPriority.myselfPriority;
		}
	}
}
