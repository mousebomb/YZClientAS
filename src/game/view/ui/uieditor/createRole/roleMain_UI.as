package game.view.ui.uieditor.createRole {
	import morn.core.components.*;
	import game.view.ui.uieditor.createRole.role_UI;
	import game.view.ui.uieditor.role_UI;

	public class roleMain_UI extends View {

        public static const dependsRes:Array = [];
		public static const dependsClass:Array = [game.view.ui.uieditor.role_UI];
		protected static var uiView:Object = {"props":{"height":"545","width":"960"},"child":[{"props":{"x":"343","runtime":"game.view.ui.uieditor.createRole.role_UI","y":"0","height":"545","width":"274"},"type":"role_UI"}],"type":"View"};
		public function roleMain_UI(){}
		override protected function createChildren():void {
			viewClassMap["game.view.ui.uieditor.createRole.role_UI"] = role_UI;

			super.createChildren();
			createView(uiView);
		}
	}
}