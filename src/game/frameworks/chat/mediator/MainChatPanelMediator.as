/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.chat.mediator
{
	import com.greensock.TweenLite;

	import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    import game.frameworks.chat.model.ChatModel;
    import game.frameworks.chat.view.FaceIcons;

    import game.frameworks.chat.view.MainChatPanel;
    import game.frameworks.chat.view.richText.RichTextField;
    import game.frameworks.uicontainer.NotifyUIConst;

    import morn.core.components.UIButton;
    import morn.core.events.UIEvent;
    import morn.core.events.UITextEvent;

    import org.robotlegs.mvcs.Mediator;

    import starling.core.Starling;

    import starling.events.Event;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    import tl.core.GPUResProvider;

    import tool.StageFrame;

	/**主界面聊天栏*/
	public class MainChatPanelMediator extends Mediator
	{
		[Inject]
		public var ui: MainChatPanel;
		[Inject]
		public var chatModel: ChatModel;
		private var _currentBtn:UIButton;
        private var _key:String = '';
        private var _isMDown:Boolean;
        private var _vy:Number;
        private var _currentY:int;
        private var _currentHeight:int;
		public function MainChatPanelMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			onResize(null);
			_currentBtn = ui.btn_all;
			_currentBtn.selected = true;
			ui.btn_show.visible = false;
            ui.text_input.text = "请在此输入内容"
			eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
			eventMap.mapListener(ui.btn_all, Event.SELECT, onClick);
			eventMap.mapListener(ui.btn_current, Event.SELECT, onClick);
			eventMap.mapListener(ui.btn_world, Event.SELECT, onClick);
			eventMap.mapListener(ui.btn_server, Event.SELECT, onClick);
			eventMap.mapListener(ui.btn_camp, Event.SELECT, onClick);
			eventMap.mapListener(ui.btn_system, Event.SELECT, onClick);
            eventMap.mapListener(ui.btn_gm, Event.SELECT, onClick);
            eventMap.mapListener(ui.btn_enter, Event.SELECT, onClickSend);
            eventMap.mapListener(ui.btn_face, Event.SELECT, onShowFace);
            eventMap.mapListener(ui.btn_drag, TouchEvent.TOUCH, onTouch);

			eventMap.mapListener(ui.btn_hide, Event.SELECT, onClickHide);
            eventMap.mapListener(ui.btn_show, Event.SELECT, onClickHide);
            eventMap.mapListener(ui.text_input, UITextEvent.FOCUS_IN, onFocusIn);
            updateChatInfo();
			addContextListener(NotifyUIConst.UI_ADD_FACEICONS, onAddFaceIcons)
		}

        private function onFocusIn(event:UITextEvent):void
        {
            if(ui.text_input.text == "请在此输入内容")
            {
                ui.text_input.text = '';
            }
        }

		private function onTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(ui.btn_drag);
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					_isMDown = true;
					_vy = touch.globalY;
					_currentY = ui.chatSpr.y ;
					_currentHeight = ui.chatSpr.myHeight;
				}
                if(touch.phase == TouchPhase.ENDED)
                {
                    _isMDown = false;
					ui.sfScrollC.y = ui.chatSpr.y;
					ui.sfScrollC.height = ui.chatSpr.myHeight;
                }
                if(touch.phase == TouchPhase.MOVED && _isMDown)
                {
					//拖动改变聊天栏大小
                    var addy:int = touch.globalY - _vy;
                    if(_currentHeight - addy <= 360 && _currentHeight - addy >= 175)
                    {
                        ui.btn_drag.y = ui.chatSpr.y = _currentY + addy;
                        ui.chatSpr.myImageHeight = _currentHeight - addy;
                    }
                }
			}
		}
		/**添加表情符号*/
		private function onAddFaceIcons(event:Event):void
		{

            var first:Boolean;
            if(ui.text_input.text == "请在此输入内容")
            {
                first = true;
                ui.text_input.text = '';
            }
            var date:Object = event.data as Object;
            var faceStr:String = "@" + date.nameStr;
            var oldStr:String = ui.text_input.text;
            if(oldStr.length + faceStr.length > 58)
                return;
            var tf:TextField = ui.text_input.textField
            Starling.current.nativeStage.focus = tf;
            var length:int = tf.caretIndex + faceStr.length;
            var preStr:String = oldStr.substring(0, tf.caretIndex);
            var endStr:String = oldStr.substring(tf.caretIndex);
            //tf.text =
            ui.text_input.text = preStr + faceStr + endStr;
            //tf.requestSoftKeyboard();
            ui.text_input.setSelection(length, length);
            /*tf.selectRange(length, length);
            tf.setFocus();
            if(first)
                _sfInput.getTextEditor().setFocus(new Point());*/
		}

		public function updateChatInfo():void
		{
			var arr:Array = chatModel.getChatByKey(_key)
			var leng:int = arr.length;
			while (ui.scrollTarget.numChildren)
			{
                ui.scrollTarget.removeChildAt(0);
			}
			var vy:int;
			for(var i:int=0; i<leng; i++)
			{
                var xml:XML = arr[i];
                var rich:RichTextField = new RichTextField();
                rich.setSize(340, 100);
                rich.type = RichTextField.DYNAMIC;
                rich.defaultTextFormat = chatModel.textFormat;
                rich.html = true;
                rich.importXMLAfterClear(xml);
                ui.scrollTarget.addChild(rich);
				rich.y = vy;
				vy += rich.textRendererHeight;
			}
			ui.sfScrollC.scrollTarget = ui.scrollTarget;
		}
		private function onShowFace(event:Event):void
		{
			dispatchWith(NotifyUIConst.UI_SHOW_FACEICONS)
		}
		private function onClickSend(event:Event):void
		{
			_key = _currentBtn.label;
			var str:String = ui.text_input.text;
			chatModel.addChat(_key, str);
            ui.text_input.text = '';
			updateChatInfo();
		}
        private function onClick(event:Event):void
        {
            var btn:UIButton = event.currentTarget as UIButton;
            _currentBtn.selected = false;
            _currentBtn = btn;
            _currentBtn.selected = true;
        }

		private function onClickHide(event:Event):void
		{
			if(event.currentTarget == ui.btn_hide)
			{
                ui.touchable = false;
				ui.text_input.visible = false;
				TweenLite.to(ui, 1, {x:-ui.width, onComplete:function ():void
															 {
																 ui.btn_show.visible = true;
                                                                 ui.touchable = true;
															 }})
			}	else {
				ui.text_input.visible = true;
				ui.btn_show.visible = false;
				TweenLite.to(ui, 1, {x:0})
			}
		}

		private function onResize(event:Event):void
		{
			ui.y = StageFrame.stage.stageHeight - ui.height - 100;
		}
	}
}
