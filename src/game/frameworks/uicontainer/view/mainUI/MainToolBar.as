package game.frameworks.uicontainer.view.mainUI
{
	import tl.core.common.HSimpleButton;
	import tl.core.common.HSprite;

	public class MainToolBar extends HSprite
	{

		public var btn_hide:HSimpleButton;
		public var btn_show:HSimpleButton;
		public var btnSpr:HSprite;
		public function MainActivityIcon()
		{

		}
		public function init():void
		{
			if(this.isInit) return;
			this.isInit = true;
			btnSpr = new HSprite();
			this.addChild(btnSpr);

			btn_show = new HSimpleButton();
			this.addChild(btn_show);
			btn_show.visible = false;

			btn_hide = new HSimpleButton();
			this.addChild(btn_hide)
			btn_hide.y = btn_show.y = 2;
		}
	}
}