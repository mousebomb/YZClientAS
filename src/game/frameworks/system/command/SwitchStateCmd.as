/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.command
{
	import com.demonsters.debugger.MonsterDebugger;

	import game.frameworks.NotifyConst;

	import game.frameworks.system.model.vo.StepType;
	import game.frameworks.system.service.LoginTaskService;
	import game.frameworks.system.service.StatsService;

	import org.robotlegs.mvcs.Command;

	import starling.events.Event;

	import tl.Net.MsgKey;

	import tool.StageFrame;

	public class SwitchStateCmd extends Command
	{
		public function SwitchStateCmd()
		{
			super();
		}

		[Inject]
		public var e :Event;
		[Inject]
		public var stats:StatsService;

		[Inject]
		public var loginService:LoginTaskService;
		override public function execute():void
		{
			var state :int = e.data as int ;
			MonsterDebugger.trace("[SwitchStateCmd]/execute()" , state,"bomb","",0x990000);
			switch(state)
			{
				case MsgKey.State_Login:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "State_Login","bomb","",0x990000);
						stats.scendStepToScever(StepType.step_10);
						loginService.login();
					break;
				case MsgKey.State_CreateRole:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "State_CreateRole","bomb","",0x990000);
//					_isWait = false;
//					_isStateLogin = true;
//					loadSource();
						dispatchWith(NotifyConst.LOAD_CREATE_ROLE,false);
						loginService.createRole();
					break;
				case MsgKey.State_ConnectStateType_Queue:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "State_ConnectStateType_Queue","bomb","",0x990000);
//					State_ConnectStateType_Queu();
					break;
				case MsgKey.State_ConnectStateType_Build:
					dispatchWith(NotifyConst.LOAD_MAIN_UI,false);
						loginService.build();
					break;
				case MsgKey.State_GameInIt:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "State_GameInIt","bomb","",0x990000);
					break;
				case MsgKey.State_ConnectStateType_Logout:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "State_ConnectStateType_Logout","bomb","",0x990000);
					break;
				case MsgKey.State_ConnectStateType_Wait:
						MonsterDebugger.trace("[SwitchStateCmd]/execute()" , "等待前一相同角色下线","bomb","",0x990000);
					stats.scendStepToScever(StepType.step_11);
//					_isWait = true;
//					MainInterfaceManage.getInstance().scendStepToScever(StepType.step_11);
//					//HAlert.show("#ffffff12等待前一相同角色下线","温馨提示",HTopBaseView.getInstance(), "确定");
					break;
				case MsgKey.State_ResourceLoading:
					trace(StageFrame.renderIdx,"[SwitchStateCmd]/execute State_ResourceLoading");
					break;
				case MsgKey.State_ConnectServer:
						trace(StageFrame.renderIdx,"[SwitchStateCmd]/execute State_ConnectServer");
//					State_ConnectServer();
					break;
				default:
					break;
			}
		}
	}
}
