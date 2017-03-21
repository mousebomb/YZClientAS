/**
 * Created by gaord on 2017/2/4.
 */
package game.frameworks.system.command
{
	import game.frameworks.NotifyConst;
	import game.frameworks.chat.command.ChatCmd;
    import game.frameworks.chat.command.FaceIconsCmd;
    import game.frameworks.chat.mediator.FaceIconsMediator;
    import game.frameworks.chat.model.ChatModel;
    import game.frameworks.chat.view.FaceIcons;
	import game.frameworks.roleInfo.mediator.EquipBoxMediator;
	import game.frameworks.roleInfo.mediator.RoleInfoPanelMediator;
	import game.frameworks.system.mediator.CreateRoleUIMediator;
	import game.frameworks.system.model.FrameworkModel;
	import game.frameworks.textEffect.command.EffectScreenFloatingCmd;
	import game.frameworks.chat.mediator.MainChatPanelMediator;
	import game.frameworks.chat.service.ChatService;
	import game.frameworks.chat.view.MainChatPanel;
	import game.frameworks.gameLoading.command.LoadingCmd;
	import game.frameworks.gameLoading.mediator.LoadingMediator;
	import game.frameworks.quest.model.QuestModel;
	import game.frameworks.system.command.CreateMyselfCmd;
	import game.frameworks.system.command.LoadMapCmd;
	import game.frameworks.system.model.GameMapModel;
	import game.frameworks.system.model.UserModel;
	import game.frameworks.system.service.GameMapService;
	import game.frameworks.quest.command.QuestCmd;
	import game.frameworks.quest.mediator.QuestMediator;
	import game.frameworks.quest.service.QuestService;
	import game.frameworks.quest.view.QuestPanel;
	import game.frameworks.system.mediator.GameSceneA3DMediator;
	import game.frameworks.system.mediator.MousePointTrackMediator;
	import game.frameworks.system.mediator.MyselfMediator;
	import game.frameworks.system.model.CsvDataModel;
	import game.frameworks.system.model.LoginTaskModel;
	import game.frameworks.system.model.MyselfModel;
	import game.frameworks.system.model.vo.MyselfVO;
	import game.frameworks.system.service.LoginTaskService;
	import game.frameworks.system.service.MyselfAIService;
	import game.frameworks.system.service.StatsService;
	import game.frameworks.system.service.SystemService;
	import game.frameworks.system.view.GameSceneA3D;
	import game.frameworks.system.view.MousePointTrack;
	import game.frameworks.system.view.Myself;
	import game.frameworks.textEffect.command.EffectScreenLampCmd;
import game.frameworks.textEffect.mediator.EffectScreenFloatingMediator;
import game.frameworks.textEffect.mediator.EffectScreenLampMediator;
import game.frameworks.textEffect.view.EffectScreenFloating;
import game.frameworks.textEffect.view.EffectScreenLamp;
    import game.frameworks.uicontainer.NotifyUIConst;
    import game.frameworks.uicontainer.mediator.MainActivityIconMediator;
	import game.frameworks.uicontainer.mediator.MainRoleInfoMediator;
	import game.frameworks.uicontainer.mediator.MainSkillPanelMediator;
	import game.frameworks.uicontainer.mediator.MainToolBarMediator;
	import game.frameworks.uicontainer.mediator.MainWorldMapMediator;
	import game.frameworks.uicontainer.mediator.UIBaseLayerMediator;
	import game.frameworks.uicontainer.mediator.UIPanelLayerMediator;
	import game.frameworks.uicontainer.mediator.UIRootMediator;
	import game.frameworks.uicontainer.view.GameUIRoot;
	import game.frameworks.uicontainer.view.UIBaseLayer;
	import game.frameworks.uicontainer.view.UIPanelLayer;
	import game.frameworks.uicontainer.view.mainUI.LoadingUI;
	import game.frameworks.uicontainer.view.mainUI.MainActivityIcon;
	import game.frameworks.uicontainer.view.mainUI.MainToolBar;
	import game.view.runtime.EquipBox;
	import game.view.ui.uieditor.CreateRole_UI;
	import game.view.ui.uieditor.MainRoleInfo;
	import game.view.ui.uieditor.MainSkillPanel;
	import game.view.ui.uieditor.MainWorldMap;
	import game.view.ui.uieditor.RoleInfoPanel_UI;

	import org.robotlegs.mvcs.Command;

	import tl.Net.Socket.Connect;
	import tl.core.GPUResProvider;

	public class StartupCmd extends Command
	{
		public function StartupCmd()
		{
			super();
		}


		override public function execute():void
		{
			// model
			injector.mapSingleton(MyselfVO);
			injector.mapSingleton(Myself);
			injector.mapSingleton(UserModel);
			injector.mapSingleton(GameMapModel);
			injector.mapSingleton(CsvDataModel);
			injector.mapSingleton(MyselfModel);
			injector.mapSingleton(LoginTaskModel);
			injector.mapSingleton(FrameworkModel);
            injector.mapSingleton(QuestModel);
            injector.mapSingleton(ChatModel);
			injector.mapValue(GPUResProvider, GPUResProvider.getInstance());
			injector.mapValue(Connect, Connect.getInstance());
			// service
			injector.mapSingleton(StatsService);
			injector.mapSingleton(GameMapService);
			injector.mapSingleton(SystemService);
			injector.mapSingleton(LoginTaskService);
			injector.mapSingleton(MyselfAIService);
			injector.mapSingleton(ChatService);
			injector.mapSingleton(QuestService);

			// command
			commandMap.mapEvent(NotifyConst.SETTINGS_LOADED, LoadFirstUICmd, null, true);// 直接初始化ui
//			commandMap.mapEvent(NotifyConst.SETTINGS_LOADED, LoadVersionCmd, null, true);//初始化版本
//			commandMap.mapEvent(NotifyConst.VERSION_LOADED, LoadFirstUICmd, null, true);//初始化ui
			commandMap.mapEvent(NotifyConst.FIRSTUI_LOADED, InitConnectionCmd, null, true);
			commandMap.mapEvent(NotifyConst.SC_CONN_SUCC, LoadCsvCmd, null, true);
			commandMap.mapEvent(NotifyConst.CSV_LOADED, CsvLoadedCmd, null, true);
			commandMap.mapEvent(NotifyConst.LOAD_CREATE_ROLE, LoadCreateRoleUICmd);
			commandMap.mapEvent(NotifyConst.LOAD_MAIN_UI, LoadUICmd, null, true);
			commandMap.mapEvent(NotifyConst.CREATE_ROLE, CreateRoleCmd);
			commandMap.mapEvent(NotifyConst.ENTER_GAME, EnterGameCmd, null, true);
			commandMap.mapEvent(NotifyConst.SC_CREATE_PLAYER, CreateMyselfCmd,null , true);
			commandMap.mapEvent(NotifyConst.SC_CREATE_CHAT, ChatCmd, null, true);
            commandMap.mapEvent(NotifyConst.SC_CREATE_TASK, QuestCmd, null, true);
            commandMap.mapEvent(NotifyConst.SC_CREATE_ITEM, QuestCmd, null, true);
			commandMap.mapEvent(NotifyConst.ENABLE_MOUSE_POINT_TRACK, EnableMousePointTrackCmd,null,true);
			commandMap.mapEvent(NotifyConst.SC_SWITCH_STATE, SwitchStateCmd);
			commandMap.mapEvent(NotifyConst.LOAD_MAP, LoadMapCmd);
			commandMap.mapEvent(NotifyConst.SHOW_LOADING_UI, LoadingCmd);
			commandMap.mapEvent(NotifyConst.SHOW_SCREEN_LAMP, EffectScreenLampCmd);
            commandMap.mapEvent(NotifyConst.SHOW_SCREEN_FLOATING, EffectScreenFloatingCmd);
            commandMap.mapEvent(NotifyUIConst.UI_SHOW_FACEICONS, FaceIconsCmd);
//            commandMap.mapEvent(NotifyConst.FIND_PATH, DebugPathCmd);

			// map view mediator
			mediatorMap.mapView(CreateRole_UI,CreateRoleUIMediator);
			mediatorMap.mapView(GameUIRoot,UIRootMediator);
			mediatorMap.mapView(UIBaseLayer,UIBaseLayerMediator);
			mediatorMap.mapView(UIPanelLayer,UIPanelLayerMediator);
			mediatorMap.mapView(LoadingUI, LoadingMediator);
			mediatorMap.mapView(MainRoleInfo, MainRoleInfoMediator);
			mediatorMap.mapView(MainActivityIcon, MainActivityIconMediator);
			mediatorMap.mapView(MainWorldMap, MainWorldMapMediator);
			mediatorMap.mapView(MainToolBar, MainToolBarMediator);
			mediatorMap.mapView(MainSkillPanel, MainSkillPanelMediator);
			mediatorMap.mapView(MainChatPanel, MainChatPanelMediator);
			mediatorMap.mapView(QuestPanel, QuestMediator);
            mediatorMap.mapView(EffectScreenLamp, EffectScreenLampMediator);
            mediatorMap.mapView(EffectScreenFloating, EffectScreenFloatingMediator);
            mediatorMap.mapView(FaceIcons, FaceIconsMediator);


            mediatorMap.mapView(RoleInfoPanel_UI, RoleInfoPanelMediator);
            mediatorMap.mapView(EquipBox, EquipBoxMediator);


			// map view Mediator 3D (3D的目前尚未实现自动addChild绑定，所以需要手动createMediator)
			mediatorMap.mapView(GameSceneA3D, GameSceneA3DMediator, null, false, false);
			mediatorMap.mapView(Myself, MyselfMediator, null, false, false);
			mediatorMap.createMediator(Main.view3D.scene);

			// start
			commandMap.execute(LoadSettingsCmd);
		}
	}
}
