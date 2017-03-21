/**
 * Created by Administrator on 2017/3/6.
 */
package tl.core.common
{
	import starling.display.Sprite;

	public class HBaseSprite extends Sprite
	{
		private var _myWidth:Number = 0;
		private var _myHeight:Number = 0;

		public var isNeedQuare:Boolean;
		public var isInit:Boolean = false;
		public function HBaseSprite()
		{
			this.isAddEvent = false;
			super();
		}
		public function set myWidth(value:Number):void
		{
			_myWidth=value;
		}
		public function get myWidth():Number{
			return _myWidth;
		}
		public function set myHeight(value:Number):void{
			_myHeight=value;
		}
		public function get myHeight():Number{
			return _myHeight;
		}

		override public function set x(value:Number):void
		{
			if(isNeedQuare && value % 2 != 0)
				value = value - value % 2;
			super.x = value;
		}

		override public function set y(value:Number):void
		{
			if(isNeedQuare && value % 2 != 0)
				value = value - value % 2;
			super.y = value;
		}

	}
}
