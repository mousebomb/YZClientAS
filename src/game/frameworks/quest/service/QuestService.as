/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.quest.service
{
    import game.frameworks.quest.model.QuestModel;
    import game.frameworks.quest.model.QuestVo;
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.vo.CsvQuestVO;

    import org.robotlegs.mvcs.Actor;

	import tl.Net.MsgKey;

	import tl.Net.Socket.Connect;
	import tl.Net.Socket.Order;

	public class QuestService extends Actor
	{

		[Inject]
		public var connect:Connect;

        [Inject]
        public var questModel: QuestModel;
		[Inject]
		public var csvDataModel: CsvDataModel;
		public function QuestService()
		{
			super();
		}

		public function init():void
		{
//			connect.addOrderCallBack(""+MsgKey.MsgType_Cache+MsgKey.MsgId_Quest_UpdateQuests,onMsgId_Quest_UpdateQuests);
//			connect.addOrderCallBack(""+MsgKey.MsgType_Cache+MsgKey.MsgId_Quest_UpdateAcceptableQuests,onMsgId_Quest_UpdateAcceptableQuests);
//			connect.addOrderCallBack(""+MsgKey.MsgType_Cache+MsgKey.MsgId_Quest_UpdateDailyQuests,onMsgId_Quest_UpdateDailyQuests);
//			connect.addOrderCallBack(""+MsgKey.MsgType_Cache+MsgKey.MsgId_Quest_UpdateKinQuests,onMsgId_Quest_UpdateKinQuests);

            var questvo:QuestVo = new QuestVo();
            var csvvo:CsvQuestVO = csvDataModel.table_quest.get('10002');
			questvo.csvQuest = csvvo;
            questModel.addQuest(questvo)
		}

		private function onMsgId_Quest_UpdateQuests(order:Order):void
		{

		}

		private function onMsgId_Quest_UpdateAcceptableQuests(order:Order):void
		{

		}

		private function onMsgId_Quest_UpdateDailyQuests(order:Order):void
		{

		}

		private function onMsgId_Quest_UpdateKinQuests(order:Order):void
		{

		}
	}
}
