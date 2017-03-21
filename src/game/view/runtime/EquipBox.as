/**
 * Created by Caius on 2017/3/10.
 */
package game.view.runtime
{
    import game.frameworks.roleInfo.RoleInfoConst;
    import game.view.ui.uieditor.roleInfo.EquipBox_UI;

    public class EquipBox extends EquipBox_UI
    {
        public function EquipBox()
        {
            super();
        }

        public function setType(type:String):void
        {
            switch (type)
            {
                case RoleInfoConst.EQUIPHEAD:
                    bgClip.frame   = 0;
                    bgClip.toolTip = "头盔";
                    break;
                case RoleInfoConst.EQUIPCHEST:
                    bgClip.frame = 1;
                    bgClip.toolTip = "胸甲";
                    break;
                case RoleInfoConst.EQUIPLEG:
                    bgClip.frame = 2;
                    bgClip.toolTip = "护腿";
                    break;
                case RoleInfoConst.EQUIPHAND:
                    bgClip.frame = 3;
                    bgClip.toolTip = "护手";
                    break;
                case RoleInfoConst.EQUIPFOOT:
                    bgClip.frame = 4;
                    bgClip.toolTip = "战靴";
                    break;
                case RoleInfoConst.EQUIPWEAPON:
                    bgClip.frame = 5;
                    bgClip.toolTip = "武器";
                    break;
                case RoleInfoConst.EQUIPNECK:
                    bgClip.frame = 6;
                    bgClip.toolTip = "项链";
                    break;
                case RoleInfoConst.EQUIPWRIST:
                    bgClip.frame = 7;
                    bgClip.toolTip = "手镯";
                    break;
                case RoleInfoConst.EQUIPFINGER:
                    bgClip.frame = 8;
                    bgClip.toolTip = "戒指";
                    break;
                case RoleInfoConst.EQUIPTOTEM:
                    bgClip.frame = 9;
                    bgClip.toolTip = "饰品";
                    break;
                case RoleInfoConst.EQUIPAMULET:
                    bgClip.frame = 10;
                    bgClip.toolTip = "护符";
                    break;
                case RoleInfoConst.EQUIPMEDAL:
                    bgClip.frame = 11;
                    bgClip.toolTip = "勋章";
                    break;
            }
        }
    }
}
