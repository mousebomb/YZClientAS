package game.view.ui.uieditor {
	import morn.core.components.*;

	public class MainSkillPanel extends View {
		public var roleInfoBtn:UIButton = null;

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"props":{"height":"84","width":"912"},"child":[{"props":{"y":"0","skin":"source_interface_0.faceBack1","useTextureSkin":"true","x":"0"},"type":"Image"},{"props":{"y":"21","skin":"source_interface_0.mount","useTextureSkin":"true","x":"727"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.bag","useTextureSkin":"true","x":"138.3"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.bag","useTextureSkin":"true","x":"89.65"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.bag","useTextureSkin":"true","x":"187"},"type":"Button"},{"props":{"var":"roleInfoBtn","skin":"source_interface_0.bag","y":"21","useTextureSkin":"true","x":"41"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.mount","useTextureSkin":"true","x":"821"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.mount","useTextureSkin":"true","x":"774"},"type":"Button"},{"props":{"y":"21","skin":"source_interface_0.mount","useTextureSkin":"true","x":"680"},"type":"Button"},{"props":{"y":"6","autoPlay":"true","useTextureSkin":"true","width":"57","totalFrame":"10","skin":"source_interface_0.movclip/hongxue","height":"65","x":"233"},"type":"TextureClip"},{"props":{"y":"0","autoPlay":"true","useTextureSkin":"true","totalFrame":"10","skin":"source_interface_0.movclip/hongxueb","x":"234"},"type":"TextureClip"},{"props":{"y":"6","autoPlay":"true","useTextureSkin":"true","totalFrame":"10","skin":"source_interface_0.movclip/huangxue","x":"625"},"type":"TextureClip"},{"props":{"y":"0","autoPlay":"true","useTextureSkin":"true","totalFrame":"10","skin":"source_interface_0.movclip/huangxueb","x":"624"},"type":"TextureClip"},{"props":{"y":"13","skin":"source_interface_0.itemBack3","useTextureSkin":"true","x":"351"},"type":"Image"},{"props":{"y":"13","skin":"source_interface_0.itemBack3","useTextureSkin":"true","x":"405.65"},"type":"Image"},{"props":{"y":"13","skin":"source_interface_0.itemBack3","useTextureSkin":"true","x":"460.3"},"type":"Image"},{"props":{"y":"13","skin":"source_interface_0.itemBack3","useTextureSkin":"true","x":"515"},"type":"Image"}],"type":"View"};
		public function MainSkillPanel(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}