package tl.core.common
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	/**
	 * 纹理进度条公共类 
	 * @author Administrator
	 * 郑利本
	 */
	public class HProgressBar extends HSprite
	{
		private var _minNum:Number = 0;
		private var _maxNum:Number = 0;				//最大值
		private var _gapX:int;						//文本偏移量
		private var _gapY:int;
		private var _downTexture:Texture;			//底板纹理
		private var _upTexture:Texture;				//面板纹理
		private var _downImage:Image;				//底板图片
		protected var _upImage:Image ;				//面板图片
		private var _upSpr:HSprite;
		
		private var _progressBarBG:Image;			//纹理背景

		private var _FontSize:int=12;				//字体大小
		private var _FontColor:uint=0xffffff;		//字体颜色
		private var _nowProgress:Number = 100;		//当前进度
		protected var _ratio:Number = 0.00;			//比率
		private var _isConvertText:Boolean;			//是否只显示当前值
		private var _isShowText:Boolean = true;		//是否显示文本
		protected var _effectRatio:Number;			//原始数值
		protected var _isAdd:Boolean;
		public var upColor:uint=0xFFb47015;			//面板颜色 ARPG格式
		public var downColor:uint=0xFF0d9b8c;		//底板颜色
		public var isDisPatchDraw:Boolean;			//是否派发事件
		private var _showTextType:int = 0;			
		public var fractionDigits:int = 0;			//保留小数点位数
		public var repeatCall:Function;
		private var _isChangeMax:Boolean;
		private var _isPlayer:Boolean;				//正在播放特效
		protected var _change:Boolean;				//是否改变进度值图片
		private var _tempoImage:Image;				//进度光标
		protected var _isReverse:Boolean = false;
		private var _tempoSpr:Sprite;
		private var _tempoAddx:int;					//光标X轴偏移量
		protected var _txtProgress:StarlingTextField;
		private var _backgroundImg:Image;			//背景图片
		//进度文本
		
		/**
		 *血条文字显示类型(0:显示数值 1:显示百分比 2:显示当前数值) 
		 */
		public function get showTextType():int
		{
			return _showTextType;
		}

		/**
		 * @private
		 */
		public function set showTextType(value:int):void
		{
			_showTextType = value;
		}
		public function HProgressBar()
		{
			super();
		}
		/**
		 * 进度条设置 
		 * @param downTexture 	背景纹理
		 * @param upTexturet  	进度纹理
		 * @param _Width		宽度
		 * @param _Height		高度
		 * @param min			数值显示最小值
		 * @param max			数值显示最大值
		 * @param gapX			文本坐标偏移量
		 * @param gapY
		 * 
		 */		
		public function  init(upTexturet:Texture=null,downTexture:Texture=null,_Width:Number=100,_Height:Number=20,min:Number=0,max:Number=100, gapX:int = 0, gapY:int = 0):void
		{
			_gapX = gapX;
			_gapY = gapY;
			_minNum = min;
			_maxNum = max;
			if(this.isInit) return;
			if(upTexturet!=null){
				_upTexture=upTexturet;
				this.myWidth = upTexturet.width;
				this.myHeight = upTexturet.height;
			}else{
				this.myWidth = _Width;
				this.myHeight = _Height;
				_upTexture = Texture.fromColor(this.myWidth,this.myHeight,upColor);
			}
			if(downTexture!=null){
				_downTexture = downTexture;
			}else{
				_downTexture = Texture.fromColor(this.myWidth,this.myHeight,downColor);
			}
			_downImage = new Image(_downTexture);
			this.addChild(_downImage);
			
			_upSpr = new HSprite;
			_upSpr.touchable = false;
			_upImage = new Image(_upTexture);
			_upSpr.addChild(_upImage);
			this.addChild(_upSpr);
			if(_tempoSpr)
				this.addChild(_tempoSpr);
			_txtProgress = new StarlingTextField()
			_txtProgress.touchable = false;
			_txtProgress.size = _FontSize;
			_txtProgress.algin = "center";
			_txtProgress.width = this.myWidth;
			_txtProgress.height = 20;
			_txtProgress.x = 0;
			_txtProgress.textColor = _FontColor;
			_txtProgress.y=(this.myHeight-20 >> 1) + gapY;
			if(isShowText)
				this.addChild(_txtProgress);
			this.isInit = true;
		}
		/**
		 * 设定当前进度值 
		 * @param value 
		 * 
		 */		
		public function set nowProgress(value:Number):void
		{
			if((_nowProgress == value && !_isChangeMax) || _isPlayer) return;
			_isChangeMax = false;
			if(isDisPatchDraw)dispatchEvent(new Event("drawProgress"));
			_effectRatio = Number(_ratio.toFixed(4));
			if(_nowProgress < value)
				_isAdd =  true ;
			else {
				_isAdd = false;
				//_effectRatio = _upImage.scaleX = 0;
			}
			_nowProgress = value;
			var num:Number = Number(Number(value/_maxNum).toFixed(4));
			_ratio = Math.max(0.0, Math.min(1.0, num));



			updateProgress();
			showTextValue();
		}
		/**设定背景图片*/
		public function set backgroudTexture(texture:Texture):void
		{
			if(!_backgroundImg)
			{
				_backgroundImg = new Image(texture);
				this.addChildAt(_backgroundImg, 0);
				_backgroundImg.touchable = false;
			}	else {
				_backgroundImg.texture = texture;
				_backgroundImg.readjustSize();
			}
			_backgroundImg.x = this.myWidth - texture.width >> 1;
			_backgroundImg.y = this.myHeight - texture.height >> 1;
		}
		/**
		 * 刷新显示 
		 */		
		private function updateProgress():void
		{
			if(_tempoImage)
			{
				if(_isReverse)//显示反转
					_tempoImage.x = (1 -  _ratio) * this.myWidth - _tempoAddx;
				else
					_tempoImage.x = _ratio * this.myWidth - _tempoAddx;
			}
			_upImage.scaleX = _ratio;
			_upImage.setTexCoords(1, _ratio, 0.0);
			_upImage.setTexCoords(3, _ratio, 1.0);
		}
		public function get nowProgress():Number{
			return _nowProgress;
		}
		
		public function get maxNum():Number
		{
			return _maxNum;
		}
		
		public function set maxNum(value:Number):void
		{
			if(_txtProgress && _isShowText && (_maxNum != value))
			{
				showTextValue()
			}
			if(_maxNum != value)
				_isChangeMax = true;
			_maxNum = value;
		}

		
		public function get FontSize():int
		{
			return _FontSize;
		}
		/**
		 * 字体大小设置 
		 * @param value
		 * 
		 */
		public function set FontSize(value:int):void
		{
			_FontSize = value;
		}
		
		public function get FontColor():uint
		{
			return _FontColor;
		}
		/**
		 * 字体颜色设置 
		 * @param value
		 * 
		 */
		public function set FontColor(value:uint):void
		{
			_FontColor = value;
		}
		
		public function get isConvertText():Boolean
		{
			return _isConvertText;
		}

		public function set isConvertText(value:Boolean):void
		{
			_isConvertText = value;
			showTextType = 3;
		}
		/**
		 * 设置进度条背景(在init方法调用后执行)
		 * @param value		: 进度条背景纹理
		 * @param offsetX	: x偏移坐标
		 * @param offsetY	: y偏移坐标
		 */		
		public function setProgressBarBG(value:Texture, offsetX:int = 0, offsetY:int = 0):void
		{
			_progressBarBG ||= new Image(value);
			this.addChildAt(_progressBarBG, 0);
			if(_downImage)
			{
				_progressBarBG.x = ((_downImage.width - _progressBarBG.width) >> 1) + offsetX;
				_progressBarBG.y = ((_downImage.height - _progressBarBG.height) >> 1) + offsetY;
			}
		}
		/**显示文本*/
		private function showTextValue():void
		{
			switch(showTextType)
			{
				case 0:	//显示当前值
					_txtProgress.label = ""+int(_nowProgress)+"  /  "+_maxNum;
					break;
				case 1:	//显示百分比
					var str:String = Number(_nowProgress/_maxNum*100).toFixed(fractionDigits);
					_txtProgress.label = str + "%";
					break;
				case 2:	//显示当前数值
					_txtProgress.label = ""+int(_nowProgress);
					break;
				case 3:	//显示百分比,但是不显示百分号
					str = Number(_nowProgress/_maxNum*100).toFixed(fractionDigits);
					_txtProgress.label = str ;
					break;
				case 4:	//显示数字，又显示百分比
					str = ""+_nowProgress+"  /  "+_maxNum + "  (" + Number(_nowProgress/_maxNum*100).toFixed(fractionDigits) + "%)";
					_txtProgress.label = str ;
					break;
			}
		}
		
		public override function dispose():void
		{
			if(_txtProgress)
				_txtProgress.dispose();
			if(_downTexture)
				_downTexture.dispose();
			if(_upTexture)
				_upTexture.dispose();
			if(_downTexture)
				_downTexture.dispose();
			if(_downImage)
				_downImage.dispose();
			if(_upImage)
				_upImage.dispose();
			if(_upSpr)
				_upSpr.dispose();
			super.dispose();
		}

		public function get isShowText():Boolean
		{
			return _isShowText;
		}

		public function set isShowText(value:Boolean):void
		{
			_isShowText = value;
			if(_txtProgress)
			{
				_txtProgress.visible = value;
				if(value)
				{
					showTextValue()
				}
			}
		}

		/**
		 * 设定光标
		 * @param value，图标
		 * @param addX， x轴偏移量
		 * 
		 */
		public function setTempoImage(value:Image, addX:int):void
		{
			if(value)
			{
				if(!_tempoSpr)
				{
					_tempoSpr = new Sprite;
					if(this.isInit)
					{
						var index:int = this.getChildIndex(_txtProgress);
						if(index > -1)
							this.addChildAt(_tempoSpr, index);
						else
							this.addChild(_tempoSpr);
					}
				}
				_tempoImage = value;
				_tempoAddx = addX;
				clearTempoImage();
				_tempoSpr.addChild(_tempoImage)
				_tempoImage.y = this.myHeight - _tempoImage.height >> 1;
				if(_isReverse)//显示反转
					_tempoImage.x = (1 -  _upImage.scaleX) * this.myWidth - _tempoAddx;
				else
					_tempoImage.x = _upImage.scaleX * this.myWidth - _tempoAddx;
			}
		}

		private function clearTempoImage():void
		{
			while(_tempoSpr.numChildren > 0)
			_tempoSpr.removeChildAt(0);
		}
		
		public function get isReverse():Boolean
		{
			return _isReverse;
		}

		public function set isReverse(value:Boolean):void
		{
			_isReverse = value;
		}


		public function get tempoImage():Image
		{
			return _tempoImage;
		}


	}
}

