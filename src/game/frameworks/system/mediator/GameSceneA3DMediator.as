/**
 * Created by gaord on 2017/2/10.
 */
package game.frameworks.system.mediator
{
    import away3d.events.MouseEvent3D;

    import com.demonsters.debugger.MonsterDebugger;

    import flash.events.MouseEvent;
    import flash.geom.Vector3D;

    import game.frameworks.NotifyConst;
    import game.frameworks.system.helpers.GameEntityPriority;
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.FrameworkModel;
    import game.frameworks.system.model.GameMapModel;
    import game.frameworks.system.service.GameMapService;
    import game.frameworks.system.service.MyselfAIService;
    import game.frameworks.system.view.GameSceneA3D;
    import game.frameworks.system.view.Myself;

    import org.robotlegs.mvcs.Mediator;

    import tl.Net.Socket.DataType;
    import tl.core.LightProvider;
    import tl.core.mapnode.Node;
    import tl.core.rigidbody.RigidBodyVO;
    import tl.core.rigidbody.RigidBodyView;
    import tl.core.role.Role;
    import tl.core.role.RolePlaceVO;
    import tl.core.role.RoleVO;

    import tool.StageFrame;

    public class GameSceneA3DMediator extends Mediator
	{
		public function GameSceneA3DMediator()
		{
			super();
		}

		[Inject]
		public var view:GameSceneA3D;
        /** 主角 玩家自己 */
        [Inject]
        public var myself:Myself;
		[Inject]
		public var mapModel:GameMapModel;
		[Inject]
		public var csvModel:CsvDataModel;
		[Inject]
		public var aiService:MyselfAIService;
		[Inject]
		public var frameworkModel:FrameworkModel;
		[Inject]
		public var gameMapService: GameMapService;

		/** 场景内的显示的角色 */
		private var rolesInScene:Vector.<Role> = new Vector.<Role>();
		/**场景内角色数据*/
		private var roleVoVector:Vector.<RoleVO> = new <RoleVO>[];
		override public function onRegister():void
		{
			addContextListener(NotifyConst.MAP_VO_INITED, onMapVOInited);

			//
			// 各种cancel
			eventMap.mapListener(StageFrame.stage, MouseEvent.MOUSE_UP, onStageMouseUp, MouseEvent);

			// 镜头缩放的
			eventMap.mapListener(Main.view3D, MouseEvent.MOUSE_WHEEL, onMouseWheel, MouseEvent);
			eventMap.mapListener(Main.view3D, MouseEvent.RIGHT_MOUSE_DOWN, onStageRightMouseDown, MouseEvent);
			eventMap.mapListener(Main.view3D, MouseEvent.MOUSE_MOVE, onStageMouseMove, MouseEvent);
			eventMap.mapListener(Main.view3D, MouseEvent.RIGHT_MOUSE_UP, onStageRightMouseUp, MouseEvent);
			eventMap.mapListener(Main.view3D, MouseEvent.MOUSE_OUT, onStageRightMouseUp, MouseEvent);

			// 点击地面
			eventMap.mapListener(view.terrainView, MouseEvent3D.MOUSE_DOWN, onTerrainMouseDown, MouseEvent3D);
			eventMap.mapListener(view.rigidBodyView, MouseEvent3D.MOUSE_DOWN, onTerrainMouseDown, MouseEvent3D);

			// 镜头跟踪主角
			addContextListener(NotifyConst.SC_CREATE_PLAYER,onSC_CREATE_PLAYER);
			//通知服务端寻路路径
            addContextListener(NotifyConst.FIND_PATH, onSelfFoundPath);
			/**创建玩家*/
			addContextListener(NotifyConst.SC_CREATE_OTHER_PLAYER, onSC_CREATE_OTHER_PLAYER);
			/**删除玩家*/
			addContextListener(NotifyConst.SC_DESTROY_ENTITY, onSC_DESTROY_ENTITY);
            /**其他实体移动*/
            addContextListener(NotifyConst.SC_ENTITY_MOVE, onSC_ENTITY_MOVE);

            // 游戏场景主循环 每帧执行
            StageFrame.addGameFun(mainLoop);
		}


		// #pragma mark --  对地形点击鼠标相关  ------------------------------------------------------------
		private function onTerrainMouseDown(e:MouseEvent3D):void
		{
			if(frameworkModel.isUIHovering) return;
			var clickedTerrainPos:Vector3D = e.scenePosition;
			// 转换成服务器坐标 ++
			aiService.moveTo( clickedTerrainPos.x, -clickedTerrainPos.z );
		}

		// #pragma mark --  摄像机  ------------------------------------------------------------
		private var isStageRightMouseDown:Boolean;
		private var lastX:Number;
		private var lastY:Number;

		private function onMouseWheel(event:MouseEvent):void
		{
            if(frameworkModel.isUIHovering) return;
            view.camForward(event.delta);
		}

		private function onStageRightMouseDown(event:MouseEvent):void
		{
			isStageRightMouseDown = true;
			lastX                 = StageFrame.stage.mouseX;
			lastY                 = StageFrame.stage.mouseY;
		}

		private function onStageRightMouseUp(event:MouseEvent):void
		{
			isStageRightMouseDown = false;
		}

		private function onStageMouseMove(event:MouseEvent):void
		{
			// 摄像机
			if (isStageRightMouseDown/* && curBrushType == ToolBrushType.BRUSH_TYPE_NONE*/)
			{
				// 移动摄像机
				var deltaX:Number = StageFrame.stage.mouseX - lastX;
				var deltaY:Number = StageFrame.stage.mouseY - lastY;
				lastX             = StageFrame.stage.mouseX;
				lastY             = StageFrame.stage.mouseY;
				view.dragRoll(deltaX, deltaY);
			}
		}

		private function onStageMouseUp(e:MouseEvent):void
		{
			// 处理鼠标弹起
		}

		private function onSC_CREATE_PLAYER( n: * ):void
		{
			if(myself.parent==null)
					view.addChild(myself);
			view.setLookObject(myself);
		}


		// #pragma mark --  地图切换  ------------------------------------------------------------
		/** 当前地图数据就绪 （ 切换地图完毕 ） */
		private function onMapVOInited(n:*):void
		{
            MonsterDebugger.trace("[GameSceneA3DMediator]/onMapVOInited()", "", "bomb", "", 0x990000);
			// 地形
			view.terrainView.fromMapVO(mapModel.mapVO);
			// 模型
			removeAllWizards();
            var len:int = mapModel.mapVO.entityGroupNames.length;
            for (var i:int = 0; i < len; i++)
            {
                var string:String = mapModel.mapVO.entityGroupNames[i];
//                if(string == "植被") continue;
                var loadPriority : int = GameEntityPriority.priorityByGroup[string];
                var group:Vector.<RolePlaceVO>  = mapModel.mapVO.entityGroups[string];
                for (var j:int = 0; j < group.length; j++)
                {
                    var vo:RolePlaceVO = group[j];
                    fromMapWizard(vo,loadPriority);
                }
            }
			// 刚体 用来接受光线检测 做鼠标点击寻路
            removeAllRigidBodies();
            for (var i:int = 0; i < mapModel.mapVO.rigidBodies.length; i++)
            {
                var rigidBodyVO:RigidBodyVO = mapModel.mapVO.rigidBodies[i];
                var rigidBody:RigidBodyView = new RigidBodyView(rigidBodyVO);
                rigidBody.mouseEnabled=true;
                view.rigidBodyView.addChild(rigidBody);
                rigidBodiesInScene.push(rigidBody);
            }
			// 灯光
			LightProvider.getInstance().setSunLightDirection(mapModel.mapVO.sunLightDirection);
			// 天空盒
			view.skyBoxView.setSkyBoxTextureName(mapModel.mapVO.skyboxTextureName);

            //通知服务 地图加载完毕 要进入场景
            gameMapService.send_MsgId_Scene_EnterMap([int(mapModel.mapId), DataType.Byte(mapModel.enterType),mapModel.scenceId]);
			//
//			view.terrainView.isShowGrid=true;
//			view.terrainView.isShowZone=true;
		}


        // #pragma mark --  刚体          ------------------------------------------------------------
        /*
        * 游戏里的刚体和编辑器不同，游戏里目前只用来做鼠标点击判断，尽可能简单的面片
        * */
        /**清空地图 刚体*/
        private function removeAllRigidBodies():void
        {
            for (var i:int = 0; i < rigidBodiesInScene.length; i++)
            {
                var view1:RigidBodyView = rigidBodiesInScene[i];
                view1.disposeWithChildren();
            }
            rigidBodiesInScene   = new Vector.<RigidBodyView>();
        }
        private var rigidBodiesInScene:Vector.<RigidBodyView> = new <RigidBodyView>[];

		/** 清空地图：wizard */
		private function removeAllWizards():void
		{
			for (var i:int = 0; i < rolesInScene.length; i++)
			{
				var role:Role = rolesInScene[i];
				role.clearRole();
			}
			rolesInScene = new Vector.<Role>();
            roleVoVector = new <RoleVO>[];
		}


		/** 从tlmap存档加入显示 */
		private function fromMapWizard(placeVO:RolePlaceVO,loadPriority:int ):void
		{
			//TODO  筛选类型 客户端添加 其他为服务器端通知添加
//			var placeRoleType :int = ( (csvModel.table_wizard.get(placeVO.wizardId) as CsvRoleVO).Type );
//			if(placeRoleType == WizardKey.Type)
//			{}
			var wizardObject:RoleVO = new RoleVO();
			wizardObject.csvVO      = csvModel.table_wizard.get(placeVO.wizardId);
			var newRole:Role        = new Role();
			newRole.actor3DInIt(wizardObject);
			newRole.x         = placeVO.x;
			newRole.z         = placeVO.z;
			newRole.y         = placeVO.y;
			newRole.rotationY = placeVO.rotationY;
			newRole.scale(placeVO.scale);
			newRole.mouseInteractive = false;
            newRole.loadPriority = loadPriority;
			view.addChild(newRole);
			rolesInScene.push(newRole);
			roleVoVector.push(wizardObject);
			// 提交后监听鼠标点击可选中
//			newRole.addEventListener(MouseEvent3D.MOUSE_DOWN, onRoleMouseDown);
		}


		// #pragma mark --  动态角色增删  ------------------------------------------------------------

		/**批量创建玩家*/
		private function onSC_CREATE_OTHER_PLAYER(event:*):void
		{
			var arr:Array = event.data;
			var leng:int = arr.length;
			for (var i:int = 0; i < leng; i++)
			{
                addRole(arr[i]);
			}

		}
		/**批量删除玩家*/
		private function onSC_DESTROY_ENTITY(event:*):void
		{
			var arr:Array = event.data;
			var leng:int = arr.length;
			for (var i:int = 0; i < leng; i++)
			{
                deleteRoleByVO(arr[i]);
			}

		}
		/**添加玩家*/
		public function addRole(vo :RoleVO):void
		{
            var newRole:Role        = new Role();
            newRole.actor3DInIt(vo);
            newRole.x = vo.x;
            newRole.z = vo.z;
            if (mapModel.mapVO)
            {
                newRole.y = mapModel.getHeightWithRigidBody(vo.x, vo.z);
            }
            view.addChild(newRole);
			roleVoVector.push(vo);
            rolesInScene.push(newRole);
		}
		/**删除玩家*/
		public function deleteRoleByVO(vo:RoleVO):void
		{
			var role:Role = getRoleByVo(vo);
			if(role)
                removeWizard(role)
		}
		/**通过玩家数据获取场景玩家*/
		private function getRoleByVo(vo):Role
		{
			var role:Role;
			var index:int = roleVoVector.indexOf(vo);
			if(index > -1)
			{
				role = rolesInScene[index];
			}
			return role;
		}
        /** 删除一个wizard*/
        private function removeWizard(role:Role):void
        {
            var index:int = rolesInScene.indexOf(role);
            if (index > -1)
            {
                rolesInScene.splice(index, 1);
	            roleVoVector.splice(index, 1);
            }
            role.clearRole();
        }
		/**玩家数据刷新*/
        public function updateRole(vo:RoleVO):void
        {

        }

        // #pragma mark --  实体移动  ------------------------------------------------------------
        /** 其他玩家移动 */
        private function onSC_ENTITY_MOVE(n:*):void
        {
//            var vo:RoleVO = n.data as RoleVO;
//            var role:Role = getRoleByVo(vo);
//            role.roleMoveStep();
        }

        /**主角移动 通知服务器 */
        private function onSelfFoundPath(event:*):void
        {
            var paths:Vector.<Node> = event.data;
            if (!paths || paths.length == 0) return;

            var sendPathArgs:Array = [myself.vo.Entity_UID, false];
            var leng:int = paths.length
            for (var i:int = 0; i < leng; i++)
            {
                sendPathArgs.push(paths[i].pointX);
                sendPathArgs.push(paths[i].pointY);
            }
            gameMapService.entityMove(sendPathArgs)
        }


        /**主循环*/
        private function mainLoop():void
        {
            var deltaFor200Ms:uint = StageFrame.curTime - lastUpdate200Time;
            if (deltaFor200Ms >= 200)
            {
                updatePer200Ms(deltaFor200Ms);
                lastUpdate200Time = StageFrame.curTime;
            }
            this.update(StageFrame.deltaTime);
        }

        /** 每帧更新 */
        private function update(deltaMs:uint):void
        {
            // 处理所有其他角色的移动

            for (var i:int = 0; i < rolesInScene.length; i++)
            {
                var role:Role = rolesInScene[i];
                if(role.vo.moveVO)
                {
                    // 根据vo计算移动时间片
                    // 如果已经结束，则开始下一路径点
                }else
                {
                    //
                    if (role.vo.movePath)
                    {

                    }
                }
            }

        }

        private var lastUpdate200Time:uint = 0;

        private function updatePer200Ms(deltaMs:uint):void
        {
            //TODO 处理视野景物

        }
//
//
//        // #pragma mark --  移动		  ------------------------------------------------------------
//        public function roleMoveBegin():void
//        {
//            var paths:Vector.<Node> = vo.movePath;
//            if (paths && paths.length)
//            {
//                // 开始移动
//                var fromX     = vo.WEntity_PosX;
//                var fromY     = vo.WEntity_PosY;
//                var nextPoint = paths.shift();
//                // 计算移动耗时
//// 计算移动耗时
//                var beginTime = StageFrame.curTime;
//                //			AIMoveOneStep.duration = myselfVO.moveSpd * .5;
//
//                var distance :Number = HPointUtil.getTowPointDisTance( new Point(fromX,fromY ),new Point(nextPoint.pointX,nextPoint.pointY));
////			trace(StageFrame.renderIdx,"[AIBeginMoveOneStep]/doEnter",distance ,myselfVO.moveSpeed);
//                var duration = GameRuleUtil.moveDurationS(vo.moveSpeed ,distance);
//                TweenLite.to( this , duration, { x : nextPoint.pointX , z:-nextPoint.pointY});
//            }
//        }
//
//        public function roleMoveClear():void
//        {
//
//        }

    }
}
