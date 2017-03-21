package game.view.ui.uieditor {
	import morn.core.components.*;

	public class role_UI extends View {

        public static const dependsRes:Array = ["source_toolBar_17_1", "source_toolBar_17_2"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"props":{"height":"545","width":"274"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_toolBar_17_1.role_bg","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"65","skin":"source_toolBar_17_1.role_2","x":"20"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"133","skin":"source_toolBar_17_2.text_1","x":"22"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"463","skin":"source_toolBar_17_2.role_1_up","x":"55"},"type":"Image"}],"type":"View"};
		public function role_UI(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}