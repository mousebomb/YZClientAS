/**
 * Morn UI Version 2.4.1020 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package {
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	import morn.core.managers.DialogManager;
	import morn.core.managers.DragManager;
	import morn.core.managers.LangManager;
	import morn.core.managers.LoaderManager;
	import morn.core.managers.LogManager;
	import morn.core.managers.RenderManager;
	import morn.core.managers.TimerManager;
	import morn.core.managers.TipManager;
	import morn.core.managers.UIAssetManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.utils.AssetManager;

	import tl.core.GPUResProvider;

	/**全局引用入口*/
	public class App {
		/**全局stage引用*/
		public static var stage:Stage;
		/**全局starling引用*/
		public static var starling:Starling;
		/**starling资源管理器*/
		public static var assetManager:GPUResProvider = GPUResProvider.getInstance();
		/**资源管理器*/
		public static var asset:UIAssetManager = new UIAssetManager();
		/**加载管理器*/
		public static var loader:LoaderManager = new LoaderManager();
		/**时钟管理器*/
		public static var timer:TimerManager = new TimerManager();
		/**渲染管理器*/
		public static var render:RenderManager = new RenderManager();
		/**对话框管理器*/
		public static var dialog:DialogManager = new DialogManager();
		/**日志管理器*/
		public static var log:LogManager = new LogManager();
		/**提示管理器*/
		public static var tip:TipManager = new TipManager();
		/**拖动管理器*/
		public static var drag:DragManager = new DragManager();
		/**语言管理器*/
		public static var lang:LangManager = new LangManager();
		
		public static function init(main:Sprite):void {
			stage = main.stage;
			starling = Starling.current;
//			stage.frameRate = MornUIConfig.GAME_FPS;
//			stage.scaleMode = StageScaleMode.NO_SCALE;
//			stage.align = StageAlign.TOP_LEFT;
//			stage.stageFocusRect = false;
//			stage.tabChildren = false;
			
			//覆盖配置
			var gameVars:Object = null;//stage.loaderInfo.parameters;
			if (gameVars != null) {
				for (var s:String in gameVars) {
					if (MornUIConfig[s] != null) {
						MornUIConfig[s] = gameVars[s];
					}
				}
			}
			
//			stage.addChild(dialog);
//			stage.addChild(tip);
//			stage.addChild(log);
			
			//如果UI视图是加载模式，则进行整体加载
			if (Boolean(MornUIConfig.uiPath)) {
				App.loader.loadDB(MornUIConfig.uiPath, new Handler(onUIloadComplete));
			}
		}
		
		private static function onUIloadComplete(content:*):void {
			View.uiMap = content;
		}
		
		/**获得资源路径(此处可以加上资源版本控制)*/
		public static function getResPath(url:String):String {
			return /^http:\/\//g.test(url) ? url : MornUIConfig.resPath + url;
		}
	}
}