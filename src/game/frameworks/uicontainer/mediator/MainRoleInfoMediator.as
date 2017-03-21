/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.uicontainer.mediator
{
    import game.frameworks.NotifyConst;
    import game.frameworks.system.model.vo.MyselfVO;
    import game.view.ui.uieditor.MainRoleInfo;

	import org.robotlegs.mvcs.Mediator;

    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    import tool.StageFrame;

	/**主界面角色头像信息*/
	public class MainRoleInfoMediator extends Mediator
	{
		[Inject]
		public var ui: MainRoleInfo;
		[Inject]
		public var mySelfVo: MyselfVO;
        [Inject]
        public var gpu: GPUResProvider;
		public function MainRoleInfoMediator()
		{
			super();
		}
		override public function onRegister():void
		{
            addContextListener(NotifyConst.SC_CREATE_PLAYER, onCreatePlayer);
            addContextListener(NotifyConst.SC_UPDATE_MYSELF, onUpdatePlayer);
		}

		private function onCreatePlayer(event:*):void
		{
            ui.txt_name.text = mySelfVo.Player_Name;

			var str:String = 'source_interface_0.'

            switch( mySelfVo.Creature_Race ){
                case 0:
                case 1://兽人
	                str += 'avatarImage/role' + 4;
                    break;
                case 2://巫妖
	                str += 'avatarImage/role' + 1;
                    break;
                case 3://精灵
	                str += 'avatarImage/role' + 2;
                    break;
                case 4://人族
	                str += 'avatarImage/role' + 3;
                    break;
            }
//			ui.img_head.skin = str;
		}
		private function onUpdatePlayer(event:*):void
		{

		}

	}
}
