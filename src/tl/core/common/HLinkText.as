package tl.core.common
{
	import game.frameworks.system.service.ItemIconTipsManage;
	import game.frameworks.system.service.MouseCursorManage;

	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import tool.StageFrame;

	/**
	 * 带手形标志文本 
	 * @author Administrator
	 * 郑利本
	 */
	public class HLinkText extends HSprite
	{
		private var _isStart:Boolean;
		private var _data:Object;
		private var _starlingTF:StarlingTextField;
		public var needPose:Boolean = true;				//是否释放
		public var noTouch:Boolean;						//是否显示链接标志
		private var _isShowTips:Boolean;				//是否显示tips标志
		private var _showTips:Boolean;					//显示tips标志
		private var _isEvent:Boolean;
		public var noTouchDelayCall:Function;			//回调方法
		public var benanDelayCall:Function;
		public var endedDelayCall:Function;
		public var hoverDelayCall:Function;
		private var _touch:Touch;
		public function HLinkText()
		{
			init();
		}
		
		private function init():void
		{
			this.touchGroup = true;
			_starlingTF = new StarlingTextField();
            _starlingTF.algin = 'left'
            _starlingTF.width = 100;
            _starlingTF.height = 20;
			_starlingTF.touchable = true;
			this.addChild(_starlingTF);
			this.myWidth = 100;
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage)
		}
		private function onRemoveFromStage(e:Event):void
		{
			if(needPose)
			{
				this.dispose();
				this.removeEventListener(TouchEvent.TOUCH, onTouch)	;
				this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage)	
			}
		}
		
		override public function dispose():void
		{
			this.removeEventListener(TouchEvent.TOUCH, onTouch);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			super.dispose();
		}
		
		private function onTouch(e:TouchEvent):void
		{
			if(noTouch) return;
			_touch = e.getTouch(this);
			if(_touch == null)
			{
				MouseCursorManage.getInstance().showCursor();
				if(_showTips)
				{
					_showTips = false;
					ItemIconTipsManage.getInstance().hideItemTips()
				}
				if(noTouchDelayCall)
					noTouchDelayCall();
				return;
			}
			if(_touch.phase == TouchPhase.BEGAN)
			{
				_isStart = true;
				MouseCursorManage.getInstance().showCursor(9);	
				if(benanDelayCall)
					benanDelayCall();
			}
			if(_touch.phase == TouchPhase.HOVER)
			{
				MouseCursorManage.getInstance().showCursor(3);
				if(_isShowTips)
				{
					if(!_showTips)
					{
						_showTips = true;
						//ItemIconTipsManage.getInstance().showAchieveTips(_data.quest);
					}
					var vy:int = _touch.globalY + 20;
					if(vy + 140 > StageFrame.stage.stageHeight)
						vy = StageFrame.stage.stageHeight - 140;
					ItemIconTipsManage.getInstance().moveTips(_touch.globalX + 20,vy );	
				}
				if(hoverDelayCall)
					hoverDelayCall(this);
			}	
			if(_isStart && _touch.phase == TouchPhase.ENDED)
			{
				_isStart = false;
				this.dispatchEventWith(Event.TRIGGERED, false, _data);
				if(_data)
				{
					/*if(_data is HpopMenuVo){
						_data.x = _touch.globalX + 10;
						_data.y = _touch.globalY ;
						ModuleEventDispatcher.getInstance().ModuleCommunication(ComEventKey.MAI_CLICK_PLAYER_NAME, _data);
					}	else if(_data.linkListSource) {
						openActiveEvent();
					} 	else if(_data.quest) {
						if(EscortManager.getInstance().isEscortNow)EscortManager.getInstance().followCar(0);
						if(CampSources.getInstance().isEscortLine)CampSources.getInstance().followCampCar(0,HMapSources.getInstance().mainWizardObject.Player_Camp);//如果阵营护送寻路也要单独法这个协议过去取消
						if(CampSources.getInstance().isGoTONpcID)SendMessageManage.getMyInstance().sendMoveNpcIdToSever([0, DataType.Byte(0)]);//取消根据npcid寻路到npc
						ModuleEventDispatcher.getInstance().ModuleCommunication(ComEventKey.TAS_CLICK_TASK_NAME, _data);
					} 	
					else if(_data.master)
						CampSources.getInstance().sendRecommend(int(_data.master) - 1);
					else if(_data.vip != null)
						VipManager.getInstance().openVipWindow(_data.vip);
					else if(_data.chongzhi)
						MainInterfaceManage.getInstance().openPlayerUrlWindow();
					else if(_data.lookReward)
						CampSources.getInstance().openTopAwardWindow();*/
					if(_showTips)
					{
						_showTips = false;
						ItemIconTipsManage.getInstance().hideItemTips()
					}
				}
				if(endedDelayCall)
					endedDelayCall();
			}
		}
		/**
		 * 7位颜色+2位字体大小+内容
		 * #f9f9f916这里要显示的内容 
		 * @param value
		 */	
		public function set label(value:String):void
		{
			_isEvent = false;
			_starlingTF.label = value;
		}
		
		/**
		 * 7位颜色+2位字体大小+n/b是否粗体+n/u是否下划线+两位数事件Key长度+事件Key+内容
		 * #f9f9f916bu08eventkey这里要显示的内容 
		 * #f9f9f916nu08eventkey这里要显示的内容 
		 * #f9f9f916nn00这里要显示的内容
		 * @param value
		 */
		public function set eventLabel(value:String):void
		{
			_isEvent = true;
			_starlingTF.eventLabel = value;
		}
		
		override public function set myWidth(value:Number):void
		{
			super.myWidth = value;
			_starlingTF.width = value;
		}
		/**设定文本换行 */		
		public function set wordWrap(value:Boolean):void
		{
			_starlingTF.wordWrap = value;
		}
		
		public function get textWidth():int
		{
			return _starlingTF.textWidth;
		}
        /**  自动对齐方式 **/
        public function set autoSize(value:String):void
        {
            _starlingTF.autoSize = value;
        }
        public function get autoSize():String
        {
            return _starlingTF.autoSize;
        }

		public function get textHeight():int
		{
			return _starlingTF.textHeight;
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			if(_showTips)
			{
				_showTips = false;
				ItemIconTipsManage.getInstance().hideItemTips()
			}
			_data = value;
			if(_data )
				_isShowTips = true;
			else
				_isShowTips = false;
		}


		public function get mySTextField():StarlingTextField
		{
			return _starlingTF;
		}


	}
}