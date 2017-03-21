/**
 * Created by gaord on 2017/3/2.
 */
package game.frameworks.system.model
{
	import org.robotlegs.mvcs.Actor;

	public class LoginTaskModel extends Actor
	{
		public function LoginTaskModel()
		{
			super();
		}



		/** 基本设置  settings.xml的内容 和动态修改过后的
		 * 对应灵魂之殇的 IResourceManager.getInstance().Config */
		public var settingsConf:XML;

		/** 处理后的flashvars */
		public var parameters:Object;

		/**
		 *
		 * 对应老的： IResourcePool.getInstance()._Localver */
		public var localVer:String="";


        /** csv是否加载完毕 */
        public var isCsvLoaded:Boolean = false;
		/** 是否在构建态 (是的话则客户端资源加载完毕后要告知服务器） */
		public var _IsStateBuild:Boolean = false;
		/**是否 最初满足初始的资源都加载完毕了*/
		public var isInitResLoaded:Boolean = false;

		/** 是否要创建角色 */
		public var isCreateRole:Boolean = false;
		public var isCreateRoleResLoaded:Boolean = false;

		/**是否微端登陆判断 2、没有微端标志。1、微端登陆    0、网页登陆*/
		public function get frommicroType():int
		{
			if(!parameters.hasOwnProperty("isfrommicro"))
				return 2;
			else
				return int(parameters.isfrommicro);
		}
	}
}
