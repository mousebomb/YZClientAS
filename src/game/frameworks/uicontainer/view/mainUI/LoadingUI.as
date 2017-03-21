package game.frameworks.uicontainer.view.mainUI {
	import starling.display.Image;
	import starling.filters.BlurFilter;
    import starling.filters.GlowFilter;
    import starling.textures.Texture;

	import tl.core.GPUResProvider;
	import tl.core.common.HProgressBar;
	import tl.core.common.HSprite;
	import tl.core.common.StarlingTextField;
    import tl.utils.HCss;
	/**全屏显示加载界面*/
    public class LoadingUI extends HSprite
	{
		public var ui_bg:Image = null;
		public var ui_progress_bar:HProgressBar
		public var ui_txt_bg:Image = null;
		public var ui_txt_name:StarlingTextField;
		public var imageUpArr:Array = [];
		public var imageDownArr:Array = [];
        public var adviceTxt:StarlingTextField;

		public function LoadingUI()
		{
			init();
		}

		private function init():void
		{
			if(this.isInit) return;
			this.isInit = true;
			var texture:Texture = GPUResProvider.getInstance().getMyTexture("loadingBg" , "Loading_Type1_BG");
			ui_bg = new Image(texture);
			this.addChild(ui_bg);

			var up:Texture = GPUResProvider.getInstance().getMyTexture("loadingBg" , "loading_progress$bar");
			var down:Texture = GPUResProvider.getInstance().getMyTexture("loadingBg" , "loading_progress");
			var bg:Texture = GPUResProvider.getInstance().getMyTexture("loadingBg" , "loading_progress_bg");
			ui_progress_bar = new HProgressBar();
			ui_progress_bar.init(up, down);
			ui_progress_bar.backgroudTexture = bg;
			this.addChild(ui_progress_bar);

			up = GPUResProvider.getInstance().getMyTexture("loadingBg" , "Loading_Map_TitleBG");
			ui_txt_bg = new Image(up);
			this.addChild(ui_txt_bg);
			ui_txt_name = new StarlingTextField();
			ui_txt_name.touchable = false;
			ui_txt_name.size = 26;
			ui_txt_name.algin = "center";
			ui_txt_name.width = up.width;
			ui_txt_name.height = 32;
			ui_txt_name.textColor = 0xF2D89A;
            ui_txt_name.label = '#F2D89A26地图大事发生的';
            ui_txt_name.filter = new GlowFilter(0xF2D89A, 1, 1, 0.6);
			//ui_txt_name.filter = new BlurFilter(0xBE0D00, 1, 4);
			this.addChild(ui_txt_name);


            adviceTxt = new StarlingTextField;
            this.addChild(adviceTxt)
            adviceTxt.width = 300;

		}

	}
}