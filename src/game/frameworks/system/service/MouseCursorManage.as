package game.frameworks.system.service
{
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.ui.MouseCursorData;
	import flash.utils.getQualifiedClassName;

	import game.frameworks.Config;

	import tl.core.bombloader.JYLoader;

	/**
	 * 鼠标样式管理类 
	 * @author Administrator
	 * 郑利本
	 */
	public class MouseCursorManage
	{
		/** 出售图标 */
		public static const MONEY_TYPE:String = "Money";
		/** 攻击图标 */
		public static const ATTACK_1_TYPE:String = "Attack_1";
		/** 攻击图标  */
		public static const ATTACK_2_TYPE:String = "Attack_2";
		/** 通用图标 */
		public static const NORMAL_TYPE:String = "Normal";
		/** 点击图标 */
		public static const CLICK_1_TYPE:String = "Ckick_1";
		/** 点击图标 */
		public static const CLICK_2_TYPE:String = "Ckick_2";
		/** 拾取图标 */
		public static const PICKUP_TYPE:String = "Pickup";
		/** 抓取图标 */
		public static const CAPTURE_TYPE:String = "Capture";
		/** 采集图标 */
		public static const GATHER_TYPE:String = "gather";
		/** 帮助图标 */
		public static const HELP_TYPE:String = "help";
		/** 失效图标 */
		public static const DISALBED_TYPE:String = "disalbed";
		
		private static var _instance:MouseCursorManage;
		
		private var _isLong:Boolean;
		public function MouseCursorManage()
		{
			init();
		}
		
		public static function getInstance():MouseCursorManage
		{
			if(_instance == null)
			{
				_instance = new MouseCursorManage;
			}
			return _instance;
		}
		
		public function init():void
		{
			JYLoader.getInstance().reqResource(Config.SWF_URL +"MouseCursor.swf",JYLoader.RES_RSL,0,JYLoader.GROUP_LOGIN,onLoaded);
			return;
		}

		private function instanceClass(name:String):BitmapData
		{
			var clazz :Class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
			return new clazz;
		}

		private function onLoaded(url:String, d:*, mark:*):void
		{
			var data:MouseCursorData = new MouseCursorData;
			 var vector:Vector.<BitmapData> = new <BitmapData>[];
			 var bmd:BitmapData = instanceClass("mouse_icon_0");
			 if(!bmd) return ;
			 _isinit = true;
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(MONEY_TYPE, data)

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_1");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(ATTACK_1_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_2");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(NORMAL_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_3");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(CLICK_1_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_4");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(PICKUP_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_5");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(CAPTURE_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass( "mouse_icon_6");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(GATHER_TYPE, data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_7");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(HELP_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_8");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(DISALBED_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_9");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(CLICK_2_TYPE,data);

			 data = new MouseCursorData;
			 vector = new <BitmapData>[];
			 bmd = instanceClass("mouse_icon_10");
			 vector.push(bmd);
			 data.data = vector ;
			 Mouse.registerCursor(ATTACK_2_TYPE,data);

			setType(NORMAL_TYPE);
		}
		
		private var _cursorType:String;
		private var _isinit:Boolean;
		
		/**
		 * 显示鼠标样式 
		 * @param type
		 * 0、出售图标 1、攻击图标 2、通用图标 3、点击图标 4、拾取图标 5、抓取图标
		 * @param isLong 是否长久显示
		 */		
		public function showCursor(type:int = 2, isLong:Boolean = false):void
		{
			if(_isLong && !isLong) 
			{
				return;
			}
			if(isLong)
			{
				if(type == 2)
				{
					_isLong = false;
				}
				else
				{
					_isLong = true;
				}
			}
			
			var tmpCursor:String = NORMAL_TYPE;
			switch(type)
			{
				case 0 :
					tmpCursor = MONEY_TYPE
					break;
				case 1 :
					tmpCursor = ATTACK_1_TYPE
					break;
				case 2 :
					tmpCursor = NORMAL_TYPE
					break;
				case 3 :
					tmpCursor = CLICK_1_TYPE
					break;
				case 4 :
					tmpCursor = PICKUP_TYPE
					break;
				case 5 :
					tmpCursor = CAPTURE_TYPE;
					break;
				case 6 :
					tmpCursor = GATHER_TYPE;
					break;
				case 7 :
					tmpCursor = HELP_TYPE;
					break;
				case 8 :
					tmpCursor = DISALBED_TYPE;
					break;
				case 9 :
					tmpCursor = CLICK_2_TYPE;
					break;
				case 10 :
					tmpCursor = ATTACK_2_TYPE;
					break;
				case 11 :
					tmpCursor = MouseCursor.ARROW;
					break;
				case 12 :
					tmpCursor = MouseCursor.AUTO;
					break;
				case 13 :
					tmpCursor = MouseCursor.BUTTON;
					break;
				case 14 :
					tmpCursor = MouseCursor.HAND;
					break;
				case 15 :
					tmpCursor = MouseCursor.IBEAM;
					break;
			}
			
			setType(tmpCursor);
		}
		
		public function setType(type:String):void
		{
			if(!_isinit) return;
			if (_cursorType != type)
			{
				Mouse.cursor = _cursorType = type;
			}
		}
	}
}