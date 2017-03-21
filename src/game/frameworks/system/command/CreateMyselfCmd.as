/**
 * Created by gaord on 2017/3/7.
 */
package game.frameworks.system.command
{
	import game.frameworks.system.model.MyselfModel;
	import game.frameworks.system.view.Myself;

	import org.robotlegs.mvcs.Command;

	import starling.events.Event;

	public class CreateMyselfCmd extends Command
	{
		public function CreateMyselfCmd()
		{
			super();
		}

		[Inject]
		public var myselfModel:MyselfModel;
		[Inject]
		public var myself:Myself;

		[Inject]
		public var event:Event;

		// 首次才会触发
		override public function execute():void
		{
			// 首次 绑定mediator  之后由mediator自行监听
				mediatorMap.createMediator(myself);

		}
	}
}
