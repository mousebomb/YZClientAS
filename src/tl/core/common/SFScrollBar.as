package tl.core.common
{
    import feathers.controls.Button;
    import feathers.controls.ScrollBar;

    import flash.geom.Rectangle;

    import starling.display.Image;
    import starling.display.Quad;
    import starling.events.TouchEvent;
    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    public class SFScrollBar extends ScrollBar
	{
		private var _isInit:Boolean;
		private var _vertical:Boolean							//竖向
		private var _horizontal:Boolean;						//横向
		private var _incrementStr:String;						//增量按钮名
		private var _decrementStr:String;						//减量按钮名
		private var _thumbStr:String 							//拖动按钮
		private var _minimumStr:String;						//
		private var _sourceName:String = "source_interface_0" 	//资源包名
		private var _scrollType:int;							//图片类型
		private var _iconTexture:String;
		public var textureType:int;
		public var upColor:uint=0xFFdbac6d;
		public var overColor:uint=0xFFa45d0e;
		public var downColor:uint=0xFF8e908f;
		public function SFScrollBar()
		{
			super();
		}
		public function initializer():void
		{
			if(_vertical)
			{
				setVerticalProperty();
			}	else if(_horizontal) {
				setHorizontalProperty();
			}	else 
				setVerticalProperty();
			_isInit = true;
			var textureStr:String = "";
			//增量按钮
			this.incrementButtonFactory = function():Button
			{
			 	var button:Button = new Button();
				textureStr = _incrementStr+"_up"
				var texture:Texture = GPUResProvider.getInstance().getMyTexture(_sourceName, textureStr);
				button.upIcon = new Image(texture);
				textureStr = _incrementStr+"_over"
				texture = GPUResProvider.getInstance().getMyTexture(_sourceName,textureStr);
				button.hoverIcon = new Image(texture);
				textureStr = _incrementStr+"_down"
				texture = GPUResProvider.getInstance().getMyTexture(_sourceName,textureStr);
                button.defaultSkin = new Image(texture);
				button.downIcon = new Image(texture)
				const incrementButtonDisabledIcon:Quad = new Quad(1, 1, 0xff00ff);
				incrementButtonDisabledIcon.alpha = 0;
				button.disabledIcon = incrementButtonDisabledIcon;
			 	return button;
			}
			//减量按钮
			this.decrementButtonFactory = function():Button
			{
				var button:Button = new Button();
				textureStr = _decrementStr+"_up"
				
				var texture:Texture = GPUResProvider.getInstance().getMyTexture(_sourceName,textureStr);
				button.upIcon = new Image(texture);
				textureStr = _decrementStr+"_over";
				
				texture = GPUResProvider.getInstance().getMyTexture(_sourceName,textureStr);
				button.hoverIcon = new Image(texture);
				textureStr = _decrementStr+"_down"
				
				texture = GPUResProvider.getInstance().getMyTexture(_sourceName,textureStr);
				button.downIcon = new Image(texture);

                button.defaultSkin = new Image(texture);
				const decrementButtonDisabledIcon:Quad = new Quad(1, 1, 0xff00ff);
				decrementButtonDisabledIcon.alpha = 0;
				button.disabledIcon = decrementButtonDisabledIcon;
				return button;
			}
			var image:Image
			this.thumbFactory = function():Button
			{
                var scale:Rectangle;
				var thumb:Button = new Button();
                var texture:Texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_thumbStr+"_up");
                if(_vertical)
                    scale  = new Rectangle(4, 4, 8, texture.height-8);
                else
                    scale = new Rectangle(4, 4, texture.width-8, 8);
				var upSkin:Image = new Image(texture);
				upSkin.scale9Grid = scale;
                thumb.upSkin = upSkin;

                texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_thumbStr+"_over");
				var overSkin:Image = new Image(texture);
				overSkin.scale9Grid = scale;
				thumb.hoverSkin = overSkin;
                texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_thumbStr+"_down");
                var downSkin:Image = new Image(texture);
                downSkin.scale9Grid = scale;
                thumb.downSkin = downSkin;

                thumb.hasLabelTextRenderer = false;
				return thumb;
				var button:Button = new Button();
				var texture:Texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_thumbStr+"_up");

                texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_iconTexture);

				if(_vertical)
				{
					button.horizontalAlign = Button.HORIZONTAL_ALIGN_LEFT;
				}	else {
					button.verticalAlign = Button.VERTICAL_ALIGN_TOP;
				}
				return button;
			}
			this.minimumTrackFactory = function ():Button
			{
				var button:Button = new Button();
				var texture:Texture = GPUResProvider.getInstance().getMyTexture(_sourceName,_minimumStr);
				image = new Image(texture);
				image.scale9Grid = new Rectangle(4,4,int(texture.width-8),int(texture.height-8));
                button.defaultSkin = image;

                button.hasLabelTextRenderer = false;
				return button;
			}
		}
		/** 横向拖动资源名*/	
		private function setHorizontalProperty():void
		{
			switch(_scrollType)
			{
				case 0 :
                    _incrementStr = "skinsource/horizontal_1_decrement";	//增量按钮名
                    _decrementStr = "skinsource/horizontal_1_increment";	//减量按钮名
                    _thumbStr = "skinsource/horizontal_1_drag" 				//拖动按钮
                    _minimumStr = "skinsource/horizontal_1_track";			//背包
                    _iconTexture = "skinsource/horizontal_1_drag";
					break;
				case 1 :
					break;
			}
		}
		/** 竖向拖动资源名*/	
		private function setVerticalProperty():void
		{
			switch(_scrollType)
			{
				case 0 :
					_incrementStr = "skinsource/vertical_1_decrement";	//增量按钮名
					_decrementStr = "skinsource/vertical_1_increment";	//减量按钮名
					_thumbStr = "skinsource/vertical_1_drag" 				//拖动按钮
					_minimumStr = "skinsource/vertical_1_track";			//
					_iconTexture = "skinsource/vertical_1_drag";
					break;
				case 1 :
					break;
			}
		}
		
		override protected function draw():void
		{
			if(!_isInit)
			{
				initializer();
			}
			super.draw();
		}

		public function get horizontal():Boolean
		{
			return _horizontal;
		}
		/**
		 *定为横向拖动 
		 * @param value
		 * 
		 */
		public function set horizontal(value:Boolean):void
		{
			_horizontal = value;
		}

		public function get vertical():Boolean
		{
			return _vertical;
		}
		
		/**
		 *定为竖向拖动 
		 * @param value
		 * 
		 */
		public function set vertical(value:Boolean):void
		{
			_vertical = value;
		}

		public function get scrollType():int
		{
			return _scrollType;
		}
		/**
		 *设定资源名 
		 * @param value
		 * 
		 */
		public function set scrollType(value:int):void
		{
			_scrollType = value;
		}
		
		override protected function track_touchHandler(event:TouchEvent):void
		{
			//if(!HBaseView.getInstance().isClickStarling)
				super.track_touchHandler(event);
		}
		
		
		override public function set visible(value:Boolean):void
		{
			// TODO Auto Generated method stub
			super.visible = value;
		}
		
		public function setBtnVisbile():void
		{
			if(incrementButton && incrementButton.parent)
			{
				incrementButton.parent.removeChild(incrementButton);
			}
			if(decrementButton && decrementButton.parent)
			{
				decrementButton.parent.removeChild(decrementButton);
			}
			if(minimumTrack)
				minimumTrack.visible = false;
		}
		override protected function layoutStepButtons():void
		{
			super.layoutStepButtons()
			var showButtons:Boolean = this._maximum != this._minimum;
			minimumTrack.visible = showButtons;
		}
	}
}