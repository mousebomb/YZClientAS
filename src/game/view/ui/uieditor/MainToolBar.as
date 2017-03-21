package game.view.ui.uieditor {
	import morn.core.components.*;

	public class MainToolBar extends View {

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"props":{"y":"0","skin":"source_interface_0.mount","label":"label","useTextureSkin":"true","x":"117.3"},"type":"Button"},{"props":{"y":"51","skin":"source_interface_0.bag","label":"label","useTextureSkin":"true","x":"0"},"type":"Button"},{"props":{"y":"0","skin":"source_interface_0.bag","label":"label","useTextureSkin":"true","x":"58.65"},"type":"Button"},{"props":{"y":"50","skin":"source_interface_0.bag","label":"label","useTextureSkin":"true","x":"58.65"},"type":"Button"},{"props":{"y":"0","skin":"source_interface_0.bag","label":"label","useTextureSkin":"true","x":"0"},"type":"Button"},{"props":{"y":"0","skin":"source_interface_0.mount","label":"label","useTextureSkin":"true","x":"176"},"type":"Button"},{"props":{"y":"50","skin":"source_interface_0.mount","label":"label","useTextureSkin":"true","x":"176"},"type":"Button"},{"props":{"y":"51","skin":"source_interface_0.mount","label":"label","useTextureSkin":"true","x":"117.3"},"type":"Button"},{"props":{"y":"43","skin":"source_interface_0.activityIcon/icon_hide","label":"label","useTextureSkin":"true","x":"232"},"type":"Button"}],"props":{"height":"100","width":"254"},"type":"View"};
		public function MainToolBar(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}