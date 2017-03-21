package game.view.ui.uieditor {
	import morn.core.components.*;

	public class CreateRole_UI extends View {
		public var bg:UIImage = null;
		public var top_1:UIImage = null;
		public var top_0:UIImage = null;
		public var top_4:UIImage = null;
		public var top_2:UIImage = null;
		public var top_5:UIImage = null;
		public var bottom_1:UIImage = null;
		public var bottom_3:UIImage = null;
		public var top_3:UIImage = null;
		public var bottom_4:UIImage = null;
		public var bottom_0:UIImage = null;
		public var bottom_2:UIImage = null;
		public var middle_left:UIImage = null;
		public var middle_right:UIImage = null;
		public var createBtn:UIButton = null;
		public var move_role:Box = null;
		public var role_1:Box = null;
		public var property_1:UIImage = null;
		public var role_0:Box = null;
		public var property_0:UIImage = null;
		public var role_2:Box = null;
		public var property_2:UIImage = null;
		public var role_3:Box = null;
		public var property_3:UIImage = null;
		public var nameTf_bg:UIImage = null;
		public var nameTf:TextInput = null;
		public var timeTf:Label = null;
		public var check_0:CheckBox = null;
		public var btn_random:UIButton = null;

        public static const dependsRes:Array = ["source_toolBar_17_2", "source_toolBar_17_1"];
		public static const dependsClass:Array = [];
		protected static var uiView:Object = {"props":{"height":"945","width":"1680"},"child":[{"props":{"y":"0","left":"0","skin":"source_toolBar_17_2.bg","width":"1680","top":"0","right":"0","bottom":"0","var":"bg","useTextureSkin":"true","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"0","centerX":"-700","top":"0","var":"top_1","skin":"source_toolBar_17_1.bg_top_left","x":"0"},"type":"Image"},{"props":{"y":"0","left":"0","skin":"source_toolBar_17_2.bg_right_1","top":"0","var":"top_0","useTextureSkin":"true","x":"94"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"0","centerX":"700","top":"0","var":"top_4","skin":"source_toolBar_17_1.bg_top_left","x":"1378"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"-1","centerX":"0","top":"0","var":"top_2","skin":"source_toolBar_17_1.bg_top","x":"263"},"type":"Image"},{"props":{"scaleX":"-1","y":"0","skin":"source_toolBar_17_2.bg_right_1","top":"0","right":"117","var":"top_5","useTextureSkin":"true","x":"1563"},"type":"Image"},{"props":{"y":"914","centerX":"-720","useTextureSkin":"true","bottom":"0","var":"bottom_1","skin":"source_toolBar_17_1.bg_dow_left","x":"0"},"type":"Image"},{"props":{"y":"914","centerX":"720","useTextureSkin":"true","bottom":"0","var":"bottom_3","skin":"source_toolBar_17_1.bg_dow_left","x":"1378"},"type":"Image"},{"props":{"y":"0","useTextureSkin":"true","skin":"source_toolBar_17_2.effect","var":"top_3","centerX":"0","x":"696"},"type":"Image"},{"props":{"scaleX":"-1","y":"901","skin":"source_toolBar_17_2.bg_right_2","right":"117","bottom":"0","var":"bottom_4","useTextureSkin":"true","x":"30"},"type":"Image"},{"props":{"y":"494","left":"0","skin":"source_toolBar_17_2.bg_right_2","bottom":"0","var":"bottom_0","useTextureSkin":"true","x":"325"},"type":"Image"},{"props":{"y":"831","centerX":"0","useTextureSkin":"true","bottom":"0","var":"bottom_2","skin":"source_toolBar_17_1.bg_down","x":"253"},"type":"Image"},{"props":{"centerY":"0","y":"271","centerX":"-580","useTextureSkin":"true","var":"middle_left","skin":"source_toolBar_17_1.bg_left","x":"189"},"type":"Image"},{"props":{"centerY":"0","y":"255","centerX":"580","useTextureSkin":"true","var":"middle_right","skin":"source_toolBar_17_1.bg_right","x":"1347"},"type":"Image"},{"props":{"centerY":"NaN","useTextureSkin":"true","y":"859","labelBold":"true","centerX":"0","labelColors":"0xfffffff,0xfffffff,0xfffffff,0xfffffff","bottom":"20","var":"createBtn","skin":"source_toolBar_17_2.btn","x":"732"},"type":"Button"},{"props":{"useTextureSkin":"true","y":"892","skin":"source_toolBar_17_2.btn_up","x":"818"},"type":"Button"},{"props":{"y":"933","x":"1428"},"type":"TextureClip"},{"props":{"centerY":"-30","y":"166","centerX":"0","width":"960","height":"550","var":"move_role","x":"367"},"child":[{"props":{"y":"95","scale":"0.75","var":"role_1","x":"0"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_toolBar_17_1.role_bg","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"66","skin":"source_toolBar_17_1.role_2","x":"22"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"130","skin":"source_toolBar_17_2.text_2","x":"35"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"464","var":"property_1","skin":"source_toolBar_17_2.role_1_up","x":"59"},"type":"Image"}],"type":"Box"},{"props":{"y":"0","var":"role_0","x":"337"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_toolBar_17_1.role_bg","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"66","skin":"source_toolBar_17_1.role_1","x":"22"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"130","skin":"source_toolBar_17_2.text_1","x":"35"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"462","var":"property_0","skin":"source_toolBar_17_2.role_1_up","x":"58"},"type":"Image"}],"type":"Box"},{"props":{"y":"108","scale":"0.65","var":"role_2","x":"512"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_toolBar_17_1.role_bg","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"66","skin":"source_toolBar_17_1.role_3","x":"22"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"130","skin":"source_toolBar_17_2.text_3","x":"35"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"462","var":"property_2","skin":"source_toolBar_17_2.role_3_up","x":"58"},"type":"Image"}],"type":"Box"},{"props":{"y":"95","scale":"0.75","var":"role_3","x":"752"},"child":[{"props":{"useTextureSkin":"true","y":"0","skin":"source_toolBar_17_1.role_bg","x":"0"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"66","skin":"source_toolBar_17_1.role_4","x":"22"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"130","skin":"source_toolBar_17_2.text_4","x":"35"},"type":"Image"},{"props":{"useTextureSkin":"true","y":"463","var":"property_3","skin":"source_toolBar_17_2.role_4_up","x":"59"},"type":"Image"}],"type":"Box"}],"type":"Box"},{"props":{"centerY":"NaN","y":"769","centerX":"0","useTextureSkin":"true","bottom":"120","var":"nameTf_bg","skin":"source_toolBar_17_2.input_bg","x":"709.5"},"type":"Image"},{"props":{"y":"784","text":"随机名字xxx","skin":"png.comp.textinput","useTextureSkin":"false","color":"16777215","bottom":"133","var":"nameTf","centerX":"50","x":"810"},"type":"TextInput"},{"props":{"centerY":"NaN","y":"734","text":"测试：点击头像选择立即进入","centerX":"0","color":"16777215","bottom":"170","var":"timeTf","useTextureSkin":"false","x":"761"},"type":"Label"},{"props":{"useTextureSkin":"true","y":"829","centerX":"-50","labelColors":"0xffcc99,0xffcc99,0xffcc99,0xffcc99","bottom":"96","label":"同意：","var":"check_0","skin":"source_toolBar_17_1.check","x":"766"},"type":"CheckBox"},{"props":{"centerY":"NaN","y":"782","centerX":"160","useTextureSkin":"true","bottom":"133","var":"btn_random","skin":"source_toolBar_17_2.random","x":"980"},"type":"Button"}],"type":"View"};
		public function CreateRole_UI(){}
		override protected function createChildren():void {

			super.createChildren();
			createView(uiView);
		}
	}
}