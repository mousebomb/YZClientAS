/**
 * Created by gaord on 2017/3/18.
 */
package game.frameworks.system.view
{
    import away3d.containers.ObjectContainer3D;
    import away3d.controllers.HoverController;
    import away3d.controllers.LookAtController;
    import away3d.entities.Entity;

    /** 游戏主镜头控制器 */
    public class GameCamController extends HoverController
    {
        public function GameCamController(targetObject:Entity = null, lookAtObject:ObjectContainer3D = null, panAngle:Number = 0, tiltAngle:Number = 90, distance:Number = 1000, minTiltAngle:Number = -90, maxTiltAngle:Number = 90, minPanAngle:Number = NaN, maxPanAngle:Number = NaN, steps:uint = 8, yFactor:Number = 2, wrapPanAngle:Boolean = false)
        {
            super(targetObject, lookAtObject, panAngle, tiltAngle, distance, minTiltAngle, maxTiltAngle, minPanAngle, maxPanAngle, steps, yFactor, wrapPanAngle);
        }

        /** 主角身上抬高镜头y */
        public var offsetY:Number  = 0.0 ;


        override public function update(interpolate:Boolean = true):void
        {
            super.update(interpolate);
            _targetObject.y+= offsetY;
        }
    }
}
