/**
 * Created by gaord on 2017/3/2.
 */
package game.frameworks.system.service
{
    import com.demonsters.debugger.MonsterDebugger;

    import flash.utils.ByteArray;

    import game.frameworks.NotifyConst;
    import game.frameworks.system.model.LoginTaskModel;

    import org.robotlegs.mvcs.Actor;

    import tl.Net.MsgKey;
    import tl.Net.Socket.Connect;
    import tl.core.bombloader.JYLoader;
    import tl.utils.Tool;

    import tool.StageFrame;

    /** 登陆阶段任务服务 */
	public class LoginTaskService extends Actor
	{

		[Inject]
		public var model:LoginTaskModel;
		[Inject]
		public var connect:Connect;

		public function LoginTaskService()
		{
			super();
		}

		public function loadSettingsXML():void
		{
			model.parameters     = {};
			var resArgs:Array   = ["0", "v=0"];
			var tmpConfig:XML;
			var _LoaderUrl:Array = StageFrame.stage.loaderInfo.loaderURL.split("?");
			if (_LoaderUrl.length > 1)
			{
				var _LoaderUrlArgs:Array = _LoaderUrl[1].split("&");
				for (var i:int = 0; i < _LoaderUrlArgs.length; i++)
				{
					var _Args:Array = _LoaderUrlArgs[i].split("=");
					if (_Args[0] == 'chargeurl' || _Args[0] == 'addictedurl' || _Args[0] == 'microdownurl')
					{//充值、认证、下载、网址转换
						var decode:String          = decodeURIComponent(_Args[1]);
						model.parameters[_Args[0]] = decode;
					} else
					{
						model.parameters[_Args[0]] = _Args[1];
					}

				}
				for (var ss:String in model.parameters)
				{
					trace(StageFrame.renderIdx, "[LoginTaskService]/loadSettingsXML " + ss + ":" + model.parameters[ss]);
				}
				if (model.parameters.ip != null)
				{
					if (model.parameters.resurl)
					{
						resArgs[1] = "v=" + model.parameters.xmlver.toString();
						tmpConfig     = XML("<?xml version=" + String(1.0) + "?><setting><LogicServer>" + model.parameters.ip + "</LogicServer><LogicPort>" + model.parameters.port +
								"</LogicPort><ResourceUrl>" + model.parameters.resurl.toString() + "</ResourceUrl></setting>");
					}
					else
					{
						tmpConfig = XML("<?xml version=" + String(1.0) + "?><setting><LogicServer>" + model.parameters.ip + "</LogicServer><LogicPort>" + model.parameters.port +
								"</LogicPort><ResourceUrl></ResourceUrl></setting>");
					}
					model.localVer     = model.parameters.xmlver.toString();
					model.settingsConf = tmpConfig;
					trace(StageFrame.renderIdx, "[LoginTaskService]/loadSettingsXML " + tmpConfig.toString());
					trace(StageFrame.renderIdx, "[LoginTaskService]/loadSettingsXML Parameters get config complete");
				}
			} else
				trace(StageFrame.renderIdx, "[LoginTaskService]/loadSettingsXML no Config");
			var _SettingUrl:String;
			if (tmpConfig)
			{
				trace(StageFrame.renderIdx, "[LoginTaskService]/loadSettingsXML Load setting 1");
				_SettingUrl = tmpConfig.ResourceUrl + "assets/setting.xml?" + resArgs[1];
			}
			else
			{
				trace(StageFrame.renderIdx,"[LoginTaskService]/loadSettingsXML Load setting 2");
				_SettingUrl = "assets/setting.xml";
			}
			trace(StageFrame.renderIdx,"[LoginTaskService]/loadSettingsXML Load setting3 " + _SettingUrl);
			/*var loader:DataLoad = new DataLoad(_SettingUrl);
			 loader.addEventListener ( Event.COMPLETE, onConfigComplete );
			 loader.addEventListener ( IOErrorEvent.IO_ERROR, onConfigIOError );
			 loader.start();*/

			//加载settings
			JYLoader.getInstance().reqResource(_SettingUrl,JYLoader.RES_BYTEARRAY,0,JYLoader.GROUP_LOGIN, onConfigComplete);

            MonsterDebugger.trace("[LoginTaskService]/loadSettingsXML()" , "load setting.xml","bomb","",0x990000);
            MonsterDebugger.trace("[LoginTaskService]/loadSettingsXML()" , _SettingUrl,"bomb","",0x990000);
		}

		private function onConfigComplete(url:String, ba:ByteArray, mark:*):void
		{
			var xml :XML = XML(ba.readUTFBytes( ba.bytesAvailable ));
			model.settingsConf = xml;
			trace(StageFrame.renderIdx,"[LoginTaskService]/onConfigComplete setting.xml load complete");
			dispatchWith(NotifyConst.SETTINGS_LOADED,false);
		}


		public function loadVersion():void
		{
			var url:String = model.settingsConf.ResourceUrl+"assets/Bitmap/version.atf?ver=" + +Tool.getRandomColor();
			JYLoader.getInstance().reqResource(url,JYLoader.RES_BYTEARRAY,0,JYLoader.GROUP_LOGIN, onVersionComplete);
		}

		private function onVersionComplete(url:String, ba:ByteArray, mark:*):void
		{
//
			dispatchWith(NotifyConst.VERSION_LOADED,false);
		}

		public function login():void
		{
			var _Date:Date = new Date();
			connect.sendServer(MsgKey.MsgType_Login, MsgKey.MsgId_Login_Timestamp, [int(_Date.time / 1000)]);
			if (model.parameters.user)
			{
				trace(StageFrame.renderIdx,"[LoginTaskService]/login login server user=" + model.parameters.user);
				Connect.getInstance().sendServer(MsgKey.MsgType_Login, MsgKey.MsgId_Login_Login, [1,
					model.parameters.hasOwnProperty("user") ? model.parameters.user : "0",//user － 玩家的唯一标识，字符串类型，只要可以唯一标识一个玩家即可，可以是平台的用户ID、用户名、Email等(长度<=20)。
					model.parameters.hasOwnProperty("time") ? int(model.parameters.time) : 0,//time － 登录时间，时间戳类型，一个正整数，对应php中的time()函数的返回值，北京时间，如果登录服务器时间不是北京时间，请算好时差，登录时间用于登录票据的过期验证，目前票据过期时间为前后10分钟。
					model.parameters.hasOwnProperty("hash") ? model.parameters.hash : "0",//hash － 登录票据，字符串类型，按 md5(user_time_平台密钥) 算法生成的哈希值(小写)。
					model.parameters.hasOwnProperty("pid") ? int(model.parameters.pid) : 0,//合作商ＩＤ
					//可选参数(详细请查看[广告渠道来源规则])：
					model.parameters.hasOwnProperty("source") ? model.parameters.source : "0",//_Params.source,//source － 玩家的来源，字符串类型，用于后台统计不同广告来源的玩家流失率等情况，有助于分享广告质量。
					model.parameters.hasOwnProperty("sid") ? model.parameters.sid : "0",//广告的二级来源
					model.parameters.hasOwnProperty("regdate") ? int(model.parameters.regdate) : 0,//int(_Params.regdate),//regdate － 玩家在平台上的注册时间，时间戳类型，一个正整数，用于后台分析滚服玩家。
					model.parameters.hasOwnProperty("non_kid") ? int(model.parameters.non_kid) : 0,//int(regdate)//non_kid － 传0表示玩家需要被防沉迷，不传或传1表示不需要
					model.parameters.hasOwnProperty("worldid") ? int(model.parameters.worldid) : 0,			//服务器的世界ID
					model.parameters.hasOwnProperty("isfrommicro") ? int(model.parameters.isfrommicro) : 0,	//微端登陆标志ID
					model.parameters.hasOwnProperty("openkey") ? String(model.parameters.openkey) : '',	//用户的Session Key
					model.parameters.hasOwnProperty("pf") ? String(model.parameters.pf) : '',		//用户的登录平台
					model.parameters.hasOwnProperty("pfkey") ? String(model.parameters.pfkey) : '',		//用户登录平台的key
					model.parameters.hasOwnProperty("appid") ? String(model.parameters.appid) : '',		//用户登录平台的key
				]);
                MonsterDebugger.trace("[LoginTaskService]/login()" , "sendServer login 1 end","bomb","",0x990000);
			}
			else
			{
				var userName:String = model.settingsConf.elements("UserName");
				var password:String = model.settingsConf.elements("PassWord");
				connect.sendServer(MsgKey.MsgType_Login, MsgKey.MsgId_Login_Login, [
					2,
					userName,
					password,
					0//微端登陆标志
				]);
				model.parameters.server = "s1";
				model.parameters.user   = "100000";
                MonsterDebugger.trace("[LoginTaskService]/login()" , "sendServer login 2 end","bomb","",0x990000);
			}

		}

        // #pragma mark --   进游戏   ------------------------------------------------------------
		/**构建角色态，用于从数据库读取所有必须的角色数据*/
		public function build():void
		{
            model._IsStateBuild = true;
            model.isCreateRole = false;
            checkLoadingCompleteAndBuild();
		}

		/** 最初满足初始的资源都加载完毕了 */
		public function onInitResLoaded():void
		{
			// 标记初始资源完成 告知服务器
			model.isInitResLoaded = true;
            checkLoadingCompleteAndBuild();
		}

        public function onCsvLoaded():void
        {
            model.isCsvLoaded = true;
            checkLoadingCompleteAndBuild();
        }

        private function checkLoadingCompleteAndBuild():void
		{
            if (model._IsStateBuild && model.isCsvLoaded && model.isInitResLoaded)
            {
                MonsterDebugger.trace("[LoginTaskService]/checkLoadingCompleteAndBuild()", "构建状态 且 资源已完毕", "bomb", "", 0x990000);
                connect.sendServer(MsgKey.MsgType_Login, MsgKey.MsgId_Login_ResLoadExt, [9]);
                connect.sendServer(MsgKey.MsgType_Login, MsgKey.MsgId_Login_ResLoaded, []);
                dispatchWith(NotifyConst.ENTER_GAME, false);
            }
		}

        // #pragma mark --  创建角色  ------------------------------------------------------------
        /** 创建角色 */
        public function createRole():void
        {
            model.isCreateRole = true;
            model._IsStateBuild = false;
        }

        public function onCreateRoleResLoaded():void
        {
            model.isCreateRoleResLoaded = true;
            if (model.isCreateRole)
            {
                onLoadingCompleteAndCreateRole();
            }
        }

        private function onLoadingCompleteAndCreateRole():void
        {

            dispatchWith(NotifyConst.CREATE_ROLE);
        }

        /** 提交创建的角色 */
        public function confirmCreateRole(name:String, wizardId:String = "10004"):void
        {
            connect.sendServer(MsgKey.MsgType_Cache, MsgKey.MsgId_Login_CreateActor, [int(wizardId), name]);

        }
    }
}
