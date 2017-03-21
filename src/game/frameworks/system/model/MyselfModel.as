/**
 * Created by gaord on 2017/3/6.
 */
package game.frameworks.system.model
{
	import flash.geom.Point;

    import game.frameworks.NotifyConst;

    import game.frameworks.system.helpers.EntityOrderHelper;
	import game.frameworks.system.model.vo.MyselfVO;

	import org.robotlegs.mvcs.Actor;

	import tl.Net.Socket.Order;
	import tl.core.mapnode.Node;

	/** 主角场景信息数据 */
	public class MyselfModel extends Actor
	{
		[Inject]
		public var vo:MyselfVO;
		[Inject]
		public var csvModel:CsvDataModel;

		/** 当前移动的剩余路径 */
		public var inMovingPath:Vector.<Node>;

		public function MyselfModel()
		{
			super();
		}

		/** 测试代码 */
		public function createTestPlayer():void
		{
			vo.Creature_WizardId = 10004;
			vo.Entity_UID = Math.random();
			vo.Creature_MoveSpeed=12.0;
			vo.WEntity_PosX = 5000;
			vo.WEntity_PosY = 5000;
			vo.csvVO = csvModel.table_wizard.get(vo.Creature_WizardId.toString());
			if (vo.inited == false)
			{
				// 首次初始化
				vo.inited = true;
			}
            dispatchWith(NotifyConst.SC_CREATE_PLAYER, false);
        }

		/** SC 创建主角 */
		public function createPlayer(order:Order):void
		{
			EntityOrderHelper.refreshEntity(vo, order);
			vo.csvVO = csvModel.table_wizard.get(vo.Creature_WizardId.toString());
			if (vo.inited == false)
			{
				// 首次初始化
				vo.inited = true;
			}
//			var wizardObj:WizardObject = new WizardObject();
//			wizardObj.inItPropMonitor();
//			wizardObj.refreshWizardObject(order);
//			wizardObj.isMainActor = true;
//			wizardObj.inMyEyes    = true;
//			if (wizardObj.id == "0")
//			{
//
//				trace(StageFrame.renderIdx,"[MyselfModel]/createPlayer");
//				if (HKeyboardManager.getInstance().isGM)
//				{
//					Debug.error("创建主角的Id为零-->" + wizardObj.name);
//				}
//				return;
//			}
//			_MainWizardObject   = wizardObj;
//			_MainWizardObject.x = wizardObj.WEntity_PosX;
//			_MainWizardObject.z = wizardObj.WEntity_PosY;
//			//			_MainWizardObject.refreshCirclePoint();
//			SettingSources.getInstance().initByMainPlayer();

		}
	}
}
