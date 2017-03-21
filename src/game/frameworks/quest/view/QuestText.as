/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.quest.view
{
    import game.frameworks.quest.model.QuestVo;

    import starling.display.Image;
    import starling.textures.Texture;

    import tl.core.GPUResProvider;
    import tl.core.common.HLinkText;
    import tl.core.common.HSimpleButton;
    import tl.core.common.HSprite;

    import tool.StageFrame;

    public class QuestText extends HSprite
    {
        private var _image:Image;                   //任务类型图标
        private var _taskName:HLinkText;            //任务名字
        private var _txtTarget:HLinkText;           //任务目标
        private var _questVo:QuestVo;               //任务数据
        private var _size:int = 13;                 //字体大小
        public var moveBtn:HSimpleButton;         //飞鞋

        public function QuestText()
        {
            init();
        }

        private function init():void
        {
            this.myWidth = 180
            var texture:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_bg_0');
            _image = new Image(texture);
            this.addChild(_image);
            _image.x = 0;

            _taskName = new HLinkText();
            _taskName.needPose = false;
            _taskName.autoSize = 'left';
            _taskName.myWidth = myWidth - 25;
            this.addChild(_taskName);
            _taskName.x = 25;

            _txtTarget = new HLinkText();
            _txtTarget.needPose = false;
            _txtTarget.myWidth = myWidth - 25;
            this.addChild(_txtTarget);
            _txtTarget.autoSize = 'left';
            _txtTarget.y = 20;
            _txtTarget.x = 12;
        }

        /**更新任务*/
        public function set quest(value:QuestVo):void
        {
            _questVo              = value;
            var texture:Texture = _questVo.questTypeTexture;
            if (_image.texture != texture)
            {
                _image.texture = texture;
                _image.readjustSize();
            }
            //_taskName.data = {quest:value, type:1};
            _taskName.label = _questVo.questLabel;
            _txtTarget.data = {quest:value, type:2};;
            _txtTarget.eventLabel = _questVo.questEventLabel;
            trace(StageFrame.renderIdx,"QuestText/quest", _questVo.questEventLabel, _questVo.questLabel);
            if(_questVo.isShowMove)
            {
                if(!moveBtn)
                {
                    moveBtn = new HSimpleButton;
                    moveBtn.setAssetsSkin('source_interface_0', "task/task_move");
                    moveBtn.init();
                    this.addChild(moveBtn);
                    moveBtn.y = 18;
                }   else {
                    moveBtn.visible = true;
                }
                var vx:int = _txtTarget.x + _txtTarget.textWidth + 15;
                if(vx > 170) vx = 170;
                moveBtn.x = vx;
            }   else if(moveBtn) {
                moveBtn.visible = false;
            }
        }
    }
}
