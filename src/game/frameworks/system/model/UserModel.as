/**
 * Created by gaord on 2017/3/7.
 */
package game.frameworks.system.model
{
    import flash.utils.Endian;

    import game.frameworks.NotifyConst;

    import game.frameworks.system.helpers.EntityOrderHelper;
    import game.frameworks.system.model.vo.MyselfVO;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.Socket.Order;
    import tl.core.mapnode.Node;
    import tl.core.role.RoleVO;

    /** 玩家数据 */
	public class UserModel extends Actor
	{
        [Inject]
        public var csvModel:CsvDataModel;

	    [Inject]
	    public var mySelfVO: MyselfVO;

	    public var playerVoVector:Vector.<RoleVO> = new <RoleVO>[];
	    public var playerUIDVector:Vector.<Number> = new <Number>[];
		public function UserModel()
		{
			super();
		}


		// #pragma mark --  同场景内其他角色数据  ------------------------------------------------------------

		/** 创建玩家  */
        public function onCreateEntity(order:Order):void
        {
            var bytes:Order = new Order();
            bytes.endian = Endian.LITTLE_ENDIAN;
			var arr:Array = [];
            while(order.bytesAvailable)
            {
                //单个实体数据长度
                var byteLen:int = order.readInt();
                //读取单个实体数据
                bytes.clear();
                bytes.position = 0;
                order.readBytes(bytes, 0, byteLen);
                bytes.position = 0;
                bytes.position = 0;

                var createType:int = bytes.readByte();
                var type:int = bytes.readInt();
                var angle:int = bytes.readInt();
                var x:int = bytes.readInt();
                var y:int = bytes.readInt();
                var vo:RoleVO = new RoleVO;
                EntityOrderHelper.refreshEntity(vo, bytes);
                vo.csvVO = csvModel.table_wizard.get(vo.Creature_WizardId.toString());

	            vo.WEntity_PosX = x;
	            vo.WEntity_PosY = y;
                playerVoVector.push(vo);
	            playerUIDVector.push(vo.Entity_UID);
	            trace(vo.Creature_WizardId, mySelfVO.Creature_WizardId)
	            if(vo.Creature_WizardId == 10004)
                    arr.push(vo);
            }
            dispatchWith(NotifyConst.SC_CREATE_OTHER_PLAYER, false, arr);
        }

	    private function getRoleVoByUID(uid:Number):RoleVO
	    {
            var index:int = playerUIDVector.indexOf(uid);
            if(index < 0)
            {
                return null;
            }
            var vo:RoleVO = playerVoVector[index];
		    return vo;
	    }
		/**删除玩家*/
        public function onDestroyEntity(order:Order):void
        {

            var voArr:Array = new Array();
            while(order.bytesAvailable)
            {
                var uid:Number = order.readDouble();
                var vo:RoleVO = getRoleVoByUID(uid);
	            if(!vo)
	            {
		            continue;
	            }
	            voArr.push(vo);
            }
            dispatchWith(NotifyConst.SC_DESTROY_ENTITY, false, voArr);
        }
		/**玩家数据刷新*/
        public function onUpdateEntity(order:Order):void
        {

            var type:int = order.readInt();
            var uid:Number = order.readDouble();
	        if(uid == mySelfVO.Entity_UID)
	        {
                EntityOrderHelper.refreshEntity(mySelfVO, order);
                dispatchWith(NotifyConst.SC_UPDATE_MYSELF ,false , mySelfVO );
	        }   else {
                var vo:RoleVO = getRoleVoByUID(uid);
		        if(!vo)
		        {
			        return;
		        }
	            EntityOrderHelper.refreshEntity(vo, order);
                dispatchWith(NotifyConst.SC_UPDATE_ENTITY ,false , vo );
	        }

        }
		/**玩家移动*/
        public function onEntityMove(order:Order):void
        {
            var uid:Number = order.readDouble();
            var path:Vector.<Node> = new <Node>[];
            var node:Node;
            var index:int = 0;
            while(order.bytesAvailable)
            {
                if(index == 0)
                {
                    order.readInt();
                    order.readInt();
                }
                else
                {
                    node =  new Node();
                    node.pointX = order.readInt();
                    node.pointY = order.readInt();
                    path.push(node);
                }
                index++ ;
            }
            var vo:RoleVO = getRoleVoByUID(uid);
            if(path.length < 1 || !vo)
            {
                return;
            }
	        vo.movePath = path;
	        dispatchWith(NotifyConst.SC_ENTITY_MOVE, false, vo)
        }
		/**停止移动*/
        public function onEntityStop(order:Order):void
        {

            var flag:Boolean;
            var uid:Number = order.readDouble();
            var wizardX:int = order.readInt();
            var wizardY:int = order.readInt();
            if (order.bytesAvailable)
            {
                flag = order.readBoolean();
            }
            var vo:RoleVO = getRoleVoByUID(uid);
            if(!vo)
            {
                return;
            }
            vo.WEntity_PosX = wizardX;
            vo.WEntity_PosY = wizardY;
        }
		/**站到指定位置*/
        public function onEntityStand(order:Order):void
        {

            var uid:Number = order.readDouble();
            var wizardX:int = order.readInt();
            var wizardY:int = order.readInt();
            var vo:RoleVO = getRoleVoByUID(uid);
            if(!vo)
            {
                return;
            }
            vo.WEntity_PosX = wizardX;
            vo.WEntity_PosY = wizardY;
        }

        public function onEntityDeadExt(order:Order):void
        {
            var uid:Number;
            var type:int;
            var role:RoleVO;
            var deadWizardVec:Vector.<Number> = new Vector.<Number>();
            var killerUid:Number = order.readDouble();
            var tmpX:int;
            var tmpZ:int;
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                type = order.readByte();
                tmpX = order.readInt();
                tmpZ = order.readInt();
                var vo:RoleVO = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.WEntity_PosX = tmpX;
                vo.WEntity_PosY = tmpZ;
                vo.killerUid = killerUid;
                vo.isDead = true;
                vo.killType = type;
                deadWizardVec.push(uid);	//添加UID,下面派发事件做延迟消失处理
            }
        }
        /**实体复活*/
        public function onEntityRevive(order:Order):void
        {
            var uid:Number;
            var x:int;
            var y:int;
            var deadMapId:int;
            var deadX:int;
            var deadY:int;

            var vo:RoleVO
            var reviveVec:Vector.<Object> = new Vector.<Object>();
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                x = order.readInt();
                y = order.readInt();
                deadMapId = order.readInt();
                deadX = order.readInt();
                deadY = order.readInt();
                vo  = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.killerUid = 0;
                vo.isDead = false;
                vo.WEntity_PosX = x;
                vo.WEntity_PosY = y;

                reviveVec.push( { uid:uid, deadMapId:deadMapId, deadX:deadX, deadY:deadY } );
            }
        }
        /**离开视野*/
        public function onWhoLeaveMe(order:Order):void
        {
            var uid:Number;
            var vo:RoleVO
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                vo  = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.inMyEyes = false;
            }
        }
        /**进入视野*/
        public function onEntityWhoNearMe(order:Order):void
        {
            var uid:Number;
            var x:int;
            var y:int;
            var vo:RoleVO;
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                x = order.readInt();
                y = order.readInt();
                vo = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.inMyEyes = true;
                vo.WEntity_PosX = x;
                vo.WEntity_PosY = y;
                /*vo.canUseSkill = true;

                if (vo.Creature_CurHp > 0)
                {
                    vo.isDead = false;

                    vo.resetAction();	//设置为站立动作
                }
                else
                {
                    if (vo.isDead)
                    {
                        vo.status = WizardKey.Status_Dead;
                        vo.playAction(ActionName.dead);
                    }
                    else
                    {
                        vo.resetAction();	//设置为站立动作
                    }
                }*/
            }
        }
        /**隐身*/
        public function onEntityStealth(order:Order):void
        {
            var uid:Number;
            var type:int;
            var vo:RoleVO
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                type = order.readByte();
                vo  = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.stealthType = type + 1;
            }
        }
        /**取消隐身*/
        public function onEntityNotStealth(order:Order):void
        {
            var uid:Number;
            var vo:RoleVO
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                vo  = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                vo.stealthType = 0;
            }
        }
        /**随机说话*/
        public function onEntitySpoken(order:Order):void
        {
            var uid:Number = order.readDouble();
            var spokenId:uint = order.readInt();
            var vo:RoleVO = getRoleVoByUID(uid);
            if(!vo)
            {
                return;
            }
            vo.spokenId = spokenId;
        }

        /**更新某条属性*/
        public function onUpdateProperty(order:Order):void
        {
            var uid:Number;
            var type:int;
            var value:int;
            var vo:RoleVO
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                type = order.readShort()
                value = order.readInt();

                vo  = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                switch(type)
                {
                    case 0:	//旋转角度
                       // wizardObject.angle = wizardObject.rotationY = value;
                        break;
                }
            }
        }
        /**
         * 更新附近生物的坐标
         * CL: byte nSelfPos(是否获取自己的坐标 0不获取,1获取)
         * LC:
         * 	[
         * 		 UID creatureUID
         * 		,byte nState(0站立;1移动中)
         * 		,MapPos curPos(当前坐标)
         * 		,byte nPathIndex(下一个路径点的索引(如站立,则是0)
         * 	] * n
         */
        public function onUpdatePosExt(order:Order):void
        {

            var uid:Number;
            var state:int;
            var pathLength:int;
            var vo:RoleVO;
            var nodeArgs:Array;
            var node:Node=new Node();
            while(order.bytesAvailable)
            {
                uid = order.readDouble();
                state = order.readByte();
                var _pointX:int = order.readInt();
                var _pointY:int = order.readInt();
                if(state == 1)
                {
                    pathLength = order.readInt();
                    nodeArgs = new Array();
                    for(var i:int = 0; i < pathLength; i++)
                    {
                        node=new Node();
                        node.pointX=order.readInt();
                        node.pointY=order.readInt();
                        nodeArgs.push(node);
                    }
                }
                vo = getRoleVoByUID(uid);
                if(!vo)
                {
                    continue;
                }
                // 除非如果对象巡城（移动缓慢微距） 或 要塞建筑（可能移动一点点） 其它就只能是移动位置超过250
                /*if(wizardObject.isTourCity || wizardObject.fortreesVo || Point.distance(new Point(wizardObject.x, wizardObject.z), new Point(_pointX, _pointY)) > 250)
                {
                    wizardObject.enforceStopAndDispatchEvent();
                    wizardObject.x =_pointX;
                    wizardObject.z = _pointY;
                    if(state == 1)
                    {
                        nodeArgs.shift();
                        wizardObject.targetPath = nodeArgs;
                    }
                }
                else if (state == 0)
                {
                    wizardObject.enforceStopAndDispatchEvent();
                }*/
            }
        }
    }
}
