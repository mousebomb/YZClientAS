/**
 * Created by Administrator on 2017/3/6.
 */
package game.frameworks.system.service
{
	import tl.core.common.HBaseSprite;
	import tl.core.common.HSprite;

	import tool.StageFrame;

	public class ItemIconTipsManage extends HBaseSprite
	{
		private static var _instance:ItemIconTipsManage;
		public function ItemIconTipsManage()
		{
			this.isNeedQuare = true;
			super ();
		}

		public static function getInstance():ItemIconTipsManage
		{
			_instance ||= new ItemIconTipsManage;
			return _instance;
		}
		public function hideItemTips():void
		{
			if(this.parent)
				this.parent.removeChild(this);
			/*if(HSysClock.getInstance().isHasCallBack("showBuffTips"))
			{
				HSysClock.getInstance().removeCallBack("showBuffTips");
			}
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, onClick);*/
		}
		public function moveTips(vx:Number, vy:Number):void
		{
			if(this.myWidth + vx >= StageFrame.stage.stageWidth)
				this.x = vx - this.myWidth - 40;
			else
				this.x = vx;
			if(this.myHeight + vy > StageFrame.stage.stageHeight)
				this.y = StageFrame.stage.stageHeight - this.myHeight;
			else
				this.y = vy;
		}
	}
}
