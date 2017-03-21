/**
 * Created by gaord on 2017/3/15.
 */
package tl.core.role
{
    /**
     * 移动方式
     *  如果是击退的话，就方向反着
     * */
    public class CreatureMoveUpdateFunType
    {
        /** 普通移动 (默认)  */
        public static const NORMAL_MOVE:uint = 0;

        /** 带残影冲锋  */
        public static const Chong_Feng:uint = 1;
        /** 带技能动作的跳跃 */
        public static const JUMP_SKILL:uint = 2;
        /** 地图跳跃点，服务器发起的无条件跳跃 */
        public static const JUMP_INMAP:uint = 3;
        /** 瞬移 */
        public static const BLINK:uint = 4;
    }
}
