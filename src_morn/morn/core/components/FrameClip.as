/**
 * Morn UI Version 2.4.1020 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.components {
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import morn.core.events.UIEvent;
	import morn.core.handlers.Handler;
	import morn.editor.core.IClip;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.SubTexture;
	import starling.textures.Texture;

	/**当前帧发生变化后触发*/
	[Event(name="frameChanged",type="morn.core.events.UIEvent")]
	
	/**矢量动画类(为了统一，frame从0开始与movieclip不同)*/
	public class FrameClip extends Component implements IClip {
		protected var _autoStopAtRemoved:Boolean = true;
		protected var _mc:flash.display.MovieClip;
		protected var _frame:int;
		protected var _autoPlay:Boolean;
		protected var _interval:int = MornUIConfig.MOVIE_INTERVAL;
		protected var _to:Object;
		protected var _complete:Handler;
		protected var _isPlaying:Boolean;
		
		protected var _textures:Vector.<Texture> = null;
		protected var _images:Vector.<starling.display.Image> = null;
		
		public function FrameClip(skin:String = null) {
			this.skin = skin;
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
		
		override public function set skin(value:String):void {
			if (super.skin != value) {
				super.skin = value;
				mc = App.asset.getAsset(value);
			}
		}
		
		/**矢量动画*/
		public function get mc():flash.display.MovieClip {
			return _mc;
		}
		
		private function generateFrames():void {
			if(_mc == null)
			{
				return;
			}
			
			var i:int = 0;
			if(_textures != null) {
				for(i = 0; i < _textures.length; i++)
				{
					if (_textures[i] is SubTexture ){
						(_textures[i] as SubTexture).parent.dispose();
					}
					_textures[i].dispose();
				}
				_textures.splice(0, _textures.length);
			}
			if(_images != null)
			{
				for(i = 0; i < _images.length; i++)
				{
					_images[i].dispose();
				}
				_images.splice(0, _images.length);
			}
			
			_textures = new Vector.<Texture>();
			_images = new Vector.<starling.display.Image>();
			
			var theRect:Rectangle = null;
			for (var idx:int = 1; idx <= _mc.totalFrames; idx++)
			{
				_mc.gotoAndStop(idx);
				theRect = _mc.getRect(_mc);
				var bitmapData:BitmapData;
				if(theRect.isEmpty())//空帧特殊处理
				{
					theRect.width = 1;
					theRect.height = 1;
					bitmapData = new BitmapData(theRect.width, theRect.height, true, 0x00000000);
				}
				else
				{
					bitmapData = new BitmapData(theRect.width, theRect.height, true, 0x00000000);
					var theMaxtrix:Matrix = new Matrix();
					theMaxtrix.translate(-theRect.x, -theRect.y);
					theMaxtrix.scale(_mc.scaleX, _mc.scaleY);
					bitmapData.draw(_mc, theMaxtrix);
				}
				
				var texture:Texture = Texture.fromBitmapData(bitmapData, false, false, scale);
				bitmapData.dispose();
				_textures.push(texture);
				
				var mImage:starling.display.Image = new starling.display.Image(texture);
				_images.push(mImage);
			}
		}
		
		public function set mc(value:flash.display.MovieClip):void {
			if (_mc != value) {
				if(_mc != null) {
					_mc.stop();
				}
				_mc = null;
				
				_mc = value;
				_mc.stop();
				
				generateFrames();
				removeChildren(0, -1, true);
				if (_mc && _images) {
					addChild(_images[frame]);
				}
				
				_contentWidth = mc.width;
				_contentHeight = mc.height;
			}
		}
			
		override public function set width(value:Number):void {
			super.width = value;
			if (_mc) {
				_mc.width = _width;
			}
			//generateFrames();
		}
		
		override public function set height(value:Number):void {
			super.height = value;
			if (_mc) {
				_mc.height = _height;
			}
			//generateFrames();
		}
		
		/**当前帧(为了统一，frame从0开始，原始的movieclip从1开始)*/
		public function get frame():int {
			return _frame;
		}
		
		public function set frame(value:int):void {
			_frame = value;
			if (_mc) {
				//_frame = (_frame < _mc.numFrames && _frame > -1) ? _frame : 0;
				_frame = (_frame < _mc.totalFrames && _frame > -1) ? _frame : 0;
				//_mc.currentFrame = _frame + 1;
				removeChildren(0, -1, true);
				addChild(_images[frame]);
				
				sendEvent(UIEvent.FRAME_CHANGED);
				if (_to && (_mc.currentFrame - 1 == _to)) {
					stop();
					_to = null;
					if (_complete != null) {
						var handler:Handler = _complete;
						_complete = null;
						handler.execute();
					}
				}
			}
		}
		
		/**切片帧的总数*/
		public function get totalFrame():int {
			return _mc ? _mc.numFrames : 0;
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
			frame = _frame;
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
		
		/**从某帧播放到某帧，播放结束发送事件(为了统一，frame从0开始，原始的movieclip从1开始)
		 * @param from 开始帧或标签(为null时默认为第一帧)
		 * @param to 结束帧或标签(为null时默认为最后一帧)
		 */
		public function playFromTo(from:Object = null, to:Object = null, complete:Handler = null):void {
			from ||= 0;
//			_to = to == null ? _mc.numFrames - 1 : to;
			_to = to == null ? _mc.totalFrames - 1 : to;
			_complete = complete;
			if (from is int) {
				gotoAndPlay(from as int);
			} else {
				//_mc.currentFrame = int(from);
				removeChildren(0, -1, true);
				addChild(_images[from]);
				
				gotoAndPlay(_mc.currentFrame - 1);
			}
		}
		
		override public function set dataSource(value:Object):void {
			_dataSource = value;
			if (value is int || value is String) {
				frame = int(value);
			} else {
				super.dataSource = value;
			}
		}
	}
}