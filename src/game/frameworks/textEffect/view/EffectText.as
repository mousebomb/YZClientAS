/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.textEffect.view
{
    import com.greensock.TweenLite;

    import tl.core.common.HBaseSprite;
    import tl.core.common.StarlingTextField;

    public class EffectText extends HBaseSprite
    {
        private var _textField:StarlingTextField;    //字体
        private var _tweenLite:TweenLite;

        private var _self:EffectText;
        public var complete:Function;			//消失后执行的回调方法
        public var addComplete:Function;		//淡出完成后执行回调
        public function EffectText()
        {
            init()
            _self = this;
        }
        private function init():void
        {
            if(this.isInit) return;
            this.isInit = true;
            _textField = new StarlingTextField();
            _textField.width = 300;
            _textField.size = 12;
            this.addChild(_textField);
            this.touchGroup = true;
            this.touchable = false;
        }/**
         * 设置显示文字透明淡出并移动Y坐标效果
         * @param str			: 显示的提示文字
         * @param tweenTime_1	: 淡入效果的执行时间
         * @param tweenTime_2	: 淡出+移动效果的执行时间
         * @param delay			: 淡出+移动效果的延迟时间
         * @param upY1			: 淡入时移动的距离
         * @param upY2			: 淡出时移动的距离
         */
        public function setTextEff1(label:String, tweenTime_1:Number = 0.5, tweenTime_2:Number = 0.5, delay:Number = 1, moveY1:int = -50, moveY2:int = -20, isHtml:Boolean = false):void
        {
            if(isHtml)
                _textField.htmlText = label;
            else
                _textField.label = label;
            this.myWidth = _textField.textWidth;
            this.x = (_textField.textWidth >> 1);
            _textField.y = 0;
            //执行效果
            _textField.alpha = 0;
            _tweenLite = TweenLite.to(_textField, tweenTime_1, {alpha:1, y:(_textField.y+moveY1), onComplete:
                    function():void
                    {
                        _tweenLite.kill();
                        if(addComplete != null) addComplete();
                        _tweenLite = TweenLite.to(_textField, tweenTime_2, {alpha:0, delay:delay,  y:(_textField.y+moveY2), onComplete:
                                function():void
                                {
                                    _tweenLite.kill();
                                    closeSelf();
                                }});
                    }});
        }
        /** 移除处理 **/
        public function closeSelf():void
        {

            //移除tweenLite
            if(_tweenLite)
            {
                _tweenLite.kill();
                _tweenLite = null;
            }
            //移除对象
            if(_self.parent)
                _self.parent.removeChild(_self);
            //移除回调
            if(complete != null)
            {
                complete(_self);
                complete = null;
            }
            addComplete = null;
        }

    }
}
