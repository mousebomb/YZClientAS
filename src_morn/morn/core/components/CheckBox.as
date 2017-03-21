/**
 * Morn UI Version 2.0.0526 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import flash.display.BitmapData;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	/**多选按钮*/
	public class CheckBox extends UIButton {
		
		private var offsetx:Number = 5;
		private var offsety:Number = 5;
		
		private var _contentTextImage:Image;
		
		public function CheckBox(skin:String = null, label:String = "") {
			super(skin, label);
		}
		
		override protected function preinitialize():void {
			super.preinitialize();
			_toggle = true;
			_autoSize = false;
		}
		
		override protected function initialize():void {
			super.initialize();
			_btnLabel.autoSize = "left";
		}
		
		override protected function changeLabelSize():void {
			redraw();
			_btnLabel.width = _btnLabel.textField.textWidth + offsetx;
			_btnLabel.height = _btnLabel.textField.textHeight + offsety;
			_btnLabel.x = skinImage.width + _labelMargin[0];
			_btnLabel.y = (skinImage.height - _btnLabel.height) * 0.5 + _labelMargin[1];
		}
		
		override public function commitMeasure():void {
			exeCallLater(changeLabelSize);
		}
		
		override public function set dataSource(value:Object):void {
			_dataSource = value;
			if (value is Boolean) {
				selected = value;
			} else if (value is String) {
				selected = value == "true";
			} else {
				super.dataSource = value;
			}
		}
	}
}