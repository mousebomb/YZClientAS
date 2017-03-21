package tl.core.common
{
    import feathers.controls.IScrollBar;
    import feathers.controls.ScrollBar;
    import feathers.controls.ScrollBarDisplayMode;
    import feathers.controls.ScrollContainer;
    import feathers.controls.ScrollInteractionMode;
    import feathers.events.FeathersEventType;
    import feathers.layout.RelativePosition;

    import flash.geom.Rectangle;

    import starling.display.DisplayObjectContainer;
    import starling.display.Image;
    import starling.display.Quad;
    import starling.events.Event;
    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    /**
	 */	
	public class SFScrollContainer extends ScrollContainer
	{
		private var _isVertical:Boolean = true;				//垂直滚动条
		private var _isHorizontal:Boolean = false;			//水平滚动条
		private var _scrollTarget:DisplayObjectContainer;
		public var isShowMax:Boolean;							//是否显示最大值
		public var isShowMin:Boolean ;							//是否显示最小值
		private var _isLeft:Boolean;								//滚动条是否显示在左边
		public var scrollPosition:int;							//滚动条显示位置
		private var _isInit:Boolean;
		private var _scrollType:int;
		private var _myHeight:Number;
		private var _myWidth:Number;
		private var _maxHorizontal:Number = -1;						//要显示的最大位置
		private var _maxVertical:Number = -1;						//要显示的最大位置
		private var _ScrollVisible:Boolean = true;				//显示标志
		public var textureType:int;								//图片类型
		private var _horizontalScrollBarVisible:Boolean = true;	//横向显示标志
		public function SFScrollContainer()
		{
			super();
		}
		
		public function init(w:Number = 0, h:Number = 0):void
		{
			this.width = w;
			this.height = h;
			this._myHeight = h;
			this._myWidth = w;
		}
		public function get isVertical():Boolean
		{
			return _isVertical;
		}
		
		/**
		 * 设定垂直滚动 
		 * @param value
		 * 
		 */
		public function set isVertical(value:Boolean):void
		{
			_isVertical = value;
			if(value)
			{
				isHorizontal = false;
			}
		}
		
		public function get isHorizontal():Boolean
		{
			return _isHorizontal;
		}
		/**
		 * 设定水平滚动 
		 * @param value
		 * 
		 */
		public function set isHorizontal(value:Boolean):void
		{
			_isHorizontal = value;
			if(value)
			{
				isVertical = false;
			}
		}
		
		public function get scrollTarget():DisplayObjectContainer
		{
			return _scrollTarget;
		}
		/**
		 * 设定数据源 类
		 * @param value
		 * 
		 */		
		public function set scrollTarget(value:DisplayObjectContainer):void
		{
			if(_scrollTarget && _scrollTarget.parent)
			{
				if(_scrollTarget != value)
					_scrollTarget.parent.removeChild(_scrollTarget);
			}
			_scrollTarget = value;
			this.addChild(_scrollTarget);
			if(isShowMax)
			{
				this.invalidate(INVALIDATION_FLAG_SCROLL);
				this.invalidate(INVALIDATION_FLAG_SIZE);
				this.validate();
				if(isVertical)
					this.verticalScrollPosition = this.maxVertical;
				else if(isHorizontal)
					this.horizontalScrollPosition = this.maxHorizontal;
			}	else if(scrollPosition > 0) {
				this.invalidate(INVALIDATION_FLAG_SCROLL);
				this.invalidate(INVALIDATION_FLAG_SIZE);
				this.validate();
				if(isVertical)
					this.verticalScrollPosition = scrollPosition;
				else if(isHorizontal)
					this.horizontalScrollPosition = scrollPosition;
				scrollPosition = 0;
			}	else {
				this.invalidate(INVALIDATION_FLAG_SCROLL);
				this.invalidate(INVALIDATION_FLAG_SIZE);
				this.validate();
				if(isVertical)
					this.verticalScrollPosition = 0;
				else if(isHorizontal)
					this.horizontalScrollPosition = 0;
			}
		}
		/**
		 * 设定拖动条位置
		 */
		override protected function layoutChildren():void
		{
			super.layoutChildren();
			if(this.horizontalScrollBar)
			{
                if(!_ScrollVisible)
                    SFScrollBar(horizontalScrollBar).setBtnVisbile();
			}
			
			if(this.verticalScrollBar)
			{
				if(!_ScrollVisible)
					SFScrollBar(verticalScrollBar).setBtnVisbile();
			}
		}

        override protected function refreshMask():void
        {
            if(!this._clipContent)
            {
                return;
            }
            var clipWidth:Number = this.actualWidth - this._leftViewPortOffset - this._rightViewPortOffset;
            if(clipWidth < 0)
            {
                clipWidth = 0;
            }
            var clipHeight:Number = this.actualHeight - this._topViewPortOffset - this._bottomViewPortOffset;
            if(clipHeight < 0)
            {
                clipHeight = 0;
            }
            var mask:Quad = this._viewPort.mask as Quad;
            if(!mask)
            {
                mask = new Quad(1, 1, 0xff0ff);
                this._viewPort.mask = mask;
            }
            mask.x = this._horizontalScrollPosition;
            mask.y = this._verticalScrollPosition;
            mask.width = clipWidth;
            mask.height = clipHeight;
        }
		override protected function draw():void
		{
			if(!_isInit)
			{
				initializer();
			}
			super.draw();
		}
		
		private function initializer():void
		{
			
			this.interactionMode = ScrollInteractionMode.MOUSE;
			this.scrollBarDisplayMode = ScrollBarDisplayMode.FIXED;
			/*this.verticalScrollPolicy = ScrollContainer.SCROLL_POLICY_ON;
			this.horizontalScrollPolicy = ScrollContainer.SCROLL_POLICY_ON;*/
			if(_isVertical)
			{
				verticalScrollBarFactory = function ():IScrollBar {
					var scrollBar:SFScrollBar = new SFScrollBar;
					scrollBar.textureType     = textureType;
					scrollBar.vertical        = true;
					scrollBar.scrollType      = _scrollType;
					scrollBar.direction       = ScrollBar.DIRECTION_VERTICAL;
					scrollBar.trackLayoutMode = ScrollBar.TRACK_LAYOUT_MODE_SINGLE;
					scrollBar.addEventListener(Event.CHANGE, onChangeHandler);
					
					scrollBar.addEventListener(FeathersEventType.BEGIN_INTERACTION, VerticalScrollBar_END_INTERACTION);
					scrollBar.visible = _ScrollVisible;
					return scrollBar;
				}
			}	else {
				this.verticalScrollBarFactory = null;
			}
			
			if(_isHorizontal)
			{
				this.horizontalScrollBarFactory = function ():IScrollBar {
					var scrollBar:SFScrollBar = new SFScrollBar;
					scrollBar.textureType     = textureType;
					scrollBar.horizontal      = true;
					scrollBar.scrollType      = _scrollType;
					scrollBar.direction       = ScrollBar.DIRECTION_HORIZONTAL;
					scrollBar.trackLayoutMode = ScrollBar.TRACK_LAYOUT_MODE_SINGLE;
					return scrollBar;
				}
			}	else {
				this.horizontalScrollBarFactory = null;
			}
           	var texture:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'skinsource/horizontal_1_drag')
            var focusIndicatorSkin:Image = new Image(texture);
            focusIndicatorSkin.scale9Grid = new Rectangle(4, 4, 8, texture.height-8);
            this.focusIndicatorSkin = focusIndicatorSkin;
            this.focusPadding = 0;
			_isInit = true;
		}
		
		private function VerticalScrollBar_END_INTERACTION(e:Event):void
		{
			this.dispatchEventWith("VerticalScrollBar_END_INTERACTION")
		}
		/** 拖动条位置改变*/		
		private function onChangeHandler(e:Event):void
		{
			this.dispatchEventWith("onVerticalScrollBar_changeHandler", false, SFScrollBar(e.currentTarget).value)
		}
		
		/**设定拖动条位置 */		
		public function set scrollBarValue(value:Number):void
		{
			if(verticalScrollBar)
				this.verticalScrollBar.value = value;
			else {
				this.invalidate(INVALIDATION_FLAG_SCROLL);
				this.invalidate(INVALIDATION_FLAG_SIZE);
				this.validate();
				if(isVertical)
					this.verticalScrollPosition = value;
			}
		}
		
		/**获取拖动条位置 */		
		public function get scrollBarValue():Number
		{
			return this.verticalScrollBar.value
		}
		
		public function get scrollType():int
		{
			return _scrollType;
		}
		/**
		 * 资源名类型 
		 * @param value
		 * 
		 */
		public function set scrollType(value:int):void
		{
			_scrollType = value;
		}

		public function get myHeight():Number
		{
			return _myHeight;
		}

		public function set myHeight(value:Number):void
		{
			_myHeight = value;
		}

		public function get myWidth():Number
		{
			return _myWidth;
		}

		public function set myWidth(value:Number):void
		{
			_myWidth = value;
		}

		public function get maxHorizontal():Number
		{
			if(_maxHorizontal == -1)
				return this.maxHorizontalScrollPosition;
			else
				return _maxHorizontal;
		}

		public function set maxHorizontal(value:Number):void
		{
			_maxHorizontal = value;
		}

		public function get maxVertical():Number
		{
			if(_maxVertical == -1)
				return this.maxVerticalScrollPosition;
			else
				return _maxVertical;
		}

		public function set maxVertical(value:Number):void
		{
			_maxVertical = value;
		}

		public function set ScrollVisible(value:Boolean):void
		{
			_ScrollVisible = value;
			if(this.verticalScrollBar)
			{
				this.verticalScrollBar.visible = value;
				if(textureType == 1)
					SFScrollBar(verticalScrollBar).setBtnVisbile();
			}
		}
		public function get ScrollVisible():Boolean
		{
			return _ScrollVisible;
		}
		
		public function set horizontalScrollBarVisible(value:Boolean):void
		{
			_horizontalScrollBarVisible = value;
			if(horizontalScrollBar)
				horizontalScrollBar.visible = value;
		}
		public function get myVerticalScrollBar():IScrollBar
		{
			return this.verticalScrollBar
		}

        public function set isLeft(value:Boolean):void
        {
            _isLeft = value;
			if(value)
                verticalScrollBarPosition = RelativePosition.LEFT;
			else
                verticalScrollBarPosition = RelativePosition.RIGHT
        }
    }
}

