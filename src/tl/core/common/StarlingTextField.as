package tl.core.common
{
	import flash.display.BitmapData;
	import flash.events.Event;

	import game.frameworks.NotifyConst;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;

	import tl.utils.Tool;

	public class StarlingTextField extends Image
	{
		private static var starlingTextInitTexture:Texture;				//starling文本初始化纹理

        private var _textField:HTextField2D;
        protected var _algin:String = "left";
		/** 2D文本,用于给文本设置描边等 **/
		public function get textField():HTextField2D
		{
			return _textField;
		}
		/** 文本对齐样式 **/
		public function set algin(value:String):void
		{
			_algin = value;
			_textField.algin = value;
		}
		public function get algin():String
		{
			return _algin;
		}
		/** 文本字体样式(默认为统一字体,只有特殊需要设置的字体才使用设置) **/
		public function set font(value:String):void
		{
			_textField.font = value;
		}
		/** 字体大小 **/
		public function set size(value:int):void
		{
			_textField.size = value;
		}
		/** 字体颜色 **/
		public function set textColor(value:uint):void
		{
			_textField.color = value;
		}
		/** 是否加粗 **/
		public function set bold(value:Boolean):void
		{
			_textField.bold = value;
		}
		/** 文本间距 **/
		public function set leading(value:int):void
		{
			_textField.leading = value;
		}
		/**  文本水平间距  **/		
		public function set letterSpacing(value:int):void
		{
			_textField.letterSpacing = value;
		}
		/**  自动对齐方式 **/
		public function set autoSize(value:String):void
		{
			_textField.autoSize = value;
		}
		public function get autoSize():String
		{
			return _textField.autoSize;
		}
		/**  指定文本字段是否具有边框  **/ 
		public function set border(value:Boolean):void
		{
			_textField.border = value;
		}
		/**  文本字段边框的颜色。  **/
		public function set borderColor(value:uint):void
		{
			_textField.borderColor = value;
		}
		/** 指示用户可输入到文本字段中的字符集 **/
		public function set restrict(value:String):void
		{
			_textField.restrict = value;
		}
		/** 一个布尔值，指示文本字段是否自动换行 **/
		public function set wordWrap(value:Boolean):void
		{
			_textField.wordWrap = value;
		}
		/** 指示文本字段是否为多行文本字段 **/
		public function set multiline(value:Boolean):void
		{
			_textField.multiline = value;
		}
		/** 是否斜体 **/
		public function set italic(value:Boolean):void
		{
			_textField.italic = value;
		}
		/** 是否显示下划线 **/
		public function set underline(value:Boolean):void
		{
			_textField.underline = value;
		}
		/** 文本宽度 **/
		public function get textWidth():Number
		{
			return _textField.textWidth;
		}
		/** 文本高度 **/
		public function get textHeight():Number
		{
			return _textField.textHeight;
		}
		
		private var _self:StarlingTextField;
		/**
		 * 设置宽度
		 * @param value
		 */
		override public function set width(value:Number):void
		{
			_width = value;
			_textField.width = _width;
		}
		override public function get width():Number
		{
			return _width;
		}
		protected var _width:Number = 100;
		/**
		 * 设置高度
		 * @param value
		 */		
		override public function set height(value:Number):void
		{
			_height = value;
			_textField.height = _height;
		}
		override public function get height():Number
		{
			return _height;
		}
		protected var _height:Number = 100;
		
		protected var _text:String = "";
		protected var _drawBitmapdata:BitmapData;	//绘制 bitmapdata
		
		public function StarlingTextField()
		{  
			starlingTextInitTexture ||= SFTexture.fromTextBitmapData(new BitmapData(24, 12, true, 0), null, false)
			super(starlingTextInitTexture);
			_self = this;  

			init();
		}
		
		private function init():void
		{
			this.touchable = false;
			_textField = new HTextField2D();
			//Tool.setDisplayGlowFilter(_textField);

		}
		/**
		 * 7位颜色+2位字体大小+内容
		 * #f9f9f916这里要显示的内容 
		 * @param value
		 */		
		public function set label(value:String):void  
		{
			if(value == "") value = " ";
			_textField.label = value;  
			drawTextField();
		}
		public function get label():String
		{
			return _textField.label;
		}

		/**
		 * 7位颜色+2位字体大小+n/b是否粗体+n/u是否下划线+两位数事件Key长度+事件Key+内容
		 * #f9f9f916bu08eventkey这里要显示的内容
		 * #f9f9f916nu08eventkey这里要显示的内容
		 * #f9f9f916nn00这里要显示的内容
		 * @param value
		 */
		public function set eventLabel(value:String):void
		{
			if(value == "") value = " ";
			_textField.eventLabel = value;
			drawTextField();
		}

		public function set htmlText(value:String):void
		{
            if(value == "") value = " ";
			_textField.htmlText = value;
			drawTextField();
		}
		public function get eventLabel():String
		{
			return _textField.label;
		}
		/** 绘制文本 **/
		private function drawTextField():void
		{
			if(Starling.context.driverInfo == "Disposed")
			{
				//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
				return;
			}
			if(autoSize)
			if(this.texture)
			{
				this.texture.dispose();
            }
			//显示文本
			_drawBitmapdata = new BitmapData(_textField.width, _textField.height, true, 0);
			_drawBitmapdata.draw(_textField);

			this.texture = SFTexture.fromTextBitmapData(_drawBitmapdata, onRestore, false);
			this.readjustSize();
            //释放原本的资源
            _drawBitmapdata.dispose();
            _drawBitmapdata = null;
		}
		
		private function onRestore():void
		{
			drawTextField()
			//Dispatcher_F.getInstance().removeEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
		}
		private function texture_onRestore():void
		{
			if(_drawBitmapdata) _drawBitmapdata.dispose();
			_drawBitmapdata = null;
			_drawBitmapdata = new BitmapData(_textField.width, _textField.height, true, 0);
			_drawBitmapdata.draw(_textField);
			texture.root.uploadBitmapData(_drawBitmapdata)
		}

		override public function dispose():void
		{
			//Dispatcher_F.getInstance().removeEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
			_textField = null;
			
			if(_drawBitmapdata) _drawBitmapdata.dispose();
			_drawBitmapdata = null;
			if(this.texture) this.texture.dispose();
			
			super.dispose();
		}
		
		override public function set x(val:Number):void
		{
			super.x = (val%2==0 ? val : val+1);
		}
		
		override public function set y(val:Number):void
		{
			super.y = (val%2==0 ? val : val+1);
		}
		
	}
}