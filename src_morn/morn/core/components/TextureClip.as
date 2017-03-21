/**
 * Morn UI Version 3.2 http://www.mornui.com/
 * Feedback yungvip@163.com weixin:yungzhu
 */
package morn.core.components {

import morn.core.events.UIEvent;
import morn.core.handlers.Handler;
import morn.editor.core.IClip;

import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;

/**图片加载后触发*/
[Event(name="imageLoaded", type="morn.core.events.UIEvent")]
/**当前帧发生变化后触发*/
[Event(name="frameChanged", type="morn.core.events.UIEvent")]

/**位图剪辑*/
public class TextureClip extends Component implements IClip {
    protected var _autoStopAtRemoved:Boolean = true;
    protected var _autoPlay:Boolean;
    protected var _interval:int = MornUIConfig.MOVIE_INTERVAL;
    protected var _from:int = -1;
    protected var _to:int = -1;
    protected var _complete:Handler;
    protected var _isPlaying:Boolean;

    //使用贴图时用来设置最大帧数
    protected var _totalFrame:uint = 1;
    //当前帧
    private var _index:int = 0;
    //一次把贴图都读进来缓存
    private var _clips:Vector.<Texture>;


    public function TextureClip(skin:String = null, totalFrame:uint = 1) {
        useTextureSkin = true;
        _totalFrame = totalFrame;
        this.skin = skin;
    }

    override protected function createChildren():void {
        _clips = new <Texture>[];
        skinImage = new Image(null);
        skinImage.width = 0;
        skinImage.height = 0;
        addChild(skinImage);
    }

    override protected function initialize():void {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    protected function onAddedToStage(e:Event):void {
        if (_autoPlay) {
            play();
        }
    }

    protected function onRemovedFromStage(e:Event):void {
        if (_autoStopAtRemoved) {
            stop();
        }
    }

    override public function get skin():String {
        return super.skin;
    }

    override public function set skin(value:String):void {
        if (skin != value && Boolean(value)) {
            super.skin = value;

            setClips(0, totalFrame - 1);
        }
    }

    /**切片Y轴数量*/
    public function get totalFrame():int {
        return _totalFrame;
    }

    public function set totalFrame(value:int):void {
        if (_totalFrame != value) {
            setClips(_totalFrame - 1, value - 1);
        }
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

        _totalFrame = end + 1;
        callLater(changeClip);
    }

    protected function changeClip():void {
        if (!useTextureSkin) {
        } else {
            if (_clips && _clips[frame]) {
                skinImage.texture = _clips[frame];
                _contentWidth = _clips[frame].width;
                _contentHeight = _clips[frame].height;
                sendEvent(UIEvent.IMAGE_LOADED);
            }
        }
    }

    /**源位图数据*/
    public function get clips():Vector.<Texture> {
        return _clips;
    }

    public function set clips(value:Vector.<Texture>):void {
        if (value) {
            _clips = value;
        }
        if (_clips && _clips[frame]) {
            skinImage.texture = _clips[frame];
            _contentWidth = _clips[frame].frameWidth;
            _contentHeight = _clips[frame].frameHeight;
            sendEvent(UIEvent.IMAGE_LOADED);
        }
    }

    override public function set width(value:Number):void {
        super.width = value;
        skinImage.width = value;
    }

    override public function set height(value:Number):void {
        super.height = value;
        skinImage.height = value;
    }

    override public function commitMeasure():void {
        exeCallLater(changeClip);
    }

    /**当前帧*/
    public function get frame():int {
        return _index;
    }

    public function set frame(value:int):void {
        _index = int(value);
        _index = (_index < _clips.length && _index > -1) ? _index : 0;
        redraw();
        sendEvent(UIEvent.FRAME_CHANGED);
        if (_index == _to) {
            stop();
            _to = -1;
            if (_complete != null) {
                var handler:Handler = _complete;
                _complete = null;
                handler.execute();
            }
        }
    }

    /**当前帧，等同于frame*/
    public function get index():int {
        return _index;
    }

    public function set index(value:int):void {
        frame = value;
    }

    /**从显示列表删除后是否自动停止播放*/
    public function get autoStopAtRemoved():Boolean {
        return _autoStopAtRemoved;
    }

    public function set autoStopAtRemoved(value:Boolean):void {
        _autoStopAtRemoved = value;
    }

    /**自动播放*/
    public function get autoPlay():Boolean {
        return _autoPlay;
    }

    public function set autoPlay(value:Boolean):void {
        if (_autoPlay != value) {
            _autoPlay = value;
            _autoPlay ? play() : stop();
        }
    }

    /**动画播放间隔(单位毫秒)*/
    public function get interval():int {
        return _interval;
    }

    public function set interval(value:int):void {
        if (_interval != value) {
            _interval = value;
            if (_isPlaying) {
                play();
            }
        }
    }

    /**是否正在播放*/
    public function get isPlaying():Boolean {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void {
        _isPlaying = value;
    }

    /**开始播放*/
    public function play():void {
        _isPlaying = true;
        frame = _index;
        App.timer.doLoop(_interval, loop);
    }

    protected function loop():void {
        frame++;
    }

    /**停止播放*/
    public function stop():void {
        App.timer.clearTimer(loop);
        _isPlaying = false;
    }

    /**从指定的位置播放*/
    public function gotoAndPlay(frame:int):void {
        this.frame = frame;
        play();
    }

    /**跳到指定位置并停止*/
    public function gotoAndStop(frame:int):void {
        stop();
        this.frame = frame;
    }

    /**从某帧播放到某帧，播放结束发送事件
     * @param from 开始帧(为-1时默认为第一帧)
     * @param to 结束帧(为-1时默认为最后一帧) */
    public function playFromTo(from:int = -1, to:int = -1, complete:Handler = null):void {
        _from = from == -1 ? 0 : from;
        _to = to == -1 ? totalFrame - 1 : to;
        _complete = complete;
        gotoAndPlay(_from);
    }

    override public function set dataSource(value:Object):void {
        _dataSource = value;
        if (value is int || value is String) {
            frame = int(value);
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

    override public function redraw():void {
        if (useTextureSkin) {
            if (clips && _clips.length > frame) {
                var texture:Texture = _clips[frame];


                if (texture) {
                    skinImage.texture = texture;
                    _contentWidth = texture.frameWidth;
                    _contentHeight = texture.frameHeight;
                    skinImage.width = isNaN(width)?_contentWidth:width;
                    skinImage.height = isNaN(height)?_contentHeight:height;
                }else {
                    skinImage.texture = null;
                    _contentWidth = 0;
                    _contentHeight = 0;
                }
            }
        }
    }

}
}