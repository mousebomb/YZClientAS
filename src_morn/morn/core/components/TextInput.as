/**
 * Morn UI Version 2.1.0623 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.KeyboardEvent;
    import flash.events.TextEvent;
    import flash.geom.Matrix;
    import flash.text.TextFieldType;
    import flash.ui.Keyboard;

    import morn.core.events.UIEvent;
    import morn.core.events.UITextEvent;

    import starling.core.Starling;
    import starling.display.DisplayObject;
    import starling.events.Event;

    /**文本发生改变后触发*/
    [Event(name="change", type="starling.events.Event")]

    /**文本发生改变后触发*/
    [Event(name="change", type="morn.core.events.UITextEvent")]

    /**当用户输入文本时调度*/
    [Event(name="textInput", type="morn.core.events.UITextEvent")]

    /**文本发生改变后触发*/
    [Event(name="enter", type="morn.core.events.UITextEvent")]

    /**文本获得焦点后触发*/
    [Event(name="focusIn", type="morn.core.events.UITextEvent")]

    /**文本失去焦点后触发*/
    [Event(name="focusOut", type="morn.core.events.UITextEvent")]


    /**输入框*/
    public class TextInput extends Label {

        //是否锁住不发送change事件
        private var changeEventLock:Boolean = false;
        //缓存文本
        private var cacheText:String = "";
        //缓存光标位置
        private var cacheCaretIndex:int = 0;

        public function TextInput(text:String = "", skin:String = null) {
            super(text, skin);
            cacheText = super.text;
            cacheCaretIndex = _textField.caretIndex;
            needDrawText = false;//输入文本默认不需要画
        }

        override protected function initialize():void {
            super.initialize();
            width                        = 128;
            height                       = 22;
            selectable                   = true;
            _textField.type              = TextFieldType.INPUT;
            _textField.autoSize          = "none";
            _textField.selectable        = true;
            _textField.needsSoftKeyboard = true;
            _textField.requestSoftKeyboard();

            addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoveFromStage);
            addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(UIEvent.MOVE, onMoving);
        }

        private function onMoving(e:UIEvent):void {
            callLater(changeSize);
        }

        private function onAddedToStage(e:starling.events.Event):void {
            if (editable) {
                redraw();
                Starling.current.nativeOverlay.addChild(_textField);
                _textField.addEventListener(flash.events.Event.CHANGE, onTextChange);
                _textField.addEventListener(TextEvent.TEXT_INPUT, onTextInput);
                _textField.addEventListener(FocusEvent.FOCUS_IN, onTextFocusIn);
                _textField.addEventListener(FocusEvent.FOCUS_OUT, onTextFocusOut);
                _textField.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            }
        }

        private function onTextChange(e:flash.events.Event):void {
            if (!changeEventLock) {
                sendEvent(starling.events.Event.CHANGE);
                sendTextEvent(UITextEvent.CHANGE);
            }
        }

        private function onTextInput(e:TextEvent):void {
            sendTextEvent(UITextEvent.TEXTINPUT);
        }

        private function onKeyDown(e:KeyboardEvent):void {
            if (e.keyCode == Keyboard.ENTER) {
                sendTextEvent(UITextEvent.ENTER);
            }
        }

        private function onTextFocusIn(e:FocusEvent):void {
            changeEventLock = true;
            needDrawText = false;
            redraw();
            _textField.text = cacheText;
            _textField.setSelection(cacheCaretIndex, cacheCaretIndex);
            changeEventLock = false;
            sendTextEvent(UITextEvent.FOCUS_IN);
        }

        private function onTextFocusOut(e:FocusEvent):void {
            changeEventLock = true;
            needDrawText = true;
            redraw();
            cacheCaretIndex = _textField.caretIndex;
            cacheText = _textField.text;
            _textField.text = "";
            changeEventLock = false;
            sendTextEvent(UITextEvent.FOCUS_OUT);
        }

        public function setSelection(beginIndex:int, endIndex:int):void {
            _textField.setSelection(beginIndex, endIndex);
        }

        override public function set visible(b:Boolean):void {
            super.visible = b;
            _textField.visible = b;
        }

        override public function get transformationMatrix():Matrix {
            if (requiresRedraw) {
                renderPosition();
            }
            return super .transformationMatrix;
        }

        private function renderPosition():void {
            _textField.x                = x;
            _textField.y                = y;
            var parentObj:DisplayObject = parent;
            while (parentObj) {
                _textField.x += parentObj.x;
                _textField.y += parentObj.y;

                parentObj = parentObj.parent;
            }
        }

        private function onRemoveFromStage(e:starling.events.Event):void {
            if (editable) {
                Starling.current.nativeOverlay.removeChild(_textField);
                _textField.removeEventListener(flash.events.Event.CHANGE, onTextChange);
                _textField.removeEventListener(TextEvent.TEXT_INPUT, onTextInput);
                _textField.removeEventListener(FocusEvent.FOCUS_IN, onTextFocusIn);
                _textField.removeEventListener(FocusEvent.FOCUS_IN, onTextFocusOut);
                _textField.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            }
        }

        /**显示的文本*/
        override public function get text():String {
            _text = cacheText;
            return _text;
        }

        override public function set text(value:String):void {
            if (_text != value) {
                _text = value || "";
                cacheText = value;
                cacheCaretIndex = cacheText.length;
                changeText();
                sendEvent(starling.events.Event.CHANGE);
                sendEvent(morn.core.events.UITextEvent.CHANGE);
            }
        }

        public function get caretIndex():int {
            return cacheCaretIndex;
        }

        /**指示用户可以输入到控件的字符集*/
        public function get restrict():String {
            return _textField.restrict;
        }

        public function set restrict(value:String):void {
            _textField.restrict = value;
        }

        override protected function changeSize():void {
            renderPosition();
            super.changeSize();
        }

        /**是否可编辑*/
        public function get editable():Boolean {
            return _textField.type == TextFieldType.INPUT;
        }

        public function set editable(value:Boolean):void {
            _textField.type = value ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
        }

        /**最多可包含的字符数*/
        public function get maxChars():int {
            return _textField.maxChars;
        }

        public function set maxChars(value:int):void {
            _textField.maxChars = value;
        }
    }
}