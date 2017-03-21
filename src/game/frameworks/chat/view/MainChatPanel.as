package game.frameworks.chat.view {
    import flash.geom.Rectangle;

    import game.frameworks.NotifyConst;

    import game.frameworks.uicontainer.NotifyUIConst;

    import morn.core.components.*;

    import starling.display.Image;

    import starling.textures.Texture;

    import tl.core.GPUResProvider;
    import tl.core.common.HSimpleButton;

    import tl.core.common.HSprite;
    import tl.core.common.SFScrollContainer;

    public class MainChatPanel extends View {
		public var btn_world:UIButton = null;
		public var btn_all:UIButton = null;
		public var btn_system:UIButton = null;
		public var btn_server:UIButton = null;
		public var btn_current:UIButton = null;
		public var btn_camp:UIButton = null;
		public var btn_label:UIButton = null;
		public var btn_enter:UIButton = null;
		public var btn_hide:UIButton = null;
		public var btn_face:UIButton = null;
		public var btn_gm:UIButton = null;
		public var btn_packet:UIButton = null;
		public var text_input:TextInput = null;
		public var btn_show:UIButton = null;
		public var chatSpr:HSprite;
		public var scrollTarget:HSprite;
		public var sfScrollC:SFScrollContainer;

		public var btn_drag:HSimpleButton;
        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"props":{"useTextureSkin":"true","var":"btn_world","y":"0","skin":"source_interface_0.chat/world","x":"119.3"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_all","y":"0","skin":"source_interface_0.chat/all","x":"22"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_system","y":"0","skin":"source_interface_0.chat/chat_btn2","x":"265.3"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_server","y":"0","skin":"source_interface_0.chat/chat_btn1","x":"168"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_current","y":"0","skin":"source_interface_0.chat/army","x":"70.65"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_camp","y":"0","skin":"source_interface_0.chat/chat_btn3","x":"216.65"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_label","y":"28","skin":"source_interface_0.chat/change","x":"0"},"type":"Button"},{"props":{"useTextureSkin":"true","y":"28.5","skin":"source_interface_0.chat/chatInterBack","x":"70"},"type":"Image"},{"props":{"useTextureSkin":"true","var":"btn_enter","y":"30","skin":"source_interface_0.chat/confirm","x":"292"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_hide","y":"0","skin":"source_interface_0.chat/chat_btn4","x":"0"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_face","y":"30","skin":"source_interface_0.chat/face","x":"317"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_gm","y":"0","skin":"source_interface_0.chat/GM","x":"314"},"type":"Button"},{"props":{"useTextureSkin":"true","var":"btn_packet","y":"32","skin":"source_interface_0.chat/red","x":"342"},"type":"Button"},{"props":{"y":"29","text":"输入内容","width":"220","color":"16777215","var":"text_input","size":"12","x":"72"},"type":"TextInput"},{"props":{"useTextureSkin":"true","var":"btn_show","y":"0","skin":"source_interface_0.chat/chat_btn5","x":"363"},"type":"Button"}],"props":{"height":"54","width":"360"},"type":"View"};
		public function MainChatPanel(){}
		override protected function createChildren():void
		{
            chatSpr = new HSprite();
            this.addChild(chatSpr);
            chatSpr.y = - 200;
            var texture:Texture = GPUResProvider.getInstance().getMyTexture(NotifyUIConst.UI_MAIN_SOURCE,"chat/chatBack");
            chatSpr.myDrawByTexture(texture);
            chatSpr.myScale9Grid = new Rectangle(8,8,16,16);
            chatSpr.myImageHeight = 200;
            chatSpr.myImageWidth = 360;


            scrollTarget = new HSprite();
            sfScrollC = new SFScrollContainer()
            sfScrollC.scrollType = 0;
            sfScrollC.textureType = 1;
            sfScrollC.isShowMin = true;
            this.addChild(sfScrollC);
            sfScrollC.y = chatSpr.y;
            sfScrollC.isLeft = true;
            //sfScrollC.ScrollVisible = false
            sfScrollC.init(360,100);

            btn_drag = new HSimpleButton();
            btn_drag.setAssetsSkin(NotifyUIConst.UI_MAIN_SOURCE, 'chat/enlarge');
            btn_drag.init();
            this.addChild(btn_drag);
            btn_drag.x = chatSpr.myWidth - btn_drag.myWidth - 2;
            btn_drag.y = chatSpr.y;
			super.createChildren();
			createView(uiView);
		}
	}
}