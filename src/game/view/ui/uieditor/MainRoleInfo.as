package game.view.ui.uieditor {
	import morn.core.components.*;

	public class MainRoleInfo extends View {
		public var txt_name:Label = null;

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"props":{"height":"90","width":"300"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_interface_0.avatar/target","x":"0"},"type":"Image"},{"props":{"x":"80","y":"31","skin":"source_interface_0.avatar/blood_progress","width":"132","height":"10","useTextureSkin":"true","name":"head_progress"},"type":"ProgressBar"},{"props":{"name":"head_txt_name","y":"46","text":"最长名字八个字吧","var":"txt_name","color":"13421772","size":"14","x":"79"},"type":"Label"},{"props":{"useTextureSkin":"true","y":"48","skin":"source_interface_0.avatar/recharge_bg","x":"204"},"type":"Image"},{"props":{"name":"head_img","useTextureSkin":"true","y":"7","skin":"source_interface_0.avatarImage/role1","x":"12"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"6","skin":"source_interface_0.avatar/label_powerTitle","x":"76"},"type":"Image"},{"props":{"color":"16764006","x":"56","y":"72","text":"元宝：2525          礼券：1252        金币：5555万","name":"head_txt_money"},"type":"Label"},{"props":{"y":"8","text":"1251251251","name":"head_txt_power","color":"16764057","size":"14","x":"144"},"type":"Label"}],"type":"View"};
		public function MainRoleInfo(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}