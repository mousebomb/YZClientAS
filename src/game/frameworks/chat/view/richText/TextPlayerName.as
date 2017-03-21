package game.frameworks.chat.view.richText
{
    import flash.geom.Point;

    import game.frameworks.chat.model.PopMenuVo;
    import game.frameworks.system.service.MouseCursorManage;
    import game.frameworks.uicontainer.NotifyUIConst;

    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;
    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    import tl.core.common.HSprite;
    import tl.core.common.StarlingTextField;

    public class TextPlayerName extends HSprite
	{
		private var _SFTextField:StarlingTextField;
		private var _isFangZhengCuYuan:Boolean = true;
		private var _campIcon:Image
		private var _vipIcon:Image;
		private var _isStart:Boolean;
		private var _vo:PopMenuVo;
		private var _mousePoint:Point = new Point;		//鼠标点
		private var _clickPoint:Point = new Point;		//鼠标点
		public var isShowQQVip:Boolean;
		private var _spr:Sprite;
		public function TextPlayerName()
		{
			init();
		}
		
		private function init():void
		{
			_spr = new Sprite;
			this.addChild(_spr);
			_SFTextField = new StarlingTextField();
			_SFTextField.touchable = true;
			_spr.addChild(_SFTextField);
			this.addEventListener(TouchEvent.TOUCH, onTouch)	
		}


		public function set data(vo:PopMenuVo):void
		{
			_vo = vo;
			var vx:int;
			if(vo.campIconStr && vo.campIconStr != 'null')
			{
				var texture:Texture = GPUResProvider.getInstance().getMyTexture(NotifyUIConst.UI_FACE_SOURCE,vo.campIconStr);;
				if(!_campIcon)
				{
					_campIcon = new Image(texture);
					_campIcon.touchable = false;
				}	else if(_campIcon.texture != texture) {
					_campIcon.texture = texture;
					_campIcon.readjustSize();
				}
				if(!_campIcon.parent)
					_spr.addChild(_campIcon);
				vx = texture.width;
			}	else if(_campIcon && _campIcon.parent) {
				_campIcon.parent.removeChild(_campIcon);
			}
			_SFTextField.eventLabel = vo.playerName;
			_SFTextField.x = vx;
			vx += _SFTextField.textWidth;
			if(vo.vipIconStr && vo.vipIconStr != 'null')
			{
				texture = GPUResProvider.getInstance().getMyTexture(NotifyUIConst.UI_FACE_SOURCE, vo.vipIconStr);
				if(!_vipIcon)
				{
					_vipIcon = new Image(texture);
					_vipIcon.touchable = false;
				}	else if(_vipIcon.texture != texture){
					_vipIcon.texture = texture;
					_vipIcon.readjustSize();
				}
				if(!_vipIcon.parent)
					_spr.addChild(_vipIcon);
				_vipIcon.x = vx;
				vx += _vipIcon.texture.width;
				_vipIcon.y = _SFTextField.textHeight - 36 >> 1;
				isShowQQVip = true;
				_spr.y = 2;
			}	else {
				isShowQQVip = false;
				if(_vipIcon && _vipIcon.parent)
					_vipIcon.parent.removeChild(_vipIcon);	 
				_spr.y = 0;
			}
			this.myHeight = _SFTextField.textHeight;
			this.myWidth = vx;
		}
		
		private function onTouch(e:TouchEvent):void
		{
			//if(HTopBaseView.getInstance().hasEvent && !isPierce || HTopBaseView.getInstance().isShowFull) return; //顶层是否添加UI了
			var touch:Touch = e.getTouch(_SFTextField);
			if(touch == null)
			{
				MouseCursorManage.getInstance().showCursor();
				return;
			}
			if(touch.phase == TouchPhase.BEGAN)
			{
				_isStart = true;
				MouseCursorManage.getInstance().showCursor(9);	
				_clickPoint.setTo(touch.globalX, touch.globalY);
			}
			if(touch.phase == TouchPhase.HOVER)
			{
				MouseCursorManage.getInstance().showCursor(3);
			}	
			if(_isStart && touch.phase == TouchPhase.ENDED)
			{
				_isStart = false;
				if(_vo){
					_mousePoint.setTo(touch.globalX, touch.globalY);
					var index:int = Point.distance(_clickPoint, _mousePoint);
					if(index < 10)
					{
						_vo.x = touch.globalX + 10;
						_vo.y = touch.globalY ;
						MouseCursorManage.getInstance().showCursor(3);
					}	else {
						MouseCursorManage.getInstance().showCursor();
					}
				}
			}
		}
		public function set playerName(name:String):void
		{
			_SFTextField.eventLabel = name;
		}
	}
}