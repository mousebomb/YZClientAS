/**
 * Created by gaord on 2016/12/13.
 */
package game.frameworks
{
	public class NotifyConst
	{

		/**鼠标坐标变化 查看：model.mouseTilePos */
		public static const MOUSE_POS_CHANGED :String = "MOUSE_POS_CHANGED";
		/** 地图数据VO初始化完毕 */
		public static const MAP_VO_INITED :String = "MAP_VO_INITED";

		/** settings.xml加载完毕 */
		public static const SETTINGS_LOADED :String = "SETTINGS_LOADED";
		/** 版本加载完毕 */
		public static const VERSION_LOADED :String = "VERSION_LOADED";
		/** CSV加载完毕 */
		public static const CSV_LOADED:String     = "CSV_LOADED";
		/** 加载主界面UI */
		public static const LOAD_MAIN_UI :String = "LOAD_MAIN_UI";
		/** 加载创建角色UI */
		public static const LOAD_CREATE_ROLE :String = "LOAD_CREATE_ROLE";
        /** 创建角色 */
        public static const CREATE_ROLE :String = "CREATE_ROLE";
        public static const CLOSE_CREATE_ROLE :String = "CLOSE_CREATE_ROLE";
        public static const SC_LOGIN_RESPONSE :String = "SC_LOGIN_RESPONSE";
		/** 资源完毕,服务器也就绪 进入游戏 */
		public static const ENTER_GAME :String = "ENTER_GAME";

		/** 编辑器要求移动镜头 @data=Point( 0.0~1.0,0.0~1.0 ) */
		public static const UI_EDITOR_MOVE_CAM :String = "UI_EDITOR_MOVE_CAM";
		/** 镜头被按快捷键移动了 ui需要更新  @data=Point( 0.0~1.0,0.0~1.0 ) */
		public static const SCENE_CAM_MOVED :String = "SCENE_CAM_MOVED";

		/**通知状态 @data =String */
		public static const STATUS:String      = "STATUS";
		public static const LOG:String         = "LOG";

		/** 加载已存在的地图文件 @data :String map名 */
		public static const LOAD_MAP :String = "LOAD_MAP";

		/**主角进入地图最后步骤 */
		public static const SC_ENTERMAP :String = "SC_ENTERMAP";

		/** 寻路完成或寻路发生变化 @data=paths */
		public static const FIND_PATH :String = "FIND_PATH";

		/** 移动一格完成 @data=Point 刚完成的格所对应的Point */
		public static const AI_MOVE_END :String = "AI_MOVE_END";
		/** 移动一格开始 @data=Point 要移动的格 */
		public static const AI_MOVE_BEGIN :String = "AI_MOVE_BEGIN";
		/** 正在移动 @data=tweenPoint 移动过程点 坐标为++  */
		public static const AI_MOVE :String = "AI_MOVE";
		/** 正在技能移动 @data=tweenPoint 移动过程点 坐标为++ */
		public static const AI_SKILLMOVE2MOVE :String = "AI_SKILLMOVE2MOVE";
		/** 进入站 */
		public static const AI_STAND :String = "AI_STAND";

		/** 开关网格 @data 不需要  */
		public static const TOGGLE_GRID :String = "TOGGLE_GRID";
		/**开关区域显示 @data 不需要 */
		public static const TOGGLE_ZONE :String = "TOGGLE_ZONE";
		/**包围盒显示与否 */
		public static const TOGGLE_BOUNDS :String = "TOGGLE_BOUNDS";



		/** SOCKET状态切换 */
		public static const SC_SWITCH_STATE :String = "SC_SWITCH_STATE";
		/** SOCKET掉线 */
		public static const SC_CONN_LOST :String = "SC_CONN_LOST";
		/** SOCKET连上服务器 */
		public static const SC_CONN_SUCC :String = "SC_CONN_SUCC";

		/** 最初的UI加载界面完毕 */
		public static const FIRSTUI_LOADED :String = "FIRSTUI_LOADED";

		/**显示全屏加载背景界面*/
		public static const SHOW_LOADING_UI:String = 'SHOW_LOADING_UI';
		/**关闭全屏加载背景界面*/
		public static const CLOSE_LOADING_UI:String = 'CLOSE_LOADING_UI';
		/**更新全屏加载界面进度条*/
		public static const UPDATE_PROGRESS_BAR:String = 'update_progress_bar';
		/**显示走马灯*/
		public static const SHOW_SCREEN_LAMP:String = 'SHOW_SCREEN_LAMP';
		/**显示飘字提示*/
		public static const SHOW_SCREEN_FLOATING:String = 'SHOW_SCREEN_FLOATING';
		/**文本默认字体*/
		public static const DEFAULT_FONT_NAME:String = '宋体';
		/**文本嵌入字体*/
		public static const EMBED_FONT_NAME:String = null;
        /**默认字体大小*/
        public static const DEFAULT_TEXT_SIZE:int = 12;


        /** Service 创建主角数据 */
        public static const SC_CREATE_PLAYER :String = "SC_CREATE_PLAYER";
        /** Service 创建其它玩家数据 */
        public static const SC_CREATE_OTHER_PLAYER :String = "SC_CREATE_OTHER_PLAYER";
        /** 删除玩家 */
        public static const SC_DESTROY_ENTITY :String = "SC_DESTROY_ENTITY";
		/**刷新玩家数据*/
        public static const SC_UPDATE_ENTITY:String = 'SC_UPDATE_ENTITY';
		/**刷新主角数据*/
        public static const SC_UPDATE_MYSELF:String = 'SC_UPDATE_MYSELF';
		/**玩家移动*/
        public static const SC_ENTITY_MOVE:String = 'SC_ENTITY_MOVE';
		/** 开启鼠标指探针 */
		public static const ENABLE_MOUSE_POINT_TRACK :String = "ENABLE_MOUSE_POINT_TRACK";

		/** 创建聊天数据 */
		public static const SC_CREATE_CHAT :String = "SC_CREATE_CHAT";
		/** 创建任务数据 */
		public static const SC_CREATE_TASK :String = "SC_CREATE_TASK";
		/** 创建物品数据 */
		public static const SC_CREATE_ITEM :String = "SC_CREATE_ITEM";
		/**刷新任务数据*/
		public static const SC_UPDATE_QUEST:String = 'SC_UPDATE_QUEST';




		public function NotifyConst()
		{
		}
	}
}
