package game.frameworks.quest.view
{
    import flash.geom.Rectangle;

    import morn.core.components.HScrollBar;

    import starling.display.Sprite;
    import starling.textures.Texture;

    import tl.core.GPUResProvider;
    import tl.core.common.SFScrollContainer;
    import tl.core.common.HSimpleButton;
    import tl.core.common.HSprite;

    public class QuestPanel extends HSprite
	{

        public var btn_hide:HSimpleButton;
        public var btn_show:HSimpleButton;
        public var hideSpr:HSprite;
        public var sfScrollC:SFScrollContainer
        public var targetSpr:Sprite;
      	public function QuestPanel()
		{
			init();
		}

		public function init():void
		{
            if(this.isInit) return;
            this.isInit = true;
            hideSpr = new HSprite();
            this.addChild(hideSpr);

			var texture:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'background/task_bg');
			hideSpr.myDrawByTexture(texture)
			hideSpr.myScale9Grid = new Rectangle(56,4,72,8)
			hideSpr.myImageHeight = 300;
            this.myWidth = texture.width;
            hideSpr.x = -this.myWidth;


            btn_show = new HSimpleButton();
            this.addChild(btn_show);
            btn_show.visible = false;
            up = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_show_0');
            over = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_show_1');
            down = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_show_2');
            btn_show.setTextureSkin(up, over, down);
            btn_show.init();
            btn_show.x = -btn_show.myWidth - 2;

            btn_hide = new HSimpleButton();
            this.addChild(btn_hide)
            var up:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_hide_0');
            var over:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_hide_1');
            var down:Texture = GPUResProvider.getInstance().getMyTexture('source_interface_0', 'task/task_hide_2');
            btn_hide.setTextureSkin(up, over, down);
            btn_hide.init();
            btn_hide.x = -btn_hide.myWidth - 2;
            btn_hide.y = btn_show.y = 2;


            targetSpr = new Sprite;
            sfScrollC = new SFScrollContainer()
            sfScrollC.scrollType = 0;
            sfScrollC.textureType = 1;
            sfScrollC.isShowMin = true;
            hideSpr.addChild(sfScrollC);
            sfScrollC.y = 30;
            //sfScrollC.ScrollVisible = false
            sfScrollC.init(this.myWidth,200);
            //sfScrollC.addEventListener("onVerticalScrollBar_changeHandler", onChangeScrollBar);
		}

		public function updateBg(mh:int):void
		{

		}
	}
}