/**
 * Morn UI Version 2.4.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**单选框按钮*/
	public class RadioButton extends UIButton {
		protected var _value:Object;
		
		public function RadioButton(skin:String = null, label:String = "", useTextureSkin:Boolean = true) {
			super(skin, label, useTextureSkin);
		}
		
		override protected function preinitialize():void {
			super.preinitialize();
			_toggle = false;
			_autoSize = false;
		}
		
		override protected function initialize():void {
			super.initialize();
			_btnLabel.autoSize = "left";
			//addEventListener(TouchEvent.TOUCH, onClick);
		}
		
		override protected function changeLabelSize():void {
			redraw();
			_btnLabel.width = _btnLabel.textField.textWidth + 5 + _btnLabel.format.letterSpacing + skinImage.width;
			_btnLabel.height = _btnLabel.textField.textHeight + 5;
			_btnLabel.x = skinImage.width + _labelMargin[0];
			_btnLabel.y = (skinImage.height - _btnLabel.height) * 0.5 + _labelMargin[1];
		}
		
		override public function commitMeasure():void {
			exeCallLater(changeLabelSize);
		}
		
		override protected function onClick(e:TouchEvent):void {
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
			if(touch)
			{
				selected = true;
			}
		}
		
		/**组件关联的可选用户定义值*/
		public function get value():Object {
			return _value != null ? _value : label;
		}
		
		public function set value(obj:Object):void {
			_value = obj;
		}
	}
}