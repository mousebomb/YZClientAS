package game.view.ui.uieditor {
	import morn.core.components.*;

	public class MainActivityIconUI extends View {
		public var btn_show:UIButton = null;
		public var btn_hide:UIButton = null;

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"props":{"skin":"source_interface_0.activityIcon/icon_open","y":"0","var":"btn_show","label":"label","useTextureSkin":"true","x":"777"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/activeIcon_2","y":"0","label":"label","useTextureSkin":"true","x":"708"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/kfxb","y":"66","label":"label","useTextureSkin":"true","x":"708"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/activeIcon_4","y":"0","label":"label","useTextureSkin":"true","x":"634"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/dailyRecharge","y":"66","label":"label","useTextureSkin":"true","x":"634"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/xfth","y":"137","label":"label","useTextureSkin":"true","x":"708"},"type":"Button"},{"props":{"skin":"source_interface_0.activityIcon/icon_hide","y":"0","var":"btn_hide","label":"label","useTextureSkin":"true","x":"777"},"type":"Button"}],"props":{"height":"200","width":"800"},"type":"View"};
		public function MainActivityIconUI(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}