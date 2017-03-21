/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.model.vo
{
	import tl.core.role.RoleVO;

	import tool.StageFrame;

	public class MyselfVO extends RoleVO
	{
		public function MyselfVO()
		{
			super();
		}

		/** 首次初始化过了 */
		public var inited:Boolean = false;



		/** 剑刃风暴那种移动的技能 释放结束时刻 */
		public var castingMovingSkillEndTime:uint;

		// 用于判断 是否 剑刃风暴那种移动的技能中
		public function get isCastingMovingSkill():Boolean
		{
			return StageFrame.curTime< castingMovingSkillEndTime;
		}
	}
}
