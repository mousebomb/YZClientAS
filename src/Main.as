package
{

	import away3d.cameras.Camera3D;
	import away3d.containers.View3D;
	import away3d.core.managers.Stage3DManager;
	import away3d.core.managers.Stage3DProxy;
	import away3d.core.pick.PickingType;
	import away3d.core.precompiled.PrecompiledShaders;
	import away3d.events.Stage3DEvent;

	import com.demonsters.debugger.MonsterDebugger;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	import game.frameworks.ApplicationContext;
    import game.frameworks.Config;

    import game.frameworks.system.view.GameSceneA3D;
	import game.frameworks.uicontainer.view.GameUIRoot;

	import starling.core.Starling;
	import starling.events.Event;

	import tool.DebugHelper;
	import tool.StageFrame;

	[SWF (width=1280,height=768,frameRate=60)]
	public class Main extends Sprite
	{

		public var debugHelper:DebugHelper;

		[Embed("yzShaderAll.shaders", mimeType="application/octet-stream")]
		public static var shadersBAClass:Class;

		public function Main()
		{
			if (stage)
			{
				onSTAGE(null);
			}
			else
			{
				this.addEventListener(flash.events.Event.ADDED_TO_STAGE, onSTAGE);
			}
		}

		private var myWidth:int;
		private var myHeight:int;

		private var _Stage3DManager:Stage3DManager;				//创建3d管理类
		private var _Stage3DProxy:Stage3DProxy;					//3d代理类
		public static var view3D:View3D;								//3d显示窗口
		private function onSTAGE(e:flash.events.Event):void
		{
			stage.addEventListener(MouseEvent.RIGHT_CLICK, function (e:MouseEvent):void
			{
			});

			this.removeEventListener(flash.events.Event.ADDED_TO_STAGE, onSTAGE);

			stage.scaleMode              = StageScaleMode.NO_SCALE;
			stage.align                  = StageAlign.TOP_LEFT;
			stage.quality                = StageQuality.LOW;
//			stage.showDefaultContextMenu = false;	//屏蔽右键菜单

			// 初始化预编译的shaders
			PrecompiledShaders.initFromBinary(new shadersBAClass());

			StageFrame.setup(stage);
			stage.frameRate = 60;
			myWidth         = stage.stageWidth;
			myHeight        = stage.stageHeight;

			//初始化3D场景设置
			_Stage3DManager         = Stage3DManager.getInstance(stage);
			_Stage3DProxy           = _Stage3DManager.getFreeStage3DProxy();
			_Stage3DProxy.antiAlias = Config.ANTI_ALIAS;           					//全局抗锯齿参数
			_Stage3DProxy.color     = 0xFF000000;  							//背景颜色
			_Stage3DProxy.addEventListener(Stage3DEvent.CONTEXT3D_CREATED, onProxyCreated);
			_Stage3DProxy.configureBackBuffer(myWidth, myHeight, Config.ANTI_ALIAS);

//			Away3DConfig.myStage = stage;			//设置Away3D类库所用的stage
			//			Parsers.enableAllBundled();

			//

			stage.addEventListener(flash.events.Event.RESIZE, onResize);

			debugHelper = new DebugHelper(stage);
			MonsterDebugger.initialize(this);
			MonsterDebugger.enabled = false;

		}
		private var _myStarling :Starling;
		private function onProxyCreated(event:Stage3DEvent):void
		{
			_Stage3DProxy.removeEventListener(Stage3DEvent.CONTEXT3D_CREATED, onProxyCreated);
			onResize(null);
			///
			StageFrame.stage3DProxy = _Stage3DProxy;
			var camera:Camera3D     = new Camera3D();
			view3D                  = new View3D(new GameSceneA3D(camera), camera);
			view3D.stage3DProxy     = _Stage3DProxy;
			view3D.shareContext     = true;						//允许共享执行
			view3D.width            = myWidth;
			view3D.height           = myHeight;
			view3D.mousePicker      = PickingType.RAYCAST_BEST_HIT;
//			_View3D.forceMouseMove = true;
			this.addChild(view3D);
			DebugHelper.setView3D(view3D);

			var viewPort :Rectangle = new Rectangle(0, 0, myWidth, myHeight);


			_myStarling                     = new Starling(GameUIRoot, stage, viewPort, _Stage3DProxy.stage3D, 'auto', 'auto');
			_myStarling.shareContext=true;
//			_myStarling.simulateMultitouch  = true;
			_myStarling.enableErrorChecking = false;//Capabilities.isDebugger;
			_myStarling.start();
			_myStarling.skipUnchangedFrames = true;
			_myStarling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);


			// RL
			StageFrame.mainFun = onEnterFrame;

		}
		private function onResize(event:flash.events.Event):void
		{
			myWidth  = stage.stageWidth;
			myHeight = stage.stageHeight;
			if (view3D)
			{
				_Stage3DProxy.configureBackBuffer(myWidth, myHeight, Config.ANTI_ALIAS);
				view3D.width  = myWidth ;
				view3D.height = myHeight;
				view3D.x      = 0;
				view3D.y      = 0;
			}
			if(_myStarling)
			{
				_myStarling.stage.stageWidth = myWidth;
				_myStarling.stage.stageHeight = myHeight;
				_myStarling.viewPort = _Stage3DProxy.viewPort;

			}
		}
		public static var context:ApplicationContext;

		protected function onRootCreated(event: *):void
		{
			context = new ApplicationContext((_myStarling.root as GameUIRoot));
			context.startup();
		}


		private function onEnterFrame():void
		{
			//清空Context3D 对象
			_Stage3DProxy.clear();
			//渲染Away3D图层
//			PropertyCount.getInstance().keyStart("Away3DRender","root");
			view3D.render();
			//
			_myStarling.nextFrame();
			_Stage3DProxy.present();

		}

	}
}
