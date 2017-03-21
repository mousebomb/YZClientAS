/**
 * Morn UI Version 2.0.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import morn.core.events.UIEvent;
	import morn.core.handlers.Handler;
	import morn.core.utils.StringUtils;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**对话框*/
	public class Dialog extends View {
		public static const CLOSE:String = "close";
		public static const CANCEL:String = "cancel";
		public static const SURE:String = "sure";
		public static const NO:String = "no";
		public static const OK:String = "ok";
		public static const YES:String = "yes";
		
		protected var _dragArea:Rectangle;
		protected var _popupCenter:Boolean = true;
		protected var _closeHandler:Handler;
		
		override protected function initialize():void {
			var dragTarget:DisplayObject = getChildByName("drag");
			if (dragTarget) {
				dragArea = dragTarget.x + "," + dragTarget.y + "," + dragTarget.width + "," + dragTarget.height;
				removeElement(dragTarget);
			}
			dragTarget = getChildByName(CLOSE);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			dragTarget = getChildByName(CANCEL);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			dragTarget = getChildByName(SURE);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			dragTarget = getChildByName(NO);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			dragTarget = getChildByName(OK);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			dragTarget = getChildByName(YES);
			if (dragTarget) {
				dragTarget.addEventListener(TouchEvent.TOUCH, onClick);
			}
			
			addEventListener(UIEvent.MOVE, onMoving);
		}
		
		private function onMoving(e:UIEvent):void {
			var container:DisplayObjectContainer = this as DisplayObjectContainer;
			if(container) {
				var child:DisplayObject = null;
				var numChildren:int = container.numChildren;
				for (var i:int = 0; i < numChildren; ++i) {
					child = getChildAt(i);
					if(child) {
						child.dispatchEvent(e);
					}
				}
			}
		}
		
		/**默认按钮处理*/
		protected function onClick(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if(touch)
			{
				var btn:UIButton = e.currentTarget as UIButton;
				if (btn) {
					switch (btn.name) {
						case CLOSE: 
						case CANCEL: 
						case SURE: 
						case NO: 
						case OK: 
						case YES: 
							close(btn.name);
							break;
					}
				}
			}
		}
		
		/**显示对话框(非模式窗口)
		 * @param closeOther 是否关闭其他对话框*/
		public function show(closeOther:Boolean = false):void {
			addEventListener(TouchEvent.TOUCH, onMouseDown);
			addEventListener(TouchEvent.TOUCH, onMouseMove);
			addEventListener(TouchEvent.TOUCH, onMouseUp);
			
			App.dialog.show(this, closeOther);
		}
		
		/**显示对话框(模式窗口)
		 * @param closeOther 是否关闭其他对话框*/
		public function popup(closeOther:Boolean = false):void {
			App.dialog.popup(this, closeOther);
		}
		
		/**关闭对话框*/
		public function close(type:String = null):void {
			removeEventListener(TouchEvent.TOUCH, onMouseDown);
			removeEventListener(TouchEvent.TOUCH, onMouseMove);
			removeEventListener(TouchEvent.TOUCH, onMouseUp);
			
			App.dialog.close(this);
			if (_closeHandler != null) {
				_closeHandler.executeWith([type]);
			}
		}
		
		/**拖动区域(格式:x:Number=0, y:Number=0, width:Number=0, height:Number=0)*/
		public function get dragArea():String {
			return StringUtils.rectToString(_dragArea);
		}
		
		public function set dragArea(value:String):void {
			if (Boolean(value)) {
				var a:Array = StringUtils.fillArray([0, 0, 0, 0], value);
				_dragArea = new Rectangle(a[0], a[1], a[2], a[3]);
				
			} else {
				_dragArea = null;
			}
		}
		
		private var lastx:Number = 0;
		private var lasty:Number = 0;
		private var dragBegin:Boolean = false;
		private function onMouseDown(e:TouchEvent):void {
			if(e.currentTarget != this) {
				return;
			}
			
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if(touch) {
				var pos:Point = touch.getLocation(this);
				if (_dragArea && _dragArea.contains(pos.x, pos.y)) {
					lastx = e.data[0].globalX;
					lasty = e.data[0].globalY;
					dragBegin = true;
				}
			}
		}
		
		private function onMouseMove(e:TouchEvent):void {
			if(e.currentTarget != this) {
				return;
			}
			
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.MOVED);
			if(touch && dragBegin) {
				x += e.data[0].globalX - lastx;
				y += e.data[0].globalY - lasty;
				
				lastx = e.data[0].globalX;
				lasty = e.data[0].globalY;
			}
		}
		
		private function onMouseUp(e:TouchEvent):void {
			if(e.currentTarget != this) {
				return;
			}
			
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.ENDED);
			if(touch) {
				dragBegin = false;
				lastx = 0;
				lasty = 0;
			}
		}
		
		/**是否弹出*/
		public function get isPopup():Boolean {
			return parent != null;
		}
		
		/**是否居中弹出*/
		public function get popupCenter():Boolean {
			return _popupCenter;
		}
		
		public function set popupCenter(value:Boolean):void {
			_popupCenter = value;
		}
		
		/**关闭回调(返回按钮名称name:String)*/
		public function get closeHandler():Handler {
			return _closeHandler;
		}
		
		public function set closeHandler(value:Handler):void {
			_closeHandler = value;
		}
	}
}