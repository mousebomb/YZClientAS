/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.uicontainer.mediator
{
	import com.greensock.TweenLite;

	import game.frameworks.NotifyConst;
    import game.frameworks.quest.model.QuestModel;
    import game.frameworks.quest.model.QuestVo;
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.vo.CsvQuestVO;

    import tl.core.common.HSimpleButton;

	import game.frameworks.uicontainer.view.mainUI.MainActivityIcon;

	import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;
	import starling.textures.Texture;

	import tl.core.GPUResProvider;

	import tool.StageFrame;

	/**主界面活动栏*/
	public class MainActivityIconMediator extends Mediator
	{
		[Inject]
		public var ui: MainActivityIcon;
		[Inject]
		public var gpu: GPUResProvider;
        [Inject]
        public var questModel: QuestModel;
        [Inject]
        public var csvDataModel: CsvDataModel;
		private var _tweenLite:TweenLite;
		private var _questId:int = 10000
		public function MainActivityIconMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			ui.init();
			var up:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_hide_0');
			var over:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_hide_1');
			var down:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_hide_2');
			ui.btn_hide.setTextureSkin(up, over, down);
			ui.btn_hide.init();
			up = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_open_0');
			over = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_open_1');
			down = gpu.getMyTexture('source_interface_0', 'activityIcon/icon_open_2');
			ui.btn_show.setTextureSkin(up, over, down);
			ui.btn_show.init();
			eventMap.mapListener(ui.btn_hide, Event.TRIGGERED, onClickBtn);
			eventMap.mapListener(ui.btn_show, Event.TRIGGERED, onClickBtn);
			onResize(null);
			eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
			onFunctionOpen();
		}
		private function onFunctionOpen():void
		{
			var up:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/activeIcon_2_0');
			var over:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/activeIcon_2_1');
			var down:Texture = gpu.getMyTexture('source_interface_0', 'activityIcon/activeIcon_2_2');
			var btn:HSimpleButton = new HSimpleButton();
			btn.setTextureSkin(up, over, down);
			btn.init();
			ui.btnSpr.addChild(btn);
			var vw:int = btn.myWidth;
			ui.btnSpr.myWidth = vw;
			ui.btnSpr.x = -vw;
		}
		/**显示、隐藏按钮*/
		private function onClickBtn(event:Event):void
		{
			if(_tweenLite)
			{
				_tweenLite.kill();
				_tweenLite = null;
			}
			if(event.currentTarget == ui.btn_hide)
			{
				ui.btn_hide.visible = false;
				ui.btn_show.visible = true;
				ui.btnSpr.touchable = false;
				_tweenLite = TweenLite.to(ui.btnSpr, 1, {x:0, alpha:0, onComplete:function ():void
				{
					ui.btnSpr.touchable = true;
					if(_tweenLite)
					{
						_tweenLite.kill();
						_tweenLite = null;
					}
				}})
			}	else {

				ui.btn_hide.visible = true;
				ui.btn_show.visible = false;
				ui.btnSpr.touchable = false;
				_tweenLite = TweenLite.to(ui.btnSpr, 1, {x:-ui.btnSpr.myWidth, alpha:1, onComplete:function ():void
				{
					ui.btnSpr.touchable = true;
					if(_tweenLite)
					{
						_tweenLite.kill();
						_tweenLite = null;
					}
				}})
                dispatchWith(NotifyConst.SC_UPDATE_QUEST,false);
			}

            dispatchWith(NotifyConst.SC_CREATE_TASK,false);
            var questvo:QuestVo = new QuestVo();
            _questId ++;
            var csvvo:CsvQuestVO = csvDataModel.table_quest.get(_questId.toString());
            questvo.csvQuest = csvvo;
            questModel.addQuest(questvo)
           // dispatchWith(NotifyConst.SHOW_SCREEN_LAMP, false, '<a href="">谁谁谁</a>通过官方充值系统充值了魔晶。<a href="">我要充值</a> ');
            //dispatchWith(NotifyConst.SHOW_SCREEN_FLOATING, false, '<a href="">谁谁谁</a>通过官方充值系统充值了魔晶。<a href="">我要充值</a> ');
		}

		private function onResize(event:Event):void
		{
			ui.x = StageFrame.stage.stageWidth - 230;
		}
	}
}
