/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.otherRoleInfo.service
{
	import game.frameworks.NotifyConst;
    import game.frameworks.chat.model.ChatModel;

    import org.robotlegs.mvcs.Actor;

	import tl.Net.MsgKey;

	import tl.Net.Socket.Connect;
	import tl.Net.Socket.Order;

	public class OtherRoleService extends Actor
	{
		[Inject]
		public var connect:Connect;
		[Inject]
		public var chatModel: ChatModel;
		public function OtherRoleService()
		{
			super();
		}

		public function init():void
		{
            //更新实体属性
            connect.addOrderCallBack("" + MsgKey.MsgType_Client + MsgKey.MsgId_Entity_WatchPlayer,onWatchPlayer);
		}
		/**聊天消息*/
		private function onWatchPlayer(order:Order):void
		{

		}
        /**(装备栏信息)(byte)nEquipSkepNum, [(uint)nSkepType, (ushort)nSkepItemCount, [ushort idx, uint dataSize, ITEM_DATA ]*n ]*n, (镶嵌的宝石信息)(ushort)nJewelCount, [uint dataSize, ITEM_DATA]*n, uint nWizardId(精录Id),uint TitleId(称号Id) uint nLevel(等级) uint nFightPower(战力) byte camp(阵营) int nArmyLevel(军衔),byte nYellowVipType, byte nYellowVipLv,[byte nGroupType(套装类型),uint nGroupId(套装Id)]*n */
        /**(装备栏信息)(byte)nEquipSkepNum, [(uint)nSkepType, (ushort)nSkepItemCount, [ushort idx, uint dataSize, ITEM_DATA ]*n ]*n, (镶嵌的宝石信息)(ushort)nJewelCount, [uint dataSize, ITEM_DATA]*n, uint nWizardId(精录Id),uint TitleId(称号Id) uint nLevel(等级) uint nFightPower(战力) byte camp(阵营) int nArmyLevel(军衔),byte nYellowVipType, byte nYellowVipLv, [byte nGroupType(套装类型),uint nGroupId(套装Id)]*n */
        private function watchOtherRole(order:Order):void
        {
            /*var skepId:int, itemArgs:Array, itemCount:int, idx:int, dataSize:int, byteArray:ByteArray, item:Item;
            otherRoleObj = new Object;
            _otherItemVec.length = 0;
            var skepNum:int = order.readByte();

            for(var i:int = 0; i < skepNum; i++)
            {
                skepId = order.readInt();
                itemCount = order.readShort();
                itemArgs  = [];
                for(var j:int = 0; j < itemCount; j++)
                {
                    idx = order.readShort();
                    dataSize = order.readInt();
                    byteArray  = new ByteArray();
                    byteArray.endian = Endian.LITTLE_ENDIAN;
                    order.readBytes(byteArray,0,dataSize);
                    item = new Item();
                    item.RefreshItem(byteArray);
                    itemArgs.push([idx,item]);
                    addOtherItem(item);
                }
            }
            itemCount = order.readShort();
            var gemArgs:Array = [];
            for(j = 0; j < itemCount; j++)
            {
                dataSize  = order.readInt();
                byteArray = new ByteArray();
                byteArray.endian = Endian.LITTLE_ENDIAN;
                order.readBytes(byteArray,0,dataSize);
                item = new Item();
                item.RefreshItem(byteArray);
                gemArgs.push([-1,item]);
                addOtherItem(item);
            }
            var tableID:int = order.readInt();
            var titleID:int = order.readInt();
            var level:int = order.readInt();
            var fightPower:int = order.readInt();
            var camp:int = order.readByte();
            var amyLevel:int = order.readInt();
            var qqviptype:int = order.readByte();
            var qqviplv:int = order.readByte();
            var Player_WeaponSoulLvId:int = order.readInt();
            var wing:int = order.readInt();
            var Creature_WeaponStrongLv:int = order.readInt();
            otherRoleObj.itemArgs = itemArgs; 	//物品数据
            otherRoleObj.gemArgs = gemArgs;		//宝石数据
            otherRoleObj.tableID = tableID;
            otherRoleObj.titleID = titleID;
            otherRoleObj.level = level;
            otherRoleObj.fightPower = fightPower;
            otherRoleObj.Player_ArmyLevel = amyLevel;
            otherRoleObj.Player_Camp = camp;
            otherRoleObj.Player_Stamina = qqviptype;
            otherRoleObj.Player_MaxStamina = qqviplv;
            otherRoleObj.Player_WeaponSoulLvId = Player_WeaponSoulLvId;			//器魂
            otherRoleObj.Creature_Wing = wing;									//翅膀幻化
            otherRoleObj.Creature_WeaponStrongLv = Creature_WeaponStrongLv;		//武器强化
            while(order.bytesAvailable)
            {
                var type:int = order.readByte();
                if(type == 5)
                    type = 4;
                var id:int = order.readInt();
                _otherEquiptSetArr[type-1] = [type, id, 0, 0];
            }
            this.dispatchEventWith("watchOtherRoleEquipt",false, otherRoleObj);*/
        }
	}
}
