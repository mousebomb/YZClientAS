/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.quest.model
{
    import game.frameworks.system.model.vo.CsvQuestVO;

    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    import tl.utils.HCss;

    public class QuestVo
    {
        public var csvQuest:CsvQuestVO;
        /**完成次数*/
        public var questCount:int;
        /**任务状态　0可接，1未完成，2完成,3 任务已失败，只能放弃重接,4 任务今日已完成(日常任务使用),5 任务不可接)　*/
        public var questState:int = 0;
        /**完成数量，比如杀敌数*/
        public var completeTime:int;
        /**最大数量*/
        public var questMaxTime:int;
        /** 任务信息*/
        public var questInfo:String = "*****";
        private const _size:int = 12;
        private var _StarLevel:int;			        //任务星级
        private var _type_0:Texture;                //类型标志0;
        private var _type_1:Texture;                //类型标志1;
        private var _type_2:Texture;                //类型标志2;
        private var _type_3:Texture;                //类型标志3;
        public function QuestVo()
        {
        }

        public function RefreshQuest(obj:Object):void
        {
            questCount = obj.count;
            questState = obj.state;
            _StarLevel = obj.star;
            completeTime = obj.completeTime;
            questMaxTime = obj.maxTime;
            questInfo = obj.info
        }

        /**任务星级*/
        public function get StarLevel():int
        {
            if(_StarLevel < 1)
                _StarLevel = 1;
            return _StarLevel;
        }

        public function set StarLevel(value:int):void
        {
            _StarLevel = value;
        }
        /**任务名称*/
        public function get questLabel():String
        {
            var label:String = HCss.Questcolr2+_size +csvQuest.Name;
            return label;
        }
        /**任务目标*/
        public function get questEventLabel():String
        {
            var info:String;
            if(csvQuest.QuestPurpose.indexOf("%s") > -1)
                info = csvQuest.QuestPurpose.replace(/%s/g, questInfo);
            else
                info = csvQuest.QuestPurpose
            var label:String = replaceHtmlFont(info,HCss.Questcolr4+_size+"nn00")
            return label;
        }
        /** 颜色匹配*/
        private function replaceHtmlFont(msg:String,beninColor:String, isEvent:String='nu00'):String
        {
            var str:String = "";
            for(var i:int=1; i<7; i++)
            {
                var replace:String = "$" + i;
                if(msg.indexOf(replace) != -1)
                {
                    if(questState == 2)
                        str = msg.replace(replace,HCss.Questcolr5 + _size + isEvent);
                    else{
                        if(i == 1)
                            str = msg.replace(replace,HCss["Questcolr" +5] + _size + isEvent);
                        else
                            str = msg.replace(replace,HCss["Questcolr" +i] + _size + isEvent);
                    }
                    msg = str;
                    str = msg.replace(replace, beninColor);
                    msg = str;
                    replaceHtmlFont(msg, beninColor);
                }
            }
            return beninColor + msg;
        }
        /**是否显示飞鞋标志*/
        public function get isShowMove():Boolean
        {
            var flg:Boolean;
            if(questState == 0)
            {
                if(csvQuest.UIQuest == 1 || csvQuest.UIQuest == 3)
                {
                    flg = true;
                }
            }   else if(questState == 1) {
                if(int(csvQuest.SubmitCondition[0]) == 6)
                {
                    if(csvQuest.SubmitCondition.length > 3 && int(csvQuest.SubmitCondition[2]) == 0)
                        flg = false;
                    else
                        flg = true;
                }	else if( int(csvQuest.SubmitCondition[0]) == 4 || int(csvQuest.SubmitCondition[0]) == 2 || csvQuest.Name == "悬赏任务"|| int(csvQuest.SubmitCondition[0]) == 72 || int(csvQuest.SubmitCondition[0]) == 89 ) {
                    flg = true;
                } 	else if(csvQuest.Type == 8 && csvQuest.TargetPath.length > 2){
                    flg = true;
                } 	else{
                    flg = false;
                }
            }   else if(questState == 2) {
                if(csvQuest.UIQuest == 0 || csvQuest.UIQuest == 2)
                {
                    flg = true;
                }
            }
            return flg;
        }
        /**任务类型图标获取*/
        public function get questTypeTexture():Texture
        {

            var texture:Texture;
            /*0，主线
             1，支线任务
             2,每日任务
             3,阵营复仇日常任务*/
            switch(csvQuest.Type)
            {
                case 0 :
                    _type_0 ||= GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_bg_0');
                    texture = _type_0
                    break;
                case 1 :
                    _type_1 ||= GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_bg_1');
                    texture = _type_1
                    break;
                case 2 :
                    _type_2 ||= GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_bg_2');
                    texture = _type_2
                    break;
                case 3 :
                    _type_3 ||= GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_bg_3');
                    texture = _type_3
                    break;
            }
            return texture;
        }
    }
}
