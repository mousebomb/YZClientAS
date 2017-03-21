/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.command
{
    import game.frameworks.NotifyConst;
    import game.frameworks.system.model.vo.StepType;
    import game.frameworks.system.service.GameMapService;
    import game.frameworks.system.service.StatsService;
    import game.frameworks.uicontainer.view.UIBaseLayer;
    import game.frameworks.uicontainer.view.UIPanelLayer;

    import org.robotlegs.mvcs.Command;

    /** 初始化各层级 进入游戏 */
    public class EnterGameCmd extends Command
    {
        public function EnterGameCmd()
        {
            super();
        }

        [Inject]
        public var stats:StatsService;
        [Inject]
        public var gameMapService:GameMapService;
        override public function execute():void
        {
            stats.scendStepToScever(StepType.step_17);
            // 初始化UI基础层级
            // 基础层
            contextView.addChild(new UIBaseLayer());
            //  窗口面板层
            contextView.addChild(new UIPanelLayer());
            //TODO 浮动tip层(crossover)


            //
            gameMapService.init();

            // 关闭加载画面
            dispatchWith(NotifyConst.CLOSE_LOADING_UI);
        }
    }
}
