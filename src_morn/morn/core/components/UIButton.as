/**
 * Morn UI Version 2.4.1027 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
import flash.display.BitmapData;

import morn.core.handlers.Handler;
import morn.core.utils.ObjectUtils;
import morn.core.utils.StringUtils;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

/**选择改变后触发*/
[Event(name="select", type="starling.events.Event")]

/**按钮类*/
public class UIButton extends Component implements ISelect {
    protected static var stateMap:Object = {"rollOver": 1, "rollOut": 0, "mouseDown": 2, "mouseUp": 1, "selected": 2};
    protected var _bitmap:AutoBitmap;
    protected var _btnLabel:Label;
    protected var _clickHandler:Handler;
    protected var _labelColors:Array = Styles.buttonLabelColors;
    protected var _labelMargin:Array = Styles.buttonLabelMargin;
    protected var _state:int;
    protected var _toggle:Boolean;
    protected var _selected:Boolean;
    protected var _autoSize:Boolean = true;

    //一次把贴图都读进来缓存
    private var _clips:Vector.<Texture>;

    public function UIButton(skin:String = null, label:String = "", useTextureSkin:Boolean = true) {
        this.skin = skin;
        this.label = label;
        this.useTextureSkin = useTextureSkin;
        addEventListener(TouchEvent.TOUCH, onMouse);
    }

    override protected function createChildren():void {
        _bitmap = new AutoBitmap();
        _btnLabel = new Label();
        _clips = new <Texture>[];
        skinImage = new Image(null);
    }

    override protected function initialize():void {
        _btnLabel.align = "center";
//			_bitmap.sizeGrid = Styles.defaultSizeGrid;
        skinImage.scale9Grid = Styles.defaultRectGrid;
    }

    protected function onMouse(e:TouchEvent):void {
        if ((_toggle == false && _selected) || _disabled) {
            return;
        }

        var touch:Touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.BEGAN);
        if (touch) {
            state = stateMap["mouseDown"];

            if (_toggle) {
                selected = !_selected;
            }
            if (_clickHandler) {
                _clickHandler.execute();
            }
            sendEvent(Event.SELECT);

            onClick(e);
            return;
        }

        if (_selected == false) {
            touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.HOVER);
            if (touch) {
                state = stateMap["rollOver"];
            } else {
                state = stateMap["rollOut"];
            }

            touch = e.getTouch(e.currentTarget as DisplayObject, TouchPhase.ENDED);
            if (touch) {
                state = stateMap["rollOut"];
            }
        }
    }

    protected function onClick(e:TouchEvent):void {
    }

    /**按钮标签*/
    public function get label():String {
        return _btnLabel.text;
    }

    public function set label(value:String):void {
        if (_btnLabel.text != value) {
            _btnLabel.text = value;
            callLater(changeState);
        }
    }

    override public function set skin(value:String):void {
        if (super.skin != value) {
            super.skin = value;
        }
    }

    override protected function updateSkin():void {
        if (useTextureSkin) {
            setClips(0, 2);
            if (_autoSize && _clips && _clips[state]) {
                _contentWidth = _clips[state].frameWidth;
                _contentHeight = _clips[state].frameHeight;
            }
        } else {
            _bitmap.clips = App.asset.getClips(super.skin, 1, 3);
            if (_autoSize) {
                _contentWidth = _bitmap.width;
                _contentHeight = _bitmap.height;
            }
        }

        callLater(changeLabelSize);
    }

    /**
     * 设置指定数量的clip 或者替换
     * @param start
     * @param end
     * @return
     */
    private function setClips(start:int, end:int):void {
        var texture:Texture;
        if (_clips.length >= (end + 1)) {
            for (var i:int = end + 1; i < _clips.length; i++) {
                texture = _clips[i];
                if (texture) {
                    texture.dispose();
                }
            }
        }
        _clips.length = end + 1;//end小的时候截断后边数据
        for (i = start; i < end + 1; i++) {
            texture = App.asset.getTextureIndex(skin, i);
            _clips[i] = texture;
        }
    }

    protected function changeLabelSize():void {
        redraw();

        _btnLabel.width = width - _labelMargin[0] - _labelMargin[2];
        _btnLabel.height = ObjectUtils.getTextField(_btnLabel.format).height;
        _btnLabel.x = _labelMargin[0];
        _btnLabel.y = (height - _btnLabel.height) * 0.5 + _labelMargin[1] - _labelMargin[3];
    }

    override public function redraw():void {
        //画到场景里
        removeChildren(0, -1, false);
        var tex:Texture = null;
        if (skin && skin != "") {
            if (useTextureSkin) {
                if (_clips && _clips.length > state) {
                    tex = _clips[state];
                } else {
                    tex = null;
                }
            } else {
                if (_bitmap.clips != null) {
                    var bmd:BitmapData = new BitmapData(_bitmap.bitmapData.width, _bitmap.bitmapData.height, true, 0x0);
                    bmd.draw(_bitmap.bitmapData);
                    tex = Texture.fromBitmapData(bmd);
                    bmd.dispose();
                }
            }
        }

        if (tex) {
            skinImage.texture = tex;
            skinImage.width = isNaN(_width)?tex.frameWidth:width;
            skinImage.height = isNaN(_height)?tex.frameHeight:height;
            addChild(skinImage);
        }

        addChild(_btnLabel);
    }

    /**是否是选择状态*/
    public function get selected():Boolean {
        return _selected;
    }

    public function set selected(value:Boolean):void {
        if (_selected != value) {
            _selected = value;
            state = _selected ? stateMap["selected"] : stateMap["rollOut"];
        }
    }

    protected function get state():int {
        return _state;
    }

    protected function set state(value:int):void {
        if (value != _state) {
            _state = value;
            changeState();
        }
    }

    protected function changeState():void {
        _bitmap.index = _state;
        _btnLabel.color = _labelColors[_state];

        callLater(changeLabelSize);
    }

    /**是否是切换状态*/
    public function get toggle():Boolean {
        return _toggle;
    }

    public function set toggle(value:Boolean):void {
        _toggle = value;
    }

    override public function set disabled(value:Boolean):void {
        if (_disabled != value) {
            super.disabled = value;
            state = _selected ? stateMap["selected"] : stateMap["rollOut"];
            ObjectUtils.gray(this, _disabled);
        }
    }

    /**按钮标签字体*/
    public function get labelFont():String {
        return _btnLabel.font;
    }

    public function set labelFont(value:String):void {
        _btnLabel.font = value
        callLater(changeLabelSize);
    }

    /**按钮标签颜色(格式:upColor,overColor,downColor,disableColor)*/
    public function get labelColors():String {
        return String(_labelColors);
    }

    public function set labelColors(value:String):void {
        _labelColors = StringUtils.fillArray(_labelColors, value);
        callLater(changeState);
    }

    /**按钮标签边距(格式:左边距,上边距,右边距,下边距)*/
    public function get labelMargin():String {
        return String(_labelMargin);
    }

    public function set labelMargin(value:String):void {
        _labelMargin = StringUtils.fillArray(_labelMargin, value, int);
        callLater(changeLabelSize);
    }

    /**按钮标签描边(格式:color,alpha,blurX,blurY,strength,quality)*/
    public function get labelStroke():String {
        return _btnLabel.stroke;
    }

    public function set labelStroke(value:String):void {
        _btnLabel.stroke = value;
    }

    /**按钮标签大小*/
    public function get labelSize():Object {
        return _btnLabel.size;
    }

    public function set labelSize(value:Object):void {
        _btnLabel.size = value;
        callLater(changeLabelSize);
    }

    /**按钮标签粗细*/
    public function get labelBold():Object {
        return _btnLabel.bold;
    }

    public function set labelBold(value:Object):void {
        _btnLabel.bold = value;
        callLater(changeLabelSize);
    }

    /**字间距*/
    public function get letterSpacing():Object {
        return _btnLabel.letterSpacing;
    }

    public function set letterSpacing(value:Object):void {
        _btnLabel.letterSpacing = value;
        callLater(changeLabelSize);
    }

    /**点击处理器(无默认参数)*/
    public function get clickHandler():Handler {
        return _clickHandler;
    }

    public function set clickHandler(value:Handler):void {
        _clickHandler = value;
    }

    /**按钮标签控件*/
    public function get btnLabel():Label {
        return _btnLabel;
    }

//		/**九宫格信息(格式:左边距,上边距,右边距,下边距)*/
//		public function get sizeGrid():String {
//			if (_bitmap.sizeGrid) {
//				return _bitmap.sizeGrid.join(",");
//			}
//			return null;
//		}
//
//		public function set sizeGrid(value:String):void {
//			_bitmap.sizeGrid = StringUtils.fillArray(Styles.defaultSizeGrid, value);
//		}

    override public function set width(value:Number):void {
        super.width = value;
        if (_autoSize) {
            skinImage.width = _bitmap.width = value;
        }

        callLater(changeLabelSize);
    }

    override public function set height(value:Number):void {
        super.height = value;
        if (_autoSize) {
            skinImage.height = _bitmap.height = value;
        }

        callLater(changeLabelSize);
    }

    override public function set dataSource(value:Object):void {
        _dataSource = value;
        if (value is Number || value is String) {
            label = String(value);
        } else {
            super.dataSource = value;
        }
    }

    /**销毁资源
     * @param    clearFromLoader 是否同时删除加载缓存*/
    override public function destroy():void {
        dispose();
    }

    /**销毁*/
    override public function dispose():void {
        super.dispose();

        if (_clips) {
            for (var i:int = 0; i < _clips.length; i++) {
                if (_clips[i]) {
                    _clips[i].dispose();
                }
            }
            _clips.length = 0;
        }
        _clips = null;
        skinImage && skinImage.dispose();
        skinImage = null;
    }
}
}
