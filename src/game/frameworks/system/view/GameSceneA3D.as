/**
 * Created by gaord on 2017/2/4.
 */
package game.frameworks.system.view
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.controllers.HoverController;
	import away3d.core.base.Object3D;

	import flash.events.Event;

	import flash.geom.Vector3D;

	import game.frameworks.Config;

	import game.frameworks.NotifyConst;

	import starling.events.EnterFrameEvent;

	import tl.core.LightProvider;
	import tl.core.skybox.TLSkyBox;
	import tl.core.terrain.MapView;

	public class GameSceneA3D extends Scene3D
	{
		/**Cam*/
		private var _camera:Camera3D;
		/** 地形 */
		public var terrainView:MapView;
		/**天空盒*/
		public var skyBoxView:TLSkyBox;
		/** 刚体容器 */
		public var rigidBodyView:ObjectContainer3D;

		private var _lookTarget:Vector3D = new Vector3D();

		/** 上盖ui层 3D标注类 */
		public var coverView:ObjectContainer3D;

		/** 摄像机控制器*/
		private var _camHC:GameCamController;

		public static const CAM_DEFAULT_DISTANCE :int = 500;
		public static const CAM_MAX_DISTANCE :int = 1000;
		public static const CAM_MIN_DISTANCE :int = 300;

		public static const CAM_DEFAULT_TILTANGLE :int = 25;
		public static const CAM_MIN_TILTANGLE :int = 6;
		public static const CAM_MAX_TILTANGLE :int = 89;
		public function GameSceneA3D(camera_:Camera3D)
		{
			addChild(LightProvider.getInstance().sunLight);
			_camera           = camera_;
			_camera.lens      = new PerspectiveLens();
            _camera.lens.near= 20;
			_camera.lens.far  = Config.CAMERA_FAR;
			_camera.position  = _lookTarget;
			_camera.moveBackward(CAM_DEFAULT_DISTANCE);
			_camHC = new GameCamController(_camera, null, 180, CAM_DEFAULT_TILTANGLE, CAM_DEFAULT_DISTANCE, CAM_MIN_TILTANGLE, CAM_MAX_TILTANGLE,NaN,NaN,8,2);
			_camHC.offsetY = 100;


			terrainView = new MapView();
			addChild(terrainView);


			coverView = new ObjectContainer3D();
			addChild(coverView);

			skyBoxView = new TLSkyBox();
			addChild(skyBoxView);
			//
			rigidBodyView = new ObjectContainer3D();
			addChild(rigidBodyView);
			//
		}


		// #pragma mark --  相机镜头  ------------------------------------------------------------

		/** 跳转镜头 跟踪某个实体 */
		public function setLookObject(obj:ObjectContainer3D):void
		{
			_camHC.lookAtObject = obj;
			_camHC.distance = CAM_DEFAULT_DISTANCE;
		}
		public function get lookTarget():Vector3D
		{
			return _lookTarget;
		}

		public function setLookTarget(lx:Number, ly:Number, lz:Number):void
		{
			_lookTarget.x         = lx;
			_lookTarget.z         = ly;
			_lookTarget.y         = lz;
			_camHC.lookAtPosition = _lookTarget;
			//
			dispatchEvent(lookTargetChanged);
		}

		private var lookTargetChanged:Event = new Event(NotifyConst.SCENE_CAM_MOVED, null);

		/** 跳转镜头 到地图中心位置 */
		public function lookAtMapCenter():void
		{
			_camHC.panAngle  = 180;
			_camHC.tiltAngle = CAM_DEFAULT_TILTANGLE;
			setLookTarget(terrainView.bounds.halfExtentsX, terrainView.bounds.halfExtentsZ, terrainView.bounds.halfExtentsY);
		}

		/** 跳转镜头 到某个实体位置 */
		public function lookAtEntity(obj:Object3D):void
		{
			setLookTarget(obj.x, obj.z, obj.y);
		}

		public function camForward(delta:int):void
		{
			var distanceNew :Number = _camHC.distance - delta * 5;
			if(distanceNew>CAM_MAX_DISTANCE) distanceNew = CAM_MAX_DISTANCE;
			else if(distanceNew<CAM_MIN_DISTANCE) distanceNew=CAM_MIN_DISTANCE;
			_camHC.distance =distanceNew;
		}

		private static const DRAG_ROLL_SENSITIVE:Number = 0.25;

		public function dragRoll(mouseX:Number, mouseY:Number):void
		{
			_camHC.panAngle += mouseX * DRAG_ROLL_SENSITIVE;
			_camHC.tiltAngle += mouseY * DRAG_ROLL_SENSITIVE;
		}

	}
}
