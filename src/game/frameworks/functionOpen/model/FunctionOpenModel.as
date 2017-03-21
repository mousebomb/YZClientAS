/**
 * Created by Administrator on 2017/3/10.
 */
package game.frameworks.functionOpen.model
{
    import game.frameworks.system.model.CsvDataModel;
    import game.frameworks.system.model.vo.CsvFunctionVO;
    import game.frameworks.uicontainer.NotifyUIConst;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.Socket.Order;
    import tl.utils.HashMap;

    /**功能开放*/
    public class FunctionOpenModel extends Actor
    {
        /**镶嵌 */
        public var EquipMosaic:Boolean = false;
        /**技能 */
        public var Skill:Boolean = false;
        /**首充 */
        public var FirstPay:Boolean = false;
        /**精采活动 */
        public var Activity:Boolean = false;
        /** 开服七天*/
        public var Sevendays:Boolean = false;
        /**副本大厅 */
        public var Hallpoints:Boolean = false;
        /**强化 */
        public var EquipStreng:Boolean = false;
        /**坐骑 */
        public var Mount:Boolean = false;
        /**翅膀 */
        public var Wing:Boolean = false;
        /**构装 */
        public var Packaging:Boolean = false;
        /**炼金 */
        public var Alchemist:Boolean = false;
        /**血脉 */
        public var EquiBlood:Boolean = false;
        /**时装 */
        public var Fashion:Boolean = false;
        /**好友 */
        public var Friends:Boolean = false;
        /**阵营 */
        public var Camp:Boolean = false;
        /**鉴定 */
        public var EquipAuthenticate:Boolean = false;
        /**重铸*/
        public var EquipRecast:Boolean = false;
        /**传承*/
        public var EquipInherit:Boolean = true;
        /**分解 */
        public var EquipResolve:Boolean = false;
        /** 合成*/
        public var EquipCompound:Boolean = false;
        /** 排行榜*/
        public var Rank:Boolean = false;
        /** 投资*/
        public var Invest:Boolean = false;
        /** 竞技场*/
        public var Arena:Boolean = false;
        /** 英雄成就*/
        public var Achieve:Boolean = false;
        /** Boss争夺*/
        public var BossFight:Boolean = false;
        /** 活跃度*/
        public var Daily:Boolean = false;
        /** 任务刷星*/
        public var InitQuest:Boolean = false;
        /**器魂*/
        public var WeaponSoul:Boolean = false;
        /**战姬*/
        public var WarConcubine:Boolean = false;
        /**图鉴*/
        public var SoulBook:Boolean = false;
        /**签到*/
        public var Sign:Boolean;
        /**资源找回*/
        public var Retrieve:Boolean;
        /**小助手*/
        public var Assistant:Boolean;
        /**献祭*/
        public var Worship:Boolean;
        /**脉宠*/
        public var EquiBloodPet:Boolean;
        /**星阵*/
        public var StarArray:Boolean;
        /**至尊天下*/
        public var Becket:Boolean;
        /**启福*/
        public var Qifu:Boolean;
        /**最大开放功能id*/
        public var maxOpenId:int;
        [Inject]
        public var csvData: CsvDataModel;
        public var functionHash:HashMap;
        public function FunctionOpenModel()
        {
            super();
        }
        /**初始化功能 ushort nFunction(功能索引号), byte nStep(步骤; 0表示开放,99表示走完流程，100表示未开放) */
        public function updateOpenFunction(order:Order):void
        {
            functionHash = new HashMap();
            var leng:int = csvData.table_function.size;
            var vo:FunctionVO;
            for(var i:int=0; i<leng; i++)
            {
                vo = new FunctionVO();
                vo.updateVo(csvData.table_function.values[i]);
                functionHash.put(vo.functionName, vo);
            }
            while (order.bytesAvailable)
            {
                var id:int = order.readShort();
                var type:int = order.readByte();
                if(type != 100)
                {
                    maxOpenId = id;
                    vo = functionHash.get(id);
                    vo.currentStep = type;
                }
            }

        }
        /**添加新功能*/
        public function openFunctionNew(order:Order):void
        {
            var vo:FunctionVO;
            var arr:Array = [];
            while(order.bytesAvailable)
            {
                var id:int = order.readShort();
                var type:int = order.readByte();
                if(type != 100)
                {
                    maxOpenId = id;
                    arr.push([id,type]);
                }
            }
            //排序
            var len:int = arr.length;
            var _arr:Array = [];
            var _arr0:Array = [];//0
            var _arr1:Array = [];//1
            var _arr2:Array = [];//2
            var _arr3:Array = [];//2 坐骑
            for(var i:int = 0;i < len;i++){
                vo = functionHash.get(arr[i][0].toString());
                if(vo)
                {
                    if(int(vo.csvVo.ShowKey) == 0){
                        _arr0.push(arr[i]);
                    }else if(int(vo.csvVo.ShowKey) == 1){
                        _arr1.push(arr[i]);
                    }else if(int(vo.csvVo.ShowKey) == 2){
                        if(vo.csvVo.Name == "WarConcubine" || vo.csvVo.Name == "WeaponSoul" ||
                                vo.csvVo.Name == "Mount" || vo.csvVo.Name == "Wing" ||
                                vo.csvVo.Name == "EquiBlood"){
                            _arr3.push(arr[i]);
                        }else{
                            _arr2.push(arr[i]);
                        }
                    }
                }
            }
            _arr = ((_arr1.concat(_arr3)).concat(_arr2)).concat(_arr0);
            len = _arr.length;
            var time:int = 0;
            for(i = 0;i < len;i++){
                vo = functionHash.get(arr[i][0].toString());
                if(vo)
                {
                    vo.currentStep = int(_arr[i][1]);
                    dispatchWith(NotifyUIConst.UI_OPEN_FUNCTION, false, vo);
                }
            }
        }
    }
}
