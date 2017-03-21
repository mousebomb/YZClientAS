/**
 * Created by gaord on 2017/3/14.
 */
package game.frameworks.system.helpers
{
    import flash.utils.Dictionary;

    /** 加载的优先级 */
    public class GameEntityPriority
    {
        public static var priorityByGroup:Dictionary;

        /** 主角优先级 */
        public static var myselfPriority:int = 99;

        public static function init():void
        {
            priorityByGroup = new Dictionary();
            priorityByGroup["植被"] = -1;
            priorityByGroup["建筑"] = 1;

        }

        init();
    }
}
