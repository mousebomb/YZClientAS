/**
 * Created by gaord on 2017/2/27.
 */
package game.frameworks.system.service
{
    import com.demonsters.debugger.MonsterDebugger;

    import flash.geom.Point;

    import flash.utils.ByteArray;
    import flash.utils.Endian;

    import game.frameworks.Config;
    import game.frameworks.NotifyConst;
    import game.frameworks.system.helpers.EntityOrderHelper;
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.GameMapModel;
    import game.frameworks.system.model.MyselfModel;
    import game.frameworks.system.model.UserModel;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.MsgKey;
    import tl.Net.Socket.Connect;
    import tl.Net.Socket.DataType;
    import tl.Net.Socket.Order;
    import tl.core.bombloader.JYLoader;
    import tl.core.mapnode.Node;
    import tl.core.role.RoleVO;
    import tl.core.role.RoleVO;

    public class GameMapService extends Actor
    {
        public function GameMapService()
        {
            super();
        }

        [Inject]
        public var mapModel:GameMapModel;
        [Inject]
        public var connect:Connect;

        private var _isInit:Boolean = false;
        public function init():void
        {
            if(_isInit) return ;
            _isInit = true;
            //玩家准备进入加载资源
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_EnterMapExt, onEnterMapExt);
            //玩家进入地图
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_EnterMap, onEnterMap);
            //实体站立
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Stand, onStand);
            //实体移动停止
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Move, onMove);
            //实体移动停止
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_MoveStop, onMoveStop);
            //   主角信息初始化 //创建主角
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_CreatePlayer, onCreatePlayer);
            //创建实体对象
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_CreateEntity, onCreateEntity);
            //销毁实体对象
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_DestroyEntity, onDestroyEntity);
            //更新实体属性
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_UpdateEntity, onUpdateEntity);
            //修改地图格子数据
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_ChangeMapData, onChangeMapData);

            //实体复活
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Revive, onEntityRevive);
            //实体离开实视线
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_WhoLeaveMe,onWhoLeaveMe);
            //实体进入范围
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_WhoNearMe, onEntityWhoNearMe);
            //实体死亡
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_DeadExt, onDeadExt);
            //实体隐身
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Stealth, onEntityStealth);
            //实体取消隐身
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_NotStealth, onEntityNotStealth);

            //实体随机说话
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Spoken, onEntitySpoken);
            //更新生物属性
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_UpdateProperty,onUpdateProperty);

            //更新实体坐标
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_UpdatePosExt,onUpdatePosExt);



//
//            //属性变化效果
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_AttrErrect, onBattleAttrErrect);
//            //实体动作播放
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_Action, onBattleAction);
//
//
//            //通知玩家进入或离开某区域
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_EnterAreaInfo,onEnterAreaInfo);
//
//            //自动战斗返回
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_Auto, onBattleAuto);
//
//            //停止自动战斗
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_CancelAuto, onBattleCancelAuto);
//
//            //实体移动
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Move,onWizardObjectMove);
//
//            //实体站立
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_Stand,onWizardObjectStand);
//
//            //实体移动停止
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_MoveStop,onWizardObjectMoveStop);
//
//            //使用技能
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_UseSkill,onUseSkill);
//
//            //中断技能
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_CancelSkill,onCancelSkill);
//
//            //技能生效
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_SkillImpact,onSkillImpact);
//
//            //添加Buff
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_AddBuff,onAddBuff);
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_RemoveBuff,onRemoveBuff);		//移除（取消）Buff
//            //进入范围刷新BUFF显示
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_BuffInfo,onBattleBuffInfo);
//
//            //物品掉落
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Barrier_ItemDrop, onItemDrop);
//
//            //物品拾取
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Barrier_ItemCollect, onItemCollect);
//
//            //创建竞技场实体对象
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Arena_Order,onCreateArenaWizardObject);
//
//            //切换分线
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_ChangeLine,MsgId_Scene_ChangeLine);
//
//            //广播分线信息
//
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Scene_BroadcastLine,MsgId_Scene_BroadcastLine);
//
//            //广播分线信息
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_MonsterDead,MsgId_Battle_MonsterDead);
//
//            //广播分线信息
//            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Battle_MonsterRevive,MsgId_Battle_MonsterRevive);
//
//            //登陆天数
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_Online_LoginDays,onLineDays);
//
//            //登陆天数
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_Online_RegDays,onRegDays);
//
//            //登陆天数
//
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_WorldLevel_Info,MsgId_WorldLevel_Info);
//
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_Patrol_ActorOutput,MsgId_Patrol_ActorOutput);
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_Barrier_ChessPiecePoint,MsgId_Barrier_ChessPiecePoint);
//            connect.addOrderCallBack(MsgKey.MsgType_Client.toString() + MsgKey.MsgId_Scene_XuKongTimeInfo,MsgId_Scene_XuKongTimeInfo);

        }

        /** 控制加载地图开始 */
        public function startLoadMap(mapId:String, isPrepared:Boolean):void
        {
            if (isPrepared)
                JYLoader.getInstance().reqResource(Config.MAP_URL + mapId + ".tlmap", JYLoader.RES_BYTEARRAY, 1, JYLoader.GROUP_SCENE, null);
            else
                JYLoader.getInstance().reqResource(Config.MAP_URL + mapId + ".tlmap", JYLoader.RES_BYTEARRAY, 1, JYLoader.GROUP_SCENE, onMapLoaded);

        }

        private function onMapLoaded(url:String, ba:ByteArray, mark:*):void
        {
            mapModel.readMapVO(ba);
        }


        // #pragma mark --  通信  ------------------------------------------------------------
        /** 请求切换地图 */


        /** 切换地图 */


        [Inject]
        public var myselfModel:MyselfModel;
        [Inject]
        public var userModel: UserModel;
        [Inject]
        public var csvModel:CsvDataModel;


        /** SC 准备进入地图 **/
        private function onEnterMapExt(order:Order):void
        {
            mapModel.mapId = order.readInt();
            mapModel.enterType = order.readByte();
            mapModel.scenceId = order.readInt();
            mapModel.csvMapVO = csvModel.table_map.get(mapModel.mapId);
//            startLoadMap(mapModel.csvMapVO.XmlName , false);
//            dispatchWith(NotifyConst.LOAD_MAP, false, "map001");
            // TODO del debug only
            startLoadMap("map001" , false);
            // TODO ENDOF debug only
            //显示加载进度界面
            MonsterDebugger.trace("[GameMapService]/onEnterMapExt()" , "准备进入地图","bomb","",0x990000);
            //			trace("---------------------------------------------->离开地图:", mapId);
        }
        /** SC 进入地图 **/
        private function onEnterMap(order:Order):void
        {
            MonsterDebugger.trace("[GameMapService]/onEnterMap()" , "进入场景","bomb","",0x990000);
            mapModel.mapId = order.readInt();
            mapModel.hookState = order.readByte();

            myselfModel.vo.WEntity_PosX = order.readInt();
            myselfModel.vo.WEntity_PosY = order.readInt();

            dispatchWith(NotifyConst.SC_ENTERMAP);
            trace("---------------------------------------------->进入地图:", mapModel.mapId);

            // 关闭加载画面
            dispatchWith(NotifyConst.CLOSE_LOADING_UI);
        }
        /** 实体移动**/
        private function onMove(order:Order):void
        {
            userModel.onEntityMove(order);
        }


        /** 实体拉到指定位置**/
        private function onStand(order:Order):void
        {
            userModel.onEntityStand(order);
        }

        /** 实体强制停止**/
        private function onMoveStop(order:Order):void
        {
            userModel.onEntityStop(order);
        }
        /**创建主角*/
        private function onCreatePlayer(order:Order):void
        {
            myselfModel.createPlayer(order);
            dispatchWith(NotifyConst.SC_CREATE_PLAYER, false);
        }


        /** 批量创建实体**/
        private function onCreateEntity(order:Order):void
        {
            userModel.onCreateEntity(order)
        }

        /** 删除实体**/
        private function onDestroyEntity(order:Order):void
        {
            userModel.onDestroyEntity(order)
        }

        /** 实体数据更新 **/
        private function onUpdateEntity(order:Order):void
        {
            userModel.onUpdateEntity(order);
        }
        /** 刷新地图格子数据**/
        private function onChangeMapData(order:Order):void
        {
            var mapId:int = order.readInt();
            while(order.bytesAvailable)
            {
                var index:int = order.readInt();
                var value:int = order.readByte();
                var c:int //= index % this.mapData._GridCols;
                var r:int //= int(index / this.mapData._GridCols);
                var node:Node //= this.mapData.getNode(r, c);
                node.value = value;
            }
        }
        /** 实体复活 **/
        private function onEntityRevive(order:Order):void
        {
            userModel.onEntityRevive(order)
        }
        /**
         * 实体离开视线 [UID creatureUID] * n
         */
        private function onWhoLeaveMe(order:Order):void
        {
            userModel.onWhoLeaveMe(order)
        }
        /**
         * 实体进入视线
         * 	[
         * 		 UID creatureUID
         * 		,int x
         * 		,int y
         * ] * n
         */
        private function onEntityWhoNearMe(order:Order):void
        {
            userModel.onEntityWhoNearMe(order)
        }

        /**实体死亡(多个实体)(怎么死)*/
        private function onDeadExt(order:Order):void
        {
            userModel.onEntityDeadExt(order)
        }
        /**实体隐身 */
        private function onEntityStealth(order:Order):void
        {
            userModel.onEntityStealth(order)

        }

        /**实体取消隐身 */
        private function onEntityNotStealth(order:Order):void
        {
            userModel.onEntityNotStealth(order)
        }

        /**
         * 实体随机说话
         * LC:
         * 	UID uid(怪物uid)
         * ,uint nSpokenId
         */
        private function onEntitySpoken(order:Order):void
        {
           userModel.onEntitySpoken(order)
        }
        /**更新实体某条属性*/
        private function onUpdateProperty(order:Order):void
        {
            userModel.onUpdateProperty(order)
        }

        /**更新附近生物的坐标 */
        private function onUpdatePosExt(order:Order):void
        {
            userModel.onUpdatePosExt(order)
        }
        /**资源准备完毕，通知服务端可以进入地图*/
        public function send_MsgId_Scene_EnterMap(arr:Array):void
        {
            connect.sendServer(MsgKey.MsgType_Cache,MsgKey.MsgId_Scene_EnterMap, arr);
        }

        /**
         * 实体移动
         * @param serverPathArgs
         */
        public function entityMove(serverPathArgs:Array):void
        {
            connect.sendServer(MsgKey.MsgType_Client, MsgKey.MsgId_Entity_Move, serverPathArgs);
        }

    }
}
