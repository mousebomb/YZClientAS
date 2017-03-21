/**
 * Morn UI Version 2.0.0526 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.events {
	import starling.events.Event;
	
	/**UI事件类*/
	public class UITextEvent extends Event {
		//文本变化
		public static const CHANGE:String    = "change";
		//文本回车
		public static const ENTER:String     = "enter";
		//文本获得焦点
		public static const FOCUS_IN:String  = "focusIn";
		//文本失去焦点
		public static const FOCUS_OUT:String = "focusOut";

		//输入文本
		public static const TEXTINPUT:String = "textInput";
		
		public function UITextEvent(type:String, data:*, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, data);
		}
	}
}