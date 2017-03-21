/**
 * Morn UI Version 2.4.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Rectangle;

	import morn.core.events.UIEvent;
	import morn.core.utils.ObjectUtils;
	import morn.core.utils.StringUtils;
	import morn.editor.core.IComponent;

	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	/**重置大小后触发*/
	[Event(name = "resize", type = "starling.events.Event")]
	/**移动组件后触发*/
	[Event(name = "move", type = "morn.core.events.UIEvent")]
	/**显示鼠标提示时触发*/
	[Event(name = "showTip", type = "morn.core.events.UIEvent")]
	/**隐藏鼠标提示时触发*/
	[Event(name = "hideTip", type = "morn.core.events.UIEvent")]

	/**组件基类*/
	public class Component extends Sprite implements IComponent {
		protected var _width:Number;
		protected var _height:Number;
		protected var _contentWidth:Number = 0;
		protected var _contentHeight:Number = 0;
		protected var _disabled:Boolean;
		protected var _tag:Object;
		protected var _comJSON:Object;
		protected var _comXml:XML;
		protected var _dataSource:Object;
		protected var _toolTip:Object;
		
		protected var _top:Number = Number.NaN;
		protected var _bottom:Number = Number.NaN;
		protected var _left:Number = Number.NaN;
		protected var _right:Number = Number.NaN;
		protected var _centerX:Number = Number.NaN;
		protected var _centerY:Number = Number.NaN;
		protected var _layOutEnabled:Boolean;
		
		protected var _buttonMode:Boolean = false;

		//是否使用纹理皮肤
		protected var _useTextureSkin:Boolean = true;
		//Bitmap皮肤 对应导出类名
		private var _skin:String;

		//皮肤
		protected var _skinImage:Image = null;

		public function Component() {
			mouseChildren = false;
			//mouseChildren = tabEnabled = tabChildren = false;
			preinitialize();
			createChildren();
			initialize();
		}
		
		/**销毁*/
		override public function dispose():void {
			super.dispose();
			_tag = null;
			_comXml = null;
			_comJSON = null;
			_dataSource = null;
			_toolTip = null;
		}
		
		/**预初始化，在此可以修改属性默认值*/
		protected function preinitialize():void {

		}

		/**在此创建组件子对象*/
		protected function createChildren():void {

		}

		/**初始化，在此子对象已被创建，可以对子对象进行修改*/
		protected function initialize():void {

		}

		/**延迟调用，在组件被显示在屏幕之前调用*/
		public function callLater(method:Function, args:Array = null):void {
			App.render.callLater(method, args);
		}
		
		/**立即执行延迟调用*/
		public function exeCallLater(method:Function):void {
			App.render.exeCallLater(method);
		}

		/**派发事件，data为事件携带数据*/
		public function sendEvent(type:String, data:* = null):void {
			if (hasEventListener(type)) {
				dispatchEvent(new UIEvent(type, data));
			}
		}

		/**从父容器删除自己，如已经被删除不会抛出异常*/
		public function remove():void {
			if (parent) {
				parent.removeChild(this);
			}
		}

		/**根据名字删除子对象，如找不到不会抛出异常*/
		public function removeChildByName(name:String):void {
			var display:DisplayObject = getChildByName(name);
			if (display) {
				removeChild(display);
			}
		}

		/**设置组件位置*/
		public function setPosition(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
		}

		override public function set x(value:Number):void {
			super.x = value;
			callLater(sendEvent, [UIEvent.MOVE]);
		}

		override public function set y(value:Number):void {
			super.y = value;
			callLater(sendEvent, [UIEvent.MOVE]);
		}

		/**宽度(值为NaN时，宽度为自适应大小)*/
		override public function get width():Number {
			exeCallLater(resetPosition);
			if (!isNaN(_width)) {
				return _width;
			} else if (_contentWidth != 0) {
				return _contentWidth;
			} else {
				return measureWidth;
			}
		}
		
		/**显示的宽度(width * scaleX)*/
		public function get displayWidth():Number {
			return width * scaleX;
		}
		
		protected function get measureWidth():Number {
			commitMeasure();
			var max:Number = 0;
			for (var i:int = numChildren - 1; i > -1; i--) {
				var comp:DisplayObject = getChildAt(i);
				if (comp.visible) {
					max = Math.max(comp.x + comp.width * comp.scaleX, max);
				}
			}
			return max;
		}

		override public function set width(value:Number):void {
			if (_width != value) {
				_width = value;
				callLater(changeSize);
				if (_layOutEnabled) {
					callLater(resetPosition);
				}
			}
		}

		/**高度(值为NaN时，高度为自适应大小)*/
		override public function get height():Number {
			exeCallLater(resetPosition);
			if (!isNaN(_height)) {
				return _height;
			} else if (_contentHeight != 0) {
				return _contentHeight;
			} else {
				return measureHeight;
			}
		}
		
		/**显示的高度(height * scaleY)*/
		public function get displayHeight():Number {
			return height * scaleY;
		}
		
		protected function get measureHeight():Number {
			commitMeasure();
			var max:Number = 0;
			for (var i:int = numChildren - 1; i > -1; i--) {
				var comp:DisplayObject = getChildAt(i);
				if (comp.visible) {
					max = Math.max(comp.y + comp.height * comp.scaleY, max);
				}
			}
			return max;
		}

		override public function set height(value:Number):void {
			if (_height != value) {
				_height = value;
				callLater(changeSize);
				if (_layOutEnabled) {
					callLater(resetPosition);
				}
			}
		}
		
		/**获取X坐标*/
		override public function get x():Number {
			exeCallLater(resetPosition);
			return super.x;
		}
		
		/**获取Y坐标*/
		override public function get y():Number {
			exeCallLater(resetPosition);
			return super.y;
		}
		
		override public function set scaleX(value:Number):void {
			super.scaleX = value;
			callLater(changeSize);
		}

		override public function set scaleY(value:Number):void {
			super.scaleY = value;
			callLater(changeSize);
		}

		/**执行影响宽高的延迟函数*/
		public function commitMeasure():void {

		}

		protected function changeSize():void {
			sendEvent(Event.RESIZE);
		}

		/**设置组件大小*/
		public function setSize(width:Number, height:Number):void {
			this.width = width;
			this.height = height;
		}

		/**缩放比例(等同于同时设置scaleX，scaleY)*/
//		public function set scale(value:Number):void {
//			scaleX = scaleY = value;
//		}
//		
//		public function get scale():Number {
//			return scaleX;
//		}

		public function set buttonMode(value:Boolean):void {
			_buttonMode = value;
			if (_buttonMode) {
				useHandCursor = true;
			} else {
				useHandCursor = false;
			}
		}

		/**是否禁用*/
		public function get disabled():Boolean {
			return _disabled;
		}

		public function set disabled(value:Boolean):void {
			if (_disabled != value) {
				_disabled = value;
				//mouseEnabled = !value;
				//super.mouseChildren = value ? false : _mouseChildren;
				ObjectUtils.gray(this, _disabled);
			}
		}

		public function get mouseChildren():Boolean {
			return !touchGroup;
		}

		public function set mouseChildren(value:Boolean):void {
			touchGroup = !value;
		}

		/**标签(冗余字段，可以用来储存数据)*/
		public function get tag():Object {
			return _tag;
		}

		public function set tag(value:Object):void {
			_tag = value;
		}

		/**显示边框*/
		public function showBorder(color:uint = 0xff0000):void {
			removeChildByName("border");
			var border:Shape = new Shape();
			border.name = "border";
			border.graphics.lineStyle(1, color);
			border.graphics.drawRect(0, 0, width, height);
			var bitdata:BitmapData = new BitmapData(border.width, border.height, true, 0x0);
			bitdata.draw(border);
			var tex:Texture = Texture.fromBitmapData(bitdata);
			bitdata.dispose();
			var im:starling.display.Image = new starling.display.Image(tex);
			im.touchable = false;
			addChild(im);
		}

		/**组件xml结构(高级用法：动态更改XML，然后通过页面重新渲染)*/
		public function get comXml():XML {
			return _comXml;
		}

		public function set comXml(value:XML):void {
			_comXml = value;
		}

		/**组件的JSON类型数据结构*/
		public function get comJSON():Object {
			return _comJSON;
		}

		public function set comJSON(value:Object):void {
			_comJSON = value;
		}

		/**数据赋值
		 * 简单赋值更改组件的默认属性，使用大括号可以指定组件的任意属性进行赋值
		 * @example label1和checkbox1分别为组件实例的name属性
		 * <listing version="3.0">
		 * //默认属性赋值(更改了label1的text属性，更改checkbox1的selected属性)
		 * dataSource = {label1: "改变了label", checkbox1: true}
		 * //任意属性赋值
		 * dataSource = {label2: {text:"改变了label",size:14}, checkbox2: {selected:true,x:10}}
		 * </listing>*/
		public function get dataSource():Object {
			return _dataSource;
		}

		public function set dataSource(value:Object):void {
			_dataSource = value;
			for (var prop:String in _dataSource) {
				if (hasOwnProperty(prop)) {
					this[prop] = _dataSource[prop];
				}
			}
		}

		/**鼠标提示
		 * 可以赋值为文本及函数，以实现自定义鼠标提示和参数携带等
		 * @example 下面例子展示了三种鼠标提示
		 * <listing version="3.0">
		 *	private var _testTips:TestTipsUI = new TestTipsUI();
		 *	private function testTips():void {
		 *		//简单鼠标提示
		 *		btn2.toolTip = "这里是鼠标提示&lt;b&gt;粗体&lt;/b&gt;&lt;br&gt;换行";
		 *		//自定义的鼠标提示
		 *		btn1.toolTip = showTips1;
		 *		//带参数的自定义鼠标提示
		 *		clip.toolTip = new Handler(showTips2, ["clip"]);
		 *	}
		 *	private function showTips1():void {
		 *		_testTips.label.text = "这里是按钮[" + btn1.label + "]";
		 *		App.tip.addChild(_testTips);
		 *	}
		 *	private function showTips2(name:String):void {
		 *		_testTips.label.text = "这里是" + name;
		 *		App.tip.addChild(_testTips);
		 *	}
		 * </listing>*/
		public function get toolTip():Object {
			return _toolTip;
		}

		public function set toolTip(value:Object):void {
			if (_toolTip != value) {
				_toolTip = value;
				if (Boolean(value)) {
					addEventListener(TouchEvent.TOUCH, onRollMouse);
					if (Starling.current.stage != null) {
						Starling.current.stage.addEventListener(UIEvent.SHOW_TIP, App.tip.onStageShowTip);
						Starling.current.stage.addEventListener(UIEvent.HIDE_TIP, App.tip.onStageHideTip);
					}
				} else {
					removeEventListener(TouchEvent.TOUCH, onRollMouse);
					if (Starling.current.stage != null) {
						Starling.current.stage.removeEventListener(UIEvent.SHOW_TIP, App.tip.onStageShowTip);
						Starling.current.stage.removeEventListener(UIEvent.HIDE_TIP, App.tip.onStageHideTip);
					}
				}
			}
		}

		protected function onRollMouse(e:TouchEvent):void {
			var control:DisplayObject = e.currentTarget as DisplayObject;
			var touch:Touch = e.getTouch(control, TouchPhase.HOVER);
			dispatchEvent(new UIEvent((touch != null) ? UIEvent.SHOW_TIP : UIEvent.HIDE_TIP, {"tooltip": _toolTip, "x": e.data[0].globalX, "y": e.data[0].globalY}, true));
		}

		/**居父容器顶部的距离*/
		public function get top():Number {
			return _top;
		}
		
		public function set top(value:Number):void {
			_top = value;
			layOutEnabled = true;
		}
		
		/**居父容器底部的距离*/
		public function get bottom():Number {
			return _bottom;
		}
		
		public function set bottom(value:Number):void {
			_bottom = value;
			layOutEnabled = true;
		}
		
		/**居父容器左边的距离*/
		public function get left():Number {
			return _left;
		}
		
		public function set left(value:Number):void {
			_left = value;
			layOutEnabled = true;
		}
		
		/**居父容器右边的距离*/
		public function get right():Number {
			return _right;
		}
		
		public function set right(value:Number):void {
			_right = value;
			layOutEnabled = true;
		}
		
		/**居父容器水平居中位置的偏移*/
		public function get centerX():Number {
			return _centerX;
		}
		
		public function set centerX(value:Number):void {
			_centerX = value;
			layOutEnabled = true;
		}
		
		/**居父容器垂直居中位置的偏移*/
		public function get centerY():Number {
			return _centerY;
		}
		
		public function set centerY(value:Number):void {	
			_centerY = value;
			layOutEnabled = true;
		}
		
		private function set layOutEnabled(value:Boolean):void {
			if (_layOutEnabled != value) {
				_layOutEnabled = value;
				addEventListener(Event.ADDED, onAdded);
				addEventListener(Event.REMOVED, onRemoved);
			}
			callLater(resetPosition);
		}
		
		private function onRemoved(e:Event):void {
			if (e.target == this) {
				parent.removeEventListener(Event.RESIZE, onCompResize);
			}
		}
		
		private function onAdded(e:Event):void {
			if (e.target == this) {
				parent.addEventListener(Event.RESIZE, onCompResize);
				callLater(resetPosition);
			}
		}
		
		private function onCompResize(e:Event):void {
			callLater(resetPosition);
		}
		
		/**重置位置*/
		protected function resetPosition():void {
			if (parent) {
				if (!isNaN(_centerX)) {
					x = (parent.width - displayWidth) * 0.5 + _centerX;
				} else if (!isNaN(_left)) {
					x = _left;
					if (!isNaN(_right)) {
						width = (parent.width - _left - _right) / scaleX;
					}
				} else if (!isNaN(_right)) {
					x = parent.width - displayWidth - _right;
				}
				if (!isNaN(_centerY)) {
					y = (parent.height - displayHeight) * 0.5 + _centerY;
				} else if (!isNaN(_top)) {
					y = _top;
					if (!isNaN(_bottom)) {
						height = (parent.height - _top - _bottom) / scaleY;
					}
				} else if (!isNaN(_bottom)) {
					y = parent.height - displayHeight - _bottom;
				}
			}
		}
		
		
		/**
		 * redraw
		 */
		public function redraw():void {

		}

		/**
		 * removeAll
		 */
		public function removeAll():void {
			removeChildren(0, -1, true);
		}

		/**
		 * destroy
		 */
		public function destroy():void {
			removeAll();
		}

		/**皮肤 需要的地方才会实现皮肤的显示*/
		public function get skin():String {
			return _skin;
		}

		public function set skin(value:String):void {
			if (_skin != value) {
				_skin = value;
				updateSkin();
			}
		}

		/**
		 * 是否使用纹理皮肤  贴图皮肤 贴图Atlas名.texture名
		 * @return
		 */
		public function get useTextureSkin():Boolean {
			return _useTextureSkin;
		}

		public function set useTextureSkin(value:Boolean):void {
			if (_useTextureSkin != value) {
				_useTextureSkin = value;
				updateSkin();
			}
		}

		protected function updateSkin():void {
		}

		public function get skinImage():Image {
			return _skinImage;
		}

		public function set skinImage(value:Image):void {
			_skinImage = value;
		}

		/**九宫格信息(格式:左边距,上边距,右边距,下边距)*/
		public function get sizeGrid():String {
			var gridStr:String = null;
			if (skinImage.scale9Grid != null) {
				gridStr = skinImage.scale9Grid.x + "," +
					skinImage.scale9Grid.y + "," +
					skinImage.scale9Grid.width + "," +
					skinImage.scale9Grid.height + ",";
			}

			return gridStr;
		}

		public function set sizeGrid(value:String):void {
			var gridArr:Array = StringUtils.fillArray(Styles.defaultSizeGrid, value, int);
			skinImage.scale9Grid = new Rectangle(gridArr[0], gridArr[1], gridArr[2], gridArr[3]);
		}


	}
}