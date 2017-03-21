package game.view.ui.uieditor.roleInfo {
	import morn.core.components.*;

	public class EquipBox_UI extends View {
		public var bgClip:TextureClip = null;

        public static const dependsRes:Array = ["source_mainFace_2"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"props":{"skin":"source_mainFace_2.role/icon","totalFrame":"12","var":"bgClip","useTextureSkin":"true","y":"0","x":"0"},"type":"TextureClip"}],"props":{"width":"57","height":"57"},"type":"View"};
		public function EquipBox_UI(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}