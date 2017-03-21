/**
 * Morn UI Version 2.4.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
import flash.geom.Rectangle;

import morn.core.events.UIEvent;
import morn.core.utils.ObjectUtils;

import starling.events.Event;

/**当滚动内容时调用*/
[Event(name="scroll", type="morn.core.events.UIEvent")]

/**文本发生改变后触发*/
[Event(name="change", type="starling.events.Event")]

/**文本域*/
public class TextArea extends TextInput {
    protected var _scrollBar:VScrollBar;
    protected var _lineHeight:Number;

    public function TextArea(text:String = null) {
        super(text);
    }

    override protected function createChildren():void {
        super.createChildren();
        _scrollBar = new VScrollBar();
    }

    override protected function initialize():void {
        super.initialize();
        width = 180;
        height = 150;
        _textField.wordWrap = true;
        _textField.multiline = true;
        _textField.selectable = false;
        _textField.addEventListener(Event.SCROLL, onTextFieldScroll);
        _scrollBar.addEventListener(Event.CHANGE, onScrollBarChange);
    }

    override protected function changeSize():void {
        _textField.width = _width - _margin[0] - _margin[2];
        _textField.height = _height - _margin[1] - _margin[3];
        _textField.scrollRect = null;
        if (parent != null) {
            _textField.x = parent.x + x;
            _textField.y = parent.y + y;
        }
        if (Boolean(_scrollBar.skin)) {
            _textField.width = _textField.width - _scrollBar.width - 2;
            _scrollBar.height = _height - _margin[1] - _margin[3];
            _scrollBar.x = _width - _margin[2];
            _scrollBar.y = _margin[1];
            App.timer.doFrameOnce(1, onTextFieldScroll, [null]);

            removeChild(_scrollBar);
            redraw();
            if (_textField.scrollRect == null) {
                _textField.scrollRect = new Rectangle(0, 0, width, height);
            }
            addChild(_scrollBar);
        }
    }

    override protected function changeText():void {
        _lineHeight = ObjectUtils.getTextField(_format).textHeight;
        super.changeText();
    }

    protected function onScrollBarChange(e:Object):void {
        var rect:Rectangle = _textField.scrollRect;
        var start:int = Math.floor(_scrollBar.value / _scrollBar.scrollSize);
//			_scrollBar.direction == ScrollBar.VERTICAL ? rect.y = start : rect.x = start;
//			_textField.scrollRect = rect;
        scrollTo(start);

        removeChild(_scrollBar);
        redraw();
        addChild(_scrollBar);
    }

    protected function onTextFieldScroll(e:Object):void {
        if (Boolean(_scrollBar.skin)) {
            if (_textField.textHeight > height) {
                _scrollBar.visible = true;
                _scrollBar.target = this;
                _scrollBar.scrollSize = height / (_textField.maxScrollV - 1);
                _scrollBar.thumbPercent = height / textField.textHeight;
                _scrollBar.setScroll(0, height, _scrollBar.value);
            }
            else {
                _scrollBar.visible = false;
            }
        }
        sendEvent(UIEvent.SCROLL);
    }

    /**滚动条皮肤*/
    public function get scrollBarSkin():String {
        return _scrollBar.skin;
    }

    public function set scrollBarSkin(value:String):void {
        _scrollBar.useTextureSkin = useTextureSkin;
        _scrollBar.skin = value;
        callLater(changeSize);
    }

    /**滚动条实体*/
    public function get scrollBar():VScrollBar {
        return _scrollBar;
    }

    /**垂直滚动最大值*/
    public function get maxScrollV():int {
        return _textField.maxScrollV;
    }

    /**滚动到某个位置，单位是行*/
    public function scrollTo(line:int):void {
        commitMeasure();
        _textField.scrollV = line + 1;
    }

    override public function set useTextureSkin(value:Boolean):void {
        if (useTextureSkin != value) {
            super.useTextureSkin = value;
            _scrollBar.useTextureSkin = value;
        }
    }
}
}