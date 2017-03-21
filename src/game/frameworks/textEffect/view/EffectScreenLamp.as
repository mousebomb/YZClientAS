package game.frameworks.textEffect.view
{
	import com.greensock.TweenLite;

	import flash.geom.Rectangle;

	import starling.display.Image;
	import starling.display.Quad;

	import starling.events.Event;
	import starling.textures.Texture;

	import tl.core.GPUResProvider;
	import tl.core.common.HBaseSprite;

	import tl.core.common.HScreenText;

	import tl.core.common.HSprite;

	import tool.PropertyCount;
	import tool.StageFrame;

	/**
	 * 走马灯
	 * **/
	public class EffectScreenLamp extends HBaseSprite
	{
		private static var _instance:EffectScreenLamp = null;
		private var _Label:String                     ="";
		private var _isScroll:Boolean                 = false;
		private var queueArgs:Array                   = new Array();
		private var _width:Number                     = 600;
		private var _txtList:Vector.<HScreenText>     = new <HScreenText>[];
		private var _txtMoveList:Vector.<HScreenText> = new <HScreenText>[];
		private var _txtInfo:HScreenText;
		private var _color:String                     = "#d2a67216";
		private var _tweenLite:TweenLite;
		
		public function EffectScreenLamp(){
			//this.visible = false;
			_instance = this;
			InIt();
		}
		
		public static function getInstance():EffectScreenLamp{
			if(!_instance){
				_instance = new EffectScreenLamp();
			}
			return _instance;
		}
		
		private function InIt():void{
			var texture:Texture = GPUResProvider.getInstance().getMyTexture("source_interface_0", 'background/move_bg');
			var bg:Image = new Image(texture);
			bg.scale9Grid = new Rectangle(64,16,92,4);
			this.addChild(bg);
			bg.width = _width;
			bg.height = 30;
			this.myWidth = _width;
			this.myHeight = 30;
			this.y = 58;
			this.mask = new Quad(600, 300);
		}
		
		private function onEnterframe(event:Event=null):void{
			if(_isScroll){
				PropertyCount.getInstance().keyStart("UIScene.MainFace_ScreenTop","HFrameWorkerManager");
				var index:int = -1;
				var len:int = _txtMoveList.length;
				for(var i:int=0; i<len; i++)
				{
					_txtMoveList[i].x -= 3;
					if(_txtMoveList[i].x < -_txtMoveList[i].myWidth - 10)
						index = i;
				}
				
				if(index > -1)
				{
					var shift:HScreenText = _txtMoveList.splice(index, 1)[0];
					shift.clearTxt();
					_txtList.push(shift);
				}
				if(_txtInfo.x + _txtInfo.myWidth < _width - 300)
				{
					if(queueArgs.length>0){
						_Label = queueArgs.shift();
						var txt:HScreenText = getScreenTopTxt();
						txt.updateShowText( _color+_Label);
						txt.x = this.myWidth - 10;
						_txtInfo = txt;
						_txtMoveList.push(txt);
					}	else if(_txtInfo.x < -_txtInfo.myWidth - 10)
						_isScroll = false;
				}
				PropertyCount.getInstance().keyEnd("UIScene.MainFace_ScreenTop","HFrameWorkerManager");
			}	else {
				if(this.parent)
				{
					_tweenLite = TweenLite.to(this, 0.5, {alpha:0.1,
						onComplete:function ()
								   {
									   _tweenLite.kill();
									   _tweenLite = null;
									   _instance.alpha = 1;
									   if(_instance.parent)
									   {
										   _instance.parent.removeChild(_instance);
									   }
								   }}
					)
				}
				StageFrame.removeActorFun(onEnterframe);
			}
		}
		
		public function set Label(value:String):void{
			if(_tweenLite)
			{
				_tweenLite.kill();
				_tweenLite = null;
				_instance.alpha = 1;
			}
			if(!_isScroll)
			{
				this.visible = true;
				_isScroll = true; /// 滚动
				var txt:HScreenText = getScreenTopTxt();
				txt.updateShowText(_color +value);//"#d2a67216"
				txt.x = _width - 10;
				_txtInfo = txt;
				_txtMoveList.push(txt);
				StageFrame.addActorFun(onEnterframe);
				this.x = (StageFrame.stage.stageWidth-_width) >> 1;
			}	else
				queueArgs.push(value);
			this.y = 58;
		}
		
		private function getScreenTopTxt():HScreenText
		{
			var txt:HScreenText;
			if(_txtList.length > 0)
				txt = _txtList.shift();
			else {
				txt = new HScreenText;
				_instance.addChild(txt);
				txt.y=4;
			}
			return txt;
		}
		
	}
}