/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.textEffect.view
{
import tl.core.common.HBaseSprite;

public class EffectScreenFloating extends HBaseSprite
	{
		private var _effectDataArr:Array = [];
		private var _effectTextArr:Array = [];
		private var _isPlayer:Boolean;				//播放特效标志
		public function EffectScreenFloating()
		{
			super();
		}
		/**显示特效*/
        public function showEffect(data:String):void
        {
			if(_isPlayer)
			{
                _effectDataArr.push(data);
			}	else {
				playerEffect(data);
			}

        }
		private function playerEffect(data:String):void
		{
            _isPlayer = true;
            var effect:EffectText;
			if(_effectTextArr.length)
			{
				effect = _effectTextArr.pop();
			}	else {
                effect = new EffectText();
			}
            effect.setTextEff1(data);
			this.addChild(effect);
			effect.x = 300 - effect.myWidth >> 1;
			effect.addComplete = addComplete
			effect.complete = onComplete
		}

        private function onComplete(effect:EffectText):void
        {
            _effectTextArr.push(effect)
        }

        private function addComplete():void
        {
			if(_effectDataArr.length)
			{
				var data:String = _effectDataArr.shift();
				playerEffect(data);
			}	else {
				_isPlayer = false;
			}
        }
    }
}
