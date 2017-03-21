/**
 * Created by Administrator on 2017/3/9.
 */
package game.frameworks.chat.command
{
    import game.frameworks.chat.view.FaceIcons;
    import game.frameworks.uicontainer.NotifyUIConst;

    import org.robotlegs.mvcs.Command;

    import tl.core.GPUResProvider;
    /**动画表情*/
    public class FaceIconsCmd extends Command
    {
        [Inject]
        public static var view: FaceIcons;
        public function FaceIconsCmd()
        {
            super();
        }
        override public function execute():void
        {
            GPUResProvider.getInstance().preloadUITextureAtlas([NotifyUIConst.UI_FACE_SOURCE], onLoad);
        }

        private function onLoad():void
        {
            if(!view)
            {
                view = new FaceIcons();
            }

            if(view.parent)
            {
                view.hideFace();
                view.parent.removeChild(view)
            }	else {
                view.showFace();
                contextView.addChild(view);
            }
        }
    }
}
