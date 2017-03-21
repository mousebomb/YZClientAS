/**
 * Created by gaord on 2017/3/14.
 */
package game.frameworks.system.command
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Shape;

    import game.frameworks.system.model.GameMapModel;

    import org.robotlegs.mvcs.Command;

    import starling.core.Starling;
    import starling.events.Event;

    import tl.core.mapnode.Node;

    import tl.core.mapnode.Node;

    public class DebugPathCmd extends Command
    {

        public static var debugMap:Shape;
        public static var debugMapBg:Bitmap;

        public function DebugPathCmd()
        {
            super();
        }

        [Inject]
        public var e:Event;

        [Inject]
        public var mapModel:GameMapModel;

        override public function execute():void
        {
            if (debugMap)
            {
            } else
            {
                debugMapBg = new Bitmap(new BitmapData( mapModel._GridCols,mapModel._GridRows,false,0xffffffff));
                 for (var i:int = 0; i < mapModel._GridCols; i++)
                 {
                      for (var j:int = 0; j < mapModel._GridRows; j++)
                      {
                          var node :Node = mapModel.getNode(j,i);
                          if(node.walkable==false)
                            debugMapBg.bitmapData.setPixel32(i,j,0xff000000);
                      }
                 }
                Starling.current.nativeOverlay.addChild(debugMapBg);
                debugMap = new Shape();
                Starling.current.nativeOverlay.addChild(debugMap);
            }
            var paths:Vector.<Node> = e.data as Vector.<Node>;
            if (paths)
            {
                debugMap.graphics.clear();
                for (var i:int = 0; i < paths.length; i++)
                {
                    var node:Node = paths[i];
                    debugMap.graphics.beginFill(0xff0000);
                    debugMap.graphics.drawCircle(node.x,node.y,2);
                    debugMap.graphics.endFill();
                }
                debugMap.graphics.lineStyle(1,0x00ff00);
                for (var i:int = 0; i < paths.length; i++)
                {
                    var node:Node = paths[i];
                    debugMap.graphics.lineTo(node.x,node.y);
                }
            }
        }
    }
}
