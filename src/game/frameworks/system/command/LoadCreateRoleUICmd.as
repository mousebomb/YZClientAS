/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.command
{
    import game.frameworks.system.model.vo.StepType;
    import game.frameworks.system.service.LoginTaskService;
    import game.frameworks.system.service.StatsService;
    import game.view.ui.uieditor.CreateRole_UI;

    import org.robotlegs.mvcs.Command;

    import tl.core.GPUResProvider;

    public class LoadCreateRoleUICmd extends Command
    {
        public function LoadCreateRoleUICmd()
        {
            super();
        }

        [Inject]
        public var stats:StatsService;

        [Inject]
        public var gpuRes:GPUResProvider;
        [Inject]
        public var loginTaskService:LoginTaskService;

        override public function execute():void
        {
            // start ui load
            stats.scendStepToScever(StepType.step_12);
            // 加载创建角色需要的
            gpuRes.preloadUIDependencies(CreateRole_UI, onFinish);
        }

        private function onFinish():void
        {
            stats.scendStepToScever(StepType.step_13);
            //创建角色资源完成 告知服务器
            loginTaskService.onCreateRoleResLoaded();
        }
    }
}
