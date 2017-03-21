/**
 * Morn UI Version 2.4.1020 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import morn.core.handlers.Handler;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**滑动条变化后触发*/
	[Event(name="change",type="starling.events.Event")]
	
	/**滑动条*/
	public class Slider extends Component {
		/**水平移动*/
		public static const HORIZONTAL:String = "horizontal";
		/**垂直移动*/
		public static const VERTICAL:String = "vertical";
		protected var _allowBackClick:Boolean;
		protected var _max:Number = 100;
		protected var _min:Number = 0;
		protected var _tick:Number = 1;
		protected var _value:Number = 0;
		protected var _direction:String = VERTICAL;
		protected var _back:UIImage;
		protected var _bar:UIButton;
		protected var _label:Label;
		protected var _showLabel:Boolean = true;
		protected var _changeHandler:Handler;
		
		public function Slider(skin:String = null):void {
			this.skin = skin;
		}
		
		override protected function preinitialize():void {
			mouseChildren = true;
		}
		
		override protected function createChildren():void {
			addChild(_back = new UIImage());
			addChild(_bar = new UIButton());
			addChild(_label = new Label());
		}
		
		override protected function initialize():void {
			_bar.addEventListener(TouchEvent.TOUCH, onButtonMouseDown);
			_back.sizeGrid = _bar.sizeGrid = "4,4,4,4";
			allowBackClick = true;
		}
		
		private var _bMouseDown:Boolean = false;
		private var _oldPos:Number = 0;
		protected function onButtonMouseDown(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if(touch)
			{
				addEventListener(TouchEvent.TOUCH, onStageMouseUp);
				addEventListener(TouchEvent.TOUCH, onStageMouseMove);
				if (_direction == VERTICAL) {
					_oldPos = e.data[0].globalY;
				} else {
					_oldPos = e.data[0].globalX;
				}
				
				//显示提示
				showValueText();
				
				_bMouseDown = true;
				
				e.stopImmediatePropagation();
			}
		}
		
		protected function showValueText():void {
			if (_showLabel) {
				_label.text = _value + "";
				if (_direction == VERTICAL) {
					_label.width = _label.textField.textWidth + 5;
					_label.height = _label.textField.textHeight + 5;
					_label.x = _bar.x + 20;
					_label.y = (_bar.height - _label.height) * 0.5 + _bar.y;
				} else {
					_label.width = _label.textField.textWidth + 5;
					_label.height = _label.textField.textHeight + 5;
					_label.y = _bar.y - 20;
					_label.x = (_bar.width - _label.width) * 0.5 + _bar.x;
				}
			}
		}
		
		protected function hideValueText():void {
			_label.text = "";
		}
		
		protected function onStageMouseUp(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.ENDED);
			if(touch)
			{
				removeEventListener(TouchEvent.TOUCH, onStageMouseUp);
				removeEventListener(TouchEvent.TOUCH, onStageMouseMove);
				
				hideValueText();
				
				_oldPos = 0;
				
				_bMouseDown = false;
				
				e.stopImmediatePropagation();
			}
		}
		
		protected function onStageMouseMove(e:TouchEvent):void {
			if(_bMouseDown)
			{
				var oldValue:Number = _value;
				if (_direction == VERTICAL) {
					if(e.data[0].globalY > _oldPos)	{
						if(bar.y < height - _bar.height)
						{
							bar.y += e.data[0].globalY - _oldPos;
						}
						if(bar.y > height - _bar.height)
						{
							bar.y = height - _bar.height;
						}
					} else if(e.data[0].globalY < _oldPos) {
						if(bar.y > 0)
						{
							bar.y -= (_oldPos - e.data[0].globalY);
						}
						if(bar.y < 0)
						{
							bar.y = 0;
						}
					}
					
					_value = _bar.y / (height - _bar.height) * (_max - _min) + _min;
					
					_oldPos = e.data[0].globalY;
				} else {
					if(e.data[0].globalX > _oldPos)	{
						if(bar.x < width - _bar.width)
						{
							bar.x += e.data[0].globalX - _oldPos;
						}
						if(bar.x > width - _bar.width)
						{
							bar.x = width - _bar.width;
						}
					} else if(e.data[0].globalX < _oldPos) {
						if(bar.x > 0)
						{
							bar.x -= (_oldPos - e.data[0].globalX);
						}
						if(bar.x < 0)
						{
							bar.x = 0;
						}
					}
					
					_value = _bar.x / (width - _bar.width) * (_max - _min) + _min;
					
					_oldPos = e.data[0].globalX;
				}
				
				_value = Math.round(_value / _tick) * _tick;
				
				if (_value != oldValue) {
					showValueText();
					sendChangeEvent();
				}
				
				e.stopImmediatePropagation();
			}
		}
		
		protected function sendChangeEvent():void {
			sendEvent(Event.CHANGE);
			if (_changeHandler != null) {
				_changeHandler.executeWith([_value]);
			}
		}
		
		/**
		 * 重写是否使用贴图皮肤
		 * @param value
		 */
		override public function set useTextureSkin(value:Boolean):void {
			if (super.useTextureSkin != value) {
				super.useTextureSkin = value;
				_back.useTextureSkin = value;
				_bar.useTextureSkin = value;
				_contentWidth = _back.width;
				_contentHeight = _back.height;
				setBarPoint();
			}
		}
		
		override public function set skin(value:String):void {
			if (super.skin != value) {
				super.skin = value;
				_back.skin = super.skin;
				_bar.skin = super.skin + MornUIConfig.TEXTURESTATE_BAR;
				_contentWidth = _back.width;
				_contentHeight = _back.height;
				setBarPoint();
			}
		}
		
		override protected function changeSize():void {
			super.changeSize();
			_back.width = width;
			_back.height = height;
			setBarPoint();
		}
		
		protected function setBarPoint():void {
			if (_direction == VERTICAL) {
				_bar.x = (_back.width - _bar.width) * 0.5;
			} else {
				_bar.y = (_back.height - _bar.height) * 0.5;
			}
		}
		
		/**九宫格信息(格式:左边距,上边距,右边距,下边距)*/
		override public function get sizeGrid():String {
			return _back.sizeGrid;
		}
		
		override public function set sizeGrid(value:String):void {
			_back.sizeGrid = value;
		}
		
		protected function changeValue():void {
			_value = Math.round(_value / _tick) * _tick;
			_value = _value > _max ? _max : _value < _min ? _min : _value;
			if (_direction == VERTICAL) {
				_bar.y = (_value - _min) / (_max - _min) * (height - _bar.height);
			} else {
				_bar.x = (_value - _min) / (_max - _min) * (width - _bar.width);
			}
		}
		
		/**设置滑动条*/
		public function setSlider(min:Number, max:Number, value:Number):void {
			_value = 0;
			_min = min;
			_max = max > min ? max : min;
			this.value = value < min ? min : value > max ? max : value;
		}
		
		/**刻度值，默认值为1*/
		public function get tick():Number {
			return _tick;
		}
		
		public function set tick(value:Number):void {
			_tick = value;
			callLater(changeValue);
		}
		
		/**滑块上允许的最大值*/
		public function get max():Number {
			return _max;
		}
		
		public function set max(value:Number):void {
			if (_max != value) {
				_max = value;
				callLater(changeValue);
			}
		}
		
		/**滑块上允许的最小值*/
		public function get min():Number {
			return _min;
		}
		
		public function set min(value:Number):void {
			if (_min != value) {
				_min = value;
				callLater(changeValue);
			}
		}
		
		/**当前值*/
		public function get value():Number {
			return _value;
		}
		
		public function set value(num:Number):void {
			if (_value != num) {
				_value = num;
				callLater(changeValue);
				callLater(sendChangeEvent);
			}
		}
		
		/**滑动方向*/
		public function get direction():String {
			return _direction;
		}
		
		public function set direction(value:String):void {
			_direction = value;
		}
		
		/**是否显示标签*/
		public function get showLabel():Boolean {
			return _showLabel;
		}
		
		public function set showLabel(value:Boolean):void {
			_showLabel = value;
		}
		
		/**允许点击后面*/
		public function get allowBackClick():Boolean {
			return _allowBackClick;
		}
		
		public function set allowBackClick(value:Boolean):void {
			if (_allowBackClick != value) {
				_allowBackClick = value;
				if (_allowBackClick) {
					_back.addEventListener(TouchEvent.TOUCH, onBackBoxMouseDown);
				} else {
					_back.removeEventListener(TouchEvent.TOUCH, onBackBoxMouseDown);
				}
			}
		}
		
		protected function onBackBoxMouseDown(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if(touch)
			{
				if (_direction == VERTICAL) {
					//value = _back.mouseY / (height - _bar.height) * (_max - _min) + _min;
				} else {
					//value = _back.mouseX / (width - _bar.width) * (_max - _min) + _min;
				}
			}
		}
		
		override public function set dataSource(value:Object):void {
			_dataSource = value;
			if (value is Number || value is String) {
				this.value = Number(value);
			} else {
				super.dataSource = value;
			}
		}
		
		/**控制按钮*/
		public function get bar():UIButton {
			return _bar;
		}
		
		/**数据变化处理器*/
		public function get changeHandler():Handler {
			return _changeHandler;
		}
		
		public function set changeHandler(value:Handler):void {
			_changeHandler = value;
		}
	}
}