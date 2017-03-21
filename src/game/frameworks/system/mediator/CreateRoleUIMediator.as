/**
 * Created by gaord on 2017/3/9.
 */
package game.frameworks.system.mediator
{
    import com.demonsters.debugger.MonsterDebugger;

    import game.frameworks.NotifyConst;

    import game.frameworks.system.model.vo.StepType;
    import game.frameworks.system.service.LoginTaskService;
    import game.frameworks.system.service.StatsService;

    import game.view.ui.uieditor.CreateRole_UI;

    import morn.core.components.Box;

    import org.robotlegs.mvcs.Mediator;

    import starling.events.Event;
    import starling.events.Touch;
    import starling.events.TouchEvent;

    import tool.StageFrame;

    public class CreateRoleUIMediator extends Mediator
    {
        public function CreateRoleUIMediator()
        {
            super();
        }

        [Inject]
        public var ui:CreateRole_UI;
        [Inject]
        public var stats:StatsService;
        [Inject]
        public var loginTaskService:LoginTaskService;

        override public function onRegister():void
        {
            eventMap.mapListener(ui.nameTf , Event.CHANGE,onNameChanged); // < 目前这里组件有bug
            eventMap.mapListener(ui.createBtn , Event.SELECT,onSelect);
            eventMap.mapListener(ui.btn_random , Event.SELECT,onClickRandom);
            addContextListener(NotifyConst.CLOSE_CREATE_ROLE,onNextSteps);
            addContextListener(NotifyConst.SC_LOGIN_RESPONSE,onSC_LOGIN_RESPONSE);
            eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
            onResize();
        }

        private function onClickRandom(event:Event):void
        {


        }
        private function onNameChanged(e:*):void
        {
            ui.createBtn.disabled = false;

        }
        private function onSC_LOGIN_RESPONSE( n: * ):void
        {
            ui.createBtn.label = n.data;
            ui.createBtn.disabled=true;
        }
        private function onNextSteps( n: * ):void
        {
            ui.removeFromParent();
        }

        private function onSelect(e :*):void
        {
            MonsterDebugger.trace("[CreateRoleUIMediator]/onSelect()" , e.target.name,"bomb","",0x990000);
            /*if(!event)
             {
             if(_selectItem.playerID == '10001')
             {
             var id:int = Tool.randomNum(1, 4);
             id += 10000;
             _nameBar.selectWizardId = _selectItem.playerID = id.toString();
             }
             _nameBar.setName();
             }*/
            loginTaskService.confirmCreateRole(ui.nameTf.text ,"10004");
            stats.scendStepToScever(StepType.step_14);
        }

        private function onResize(event:Event=null):void
        {
            ui.width = StageFrame.stage.stageWidth
            ui.height = StageFrame.stage.stageHeight;
        }
    }
}
