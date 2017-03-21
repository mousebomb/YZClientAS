package tl.core.common
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.setTimeout;

	import game.frameworks.system.service.MouseCursorManage;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.textures.Texture;

	import tl.core.GPUResProvider;

	import tl.core.common.StarlingTextField;

	/**
	 * 按钮基类 
	 * @author Administrator
	 * 郑利本
	 */	
	public class HSimpleButton extends HSprite
	{
		protected var _upState:Texture=null;			//弹起样式
		protected var _downState:Texture=null;			//按下样式
		protected var _overState:Texture=null;			//经过样式
		protected var _disabledState:Texture=null;		//不可用样式
		protected var _selectedState:Texture=null		//选择样式默认为经过样式
		protected var _currentState:Texture=null;		//当前样式
		protected var _iconImage:Image=null;			//显示图标
		
		private var _myWidth:Number;
		private var _myHeight:Number;
		private var _labelText:String;					//按钮显示文本
		private var _isSelected:Boolean=false;			//是否选中状态
		private var _isDisabled:Boolean=false;			//是否失效状态
		private var _iocnText:StarlingTextField ;
		private var _currentColor:String;
		private var _isclearMOuseCursor:Boolean;		//是否清除事件遮挡
		
		public var isSelectReturn:Boolean = true;		//是否选中后再点击会return
		public var offsetX:int;							//X值偏移量
		public var offsetY:int;							//Y值偏移量
		public var selectedColor:uint=0xFFb47015;
		public var upColor:uint=0xFFdbac6d;
		public var overColor:uint=0xFFa45d0e;
		public var downColor:uint=0xFF8e908f;
		public var disabledColor:uint=0xFFcb8f42;
		
		public var moveTextColor:String = "#ff0000"
		public var selectedTextColor:String="#5dd100"
		public var upTextColor:String='#d4b07a'//"#af9875"
		public var overTextColor:String='#e6c775'//"#ffffff"
		public var downTextColor:String='#967351'//"#dcc094"
		public var disabledTextColor:String="#949494"
		
		public var id:String = "";
		public var textSize:uint=14;
		public var textBold:Boolean=false;			//文本加粗
		public var isMoveTextColor:Boolean = false;	//是否开启鼠标移入颜色改变
		public var textAlign:String="center";
		public var upCallBack:Function;				//up回调
		public var downCallBack:Function;				//down回调
		public var overCallBack:Function;				//over回调
		public var isMoveOver:Boolean;					//是否需要移动事件
		private var _mousePoint:Point = new Point;		//鼠标点
		private var _clickPoint:Point = new Point;		//鼠标点
		private var _restoreColor:uint;
		public function HSimpleButton()
		{
		}
		/**
		 * 设置纹理 
		 * @param UpTexture   		按起
		 * @param OverTexture 		移入
		 * @param DownTexture 		按下
		 * @param DisabledTexture 	失效
		 * @param SelectedTexture	选中
		 * 
		 */		
		public function setTextureSkin(UpTexture:Texture=null,
								OverTexture:Texture=null,
								DownTexture:Texture=null,
								DisabledTexture:Texture=null,
								SelectedTexture:Texture=null
		):void{
			_upState = UpTexture;
			_overState = OverTexture;
			_downState = DownTexture;
			_disabledState = DisabledTexture;
			_selectedState = SelectedTexture;
			if(_upState!=null){
				this.myDrawByTexture(_upState);
			}
		}
		
		/**
		 *设置默认皮肤 (蓝色87x32)
		 */
		public function setDefaultSkin():void
		{
			_upState = GPUResProvider.getInstance().getMyTexture("source_interface_0" , "background/btn_type_1_0");
			_downState = GPUResProvider.getInstance().getMyTexture("source_interface_0" , "background/btn_type_1_2");
			_overState = GPUResProvider.getInstance().getMyTexture("source_interface_0" , "background/btn_type_1_1");
			_disabledState = GPUResProvider.getInstance().getMyTexture("source_interface_0" , "background/btn_type_disabled");
			_selectedState = _downState;
			//this.offsetY = 1;
		}
		/** 默认关闭按钮1(35x35) **/
		public function setCloseSkin():void
		{
			_upState = GPUResProvider.getInstance().getMyTexture('source_interface_0' , "background/btn_close_0");
			_downState = GPUResProvider.getInstance().getMyTexture('source_interface_0' , "background/btn_close_1");
			_overState = GPUResProvider.getInstance().getMyTexture('source_interface_0' , "background/btn_close_2");
			_selectedState = _downState;
			
			upTextColor = "#C6EEFF";
			overTextColor = "#F1FEFF";
			downTextColor = "#62A2D4";
		}
        public function setAssetsSkin(atlasResName:String, imgName:String):void
        {
            _upState = GPUResProvider.getInstance().getMyTexture(atlasResName , imgName + "_0");
            _overState = GPUResProvider.getInstance().getMyTexture(atlasResName , imgName + "_1");
            _downState = GPUResProvider.getInstance().getMyTexture(atlasResName , imgName + "_2");
            _disabledState = GPUResProvider.getInstance().getMyTexture(atlasResName , imgName + "_3");
            _selectedState = _downState;
        }
		/**
		 *初始化 
		 * @param labelText 按钮名称
		 * @param myWidth 宽
		 * @param myHeight 高
		 * 
		 */
		public function init(labelText:String="",myWidth:Number=60,myHeight:Number=26):void{
			if(_upState==null){
				_myWidth=myWidth;
				_myHeight=myHeight;
			}else{
				_myWidth=_upState.width;
				_myHeight=_upState.height;	
			}
			//如果末指定皮肤则绘制默认皮肤
			if(myWidth<1||myHeight<1) return;
			if(_upState==null){
				if(Starling.context.driverInfo == "Disposed")
				{ 
					_restoreColor = upColor
					//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
				}	else {
					_upState = getTextureFromBmd(upColor)
				}
			}
			_currentState = _upState
			this.myDrawByTexture(_currentState);
			
			_labelText=labelText;
			this.label=_labelText;
			this.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		/**
		 * 鼠标事件 
		 * @param e
		 * 
		 */		
		protected function onTouch(e:TouchEvent):void{
			var isDraw:Boolean ,isDispatch:Boolean;
			var _Touch:Touch=e.getTouch(this);
			//选中和失效状态不处理
			if((_isSelected && isSelectReturn) || _isDisabled)
			{
				if(!_Touch)
					MouseCursorManage.getInstance().showCursor();
				return;
			}
			
			if(_Touch == null){
				if(_currentState != _upState)
				{
					isDraw = true;
					if(_isSelected)
					{
						if(_selectedState==null){
							if(Starling.context.driverInfo == "Disposed")
							{ 
								_restoreColor = selectedColor
								//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
							}	else {
								_selectedState = getTextureFromBmd(selectedColor)
							}
						}
						_currentState = _selectedState;
						_currentColor = selectedTextColor;
					}	else {
						_currentState = _upState ;
						_currentColor = upTextColor;	
					}
					
					//执行当前状态回调
					if(upCallBack != null) upCallBack(this);
				}
				MouseCursorManage.getInstance().showCursor();
			}	else {
				/*if(HTopBaseView.getInstance().hasEvent || HTopBaseView.getInstance().isShowFull)
				{
					if(!isPierce)
						return;//事件穿透
				}*/
				if (_Touch.phase == "began")//down
				{
					if(_currentState != _downState)
					{
						isDraw = true;
						if(_isSelected)
						{
							if(_selectedState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = selectedColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_selectedState = getTextureFromBmd(selectedColor)
								}
							}
							_currentState = _selectedState;
							_currentColor = selectedTextColor;
						}	else {
							if(_downState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = downColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_downState = getTextureFromBmd(downColor)
								}
							}
							_currentColor = downTextColor;
							_currentState = _downState
						}
						//执行当前状态回调
						if(downCallBack != null) downCallBack(this);
					}
					MouseCursorManage.getInstance().showCursor(9);
					_clickPoint.setTo(_Touch.globalX, _Touch.globalY);
				} 	else if (_Touch.phase == "hover") {//over
					if(_currentState != _overState)
					{
						isDraw = true;
						if(_isSelected)
						{
							if(_selectedState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = selectedColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_selectedState = getTextureFromBmd(selectedColor)
								}
							}
							_currentState = _selectedState;
						}	else {
							if(_overState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = overColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_overState = getTextureFromBmd(overColor)
								}
							}
							_currentState = _overState
						}
						
						if(isMoveTextColor)
							_currentColor = moveTextColor;
						else
							_currentColor = overTextColor;
						
						//执行当前状态回调
						if(!isMoveOver)
						{
							if(overCallBack != null) 
								overCallBack(this );
						}
						
					}
					if(isMoveOver)
					{
						if(overCallBack != null) 
							overCallBack(this );
					}
					MouseCursorManage.getInstance().showCursor(3);
				} 	else if (_Touch.phase == "ended") {//click
					MouseCursorManage.getInstance().showCursor(3);
					//对象池事件
					if(_isDisabled)
					{
						if(_currentState != _disabledState)
						{
							isDraw = true;
							if(_disabledState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = disabledColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_disabledState = getTextureFromBmd(disabledColor)
								}
							}
							_currentState = _disabledState
							_currentColor = disabledTextColor
						}
					}	else if(_isSelected) {
						if(_currentState != _selectedState)
						{
							isDraw = true;
							if(_selectedState==null){
								if(Starling.context.driverInfo == "Disposed")
								{ 
									_restoreColor = selectedColor
									//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
								}	else {
									_selectedState = getTextureFromBmd(selectedColor)
								}
							}
							_currentState = _selectedState;
							_currentColor = selectedTextColor
						}
					}	else {
						if(_currentState != _upState)
						{
							isDraw = true;
							_currentState = _upState;
							_currentColor = upTextColor
						}
					}
					isDispatch = true;
				}
			}
			if(isDraw)
			{
				this.myDrawByTexture(_currentState);
				updateLabel();
			}
			if(isDispatch)
			{
				_mousePoint.setTo(_Touch.globalX, _Touch.globalY);
				var index:int = Point.distance(_clickPoint, _mousePoint);
				if(index < 10)
				{
					setTimeout(function():void{
						dispatchEventWith(starling.events.Event.TRIGGERED, true);
					},1);
				}
			}
		}
		/**
		 *设置是否选中 
		 * @param isornot
		 * 
		 */
		public function set selected(isornot:Boolean):void{
			_isSelected=isornot;
			if(_isSelected){
				if(_selectedState==null){
					if(Starling.context.driverInfo == "Disposed")
					{ 
						_restoreColor = selectedColor
						//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
					}	else {
						_selectedState = getTextureFromBmd(selectedColor)
					}
				}
				_currentState = _selectedState
				_currentColor = selectedTextColor
			}
			else{
				_currentState = _upState
				_currentColor = upTextColor
			}
			this.myDrawByTexture(_currentState);

			updateLabel();
		}
		public function get selected():Boolean{
			return _isSelected;
		}
		/**
		 * 设置显示图标 
		 * @param texture
		 * 
		 */		
		public function set iconTexture(texture:Texture):void
		{
			if(texture == null) 
			{
				if(_iconImage)
					_iconImage.visible = false;
				return;
			}
			if(_iconImage == null)
			{
				_iconImage = new Image(texture);
				this.addChild(_iconImage);
				_iconImage.touchable = false;
				_iconImage.x = this.myWidth - texture.width >> 1;
				_iconImage.y = this.myHeight - texture.height >> 1;
			}	else {
				_iconImage.visible = true;
				if(_iconImage.texture != texture)
				{
					_iconImage.texture = texture;
					_iconImage.readjustSize();
					_iconImage.x = this.myWidth - texture.width >> 1;
					_iconImage.y = this.myHeight - texture.height >> 1;
				}
			}
		}
		public function get iconImage():Image
		{
			return _iconImage;
		}
		
		public function setIconoImage():void
		{
			_iconImage.x = this.myWidth - _iconImage.width;
			_iconImage.y = - 5;
		}
		/**
		 *设置是否失效 
		 * @param isornot
		 * 
		 */
		public function set disabled(isornot:Boolean):void{
			_isDisabled=isornot;
			if(_isDisabled){
				if(_disabledState==null){
					if(Starling.context.driverInfo == "Disposed")
					{ 
						_restoreColor = disabledColor
						//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
					}	else {
						_disabledState = getTextureFromBmd(disabledColor)
					}
				}
				_currentState = _disabledState
				_currentColor = disabledTextColor
				this.touchable=false;
			} 	else {
				if(selected)
				{
					if(_selectedState==null){
						if(Starling.context.driverInfo == "Disposed")
						{ 
							_restoreColor = selectedColor
							//Dispatcher_F.getInstance().addEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
						}	else {
							_selectedState = getTextureFromBmd(selectedColor)
						}
					}
					_currentState =  _selectedState ;
					_currentColor = selectedTextColor
				}	else {
					_currentState = _upState;
					_currentColor = upTextColor
				}
				this.touchable=true;
			}
			this.myDrawByTexture(_currentState);
			updateLabel();
		}

		/**数据找回时刷新*/
		private function onRestore(event:flash.events.Event):void
		{
			//Dispatcher_F.getInstance().removeEventListener(ComEventKey.CONTEXT_CREATED, onRestore);
			_currentState = getTextureFromBmd(_restoreColor)
			this.myDrawByTexture(_currentState);
		}
		/**获得当前状态图片*/
		private function getTextureFromBmd(color:int):Texture
		{
			var bmd:BitmapData = new BitmapData(_myWidth,_myHeight,true,color);
			return SFTexture.fromTextBitmapData(bmd, null, false);
		}
		public function get disabled():Boolean{
			return _isDisabled;
		}
		
		/** 按钮文本 **/
		public function get labelTextField():StarlingTextField  {  return _iocnText;  }
		
		public function set label(text:String):void{
			_labelText=text;
			_currentColor = upTextColor;
			if(_labelText == "")
			{
				if(_iocnText)
					_iocnText.visible = false;
			}	else {
				if(_iocnText == null)
				{
					_iocnText = new StarlingTextField;
					this.addChild(_iocnText);
					_iocnText.touchable = false;
					_iocnText.size = textSize;
					_iocnText.algin = "center";
					_iocnText.bold = true;
					_iocnText.width = this._myWidth;
					_iocnText.height = 20;
					_iocnText.x = 0;
					_iocnText.y = this._myHeight - 20 >> 1;
				}	else
					_iocnText.visible = true;
				_iocnText.textColor = _restoreColor;
				updateLabel()
			}
			
		}
		public function updateLabel():void
		{
			if(_iocnText)
			{
				if(textBold)
					_iocnText.eventLabel= _currentColor + textSize + "bn00" + _labelText;
				else	
					_iocnText.label= _currentColor + textSize + _labelText;
				
				switch(textAlign)
				{
					case "left":
						_iocnText.x = offsetX;
						_iocnText.y =  (this.myHeight-20 >> 1) +offsetY;
						break;
					case "center":
						_iocnText.x = offsetX;
						_iocnText.y = (this.myHeight-20 >> 1) + offsetY;
						break;
					case "right":
						_iocnText.x = this._myWidth - _iocnText.textWidth + offsetX;
						_iocnText.y = (this.myHeight-20 >> 1) + offsetY;
						break;
				}
			}
		}
		
		public function get label():String{
			return _labelText;
		}
		/**
		 * 释放内存 
		 */
		public override function dispose():void{
			super.dispose();
			if(_upState)
			{
				_upState.dispose()
				_upState = null;
			}
			if(_overState)
			{
				_overState.dispose()
				_overState = null;
			}
			if(_downState)
			{
				_downState.dispose()
				_downState = null;
			}
			if(_disabledState)
			{
				_disabledState.dispose()
				_disabledState = null;
			}
			if(_selectedState)
			{
				_selectedState.dispose()
				_selectedState = null;
			}
			this.removeEventListener(TouchEvent.TOUCH,onTouch);
			if(_iocnText)
			{
				_iocnText.dispose();
				_iocnText = null;
			}
			if(_iconImage)
			{
				_iconImage.texture.dispose();
				_iconImage.dispose();
				_iconImage = null;
			}
		}

		public function get isclearMOuseCursor():Boolean
		{
			return _isclearMOuseCursor;
		}
		/** 是否清除事件遮挡 */
		public function set isclearMOuseCursor(value:Boolean):void
		{
			_isclearMOuseCursor = value;
		}


		public function updateBgImage():void
		{
			this.myDrawByTexture(_overState);
			var btn:HSimpleButton = this;
			setTimeout(function ():void{
				btn.myDrawByTexture(_upState);
			}, 500);
		}
		/**渲染优化压扁标志 默认为true*/
		private var _isChangeFatten:Boolean;		//改变渲染优化压扁状态
		private var _isPlayEff:Boolean;				//播放闪动特效
		private var _effectType:Boolean;			//特效状态
		public function get isChangeFatten():Boolean
		{
			return _isChangeFatten;
		}
		
		public function playerEffect():void
		{
			_isPlayEff = true;
			updateEffect();
		}
		
		public function stopEffect():void
		{
			_isPlayEff = false;
		}
		
		private function updateEffect():void
		{
			if(_effectType && _isPlayEff)
				this.myDrawByTexture(_overState);
			else
				this.myDrawByTexture(_upState);
			_effectType = !_effectType
			if(!_isPlayEff) return;
			setTimeout(updateEffect, 500);
		}

    }
}