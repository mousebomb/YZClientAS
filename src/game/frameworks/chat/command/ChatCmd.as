/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.chat.command
{
	import game.frameworks.chat.service.ChatService;

	import org.robotlegs.mvcs.Command;

	public class ChatCmd extends Command
	{
		[Inject]
		public var service: ChatService;
		public function ChatCmd()
		{
			super();
		}

		override public function execute():void
		{
			service.init();
		}
	}
}
