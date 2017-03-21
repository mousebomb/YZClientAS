package game.view.ui.uieditor {
	import morn.core.components.*;

	public class HeadUI extends View {

        public static const dependsRes:Array = ["source_interface_0"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"child":[{"props":{"y":"0","skin":"source_interface_0.avatar/target","useTextureSkin":"true","x":"-1"},"type":"Image"},{"props":{"x":"80","skin":"source_interface_0.avatar/blood_progress","width":"132","y":"31","height":"10","useTextureSkin":"true","name":"head_progress"},"type":"ProgressBar"},{"props":{"y":"46","text":"最长名字八个字吧","name":"head_txt_name","color":"13421772","size":"14","x":"79"},"type":"Label"},{"props":{"y":"48","skin":"source_interface_0.avatar/recharge_bg","useTextureSkin":"true","x":"204"},"type":"Image"},{"props":{"name":"head_img","skin":"source_interface_0.avatarImage/role1","y":"7","useTextureSkin":"true","x":"12"},"type":"Image"},{"props":{"y":"6","skin":"source_interface_0.avatar/label_powerTitle","useTextureSkin":"true","x":"76"},"type":"Image"},{"props":{"color":"16764006","x":"56","y":"72","text":"元宝：2525          礼券：1252        金币：5555万","name":"head_txt_money"},"type":"Label"},{"props":{"y":"8","text":"1251251251","name":"head_txt_power","color":"16764057","size":"14","x":"144"},"type":"Label"}],"props":{"height":"90","width":"300"},"type":"View"};
		public function HeadUI(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}