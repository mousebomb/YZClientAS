/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.quest.mediator
{
import com.greensock.TweenLite;

import game.frameworks.NotifyConst;
    import game.frameworks.quest.model.QuestModel;
    import game.frameworks.quest.model.QuestVo;

    import game.frameworks.quest.view.QuestPanel;
    import game.frameworks.quest.view.QuestText;
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.vo.CsvQuestVO;

    import org.robotlegs.mvcs.Mediator;

	import starling.events.Event;
import starling.textures.Texture;

import tl.Net.Socket.Connect;
import tl.core.GPUResProvider;

import tool.StageFrame;

	/**主界面任务栏*/
	public class QuestMediator extends Mediator
	{
		[Inject]
		public var ui: QuestPanel;
		[Inject]
		public var connect: Connect;
        [Inject]
        public var gpu: GPUResProvider;
        [Inject]
        public var questModel: QuestModel;
        [Inject]
        public var csvDataModel: CsvDataModel;
        private var _questTxtVector:Vector.<QuestText> ;
        private var _tweenLite:TweenLite;
		public function QuestMediator()
		{
			super();
		}
        override public function onRegister():void
        {
            ui.init();
            _questTxtVector = new <QuestText>[];
            eventMap.mapListener(ui.btn_hide, Event.TRIGGERED, onClickBtn);
            eventMap.mapListener(ui.btn_show, Event.TRIGGERED, onClickBtn);
            onResize(null);
            eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
            addContextListener(NotifyConst.SC_UPDATE_QUEST, updateQuest)
        }

        private function updateQuest(event:Event):void
        {
            var text:QuestText;
            while(ui.targetSpr.numChildren>0)
            {
                _questTxtVector.push(ui.targetSpr.removeChildAt(0)) ;
            }
            var leng:int = questModel.questVoVector.length;
            if(leng < 1) return;
            for(var i:int=0; i<leng; i++)
            {
                if(_questTxtVector.length > 0)
                {
                    text = _questTxtVector.shift();
                }   else {
                    text = new QuestText();
                }
                ui.targetSpr.addChild(text);
                text.quest = questModel.questVoVector[i];
                text.y = 40* i;
            }
            ui.sfScrollC.scrollTarget = ui.targetSpr;
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
                ui.hideSpr.touchable = false;
                _tweenLite = TweenLite.to(ui.hideSpr, 1, {x:0, alpha:0, onComplete:function ():void
                {
                    ui.hideSpr.touchable = true;
                    if(_tweenLite)
                    {
                        _tweenLite.kill();
                        _tweenLite = null;
                    }
                }})
            }	else {

                ui.btn_hide.visible = true;
                ui.btn_show.visible = false;
                ui.hideSpr.touchable = false;
                _tweenLite = TweenLite.to(ui.hideSpr, 1, {x:-ui.hideSpr.myWidth, alpha:1, onComplete:function ():void
                {
                    ui.hideSpr.touchable = true;
                    if(_tweenLite)
                    {
                        _tweenLite.kill();
                        _tweenLite = null;
                    }
                }})
            }
        }
		private function onResize(event:Event):void
		{
			ui.x = StageFrame.stage.stageWidth;
			ui.y = 200;
		}
	}
}
