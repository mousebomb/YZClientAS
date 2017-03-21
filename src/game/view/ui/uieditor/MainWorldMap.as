package game.view.ui.uieditor {
	import morn.core.components.*;

	public class MainWorldMap extends View {

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"type":"Image","props":{"y":"0","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_titleImage","useTextureSkin":"true","x":"0"}},{"type":"Button","props":{"y":"1","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_worldBtn","useTextureSkin":"true","x":"170"}},{"type":"Button","props":{"y":"32","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_mail","useTextureSkin":"true","x":"185"}},{"type":"Button","props":{"y":"54","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_role_hide","useTextureSkin":"true","x":"185"}},{"type":"Button","props":{"y":"74","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_sound_close","useTextureSkin":"true","x":"185"}},{"type":"Image","props":{"y":"140","skin":"source_interface_0.mainFace_radarMap/culture_bar_bg","useTextureSkin":"true","x":"4"}},{"type":"Button","props":{"y":"1","skin":"source_interface_0.mainFace_radarMap/mainFace_radarMap_system","useTextureSkin":"true","x":"2"}}],"type":"View","props":{"height":"160","width":"206"}};
		public function MainWorldMap(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}