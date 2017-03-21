/**
 * Created by Administrator on 2017/3/2.
 */
package game.frameworks.system.model.vo
{
	/**任务数据表*/
	public class CsvQuestVO
	{
		/**任务编号 */
		public var QuestId:String;
		/**任务名称 */
		public var Name:String;
		/**任务类型 */
		public var Type:int;
		/**重复次数 */
		public var RepeatNum:int;
		/**任务星级 */
		public var StarLevel:Array;
		/**人物等级 */
		public var AcceptLevel:int;
		/**需要主任务级别 */
		public var AcceptQuestLevel:int;
		/**接任务条件 */
		public var AcceptCondition:Array;
		/**接任务NPC */
		public var AcceptNpcId:int;
		/**交任务NPC */
		public var SubmitNpcId:int;
		/**接任务对话 */
		public var AcceptTalk:String;
		/**交任务对话 */
		public var SubmitTalk:String;
		/**任务目标 */
		public var QuestPurpose:String;
		/**任务目标寻路 */
		public var TargetPath:Array;
		/**完成任务条件 */
		public var SubmitCondition:Array;
		/**奖励列表 */
		public var AwardList:Array;
		/**选择奖励列表 */
		public var AwardPickList:Array;
		/**接任务奖励buff */
		public var AwardBuffId:int;
		/**主任务级别 */
		public var AwardQuestLevel:int;
		/**阵营需求 */
		public var NeedCamp:int;
		/**界面交接 */
		public var UIQuest:int;
		/**是否飞行 */
		public var Flying:int;
		/**世界文明值 */
		public var CExp:int;
	}
}
