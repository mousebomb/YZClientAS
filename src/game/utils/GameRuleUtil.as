/**
 * Created by gaord on 2017/3/15.
 */
package game.utils
{
    import tl.core.terrain.TLMapVO;

    /**游戏规则配置*/
    public class GameRuleUtil
    {
        public function GameRuleUtil()
        {
        }

        // #pragma mark --  游戏规则配置  ------------------------------------------------------------
        /** 计算移动某个距离需要的时间
         * @param moveSpeed 每秒移动几格
         * @param distance 目标像素距离
         *  返回秒S  */
        [Inline]
        public static function moveDurationS(moveSpeed :uint , distance :Number ):Number
        {
            return   distance / (moveSpeed * TLMapVO.TERRAIN_SCALE)  ;
        }
        /** 计算移动某个距离需要的时间
         * @param moveSpeed 每秒移动几格
         * @param distance 目标像素距离
         *  返回毫秒 MS  */
        [Inline]
        public static function moveDurationMS(moveSpeed :uint , distance :Number ):Number
        {
            return   distance / (moveSpeed * TLMapVO.TERRAIN_SCALE) *1000  ;
        }
    }
}
