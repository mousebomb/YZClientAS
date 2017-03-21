/**
 * Morn UI Version 2.4.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import flash.events.MouseEvent;
	import flash.geom.Point;

	import morn.core.handlers.Handler;

	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**滚动位置变化后触发*/
	[Event(name = "change", type = "starling.events.Event")]

	/**滚动条*/
	public class ScrollBar extends Component {
		/**水平移动*/
		public static const HORIZONTAL:String = "horizontal";
		/**垂直移动*/
		public static const VERTICAL:String = "vertical";
		protected var _scrollSize:Number = 1;
		protected var _upButton:UIButton;
		protected var _downButton:UIButton;
		protected var _slider:Slider;
		protected var _changeHandler:Handler;
		protected var _thumbPercent:Number = 1;
		protected var _target:Component;
		protected var _touchScrollEnable:Boolean = MornUIConfig.touchScrollEnable;
		protected var _mouseWheelEnable:Boolean = MornUIConfig.mouseWheelEnable;
		protected var _lastPoint:Point;
		protected var _lastOffset:Number;

		private var _bMouseDown:Boolean = false;

		public function ScrollBar(skin:String = null):void {
			this.skin = skin;
		}

		override protected function preinitialize():void {
			mouseChildren = true;
		}

		override protected function createChildren():void {
			addChild(_slider = new Slider());
			addChild(_upButton = new UIButton());
			addChild(_downButton = new UIButton());
		}

		override protected function initialize():void {
			_slider.showLabel = false;
			_slider.addEventListener(Event.CHANGE, onSliderChange);
			_slider.setSlider(0, 0, 0);
			_upButton.addEventListener(TouchEvent.TOUCH, onButtonMouseDown);
			_downButton.addEventListener(TouchEvent.TOUCH, onButtonMouseDown);
		}

		protected function onSliderChange(e:Event):void {
			sendEvent(Event.CHANGE);
			if (_changeHandler != null) {
				_changeHandler.executeWith([value]);
			}
		}

		protected function onButtonMouseDown(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if (touch) {
				var isUp:Boolean = e.currentTarget == _upButton;
				slide(isUp);
				App.timer.doOnce(Styles.scrollBarDelayTime, startLoop, [isUp]);
				App.stage.addEventListener(TouchEvent.TOUCH, onStageMouseUp);
			}
		}

		protected function startLoop(isUp:Boolean):void {
			App.timer.doFrameLoop(1, slide, [isUp]);
		}

		protected function slide(isUp:Boolean):void {
			if (isUp) {
				value -= _scrollSize;
			} else {
				value += _scrollSize;
			}
		}

		protected function onStageMouseUp(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.ENDED);
			if (touch) {
				App.stage.removeEventListener(TouchEvent.TOUCH, onStageMouseUp);
				App.timer.clearTimer(startLoop);
				App.timer.clearTimer(slide);
			}
		}

		/**
		 * 重写是否使用贴图皮肤
		 * @param value
		 */
		override public function set useTextureSkin(value:Boolean):void {
			if (super.useTextureSkin != value) {
				super.useTextureSkin = value;
				_slider.useTextureSkin = value;
				_upButton.useTextureSkin = value;
				_downButton.useTextureSkin = value;
			}
		}

		override public function set skin(value:String):void {
			if (super.skin != value) {
				super.skin = value;
				_slider.skin = value;
				_upButton.skin = value + MornUIConfig.TEXTURESTATE_SCROLL_UP;
				_downButton.skin = value + MornUIConfig.TEXTURESTATE_SCROLL_DOWN;
				callLater(changeScrollBar);
			}
		}

		protected function changeScrollBar():void {
			if (_slider.direction == VERTICAL) {
				_slider.y = _upButton.height;
			} else {
				_slider.x = _upButton.width;
			}
			resetButtonPosition();
		}

		protected function resetButtonPosition():void {
			if (_slider.direction == VERTICAL) {
				_downButton.y = _slider.y + _slider.height;
				_contentWidth = _downButton.width;
				_contentHeight = _downButton.y + _downButton.height;
			} else {
				_downButton.x = _slider.x + _slider.width;
				_contentWidth = _downButton.x + _downButton.width;
				_contentHeight = _downButton.height;
			}
		}

		override protected function changeSize():void {
			super.changeSize();
			if (_slider.direction == VERTICAL) {
				_slider.height = height - _upButton.height - _downButton.height;
			} else {
				_slider.width = width - _upButton.width - _downButton.width;
			}
			resetButtonPosition();
		}

		/**设置滚动条*/
		public function setScroll(min:Number, max:Number, value:Number):void {
			_slider.setSlider(min, max, value);
			_upButton.disabled = max <= 0;
			_downButton.disabled = max <= 0;
			_slider.bar.visible = max > 0;
		}

		/**最大滚动位置*/
		public function get max():Number {
			return _slider.max;
		}

		public function set max(value:Number):void {
			_slider.max = value;
		}

		/**最小滚动位置*/
		public function get min():Number {
			return _slider.min;
		}

		public function set min(value:Number):void {
			_slider.min = value;
		}

		/**当前滚动位置*/
		public function get value():Number {
			return _slider.value;
		}

		public function set value(value:Number):void {
			_slider.value = value;
		}

		/**滚动方向*/
		public function get direction():String {
			return _slider.direction;
		}

		public function set direction(value:String):void {
			_slider.direction = value;
		}

		/**9宫格(格式[4,4,4,4]，分别为[左边距,上边距,右边距,下边距])*/
		override public function get sizeGrid():String {
			return _slider.sizeGrid;
		}

		override public function set sizeGrid(value:String):void {
			_slider.sizeGrid = value;
		}

		/**点击按钮滚动量*/
		public function get scrollSize():Number {
			return _scrollSize;
		}

		public function set scrollSize(value:Number):void {
			_scrollSize = value;
			_slider.tick = value;
		}

		override public function set dataSource(value:Object):void {
			_dataSource = value;
			if (value is Number || value is String) {
				this.value = Number(value);
			} else {
				super.dataSource = value;
			}
		}

		/**滑条长度比例(0-1)*/
		public function get thumbPercent():Number {
			return _thumbPercent;
		}

		public function set thumbPercent(value:Number):void {
			exeCallLater(changeSize);
			_thumbPercent = value;
			if (_slider.direction == VERTICAL) {
				_slider.bar.height = Math.max(int(_slider.height * value), Styles.scrollBarMinNum);
			} else {
				_slider.bar.width = Math.max(int(_slider.width * value), Styles.scrollBarMinNum);
			}
		}

		/**滚动对象*/
		public function get target():Component {
			return _target;
		}

		public function set target(value:Component):void {
			if (_target) {
				App.starling.nativeStage.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				_target.removeEventListener(TouchEvent.TOUCH, onTargetMouseDown);
			}
			_target = value;
			if (value) {
				if (_mouseWheelEnable) {
					App.starling.nativeStage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				}
				if (_touchScrollEnable) {
					_target.addEventListener(TouchEvent.TOUCH, onTargetMouseDown);
				}
			}
		}

		/**是否触摸滚动，默认为true*/
		public function get touchScrollEnable():Boolean {
			return _touchScrollEnable;
		}

		public function set touchScrollEnable(value:Boolean):void {
			_touchScrollEnable = value;
		}

		/**是否滚轮滚动，默认为true*/
		public function get mouseWheelEnable():Boolean {
			return _mouseWheelEnable;
		}

		public function set mouseWheelEnable(value:Boolean):void {
			_mouseWheelEnable = value;
			target = _target;
		}

		protected function onTargetMouseDown(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if (touch) {
				_target.mouseChildren = true;
				App.timer.clearTimer(tweenMove);
				if (!this.contains(e.target as DisplayObject)) {
					App.stage.addEventListener(TouchEvent.TOUCH, onStageMouseUp2);
					App.stage.addEventListener(TouchEvent.TOUCH, onStageEnterFrame);
					_lastPoint = new Point(e.data[0].globalX, e.data[0].globalY);
				}

				_bMouseDown = true;
			}
		}

		protected function onStageEnterFrame(e:TouchEvent):void {
			if (_bMouseDown) {
				_lastOffset = _slider.direction == VERTICAL ? e.data[0].globalY - _lastPoint.y : e.data[0].globalX - _lastPoint.x;
				if (Math.abs(_lastOffset) >= 1) {
					_lastPoint.x = e.data[0].globalX;
					_lastPoint.y = e.data[0].globalY;
					_target.mouseChildren = false;
					value -= _lastOffset;
				}
			}
		}

		protected function onStageMouseUp2(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.ENDED);
			if (touch) {
				App.stage.removeEventListener(TouchEvent.TOUCH, onStageMouseUp2);
				App.stage.removeEventListener(TouchEvent.TOUCH, onStageEnterFrame);
				if (Math.abs(_lastOffset) > 50) {
					_lastOffset = 50 * (_lastOffset > 0 ? 1 : -1);
				}
				App.timer.doFrameLoop(1, tweenMove);

				_bMouseDown = false;
			}
		}

		private function tweenMove():void {
			_lastOffset = _lastOffset * 0.92;
			value -= _lastOffset;
			if (Math.abs(_lastOffset) < 0.5) {
				_target.mouseChildren = true;
				App.timer.clearTimer(tweenMove);
			}
		}

		protected function onMouseWheel(e:MouseEvent):void {
			var p:Point = new Point(e.stageX, e.stageY);
			var disObj:starling.display.DisplayObject = Starling.current.stage.hitTest(p);
			while (disObj) {
				if (disObj == _target) {
					break;
				}

				disObj = disObj.parent;
			}
			p = null;

			if (disObj && disObj == _target) {
				value += (e.delta < 0 ? 1 : -1) * _thumbPercent * (max - min);
				if (value > max) value = max;
				if (value < min) value = min;
				if (value <= max && value >= min) {
					e.stopPropagation();
				}
			}
		}
	}
}
