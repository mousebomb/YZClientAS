/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.quest.model
{
    import game.frameworks.NotifyConst;

    import org.robotlegs.mvcs.Actor;

    public class QuestModel extends Actor
	{
		public var questVoVector:Vector.<QuestVo> = new <QuestVo>[];
		public function QuestModel()
		{
			super();
		}

        public function addQuest(questvo:QuestVo):void
        {
            questVoVector.push(questvo);
			dispatchWith(NotifyConst.SC_UPDATE_QUEST)
        }
    }
}
