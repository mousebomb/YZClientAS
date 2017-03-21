/**
 * Created by Caius on 2017/3/7.
 */
package game.frameworks.roleInfo.mediator
{
    import game.frameworks.roleInfo.RoleInfoConst;
    import game.view.ui.uieditor.RoleInfoPanel_UI;

    import org.robotlegs.mvcs.Mediator;

    public class RoleInfoPanelMediator extends Mediator
    {
        [Inject]
        public var ui:RoleInfoPanel_UI;

        public function RoleInfoPanelMediator()
        {
        }

        override public function onRegister():void
        {
            ui.dragArea = "60,0,385,50";

            ui.equipHead.setType(RoleInfoConst.EQUIPHEAD);
            ui.equipChest.setType(RoleInfoConst.EQUIPCHEST);
            ui.equipLeg.setType(RoleInfoConst.EQUIPLEG);
            ui.equipHand.setType(RoleInfoConst.EQUIPHAND);
            ui.equipFoot.setType(RoleInfoConst.EQUIPFOOT);
            ui.equipWeapon.setType(RoleInfoConst.EQUIPWEAPON);
            ui.equipNeck.setType(RoleInfoConst.EQUIPNECK);
            ui.equipWrist.setType(RoleInfoConst.EQUIPWRIST);
            ui.equipFinger.setType(RoleInfoConst.EQUIPFINGER);
            ui.equipTotem.setType(RoleInfoConst.EQUIPTOTEM);
            ui.equipAmulet.setType(RoleInfoConst.EQUIPAMULET);
            ui.equipMedal.setType(RoleInfoConst.EQUIPMEDAL);
        }
    }
}
