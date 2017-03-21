/**
 * Created by gaord on 2017/3/7.
 */
package game.utils
{
	import game.frameworks.ApplicationContext;

	public class FrameworkUtil
	{

		public static var appContext:ApplicationContext;

		public static function dispatchEventWith( type:String, bubbles:Boolean=false, data:Object=null ):void
		{
			appContext.dispatchEventWith( type,bubbles,data );
		}
	}
}
