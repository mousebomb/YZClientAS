package tl.Net
{
	public class MsgKey
	{
		//----------------tokentype------------------------------------------------------------				
		public static const _unknown:String ="_unknown";
		public static const _byte:String ="_byte";//字节-- 1字节
		public static const _String:String ="_String";	//字符串	-- 4字节
		public static const _int:String ="_int";//带符号的32位整数-- 4字节
		public static const _float:String ="_float";//单精度32位浮点数-- 4字节
		public static const _boolean:String ="_boolean";//boolean型用0或1表示-- 1字节
		public static const _short:String ="_short";//短整理-- 2字节
		public static const _object:String ="_object";//AMF 序列化格式进行编码的对象。-- 自定义字节长度
		public static const _double:String ="_Number";//又精度浮点数-- 8字节
		public static const _binary:String ="_binary";//-- 自定义字节长度
		public static const _unit:String ="_uint";//不带符号的整数，也就是是正整数-- 4字节
		//---------------- 客户端状态常量--------------------------------------------------------------
		public static const State_LoadingConfig:int = 0;//读取配置文件状态
		public static const State_Login:int = 1;//登录状态
		public static const State_CreateRole:int = 2;//创建角色状态
		public static const State_ConnectStateType_Queue:int = 3;// 排队态
		public static const State_ConnectStateType_Wait:int = 4;// 等待态，等待前一相同角色下线
		public static const State_ConnectStateType_Build:int = 5;/// 构建角色态，用于从数据库读取所有必须的角色数据
		public static const State_GameInIt:int = 6;//游戏状态
		public static const State_ConnectStateType_Logout:int = 7;// 退出态
		public static const State_ResourceLoading:int = 8;//读取数据表状态
		public static const State_ConnectServer:int = 9;//连接服务器状态
		//----------------服务端主动断开类型常量--------------------------------------------------------------
		public static const CCR_Unknow:int = 0;				/// 未知原因
		public static const CCR_Hack:int = 1	;			/// 黑客行为，用了恶意程序
		public static const CCR_Accelerate:int = 2;			/// 加速行为
		public static const CCR_NoPing:int = 3;				/// 未响应服务器的Ping指令
		public static const CCR_StopService:int = 4;		/// 服务器停止服务
		public static const CCR_Logined:int = 5	;		/// 已经在其他地方登录
		//----------------实体类型---------------------------------------------------------------------
		public static const Type_Entity:int=0;					    /// 实体
		public static const Type_Item:int=1;							/// 物品
		public static const Type_Bag:int=2;							/// 包裹
		public static const Type_Leechdom:int=3;						/// 药品
		public static const Type_Equipment:int=4;						/// 装备
		public static const Type_WEntity:int=5;						/// 世界实体
		public static const Type_Creature:int=6;						/// 生物
		public static const Type_Player:int=7;						/// 玩家
		public static const Type_Monster:int=8;						/// 怪物
		public static const Type_Corpse:int=9;						/// 尸体
		public static const Type_GameObj:int=10;						/// 游戏对象，如陷阱，旗杆，标记，传送门等
		public static const Type_Portal:int=11;						/// 传送门
		public static const Type_Chest:int=12;					    /// 宝箱
		public static const Type_Buddy:int=13							/// 伙伴
		public static const Type_Npc:int=14;							/// NPC
		//----------------物品栏类型---------------------------------------------------------------------
		public static const SkepType_Bag:int=0;			/// 背包栏
		public static const SkepType_Equip:int=1;			/// 装备栏
		public static const SkepType_BuddyEquip1:int=2;  /// 伙伴1装备栏
		public static const SkepType_BuddyEquip2:int=3;
		public static const SkepType_BuddyEquip3:int=4;
		public static const SkepType_BuddyEquip4:int=5;
		public static const SkepType_BuddyEquip5:int=6;
		public static const SkepType_BuddyEquip6:int=7;
		public static const SkepType_BuddyEquip7:int=8;
		public static const SkepType_BuddyEquip8:int=9;
		public static const SkepType_BuddyEquip9:int=10;
		public static const SkepType_BuddyEquip10:int=11;
		public static const SkepType_Stall:int=12;			/// 摊位栏
		public static const SkepType_Skill:int=13;			/// 技能快捷栏
		public static const SkepType_Smelt:int=14;			/// 精炼等打造栏，临时，不需要存储
		public static const SkepType_Shop:int=30;
		public static const SkepType_Max:int=31;
		//----------------战斗行为码---------------------------------------------------------------------
		public static const BattleAction_Unknow:int=0;			    /// 未知行为码
		public static const BattleAction_Skill:int=1;				    /// 使用技能		(char src, char dst, int skillId)
		public static const BattleAction_Dodge:int=2;					/// 躲闪			(char who)
		public static const BattleAction_Damage:int=3;				/// 受到伤害		(char who, int hp, int flags)
		public static const BattleAction_Death:int=4;				    /// 死亡	        (char who)
		public static const BattleAction_Bout:int=5;				    /// 回合计数		(uchar cnt)
		public static const BattleAction_AddBuff:int=6;				/// 添加Buff		(char who, int buffId)
		public static const BattleAction_RemoveBuff:int=7;			/// 移除Buff		(char who, int buffId)
		public static const BattleAction_Unreal:int=8;				/// 幻化Buff		(char who, int buffId)
		public static const BattleAction_Blood:int=9;				/// 吸血Buff		(char who, int hp)
		public static const BattleAction_Lower:int=10;				/// 减伤Buff		(char who)
		public static const BattleAction_Instance:int=11;			/// 无敌防护Buff	(char who)
		public static const BattleAction_RewardEx:int=12;			/// 额外掉落		(int itemId, int itemNum)
		public static const BattleAction_Bloodsucker:int=13;			/// 中毒掉血		(int itemId, int itemNum)
		//----------------点击NPC时的行为码---------------------------------------------------------------------
		public static const Action_Unknow:int=0;							/// 未知行为
		public static const Action_Selected:int=1;						/// 选中对象
		public static const Action_ViewEquipment:int=2;					/// 查看装备
		public static const Action_AddFans:int=3;
		//----------------冷却队列类型码---------------------------------------------------------------------
		public static const QueueType_Transform:int=0;	/// 打造冷却队列
		public static const QueueType_Research:int=1;		/// 科研队列，如阵型，被动技能，天赋
		public static const QueueType_Arena:int=2;		/// 竞技场队列
		public static const QueueType_Channel:int=3;		/// 经脉队列
		public static const QueueType_Recruit:int=4;		/// 招募队列
		public static const QueueType_Hotspring:int=5;	/// 温泉队列
		public static const QueueType_Slave:int=6;		/// 奴隶队列
		public static const QueueType_Soul:int=7;			/// 元婴队列
		public static const QueueType_Farm1:int=8;		/// 农场队列1
		public static const QueueType_Farm2:int=9;		/// 农场队列2
		public static const QueueType_Farm3:int=10;		/// 农场队列3
		public static const QueueType_Farm4:int=11;		/// 农场队列4
		public static const QueueType_Farm5:int=12;		/// 农场队列5
		public static const QueueType_Farm6:int=13;		/// 农场队列6
		public static const QueueType_Farm7:int=14;		/// 农场队列7
		public static const QueueType_Farm8:int=15;		/// 农场队列8
		public static const QueueType_Farm9:int=16;		/// 农场队列9
		public static const QueueType_Max:int=50;
		//----------------战斗与场景枚举类型码-------------------------------------------------------------------
		public static const BattleResponse_OK:int=0;		/// 点了确定按钮
		public static const BattleResponse_Again:int=1;		/// 重新来过
		public static const BattleResponse_Back:int=2;		/// 回城
		public static const BattleResponse_Barrier:int=3;	/// 下一关
		public static const BattleResponse_Max:int=10;

		public static const BattleResult_Unknow:int=0;		/// 未知结果
		public static const BattleResult_Win:int=1;		/// 单人赢
		public static const BattleResult_Lose:int=2;		/// 单人输
		public static const BattleResult_TeamWin:int=1;	/// 多人组队赢
		public static const BattleResult_TeamLose:int=2;	/// 多人组队输
		public static const BattleResult_Max:int=10;
		//----------------消息类型---------------------------------------------------------------------
		public static const MsgType_Unknow:int=0;		/// 未定义
		public static const MsgType_Gateway:int=0;		/// 网关消息
		public static const MsgType_Login:int=0;		/// 登录消息
		public static const MsgType_Client:int = 0;		/// 服务器与客户端的交互消息
		public static const MsgType_Cache:int = 0;		/// 前端服消息
		public static const MsgType_CommonServer:int = 0;	/// 公共服消息


		// 网关
		public static const MsgId_Gateway_Handshake:int=1;                        /// [GC] 网关发送一个握手信息给客户端
		public static const MsgId_Gateway_Ping:int=2;                             /// [GC] 网关发送ping指令到客户端
		public static const MsgId_Gateway_PingReply:int=3;                        /// [CG] 客户端响应ping指令
		public static const MsgId_Gateway_NotifyDisconnect:int=4;                 /// [GC] 通知客户端服务器即将关闭该连接，不要重连 (ulong reason)  // reason参考枚举 CloseConnReason
		public static const MsgId_Gateway_DisconnectReply:int=5;                  /// [CG] 客户端响应服务器关闭连接 (ulong reason)  // reason直接使用服务器传入的原因即可
		public static const MsgId_Gateway_SendData:int=6;                         /// [LG] 逻辑服向网关上的客户发送数据
		public static const MsgId_Gateway_Broadcast:int=7;                        /// [LG] 逻辑服向网关上的指定客户列表广播数据
		public static const MsgId_Gateway_CloseConn:int=8;                        /// [LG] 逻辑服通知网关关闭指定的连接
		public static const MsgId_Gateway_Ready:int=9;                            /// [LG] 逻辑服通知网关已经准备就绪 LG: ulong worldId(逻辑服游戏世界ID)
		public static const MsgId_Gateway_Connected:int=10;                       /// [GL] 网关接收了一个客户端连接
		public static const MsgId_Gateway_HandshakeResponse:int=11;               /// [GL] 网关发给逻辑服的握手信息
		public static const MsgId_Gateway_RecvData:int=12;                        /// [GL] 网关收到客户端数据
		public static const MsgId_Gateway_Disconnected:int=13;                    /// [GL] 网关发现客户端断开了连接
		public static const MsgId_Common_Pulse:int=14;                            /// [[[GL/LG/LF/FL] ]] 心跳包 ()
		public static const MsgId_Gateway_SwitchLogicSvr:int=15;                  /// [LG] 逻辑服通知网关将客户端切换到其他逻辑服 LG: ulong targetWorldId(目标逻辑服ID，0表示出生逻辑服), ulong clientId(客户端ID)
		public static const MsgId_Gateway_SwitchLogicLine:int=16;                 /// [LG] 逻辑服通知网关将客户端切换到其他分线逻辑服 LG:ulong clientId(客户端ID), byte nSourceLineId(原来的分线ID), byte nTargetLineId(目的分线ID)
		public static const MsgId_Gateway_LineInfo:int=17;                        /// [GL] 网关定时向逻辑服广播分线信息 LG: [byte nLineId(分线ID), ulong nCurNum(当前人数), ulong nMaxNum(最大承载数量)]*n

		// 世界服
		public static const MsgId_World_Handshake:int=51;                         /// [LW] 逻辑服发给世界服的握手信息 (ulong group, ulong type, const utf8* name)
		public static const MsgId_World_PostData:int=52;                          /// [LW] 逻辑服通过世界服中转消息 (ulong svrId, ushort bufLen, Buffer buffer)
		public static const MsgId_World_HandshakeResponse:int=53;                 /// [W*] 世界服响应各区服务器的握手信息 (ulong svrId)
		public static const MsgId_World_StopService:int=54;                       /// [W*] 世界服通知所有客户停止服务 ()
		public static const MsgId_World_SendMessage:int=55;                       /// [W*] 世界服向其他客户端发送消息 ()
		public static const MsgId_World_SendCommand:int=56;                       /// [W*] 世界服向其他客户端发送命令 (const utf8* command)
		public static const MsgId_World_UpdateLogin:int=57;                       /// [LW] 逻辑服向世界服更新玩家登陆状态 (int userIdCard, byte isAdult, byte isLogin)
		public static const MsgId_World_SendHealthState:int=58;                   /// [WD] 世界服向逻辑服发送防沉迷状态 (int userIdCard, uint healthState, uint nCD)
		public static const MsgId_World_AddMoney:int=59;                          /// [WD] 世界服通知DBS某人冲值 ulong nActorId
		public static const MsgId_World_GMKick:int=60;                            /// [WD] 世界服通知DBS服GM设置踢人下线 WD: [long nActorId]*n
		public static const MsgId_World_GMBrocastInfo:int=61;                     /// [WD] 世界服向逻辑服发送公告消息 (const utf8* info)
		public static const MsgId_World_HttpRequest:int=62;                       /// [LW] 逻辑服发给世界服的http请求 (const char* url)
		public static const MsgId_World_HttpResponse:int=63;                      /// [WL] 世界服发给逻辑服的http请求的反馈信息 (const char* result)
		public static const MsgId_World_GMMute:int=64;                            /// [WD] 世界服向逻辑服发送禁言 WL: ulong actorId, int times, int interval
		public static const MsgId_World_GMSetRight:int=65;                        /// [WD] 世界服通知DBS服GM设置某人权限 WD: ulong nActorId, ulong nRight
		public static const MsgId_World_GMSetAction:int=66;                       /// [WD] 世界服通知DBS服GM开启或关闭某活动 WL: int nAction, int nValue
		public static const MsgId_World_GMSendEmail:int=67;                       /// [WD] 世界服通知DBS服GM通过Web平台发送邮件 WD: ulong nWorldId, ulong nCount
		public static const MsgId_World_GMLimitLogin:int=68;                      /// [WD] 世界服通知DBS服GM通过Web平台禁止某人登陆 WD: [long nActorId]*n
		public static const MsgId_World_GetHealth:int=69;                         /// [LW\WL] 逻辑服向世界服请求防沉迷登陆时间 LW:int userIdCard; WL:(int userIdCard, uint healthState, uint nCD)
		public static const MsgId_World_CheckActiveCode:int=70;                   /// [LW\WL] 逻辑服向世界服请求验证激活码 LW: uint nWorldId(游戏世界ID), uint nLineId(分线ID), uint nParterId(平台ID), uint nActorId(角色ID), utf8* sCode(验证码); WL: uint nWorldId(游戏世界ID), uint nLineId(分线ID), uint nActorId(角色ID), utf8* sCode(验证码), byte byResult(验证结果), uint nTypeId(验证码类型ID)
		public static const MsgId_World_LSToDBS:int=71;                           /// [WL] 世界服通过逻辑服转发数据到DBS服
		public static const MsgId_World_LoadActivityTable:int=72;                 /// [WD] 世界服通知DBS从DB加载活动表 ()
		public static const MsgId_World_RefreshServerRank:int=73;                 /// [WD] 世界服通知DBS刷新至尊天下排行榜（DBS服转发到公共服） ()
		public static const MsgId_World_QQOpenDelivery:int=74;                    /// [WD] 世界服通知DBS玩家购买商品回调（QQ开放平台） WD: utf8* sOpenId, utf8* sToken
		public static const MsgId_World_WorldOpenTime:int=75;                     /// [WD] 世界服通知DBS更新开服时间 WD: utf8* sOpenTime(游戏世界的开服时间)

		// 登录逻辑
		public static const MsgId_Login_Login:int=101;                            /// [CL] 登录 (ulong loginMode, ...)
		public static const MsgId_Login_CreateActor:int=102;                      /// [CL] 创建角色 CL: ulong nWizardId(精灵ID), const utf8* actorName(角色名)
		public static const MsgId_Login_SwitchState:int=103;                      /// [LC] 切换登录状态 (ulong state)
		public static const MsgId_Login_LoginResponse:int=104;                    /// [LC] 登录反馈 (int retval, const char* desc)
		public static const MsgId_Login_Timestamp:int=105;                        /// [CL\LC] 同步时间戳 CL(uint time)  LC(uint cliTime, uint svrTime)
		public static const MsgId_Login_ResLoaded:int=106;                        /// [CL] 告诉服务器资源加载完毕 ()
		public static const MsgId_Network_Reconnect:int=107;                      /// [LC] 通知客户端跳转网关 LC: string szIP, uint nPort
		public static const MsgId_Login_SelectCamp:int=108;                       /// [CL] 选择阵营 CL: byte nCamp(1部落; 2联盟)
		public static const MsgId_Login_ResLoadExt:int=109;                       /// [CL] 通知服务端资源加载情况 CL: int nType
		public static const MsgId_Login_Network:int=110;                          /// [CL\LC] 网络延迟(客户端请求;服务端返回) CL: ; LC: byte nType(0到网关返回,1所在分线返回)
		public static const MsgId_Login_NetworkLine:int=111;                      /// [CL\LC] 网络延迟(分线情况) CL: ; LC: [byte nLine(分线), int nMs(毫秒延迟)]*n
		public static const MsgId_WorldLevel_Info:int=112;                        /// [CL\LC] 游戏世界等级信息 CL: ; LC: int nWorldId(游戏世界ID), int WorldLevel(等级), int nWorldExp(当前经验), int nWorldExpMax(升级到下一等级需要的经验)

		// 公共消息
		public static const MsgId_Common_Timestamp:int=151;                       /// [LC] 向客户端同步时间戳 (uint time)
		public static const MsgId_Common_SystemTips:int=152;                      /// [LC] 发送系统提示到客户端 byte nSize,[byte nYellowVipType, byte nYellowVipLv]*nsize，const char* infoId(info表的Id), ushort nMsgBoxVerifyType(默认0; nInfoPos=InfoPos_MsgBoxVerify时使用),[byte nType(参数类型：0整型，1字符型),int nValue(当nType==0)/char* sValue(当nType==1)]*n
		public static const MsgId_Common_MsgBoxVerifyResponse:int=153;            /// [CL] 客户端响应选择确认窗口 ushort nMsgBoxVerifyType, byte isOK(1:确定, 0:取消)
		public static const MsgId_Common_SetAutoCheck:int=154;                    /// [CL] 选择自动勾选确认窗口 [byte nBit(第几个位置), byte isAuto(0取消;1打钩)] * n
		public static const MsgId_Common_AdultInfoBox:int=155;                    /// [LC] 完善未成年防沉迷信息窗口 ()
		public static const MsgId_Common_OpenFunction:int=156;                    /// [CL\LC] 功能开放 CL: ushort nFunction, byte nStep(步骤)  LC: [ushort nFunction(功能索引号), byte nStep(步骤; 100表示未开放)]*n
		public static const MsgId_Common_OpenFunctionNew:int=157;                 /// [LC] 新功能开放 LC: [ushort nFunction(功能索引号), byte nStep(步骤; 100表示未开放)]*n
		public static const MsgId_Common_KillMonster:int=158;                     /// [LC] 击杀怪物获得奖励(经验,血气值) LC: UID nCreatureUID(生物UID), int nExp(经验值), int nBloodVal(血气值)

		// 场景
		public static const MsgId_Scene_EnterMap:int=201;                         /// [CL\LC] 玩家进入地图 CL: ulong mapId(地图ID), byte nFromMap(0表示是副本大厅进入; 1表示地图跳转点进入), ulong nScenceId(场景ID) LC: ulong mapId(地图ID), byte  bMapCanAutoBattle(是否可自动战斗), int x, int y(主角位置)
		public static const MsgId_Scene_ChangeLine:int=202;                       /// [CL\LC] 切换分线 CL: byte nLineId(分线ID) LC: byte nLineId(玩家所在分线ID), byte nLineState(分线状态; 0正常,1拥挤,2满)
		public static const MsgId_Scene_BroadcastLine:int=203;                    /// [CL\LC] 广播分线信息 LC: [byte nLineId, byte nLineState(分线状态; 0正常,1拥挤,2满)]*n
		public static const MsgId_Scene_JumpDynamic:int=204;                      /// [CL] 玩家在动态跳转点请求跳转 CL: UID creatureUID(动态跳转点的UID)
		public static const MsgId_Scene_EnterMapExt:int=205;                      /// [CL\LC] 玩家准备进入地图(此消息服务端只是让玩家离开旧地图,不真正进入新地图) CL: ulong mapId(地图ID), byte nFromMap(0表示是副本大厅进入; 1表示地图跳转点进入) LC: ulong mapId(地图ID), byte nFromMap, ulong nScenceId(场景ID)
		public static const MsgId_Scene_EnterAreaInfo:int=206;                    /// [LC] 通知玩家进入或离开某区域 CL: byte nInfoType(0 进入安全区域; 1离开安全区域; 2进入pk区域; 3离开pk区域)
		public static const MsgId_Scene_ChangeMapData:int=207;                    /// [LC] 通知玩家修改地图数据(可移动等) CL: int nMapId, [int nIndex(格子索引号), byte nType(0可行走,1障碍)]*n
		//public static const MsgId_Scene_LimitTimeForDrop:int=208;                 /// [LC] 通知玩家地图剩余掉落不衰减的时间 CL: int nMapId, int nSecond(剩余秒数)
		public static const MsgId_Scene_XuKongTimeInfo:int=208;                   /// [CL\LC] 虚空地图剩余衰减倒计时 CL:  LC:int nTotalSecond(总剩余秒数), int nMoneySecond(剩余购买时长:秒), int nTodayBuyCount(今日购买次数)
		public static const MsgId_Scene_XuKongBuyTime:int=209;                    /// [CL] 虚空地图购买时间 CL:
		// 实体行为
		public static const MsgId_Entity_Stand:int=251;                           /// [LC] 实体站立 (UID creatureUID, const MapPos& pos)
		public static const MsgId_Entity_Move:int=252;                            /// [CL\LC] 实体移动 UID creatureUID(生物UID), bool needFindPath(是否需服务器寻路), [const MapPos pos(路点坐标)] * n
		public static const MsgId_Entity_MoveStop:int=253;                        /// [LC] 实体移动停止 UID creatureUID, const MapPos& pos
		public static const MsgId_Entity_CreatePlayer:int=254;                    /// [LC] 创建主角 (AttrList al)
		public static const MsgId_Entity_CreateEntity:int=255;                    /// [LC] 创建实体对象 ulong entityType(实体类型), ulong angle(角度), ulong posx(位置X), ulong posy(位置Y),AttrList al(属性列表)
		public static const MsgId_Entity_DestroyEntity:int=256;                   /// [LC] 销毁实体对象(单个实体) [UID entityUID]*n
		public static const MsgId_Entity_UpdateEntity:int=257;                    /// [LC] 更新实体属性 (ulong entityType, UID entityUID, AttrList al)
		public static const MsgId_Entity_Dead:int=258;                            /// [LC] 实体死亡(多个实体)(击飞死亡) [UID creatureUID] * n
		public static const MsgId_Entity_WatchPlayer:int=259;                     /// [CL\LC] 获取玩家角色面板信息(本服或跨服) CL: uint ActorId, uint nGameWorldId, uint nSvrId;  LC: (装备栏信息)(byte)nEquipSkepNum, [(uint)nSkepType, (ushort)nSkepItemCount, [ushort idx, uint dataSize, ITEM_DATA ]*n ]*n, (镶嵌的宝石信息)(ushort)nJewelCount, [uint dataSize, ITEM_DATA]*n, uint nWizardId(精录Id),uint TitleId(称号Id) uint nLevel(等级) uint nFightPower(战力) byte camp(阵营) int nArmyLevel(军衔),byte nYellowVipType, byte nYellowVipLv, [byte nGroupType(套装类型),uint nGroupId(套装Id)]*n
		public static const MsgId_Entity_LevelUp:int=260;                         /// [CL] 玩家升级(手动) CL: byte nUpType(0:升到当前经验最高级; 1:一级一级升)
		public static const MsgId_Entity_TalkWithNPC:int=261;                     /// [CL\LC] 玩家点击NPC; 服务器通知客户端打开一个任务对话 CL: UID npcUID   LC:UID npcUID, [byte menuType, ulong Id, byte nIdType] * n  (menuType=0表示后面的是任务ID, 及任务状态)(menuType=1 表示后面的是商城ID)(menuType=2 表示后面是押镖)
		public static const MsgId_Entity_TalkWithNPCResponse:int=262;             /// [CL] 玩家点击NPC提交任务或请求打开商店等 CL: byte menuType, ulong Id, byte nIdType (menuType=0表示后面的是任务ID, 及任务状态)(menuType=1 表示后面的是商城ID)(menuType=2 表示后面的是押镖)
		public static const MsgId_Entity_Revive:int=263;                          /// [LC] 实体复活(多个实体) [UID creatureUID, int x, int y] * n
		public static const MsgId_Entity_SelectPKModle:int=264;                   /// [LC] 选择PK模式 byte nPKModle (0:和平; 1:善恶; 2:全体; 3:阵营; 4:队伍;)
		public static const MsgId_Entity_SelectRevive:int=265;                    /// [CL\LC] 玩家选择复活(安全复活/原地复活) LC:byte nShow(0按钮无效;1按钮可按; 2取消整个复活框), int nReviveTime(复活倒计时(秒), uint nFreshenId(freshen表Id)， uint nDeadCount(死亡次数)  CL: byte nRevieType(0普通复活;1原地复活(扣物品))
		public static const MsgId_Entity_WhoLeaveMe:int=266;                      /// [LC] 实体离开视线 [UID creatureUID] * n
		public static const MsgId_Entity_WatchRide:int=267;                       /// [CL\LC] 获取玩家坐骑面板信息(本服或跨服) CL: uint ActorId, uint nGameWorldId;  LC: (装备栏信息)(ushort)nSkepItemCount(坐骑栏装备数量), [ushort idx(坐骑栏装备序号), uint dataSize, ITEM_DATA ]*n , (镶嵌的宝石信息)(ushort)nJewelCount, [uint dataSize, ITEM_DATA]*n, uint nRideId(坐骑当前BlessId),ushort nLevel(坐骑当前等级),ushort nMaxLevel(坐骑最大等级),int nFight(战斗力)
		public static const MsgId_Entity_WatchWing:int=268;                       /// [CL\LC] 获取玩家翅膀面板信息(本服或跨服) CL: uint ActorId, uint nGameWorldId;  LC: uint nWingId(翅膀当前BlessId),ushort nLevel(翅膀当前等级),ushort nMaxLevel(翅膀最大等级)int nFight(战斗力)
		public static const MsgId_Entity_DeadExt:int=269;                         /// [LC] 实体死亡(多个实体)(怎么死) LC: UID nMurdererUID(凶手UID,0表示自杀或系统击杀的), [UID creatureUID, byte nType(0-原地死;1-击退 2-击飞 3-击倒), int nPosX(地图X坐标), int nPosY(地图X坐标)] * n
		public static const MsgId_Entity_Stealth:int=270;                         /// [LC] 实体隐身 [UID creatureUID, byte nType(0表示全隐身;1表示半隐身)] * n
		public static const MsgId_Entity_NotStealth:int=271;                      /// [LC] 实体取消隐身 [UID creatureUID] * n
		public static const MsgId_Entity_FollowPlayer:int=272;                    /// [CL] 跟随玩家 CL:uint nPlayerId(玩家Id，0取消跟随),byte nType(0寻路过去跟随，1使用飞行棋过去跟随，2直接跳转过去（不消耗材料）跟随, 3 追杀仇人，跳转过去)
		public static const MsgId_Entity_FollowMonster:int=273;                   /// [CL] 跟随怪物 CL:UID nMonsterId(怪物UID，0取消跟随),byte nType(0寻路过去跟随，1使用飞行棋过去跟随，2直接跳转过去（不消耗材料）跟随)
		public static const MsgId_Entity_JumpMap:int=274;                         /// [CL] 直接跳转到某坐标点 CL:uint nMapId(地图Id),int nPosX(地图X坐标), int nPosY(地图X坐标)
		public static const MsgId_Entity_JumpUser:int=275;                        /// [CL] 直接跳转到跳转到某人旁边 CL:uint nPlayerId(玩家Id),byte nType(0寻路过去，1使用飞行棋过去，2直接跳转过去（不消耗材料）)
		public static const MsgId_Entity_MoveMap:int=276;                         /// [CL] 寻路到某坐标 CL:uint nMapId(地图Id),int nPosX(地图X坐标), int nPosY(地图X坐标),byte nType(0寻路过去，1使用飞行棋过去，2直接跳转过去（不消耗材料）)
		public static const MsgId_Entity_JumpNpc:int=277;                         /// [CL] 直接跳转到跳转到某Npc旁边 CL:uint nNpcId
		public static const MsgId_Entity_MoveNpc:int=278;                         /// [CL\LC] 寻路到某Npc旁边 CL:uint nNpcId(为0表示取消寻路),byte nType(0寻路过去，1使用飞行棋过去，2直接跳转过去（不消耗材料）) LC:ulong nTargetMapID(目标点所在地图ID), UID NpcUID, int x, int y
		public static const MsgId_Entity_Spoken:int=279;                          /// [LC] 怪物实体说话 LC: UID uid(怪物uid), uint nSpokenId
		public static const MsgId_Entity_WhoNearMe:int=280;                       /// [LC] 实体进入视线 [UID creatureUID, int x, int y] * n
		public static const MsgId_Entity_GetActorInfo:int=281;                    /// [CL\LC] 获取玩家基本信息 CL: uint ActorId(玩家Id), uint nGameWorldId(服务器Id，本服为0),uint nMake(标记，转发客户端);  LC: uint nMake(客户端使用),uint nActorId(玩家Id),uint nGameWorldId(服务器Id，本服为0),utf8* nName(名称),byte bRace(种族),byte bCamp（阵营）,ushort nLevel（等级）,uint ArmyLevel（军衔）,uint nTitleId(称号)
		public static const MsgId_Entity_UpdatePos:int=282;                       /// [LC] 更新附近生物的坐标 [UID creatureUID, MapPos curPos] * n
		public static const MsgId_Entity_UpdateProperty:int=283;                  /// [LC] 更新生物属性 [UID creatureUID, ushort nType, int nValue] * n
		public static const MsgId_Entity_WatchPackage:int=284;                    /// [CL\LC] 获取玩家构装面板信息(本服或跨服) CL:uint ActorId, uint nGameWorldId; LC: uint 激活的插件位数量, [byte 插件位置, ushort 插件位等级，ushort 插件位等阶，uint 插件位等阶对应的Bless]*n  ,uint nFightPower(当前战力), uint nGroupNum(构装套装数量), [uint nPackageItemId(构装套装的物品Id),byte nGroup(构装套装当前等级),uint nSkillId(技能Id),byte nCount(插件数量),[byte nPos(插件位置),uint nItemId(物品Id)]*nCount]*nGroupNum
		public static const MsgId_Entity_WatchBlood:int=285;                      /// [CL\LC] 获取玩家血脉面板信息(本服或跨服) CL:uint ActorId, uint nGameWorldId;LC:uint nFightPower(当前战力),[uint nBloodId(激活的血脉Id),ushort nLevel(血脉当前重数)]* n
		public static const MsgId_Entity_UpdatePosExt:int=286;                    /// [CL\LC] 更新附近生物的坐标 CL: byte nSelfPos(是否获取自己的坐标 0不获取,1获取)  LC: [UID creatureUID, byte nState(0站立;1移动中), int nX, int nY(当前坐标), int nSize(后面路径数量),[int x, int y]*n  ] * n
		public static const MsgId_Entity_WatchFortress:int=287;                   /// [CL\LC] 获取玩家要塞信息(本服或跨服) CL: uint ActorId, uint nGameWorldId;  LC: uint nActorId(角色ID), const utf8* sName(角色名字), uint nFightPower(当前战力), uint nFortressLv(要塞等级), uint nFortressFightPower(要塞战力), uint nPopulation(人口)，int nExploit(战绩)
		public static const MsgId_Entity_FightDetail:int=288;                     /// [LC] 玩家战力明细 [uint 部件ID(0 角色基本属性(等级属性,不属于部件),4 装备(强化，重铸，鉴定，镶嵌)，5 技能符文，6 buff， 14 称号，15 坐骑，16 翅膀，17 阵营(军衔)，18 vip, 19 构装，22 血脉，32 要塞，37 器魂，38 战姬，39 图鉴, 45 星阵， 48 炼金)，uint 战力]*n
		public static const MsgId_Entity_RequsetFightDetail:int=289;              /// [CL\LC] 请求对方玩家战力明细 CL: uint nActorId(对方玩家ActorId) LC: [uint 部件ID(0 角色基本属性(等级属性,不属于部件),4 装备(装备基础属性，强化，重铸，鉴定，镶嵌)，5 技能符文，6 buff， 14 称号，15 坐骑，16 翅膀，17 阵营(军衔)，18 vip,19 构装，22 血脉，32 要塞，37 器魂，38 战姬，39 图鉴, 45 星阵, 48 炼金 330 装备基础属性, 331 强化属性, 332 镶嵌, 333 鉴定， 334 重铸)，uint 战力]*n
		public static const MsgId_Entity_MoveMonster:int=290;                     /// [CL] 在当前场景寻路到怪物 CL: uint nWizardId(怪物ID)
		public static const MsgId_Entity_MoveMapExt:int=291;                      /// [CL\LC] 寻路到某坐标(到达目的地客户端需启动自动战斗) CL:uint nMapId(地图Id),int nPosX(地图X坐标), int nPosY(地图X坐标),byte nType(0寻路过去，1使用飞行棋过去，2直接跳转过去(不消耗材料);   LC:uint nMapId(地图Id),int nPosX(地图X坐标), int nPosY(地图X坐标), byte  nAutoBattle(到达目标是否自动战斗  1:自动)
		public static const MsgId_Entity_WatchHandBook:int=292;                   /// [CL\LC] 获取玩家图鉴面板信息(本服或跨服) CL:uint nActorId, uint nGameWorldId; LC: uint nHandBookFight(当前图鉴战力), [uint nChapterId(图鉴套装BlessID)，byte nQuality(图鉴套装对应的品质)]*n
		public static const MsgId_Entity_UpdateAngle:int=293;                     /// [LC] 更新实体的角度 LC: UID uid(实体UID), ulong angle(角度)

		// 物品栏行为
		public static const MsgId_Skep_UseItem:int=301;                           /// [CL] 客户端使用物品 (uint64 nItemGUID, byte nAll) //nAll = 0 表示使用一个; nAll=1 表示全部使用
		public static const MsgId_Skep_MoveSkepItem:int=302;                      /// [CL\LC] 移动物品栏中的物品(可跨物品栏移动) CL:(int srcSkepId, int srcIdx, int dstSkepId, int dstIdx)  LC:(byte srcSkepId, ushort srcIdx, byte dstSkepId, ushort dstIdx)
		public static const MsgId_Skep_CreateItems:int=303;                       /// [LC] 创建单个物品或者物品列表到物品数据源中 (int buffSize, AttrList al) * n 个
		public static const MsgId_Skep_UpdateItem:int=304;                        /// [LC] 更新数据源中的对象 (uint64 nItemGUID, AttrList al)
		public static const MsgId_Skep_DestroyItems:int=305;                      /// [LC] 销毁物品数据源中的一个或者多个物品 (uint64 nItemGUID) * n 个
		public static const MsgId_Skep_CreateSkeps:int=306;                       /// [LC] 创建单个或者多个物品栏 (int buffSize, Buffer buf) * n 个 Buffer: byte skepId,ushort maxSize, [ushort idx1, int64 guid1,...]
		public static const MsgId_Skep_AddSkepItem:int=307;                       /// [LC] 向指定的物品栏添加一个物品引用 (byte skepId, ushort idx, uint64 nItemGUID)
		public static const MsgId_Skep_RemoveSkepItem:int=308;                    /// [LC] 从指定的物品栏移除一个物品引用 (byte skepId, ushort idx)
		public static const MsgId_Skep_Tidy:int=309;                              /// [CL] 整理包裹栏 (uint type) type:整理类型
		public static const MsgId_Skep_UpdateSkep:int=310;                        /// [LC] 更新一个物品栏(暂用于包裹整理) byte skepId,ushort nSkepItemSize, [ushort idx1, uint64 nItemGUID,...]
		public static const MsgId_Skep_Buy:int=311;                               /// [CL\LC] 购买包裹栏格子 CL:(uint index, byte bForceSell(是否确认购买)) LC:byte nSkepType(背包栏类型)，uint nIndex(格子序号，从0开始))
		public static const MsgId_Skep_Up:int=312;                                /// [CL\LC] 物品装上物品栏的格子(物品本身不存在背包栏) CL: uint64 nItemGUID, int dstSkepId, int dstIdx   LC: uint64 nItemGUID, int dstSkepId, int dstIdx
		public static const MsgId_Skep_Down:int=313;                              /// [CL\LC] 物品栏卸载物品(物品本身不存在背包栏) CL: int srcSkepId, int srcIdx   LC: int srcSkepId, int srcIdx
		public static const MsgId_Skep_UpdateItemFlag:int=314;                    /// [CL] 更改物品标记(如是否已被查看) uint64 nItemGUID, ulong nType, byte nVal (nType=1 表示被查看标记)(nVal= 0:表示去掉标记  1为表示添加标记)
		public static const MsgId_Skep_Time:int=315;                              /// [CL\LC] 请求时间 LC:uint nIndex(第一个可倒计时格子序号，从0开始)，uint nTime(第一个格子倒计时时间，为0表示所有格子已开启)
		public static const MsgId_Skep_BagTips:int=316;                           /// [LC] 格子倒计时为0，提示可开启格子Tips LC:uint nSkepIndex(背包格子序号，从0开始)

		// 任务
		public static const MsgId_Quest_AcceptQuest:int=351;                      /// [CL] 接任务 CL: ulong nQuestId
		public static const MsgId_Quest_SubmitQuest:int=352;                      /// [CL] 交任务 CL: ulong nQuestId, byte nUseMoney(0正常完成; 1使用元宝马上完成)
		public static const MsgId_Quest_DiscardQuest:int=353;                     /// [CL] 放弃任务 CL: ulong nQuestId
		public static const MsgId_Quest_AllAcceptedList:int=354;                  /// [LC] 更新整个已接任务列表 LC: [ulong nQuestId, ushort nCount(完成次数), byte nTaskState(任务状态), byte nStart(星级), ulong nVal(任务值;如杀人数量), string strVal(字符串值), int nConditionValue2(任务目标数2)]*n
		public static const MsgId_Quest_AllAcceptableList:int=355;                /// [LC] 更新整个可接任务列表(主线支线) LC: [ulong nQuestId, ushort nCount(完成次数)]*n
		public static const MsgId_Quest_UpdateList:int=356;                       /// [LC] 更新某些任务 LC: [ulong nQuestId, ushort nCount(完成次数), byte nTaskState(任务状态), byte nStart(星级), ulong nVal(任务值;如杀人数量), string strVal(字符串值), int nConditionValue2(任务目标数2), byte nUpdateType(0更新, 1删除, 2从可接转到已接队列)]*n
		public static const MsgId_Quest_FindPath:int=357;                         /// [CL] 任务寻路(接/交任务则寻路到相应的NPC;已接任务则寻路到任务目标点) CL: ulong nQuestId, byte nImmediately(0默认; 1马上到目标点)
		public static const MsgId_Quest_FindPathCancel:int=358;                   /// [CL] 取消寻路 CL:
		public static const MsgId_Quest_Star:int=359;                             /// [CL] 日常任务升星 CL:ulong nQuestId, byte nFlag(0:普通升星,1:一键升5星)
		public static const MsgId_Quest_FindPathTarget:int=360;                   /// [LC] 任务寻路目标 LC: byte nType(0目标是NPC;1目标是其他), ulong nTargetMapID(目标点所在地图ID), UID NpcUID, int x, int y
		public static const MsgId_Quest_OpenWindows:int=361;                      /// [LC] 打开交接任务的窗口 CL: ulong nQuestId, byte nType(0:接任务;1交任务)
		public static const MsgId_Quest_FindPathTargetExt:int=362;                /// [LC] 任务寻路目标(直接到达) LC: byte nType(0目标是NPC;1目标是其他), ulong nTargetMapID(目标点所在地图ID), UID NpcUID, int x, int y
		public static const MsgId_Quest_FindPathAu:int=363;                       /// [CL\LC] 任务寻路(返回任务目标点，自动挂机使用) CL: ulong nQuestId; LC:byte nType(0目标是NPC;1目标是其他), ulong nTargetMapID(目标点所在地图ID), UID NpcUID, int x, int y
		public static const MsgId_Quest_OneKeyFinish:int=364;                     /// [CL] 一键完成(完成一个或一种) CL: ulong nQuestId, bool bAllType(0,只完成一个,1完成一种(只针对每日任务))
		public static const MsgId_Quest_AllAcceptableList_Daily:int=365;          /// [LC] 更新日常任务可接列表 LC: [ulong nQuestId, ushort nCount(完成次数), byte nStar(星级)]*n

		// 商店
		public static const MsgId_Shop_Buy:int=401;                               /// [CL] 在商店购买指定数量的物品 CL: ulong nShopID, ulong nId, ushort nNum, ulong nMoneyType(币种), byte nBuyAndUse(1:购买直接使用)
		public static const MsgId_Shop_Sell:int=402;                              /// [CL] 在商店出售 CL: ulong nShopID, UID uidItem, ushort nNum (nShopID 可默认为0)
		public static const MsgId_Shop_Open:int=403;                              /// [LC] 打开商店 LC: ulong nShopID
		public static const MsgId_Shop_MallUpdate:int=404;                        /// [CL\LC] 商城限量商品列表更新 CL: (); LC: uint nWorldOpenTime(服务器的开服时间), uint nRefreshTime(距离限时抢购类商品的下一次刷新的秒数), [uint nId]*10(10种特惠商品的ID), [uint nID]*10(10种限时抢购商品ID)(特惠和抢购商品不足10种的话，以0补足)
		public static const MsgId_Shop_MallUpdateLimit:int=405;                   /// [LC] 商城限量商品数量信息更新 LC: [uint nId, uint nWorldLimit, uint nPersonLimit]*n(nId商品ID，nWorldLimit全服限量剩余，nPersonLimit个人限量剩余，限量为-1表示不限量)
		public static const MsgId_Shop_BuyStamina:int=406;                        /// [CL\LC] 购买体力 LC:byte bSuccess(0,失败 1，成功),uint nStamina(购买所得的体力),uint nNum(体力剩余购买次数)
		public static const MsgId_Shop_BuyStaminaNum:int=407;                     /// [LC] 体力购买次数 LC:uint nNum(体力购买剩余次数),uint nMaxNum(体力购买最大次数),uint nMoney(下次购买价格)
		public static const MsgId_Shop_Buy_Discount:int=408;                      /// [CL\LC] 使用打折卡购买商城商品 CL: ulong nId, ushort nNum, ulong nMoneyType(币种), UID uidDiscount(打折卡的UID); LC: byte byResult(购买结果，0失败，1成功)
		public static const MsgId_Shop_MallUpdateDiscount:int=409;                /// [LC] 商城限时打折商品信息更新 LC: [uint nId(商品ID), uint nDiscount(新的折扣), uint nLeftTime(剩余时间，单位秒)]*n
		public static const MsgId_Shop_SellAll:int=410;                           /// [CL] 一键出售 CL: [UID uidItem]*n (nShopID 可默认为0)
		public static const MsgId_Shop_CDTime:int=411;                            /// [CL\LC] 商店的商品CD CL: uint nShopID(商店编号); LC: uint nShopID(商店编号), [uint nID(商品ID), uint nCDTime(商品的CD时间，0表示没有冷却，单位秒)]*n

		// 聊天
		public static const MsgId_Chat_Message:int=451;                           /// [CL\LC] 聊天消息 [CL]ushort channelType, const char* szMessage, ulong nRecvActorId; [LC]ushort channelType, ulong nCamp(阵营), ulong nActorId, const char* szActorName, byte nGender(0女 1男), ushort nVip，ushort nFromWorldId, ushort nFromServerId(为0表示当前服), uint nSvrId, byte nYellowVipType, byte nYellowVipLv, const char* szMessage
		public static const MsgId_Chat_ShowItem:int=452;                          /// [CL\LC] 展示物品消息 [CL]ushort channelType, [(a)byte nItemShowType(0), char* szMessage, ulong [ulong nItemID]*n; (b)byte nItemShowType(1), char* szMessage, [uint64 itemGUID]*n]  [LC]ushort channelType, ulong nCamp(阵营), ulong nActorId, const char* szActorName, byte nGender(0女 1男), ushort nVip，byte nYellowVipType, byte nYellowVipLv, ushort nFromWorldId, ushort nFromServerId(为0表示当前服), uint nSvrId, const char* szMessage, [(a)byte nItemShowType(0), byte nItemNum, [ulong nItemID]*n], [(b)byte nItemShowType(1), byte nItemNum, [ulong dataSize, ITEM_DATA]*n]
		public static const MsgId_Chat_SendCommand:int=453;                       /// [CL] 发送GM指令 (String cmd)
		public static const MsgId_Chat_HandleCommand:int=454;                     /// [LC] 处理服务器委托的GM指令 (ulong cmdId, String cmd)
		public static const MsgId_Chat_SendResult:int=455;                        /// [CL] 发送处理结果到服务器 (ulong cmdId, String cmd, String result)
		public static const MsgId_Chat_HandleResult:int=456;                      /// [LC] 处理服务器返回的GM指令结果 (String result)
		public static const MsgId_Chat_GMSuggestion:int=457;                      /// [CL\LC] GM建议 CL: byte type(1bug 2投诉 3建议 4其他)，string titile(主题)， string suggest(内容) LC: byte state(1表示成功，0表示失败)
		public static const MsgId_Chat_Whisper:int=458;                           /// [CL\LC] 私聊 [CL]char* szMessage, ulong nRecvServerId(对方服务器Id), ulong nRecvActorId(对方Id); [LC]ulong nActorId(发送方Id), ulong nRecvActorId(对方Id), utf8* szMessage, utf8* szClientMake
		public static const MsgId_Chat_WhisperAddList:int=459;                    /// [CL\LC] 添加一个玩家到私聊列表 CL:utf8* mark(标记id：actorId1_actorId2) ,uint nActorId(私聊对方玩家Id); LC:utf8* mark(标记id：actorId1_actorId2),uint nActorId(私聊对方玩家Id),utf8* sName(玩家昵称),byte race(种族),byte camp(阵营),ushort nVip(VIP等级), int nLevel(等级),byte nOnline(是否在线)
		public static const MsgId_Chat_WhisperUpdateList:int=460;                 /// [LC] 更新私聊列表信息 LC: [utf8* mark(标记id：actorId1_actorId2) ,byte nOnline(是否都在线)]*n
		public static const MsgId_Chat_WhisperDelList:int=461;                    /// [CL\LC] 删除玩家私聊列表 CL:uint nActorId(私聊对方玩家Id);LC:utf8* mark(标记id：actorId1_actorId2)
		public static const MsgId_Chat_WhisperInfo:int=462;                       /// [LC] 初始化私聊列表 LC: [utf8* mark(标记id：actorId1_actorId2),uint nActorId(私聊对方玩家Id),utf8* sName(玩家昵称),byte race(种族),byte camp(阵营),ushort nVip(VIP等级), int nLevel(等级),byte nOnline(是否在线)]*n

		// 物品强化打造等
		public static const MsgId_Item_Strong:int=501;                            /// [CL\LC] 强化装备 CL: UID uidItem, byte nOnekey(为1表示一键强化), byte nAutoBuy(1自动购买缺少物品); LC: UID uidItem, ushort nNewLevel(表示提升的等级，为0表示失败)
		public static const MsgId_Item_Recoin:int=502;                            /// [CL\LC] 重铸装备 CL: UID uidItem, byte nAutoBuy(1自动购买缺少物品); LC UID uitItem, byte bSuccess(0失败，1成功),[uint nType(重铸属性类型),int nValue(重铸后的值)]*n
		public static const MsgId_Item_Identify:int=503;                          /// [CL\LC] 鉴定装备 CL: UID uidItem, byte nAutoBuy(1自动购买缺少物品); LC UID uitItem, byte bSuccess(0失败，1成功),int nAttack(攻击),int nDefense(防御),int nCurHp(生命值),int nCrit(暴击),int nTenacity(韧性)
		public static const MsgId_Item_IdentifySave:int=504;                      /// [CL\LC] 保存鉴定值 CL: UID uidItem; LC: UID uidItem, byte isSuccess
		public static const MsgId_Item_JewelEmbed:int=505;                        /// [CL\LC] 宝石升级 CL: (UID uidItem装备, byte nSlotId镶孔位置);  LC: UID uidItem, byte isSuccess
		public static const MsgId_Item_JewelBreakOut:int=506;                     /// [CL\LC] 取回宝石 CL: UID uidItem装备, byte nSlotId镶孔位置;  LC: UID uidItem, byte isSuccess
		public static const MsgId_Item_OpenJewelNum:int=507;                      /// [CL\LC] 扩展凹巢数量(打孔) CL: UID uidItem装备, byte nSlotId镶孔位置;  LC: UID uidItem, byte isSuccess, byte nSlotId镶孔位置
		public static const MsgId_Item_Merge:int=508;                             /// [CL\LC] 物品合成 CL: uint nMergeId(Bless表的合成Id号), byte nAutoBuy(1自动购买缺少物品),uint nNum(需要合成的数量); LC:uint nMergeId(Bless表的合成Id号)，byte nSuccess(0，失败  1，成功),uint nNum(合成数量)
		public static const MsgId_Item_Decom:int=509;                             /// [CL\LC] 物品分解 CL:  [UID uidItem(需要分解的物品uid)]*n; LC:byte isSuccess ，[uint itemId(分解所得材料Id),uint nNum(分解所得材料数量)]*n
		public static const MsgId_Item_MergeGem:int=510;                          /// [CL] 宝石移动合成 CL: UID srcItem(源宝石uid), UID desItem(目标宝石uid)
		public static const MsgId_Item_SetAutoBuy:int=511;                        /// [CL] 选择商店自动购买的币种 CL: [uint nItemId(物品Id), uint nMoneyId(货币代表Id)]*n
		public static const MsgId_Item_AutoBuyInfo:int=512;                       /// [LC] 更新商店自动购买的币种选择 LC: [uint nItemId(物品Id), uint nMoneyId(货币代表Id)]*n
		public static const MsgId_Item_Inherit:int=513;                           /// [CL\LC] 装备继承 CL: UID srcItem(传承原物品Uid),UID objItem(传承目标物品Uid),byte bAutoBuy(是否材料不足自动购买),byte bOneKey(是否一键传承);LC: byte nSuccess(0失败，1成功),byte bOneKey(是否一键传承)
		public static const MsgId_Item_Split:int=514;                             /// [CL] 物品拆分 CL: UID srcItem(需要拆分的物品Uid),uint nNum(需要拆分的数量)
		public static const MsgId_Item_GroupProperty:int=515;                     /// [LC] 装备品质套装属性 LC:[byte bType(套装类型),uint nEquipsetId(当前套装属性Id),ushort nNum(下阶品质套装数量),ushort nMax(下阶品质套装数量最大值)]*n
		public static const MsgId_Item_OnekeyMergeGem:int=516;                    /// [LC] 一健合成同类型同等级宝石 LC:UID itemUID(背包物品UID)
		public static const MsgId_Item_BlessGrade:int=517;                        /// [LC] 进阶进度条表示 LC:byte nType(进阶类型,Bless表类型),byte nSuccess(0失败，1成功),uint nMaxBless(最大祝福值),[uint nBless(祝福值),byte bCity(是否爆击)]*n
		public static const MsgId_Item_Identification:int=518;                    /// [CL] 物品辨识 CL: UID uidItem(物品uid)
		public static const MsgId_Item_StrongEx:int=519;                          /// [CL\LC] 强化装备 CL:uint nStrongCount(要强化的物品个数), [UID uidItem]*n, byte nOnekey(0 表示单个物品强化 1表示身上所有装备强化) LC: [UID uidItem, ushort nNewLevel(表示提升的等级，为0表示失败)]*n
		public static const MsgId_Item_IdentifyBind:int=520;                      /// [CL] 鉴定绑定 CL: UID uidItem, byte nAttr(10 攻击，11 防御 12 生命值 13 暴击 14 韧性 ), byte nBind(0:取消绑定，1:绑定)

		// 活跃度
		public static const MsgId_Daily_Info:int=551;                             /// [LC] 活跃度信息 LC: ushort nTotalVal(当前总活跃度), [ushort nId, ulong nCurVal(当前次数), ulong nConfigVal(配置次数), byte bFinish(1完成)]* n
		public static const MsgId_Daily_RewardInfo:int=552;                       /// [CL\LC] 活跃度奖励 CL: ushort nVal(活跃度)  LC: [ushort nVal, byte bGet(1已领取)]*n

		// 公告版系统
		public static const MsgId_CallBoard_Update:int=601;                       /// [CL\LC] 更新公告版数据 (CL: byte callBoardType LC: byte callBoardType, byte num * data(return) )
		public static const MsgId_CallBoard_IsDirty:int=602;                      /// [LC] 通知公告版数据需要更新 (byte callBoardType )
		public static const MsgId_PrizeOL_Update:int=603;                         /// [CL\LC] 校准信息(奖励和时间) CL:() LC:(uint nId, uint nTime)
		public static const MsgId_PrizeOL_DoPrize:int=604;                        /// [CL\LC] 获取奖励 CL:() LC:(uint nId)

		// 邮件系统
		public static const MsgId_Mail_Update:int=651;                            /// [CL\LC] 更新 CL:(); LC:byte byFlag(0，后面是全部邮件；1，新收到了一封邮件), [byte MailType(0，系统；1，官方；2，离线消息), uint MailId, byte MailState(0，未读；1，已读), utf8* SenderName, utf8* strTitle, uint nTime(收件时间), byte hasPrize(0，没有附件；1，有附件), byte hasGotPrize(0，有未领取的附件；1，没有未领取的附件), uint nRemainTime(邮件的有效期，以秒为单位)] *n
		public static const MsgId_Mail_Open:int=652;                              /// [CL\LC] 请求打开信件(或领取单个邮件奖励) CL:uint nMailId(邮件ID), byte byGetPrize(0:不领取奖励;1领取奖励), byte byOpenMail(0不打开邮件,1打开邮件); LC: uint nMailId(邮件ID), utf8* strTitle(邮件标题), utf8* strMail(邮件内容), byte byItemState(附件状态；0，未提取；1，已提取), uint nItemCount(附件数量), [uint nCount(格子内物品数量), [uint nItemDataSize(物品属性大小), AttrList item(附件物品属性)]*nCount]*nItemCount
		public static const MsgId_Mail_Delete:int=653;                            /// [CL\LC] 删除n个信件 CL:[uint nMailId] * n    LC:[uint nMailId] * n
		public static const MsgId_Mail_GetPrize:int=654;                          /// [CL\LC] 获取多个邮件奖励 CL:[uint nMailId] * n    LC:[uint nMailId] * n
		public static const MsgId_Mail_UpdateRemainTime:int=655;                  /// [CL\LC] 更新邮件的剩余时间 CL:(); LC: [uint MailId, uint nRemainTime(邮件的有效期，以秒为单位)]*n

		// 活动公共接口
		public static const MsgId_Activities_Start:int=701;                       /// [CL\LC] 活动开始通知 CL: byte type(0为没有任何家族活动，1为家族仙城战，2为家族祭神，3为家族boss，4为世界boss， 5为怪物攻城，6为温泉捕鱼), LC: byte type(0为没有任何家族活动，1为家族仙城战，2为家族祭神，3为家族boss，4为世界boss， 5为怪物攻城，6为温泉捕鱼), byte start(1表示活动是否开启，0表示活动没有开启)
		public static const MsgId_Activities_CollectGame:int=702;                 /// [CL\LC] 收藏游戏 LC: byte collect(1为收藏过游戏，0表示没有)
		public static const MsgId_Activitirs_Hp:int=703;                          /// [LC] 血量的更新 LC: UID uid, ulong curHp, ulong maxHp
		public static const MsgId_Activitirs_TicketfetchSomeTime:int=704;         /// [LC] 某个时间段的充值元宝 LC: uint nMoney

		// 公共服务器
		public static const MsgId_CommonServer_Chat:int=751;                      /// [PL\LP] 公共服转发跨服聊天内容
		public static const MsgId_CommonServer_ShowItem:int=752;                  /// [PL\LP] 跨服展示物品
		public static const MsgId_CommonServer_WatchPlayer_Ask:int=753;           /// [PL\LP] 跨服查看资料请求 LP: ulong receiverActorId, ulong receiverWorldId, ulong askerActorId; PL: ulong receiverActorId, ulong askerWorldId, ulong askerActorId;
		public static const MsgId_CommonServer_WatchPlayer_Answer:int=754;        /// [PL\LP] 跨服查看资料答复 LP: ulong askerActorId, ulong askerWorldId, [data]; PL: ulong askerActorId, ulong askerWorldId, [data];
		public static const MsgId_CommonServer_SendFlower_Ask:int=755;            /// [PL\LP] 跨服送花请求
		public static const MsgId_CommonServer_SendFlower_Answer:int=756;         /// [PL\LP] 跨服送花答复
		public static const MsgId_CommonServer_Request_CommonRest:int=757;        /// [LP\PL] 请求执行CommonRest存储过程 LP:(utf8 db_IP_Name,int nWorldID)  PL:(byte: 0等待;1执行)
		public static const MsgId_CommonServer_Finish_CommonRest:int=758;         /// [LP\PL] 执行CommonRest存储过程成功 LP:(utf8 db_IP_Name,int nWorldID,byte:0失败, 1成功)  PL:()
		public static const MsgId_CommonServer_RegLS:int=759;                     /// [LP\PL] 有新的LS连接到公共服 LP:int nWorldID, byte nGameLevel, string szGSIP(LS对应的网关IP), uint16 nGSClientPort(LS对应的网关端口), uint16 nGSServerPort(LS对应的网关到逻辑服端口), string szDBSIP(LS对应的DBS IP), uint16 nDBServerPort(LS对应的DBS Port);  PL:(int nWorldID, byte nGameLevel, string szGSIP(LS对应的网关IP), uint16 nGSClientPort(LS对应的网关端口), uint16 nGSServerPort(LS对应的网关到逻辑服端口), string szDBSIP(LS对应的DBS IP), uint16 nDBServerPort(LS对应的DBS Port)
		public static const MsgId_CommonServer_GetLSList:int=760;                 /// [LP\PL] 获取注册的LS列表 LP:  PL: uint nSize, [int nWorldID, byte nGameLevel, string szGSIP(LS对应的网关IP), uint16 nGSClientPort(LS对应的网关端口), uint16 nGSServerPort(LS对应的网关到逻辑服端口), string szDBSIP(LS对应的DBS IP), uint16 nDBServerPort(LS对应的DBS Port)] * n
		public static const MsgId_CommonServer_NewAddMoney:int=761;               /// [LP\PL] 通知另外一个LS的玩家充值信息 LP: uint nActorID, uint nWorldID  PL: uint nActorID
		public static const MsgId_CommonServer_Request_DBRest:int=762;            /// [LD\DL] 逻辑服通知DB服执行Rest存储过程 LD:(int nWorldID) ；DL:(int nWorldID,byte:0失败, 1成功)
		public static const MsgId_CommonServer_PostData:int=763;                  /// [LP\PL] 通过CS转发LS<->LS的数据
		public static const MsgId_CommonServer_ServerRankData:int=764;            /// [PL\LP] 至尊天下活动数据（CS<->LS<->DBS) PL: (); LP: uint nWorldId, uint nType, uint nCount, [uint nActorId, uint nWizardId, const utf8* sName, uint nPoint]*n
		public static const MsgId_CommonServer_ServerRankRank:int=765;            /// [LP\PL] 至尊天下活动排行榜(CS<->LS<->DBS) LP: uint nWorldId, uint nType; PL: uint nType, uint nCount, [uint nActorId, uint nWorldId, uint nWizardId, const utf8* sName, uint nPoint]*n
		public static const MsgId_CommonServer_RefreshServerRank:int=766;         /// [LP] 逻辑服通知公共服，刷新至尊天下排行榜 LP: uint nWorldId

		// DB服务器
		public static const MsgId_DB_RecvData:int=801;                            /// [DL] DB服务器收到逻辑服的数据
		public static const MsgId_DB_Handshake:int=802;                           /// [LC] 逻辑服向DB服发送握手信息
		public static const MsgId_DB_PostDataLine:int=803;                        /// [LD\DL] 通过DBS转发LS<->LS的数据（指定分线ID)
		public static const MsgId_DB_OnlineData:int=804;                          /// [LD\DL] 通过DBS请求玩家是否在线
		public static const MsgId_DB_OnlineDataList:int=805;                      /// [LD\DL] 通过DBS请求玩家列表是否在线
		public static const MsgId_DB_PostDataSrv:int=806;                         /// [LD\DL] 通过DBS转发LS<->LS的数据（指定服务器ID）

		// 角色关系(好友/仇人)
		public static const MsgId_Relation_KillerUpdate:int=851;                  /// [LC] 增加/修改仇人 LC: byte nUpdateType(0增加;1修改), [ulong nActorId(角色ID), uint64 nUID, string szName, ushort nLevel(等级), byte nRace(种族), byte nIsOnline(0离线, 1在线), ushort nVipLv(VIP等级)]*n
		public static const MsgId_Relation_KillerDelete:int=852;                  /// [CL\LC] 删除仇人 CL: [ulong nActorId]*n  LC:[ulong nActorId]*n

		// 飞迁
		public static const MsgId_Flay_Info:int=901;                              /// [CL\LC] 飞迁信息 CL: LC:byte nState(0表示不可飞升,1表示可飞升), byte nOpenWindow(0表示默认, 1表示弹出窗体), uint nLimitTime(剩余飞升倒计时)
		public static const MsgId_Flay_RequestFlay:int=902;                       /// [CL\LC] 请求飞升 CL: LC:byte succuess(0请求成功,飞升开始; 1请求失败)

		// 战斗
		public static const MsgId_Battle_UseSkill:int=951;                        /// [CL\LC] 使用技能 CL: ulong skillId(技能ID), UID targetUid(目标UID), MapPos targetPos(目标位置), MapPos curClientPos(使用技能者的客户端当前位置坐标) LC: UID casterUid(施法者UID), ulong skillId(技能ID), UID targetUid(目标UID), MapPos targetPos(目标位置)
		public static const MsgId_Battle_CancelSkill:int=952;                     /// [LC] 中断技能(吟唱、引导等) LC: casterUid(施法者UID), ulong skillId(被中断的技能ID)
		public static const MsgId_Battle_SkillImpact:int=953;                     /// [LC] 技能生效 LC: UID casterUid(施法者UID), ulong skillId(技能ID), [UID targetUid(目标UID), byte result(技能结果: 0-闪避 1-命中 2-暴击 3-卓越攻击 4-防御), int value(数值，负值为扣血，正值为加血), ulong buffId(添加的BUFF索引), byte physicEffect(物理效果: 0-无 1-击退 2-击飞 3-击倒), MapPos deltaPos(偏移位置，有击退击飞效果时才填充该值)] * n
		public static const MsgId_Battle_AddBuff:int=954;                         /// [LC] 添加Buff LC: UID casterUid(施法者UID)，UID targetUid(目标UID), ulong buffId(BUFFID), ulong buffTime(BUFF时长,毫秒)
		public static const MsgId_Battle_RemoveBuff:int=955;                      /// [CL\LC] 移除(取消)Buff CL: ulong buffId, LC: UID uid(生物UID), [ulong buffId]*n
		public static const MsgId_Battle_BuffInfo:int=956;                        /// [LC] 生物身上的BUFF信息(从远走进使用) LC: [UID targetUid(目标UID), ulong buffId(BUFFID), ulong buffTime(BUFF时长,毫秒)]*n
		public static const MsgId_Battle_KillEntity:int=957;                      /// [CL] 直接某(搜检部件)死亡 CL: UID uid(搜检部件UID)
		public static const MsgId_Battle_AttrErrect:int=958;                      /// [LC] 属性变化效果 LC: UID targetUid(目标UID), byte nType(0为吸血; 1补血, 2扣血; 3抵消伤害), int value, UID useSkillOwner(施法者UID), int nValue2(抵消比例值)
		public static const MsgId_Battle_AddBuffExt:int=959;                      /// [LC] 通知某人获得Buff LC: ulong nTargetActorId(目标), ulong buffId, ulong buffTime(BUFF时长)
		public static const MsgId_Battle_RemoveBuffExt:int=960;                   /// [LC] 通知某人移除(取消)Buff LC: ulong nTargetActorId(目标), [ulong buffId]*n
		public static const MsgId_Battle_AttrChange:int=961;                      /// [LC] 玩家属性变化 LC: ulong nTargetActorId(目标), int nAttrId(属性ID), int value(变化值), int nValueMax(最大值)
		public static const MsgId_Battle_Auto:int=962;                            /// [CL\LC] 自动战斗 [CL] ; [LC] UID creatureUID
		public static const MsgId_Battle_CancelAuto:int=963;                      /// [CL\LC] 取消自动战斗 [CL] ; [LC] UID creatureUID
		public static const MsgId_Battle_PressKey:int=964;                        /// [CL] 客户端按下键盘某键 CL: byte nKey(0空格键), uint nX, uint nY
		public static const MsgId_Battle_Action:int=965;                          /// [LC] 通知客户端表现某动作 LC: UID entryUid(实体UID), byte nAction(动作)
		public static const MsgId_Battle_GatherEntity:int=966;                    /// [CL] 采集实体 CL: UID creatureUID(实体UID)
		public static const MsgId_Battle_HadAutoCollectLog:int=967;               /// [LC] 逻辑服通知客户端 有拾取蓝色配置物品 LC:
		public static const MsgId_Battle_AutoCollectLogInfo:int=968;              /// [CL\LC] 挂机10分钟后拾取蓝色品质物品信息 CL:    LC: [ulong nItemId, ulong nItemNum]*n
		public static const MsgId_Battle_OccupyEntity:int=969;                    /// [CL\LC] 玩家开始占领实体 CL: UID uid(实体的UID); LC: byte byTime(占领需要的时间，0表示占领失败), UID uid(实体的UID)
		public static const MsgId_Battle_EntityOccupyBroadcast:int=970;           /// [LC] 玩家占领实体广播 LC: UID uid(实体的UID), uint nActorId(角色ID), byte byTime(占领需要的时间), byte byBreak(是否被打断，1表示被打断)
		public static const MsgId_Battle_GatherEntityExt:int=971;                 /// [LC] 服务端通知采集实体 LC: byte nType(0取消采集,1开始采集)， UID creatureUID(实体UID), byte nType(0 表示 采集物品; 1表示到达某坐标侦查; 2表示到达寻宝目标点挖宝;13表示挖宝互动埋宝，14表示挖宝互动挖宝)
		public static const MsgId_Battle_PauseBuff:int=972;                       /// [LC] 暂停(取消暂停)Buff LC: byte nType(0取消暂停, 1暂停), byte nReason(暂停原因;0:野外双倍暂停), [ulong buffId, ulong buffTime(剩余BUFF时长,毫秒)]*n
		public static const MsgId_Battle_ComboNum:int=973;                        /// [CL] 客户端通知连击数 CL: uint nCombo(连击数)
		public static const MsgId_Battle_WarConcubineBuff:int=974;                /// [LC] 战姬技能buff效果 LC: byte nType(0为复活; 1自由之愿, 2野蛮抢夺), ulong nBuffId, uint nCD(豪秒)
		public static const MsgId_Battle_RollItemPanel:int=975;                   /// [LC] 场景里拾取物品,广播Roll选择面板 LC: UID nDropItemUID(掉落物品UID), byte nShow(0隐藏, 1显示), int nSecond(倒计时间 秒; nShow为0隐藏,此值无)
		public static const MsgId_Battle_RollItem:int=976;                        /// [CL] 玩家选择Roll选项 CL: UID nDropItemUID(掉落物品UID), byte nSelect(0需求,1贪婪,2放弃)

		// 战役(副本)
		public static const MsgId_Barrier_UpdateData:int=1001;                    /// [LC] 战役(单人副本)更新数据 [ulong nMapId(战役ID,即地图ID), byte nDayEnterNum(今日进入次数), byte nPass(是否已通关), byte bHasGetDayFirstPrize，byte bHasGetDayHistoryFirstPrize, byte byDayBuyTime(当天购买的次数)] * n
		public static const MsgId_Barrier_BarrierEnd:int=1002;                    /// [LC] 战役(单人副本)结束 LC: ulong nMapId, ulong nUsedTime(当前通关所用时间,秒数), ulong nFastTime(通关最快时间,秒数), byte nSuccess(0失败, 1成功)
		public static const MsgId_Barrier_ItemDrop:int=1003;                      /// [LC] 物品掉落 LC: [uint64 nItemUID, ulong nItemId, ulong nNum, int nPosX, int nPosX, ulong nOwnerActorId(不为0表示是拥有者是玩家), char* ownerName(拥有者), ulong nSafeTime(安全时间,此时间内非掉落物品主人不可拾取), ulong nLimitSecond(剩余的物品消失时间; 0表示不会消失)] * n
		public static const MsgId_Barrier_ItemCollect:int=1004;                   /// [CL\LC] 物品拾取 CL: [uint64 nItemUID]* n   LC: UID nPlayerUID(拾取者玩家UID), [uint64 nItemUID]* n
		public static const MsgId_Barrier_UpdateCondition:int=1005;               /// [LC] 副本完成某项条件 LC: [type nType(类型0,1,2), ulong nCondition(总数/物品ID/怪物ID), ulong nNum(当前完成数量)] * n
		public static const MsgId_Barrier_LeaveMap:int=1006;                      /// [CL] 离开副本 CL:
		public static const MsgId_Barrier_HallInfo:int=1007;                      /// [LC] 副本大厅信息 LC: [ulong nMapId(战役ID,即地图ID), byte nDayEnterNum(今日进入次数), byte nPass(是否已通关), byte bHasGetDayFirstPrize，byte bHasGetDayHistoryFirstPrize, byte byDayBuyTime(当天购买的次数)] * n
		public static const MsgId_Barrier_RoomList:int=1008;                      /// [CL\LC] 某多人副本的房间列表 CL: uint nMapId(地图ID), LC:uint nMapId(地图ID), [uint nRoomId(房间ID), uint nLeaderActorId(房主的角色ID), string strLeaderName(房主的角色名), uint nWorldId(游戏世界ID), int nConditionPower(房间的战斗力条件), byte nCurNum(当前人数), byte nMaxNum(最大人数), bool bFull(是否满了), bool bMyTeam(是否是我所在的队伍队长创建的房间), [byte bySkillSerie(技能系)]*nCurNum]*n 在玩家选择地图和有新建的房间时，都会发这条消息，收到的房间都是新的，直接添加在房间列表中，不要覆盖
		public static const MsgId_Barrier_RoomInfoChange:int=1009;                /// [LC] 房间信息列表变动 LC: uint nMapId(地图ID), [uint nRoomId(房间ID), bool bDelete(false更新当前人数), byte byCurNum(当前人数), int nConditionPower(房间的战斗力条件), [byte bySkillSerie(技能系)]*byCurNum]*n
		public static const MsgId_Barrier_RoomOwnerChange:int=1010;               /// [LC] 房主变化的房间列表 LC: uint nMapId(地图ID), [uint nRoomId(房间ID), string sLeaderName(房主角色名), uint nLeaderActorId(房主的角色ID), uint nWorldId(游戏世界ID)]*n
		public static const MsgId_Barrier_RoomCreate:int=1011;                    /// [CL] 创建多人副本房间 [CL] uint nMapId(地图ID), int nConditionPower(战斗力条件;0表示无条件), bool bFullAutoStart(是否满了自动开始)
		public static const MsgId_Barrier_RoomMemberInfoList:int=1012;            /// [LC] 房间的(某些)队员信息列表 [LC] uint nMapId(地图ID), uint nRoomId(房间ID),[uint nActorId(角色ID), string strActorName(角色名), uint nWorldId(游戏世界ID), uint nLevel(等级), uint nPower(战斗力), bool bLeader(是否是房主), bool bReady(是否准备就绪), uint nSkillSerie(技能系), uint nCamp(阵营), uint nWizard(精灵Id)]*n
		public static const MsgId_Barrier_RoomEnterRequest:int=1013;              /// [CL] 请求加入某多人副本房间 [CL] uint nRoomId(房间ID)
		public static const MsgId_Barrier_RoomOwnerSetRight:int=1014;             /// [CL\LC] 房主权限设置 [CL] bool bAutoStart(是否自动开始), int nConditionPower(战力条件); [LC] bool bAutoStart(是否自动开始), int nConditionPower(战力条件);
		public static const MsgId_Barrier_RoomOwnerKickMember:int=1015;           /// [CL] 房主踢人 [CL] uint nActorId(角色ID)
		public static const MsgId_Barrier_RoomBegin:int=1016;                     /// [CL\LC] 开始挑战;  [CL] (); [LC] bool bDirectEnter(true直接进入), int nTime(秒)
		public static const MsgId_Barrier_RoomListExist:int=1017;                 /// [CL\LC] 退出房间列表 [CL] ; [LC] uint nActorId(角色ID), byte nExistReason(0自己退出; 1被踢出)
		public static const MsgId_Barrier_RoomReadyEdit:int=1018;                 /// [CL\LC] 修改准备状态 [CL] bool bReady(true准备;false取消); [LC] uint nActorId, bool bReady(true准备;false取消)
		public static const MsgId_Barrier_RoomCreateForTeamLeader:int=1019;       /// [CL\LC] 队长创建房间 [CL] uint nMapId(地图ID); [LC] uint nMapId(地图ID), uint nRoomId(房间ID), string strLeaderName(队长的角色名)
		public static const MsgId_Barrier_RoomTeamLeaderEnterResponse:int=1020;   /// [CL] 队员同意/拒绝 [CL] uint nRoomId(房间ID), bool bAccept(true进入并准备; false拒绝)
		public static const MsgId_Barrier_HallClose:int=1021;                     /// [CL] 玩家关闭副本大厅窗口 CL:()
		public static const MsgId_Barrier_BuyEnterNum:int=1022;                   /// [CL] 购买副本进入次数 CL: ulong nMapId(战役ID,即地图ID)
		public static const MsgId_Barrier_TakePassReward:int=1023;                /// [CL\LC] 领取副本通关奖励 CL: ulong nMapId(战役ID,即地图ID), byte byType(0，首次通关礼包；1，每日通关礼包); LC: ulong nMapId, byte byType, byte byResult(1，成功；0，失败)
		public static const MsgId_Barrier_AbyssInfo:int=1024;                     /// [LC] 深渊副本更新数据 LC: ulong nCurMaxMapId(当前通关的地图ID，0表示没有通过的地图), byte byIsTodayFirstToken(今天是否是首次领奖), byte byTakenToday(今天是否领取过礼包)
		public static const MsgId_Barrier_MonsterEvent:int=1025;                  /// [LC] 副本内怪物特定事件通知 LC: byte byType(0，怪物死亡), UID uidMonster(怪物的UID)
		public static const MsgId_Barrier_AbyssEnd:int=1026;                      /// [LC] 深渊副本通关 LC: ulong nMapId
		public static const MsgId_Barrier_DoomStageInfo:int=1027;                 /// [CL\LC] 末日战场关卡信息 CL:(); LC: ulong nStageTotal(总关卡数), ulong nCurrentStage(当前关卡), ulong nMonsterTotal(总怪物数), uint nMonsterCount(当前剩余怪物数), uint nNextStageTime(距离下一关卡的时间，单位秒), byte byUpdateTime(是否更新下一关时间，0不更新)
		public static const MsgId_Barrier_RoomMemberInfoChange:int=1028;          /// [LC] 副本房间内玩家信息变化 uint nRoomId(房间ID), uint nActorId(角色ID), uint nLevel(等级), uint nPower(战斗力), uint nSkillSerie(技能系), uint nCamp(阵营), uint nWorldId(游戏世界ID)
		public static const MsgId_Barrier_RoomQuickJoin:int=1029;                 /// [CL] 玩家请求快速加入房间 CL: uint nMapId(地图ID)
		public static const MsgId_Barrier_CallJoin:int=1030;                      /// [CL] 副本招募(只有队长可招募) CL:byte nType(0队长招募，1房主招募), uint nMapId, uint nValue
		public static const MsgId_Barrier_GoddessStageInfo:int=1031;              /// [LC] 守卫女神的关卡信息 LC: ulong nStageTotal(总关卡数), ulong nCurrentStage(当前关卡), ulong nMonsterTotal(总怪物数), uint nMonsterCount(当前剩余怪物数), uint nNextStageTime(距离下一关卡的时间，单位秒), uint nClearStage(怪物清除的关卡)
		public static const MsgId_Barrier_GoddessTakeReward:int=1032;             /// [CL\LC] 守卫女神领取奖励 CL:uint nStage(要领取奖励的关卡); LC: uint nCurRewardStage(当前可以领奖励的关卡), uint nNewRewardStage(下一个可以领奖励的关卡)
		public static const MsgId_Barrier_FastestPlayer:int=1033;                 /// [CL\LC] 单人副本通关的最快玩家（深渊副本只发通过的最高层） [ulong nMapId(战役ID,即地图ID), uint nTime(通关时间), uint nActorId(通关最快的玩家ID), uint nCamp(玩家阵营), utf8* sName(角色名)] * n
		public static const MsgId_Barrier_FastestTeam:int=1034;                   /// [LC] 多人副本通关最快的队伍 LC: [ulong nMapId(战役ID,即地图ID), uint nTime(通关时间), uint nActorCount(玩家数量), [uint nActorId(通关最快的玩家ID), uint nCamp(玩家阵营), uint nWorldId(游戏世界ID), utf8* sName(角色名)]*nActorCount]*n
		public static const MsgId_Barrier_EnterXukong:int=1035;                   /// [CL] 进入虚空遗迹 CL: uint nMapId(地图Id)
		public static const MsgId_Barrier_ChessTotalRank:int=1036;                /// [CL\LC] 魔幻棋局更新总排行榜 CL: (); LC: [uint nActorId(角色ID), utf8* sName(角色名), uint nPoint(积分)]*n
		public static const MsgId_Barrier_ChessActorData:int=1037;                /// [LC] 魔幻棋局更新玩家数据 LC: uint nKillTotal(击杀数量), uint nExp(获得的经验), uint nGold(获得的金币), uint nPoint(积分), uint nPointHighest(历史最高积分)
		public static const MsgId_Barrier_ChessBuyBuff:int=1038;                  /// [CL] 魔幻棋局购买buff CL: uint nBuffId(Buff的ID)
		public static const MsgId_Barrier_ChessBuffDropTime:int=1039;             /// [LC] 魔幻棋局更新buff道具掉落时间 LC: uint nTimeLeft(距离下一次掉落的时间，单位秒)
		public static const MsgId_Barrier_AbyssTimes:int=1040;                    /// [LC] 深渊副本的次数 LC: uint nBattleNum(进入次数), uint nBuyNum(购买次数)
		public static const MsgId_Barrier_SceneTime:int=1041;                     /// [LC] 通知副本结束时间 LC: uint nTime(距离场景结束的时间，单位秒)
		public static const MsgId_Barrier_ChessMultiLine:int=1042;                /// [LC] 魔幻棋局多连时死亡的棋子 LC: uint nActorId(触发多连的玩家ID), [uint nCount(一连的棋子数), [UID uidMonster(棋子UID)]*nCount]*n
		public static const MsgId_Barrier_ChessSingleLine:int=1043;               /// [LC] 魔幻棋局单连时连的棋子 LC: uint nActorId(触发单连的玩家ID), [UID uidMonster(棋子UID)]*n
		public static const MsgId_Barrier_PassTimeInfo:int=1044;                  /// [LC] 副本最快通关时间和角色 LC: ulong nMapId(副本地图ID), ulong nFastTimeSelf(通关最快时间，单位秒), uint nFastTimeWorld(世界最快通关时间，单位秒), [utf8* sName(世界最快通关角色名), uint nWorld(游戏世界), uint ActorId(角色ID)]*n
		public static const MsgId_Barrier_TakeDuplicateReward:int=1045;           /// [CL] 副本通关时领取奖励（Map表中的Reward列） CL: ()
		public static const MsgId_Barrier_ChessPiecePoint:int=1046;               /// [LC] 魔幻棋局死亡棋子的分数 LC: [uint64 nUID(棋子UID), uint nPoint(棋子分数)]*n
		public static const MsgId_Barrier_GoddessBossTroop:int=1047;              /// [LC] 守卫女神副本boss和小兵信息 LC: uint nBossTime(Boss复活时间，0表示Boss没死), uint nTroopDead(死亡小兵数量)
		public static const MsgId_Barrier_GoddessAI:int=1048;                     /// [CL\LC] 守卫女神副本使用女神AI CL: uint nAIIndex(AI索引); LC: uint nCurAIIndex(当前生效的AI索引), uint nCDTime(当前生效AI的剩余时间)
		public static const MsgId_Barrier_GoddessHP:int=1049;                     /// [LC] 定时推送女神血量 LC: int64 nHPMax(女神最大血量), int64 nHPCur(女神当前血量)

		// 队伍
		public static const MsgId_Team_Create:int=1051;                           /// [CL\LC] 创建队伍 CL: 无; LC: bool success(是否创建成功)
		public static const MsgId_Team_ApplyJoin:int=1052;                        /// [CL\LC] 申请入队 CL: ulong LeaderActorId(队长的角色ID) LC: ulong ApplyerActorId(申请者角色ID), string ApplyerName(申请者名字), byte vocation(职业), byte level(等级)， ulong faceId(头像), ulong power(战力)
		public static const MsgId_Team_ReplyApplying:int=1053;                    /// [CL\LC] 答复申请入队 CL: ulong applyerActorId(申请者角色ID), bool agree(是否同意) LC:ulong leaderActorId(队长角色ID), string leaderName(队长角色名), byte result(申请结果：0-对方拒绝 1-对方同意 2-队伍人满 3-队伍不存在 4-自身已有队伍)
		public static const MsgId_Team_InviteJoin:int=1054;                       /// [CL\LC] 邀请入队 CL: ulong inviteeActorId(被邀请者角色ID) LC: ulong leaderActorId(队长角色ID), string leaderName(队长名字), byte vocation(职业), byte level(等级)， ulong faceId(头像), ulong power(战力)
		public static const MsgId_Team_ReplyInviting:int=1055;                    /// [CL\LC] 答复邀请入队 CL: ulong leaderActorId(队长角色ID), bool agree(是否同意) LC:ulong inviteeActorId(被邀请者角色ID), string inviteeName(被邀请者角色名), byte result(邀请结果：0-对方拒绝 1-对方同意 2-队伍人满 3-队伍不存在 4-被邀请者已有队伍 5-不是队长)
		public static const MsgId_Team_Kick:int=1056;                             /// [CL\LC] 踢出队伍 CL: teammateActorId(队员角色ID) LC: teammateActorId(队员角色ID)
		public static const MsgId_Team_Leave:int=1057;                            /// [CL\LC] 离开队伍 CL: 无 LC: teammateActorId(队员角色ID)
		public static const MsgId_Team_NewMember:int=1058;                        /// [LC] 新队员加入 LC: ulong actorId(角色ID), string name(角色名), byte vocation(职业), byte level(等级)， ulong faceId(头像), ulong curHp(当前生命), ulong maxHp(最大生命), bool isLeader(是否是队长)
		public static const MsgId_Team_UpdateMemberState:int=1059;                /// [LC] 队员状态更新 LC: ulong actorId(角色ID), byte state(0-离线 1-在线)
		public static const MsgId_Team_ChangeLeader:int=1060;                     /// [CL\LC] 队长变更 CL: ulong newLeaderActorId(新队长角色ID) LC: ulong newLeaderActorId(新队长角色ID)
		public static const MsgId_Team_Follow:int=1061;                           /// [CL] 跟随某队员(取消,不使用) LC: ulong nActorId
		public static const MsgId_Team_FollowCancel:int=1062;                     /// [CL] 取消跟随(取消,不使用) LC:
		public static const MsgId_Team_CallTogether:int=1063;                     /// [CL\LC] 召集队员 LC: ; LC: ulong leaderActorId(队长角色ID), string leaderName(队长名字), byte vocation(职业), byte level(等级)， ulong faceId(头像), ulong power(战力)
		public static const MsgId_Team_ReplyCallTogether:int=1064;                /// [CL] 答复召集 CL: bool agree(是否同意)
		public static const MsgId_Team_InviteJoinDuplicate:int=1065;              /// [LC] 邀请队员进入副本(取消,不使用) LC: ulong leaderActorId(队长角色ID), string leaderName(队长名字), ulong nMapId, string szDuplicateName(副本名称)
		public static const MsgId_Team_ReplyInviteDuplicate:int=1066;             /// [CL\LC] 答复邀请进入副本(取消,不使用) CL: ulong leaderActorId(队长角色ID), bool agree(是否同意) LC:ulong inviteeActorId(被邀请者角色ID), string inviteeName(被邀请者角色名), byte result(邀请结果：0-对方拒绝 1-对方同意 2-队员在个人副本里)
		public static const MsgId_Team_ApplyOrInvite:int=1067;                    /// [CL] 申请入队或邀请入队 CL: ulong nTargetActorId(对方的角色ID)
		public static const MsgId_Team_CallJoin:int=1068;                         /// [CL] 招募队员(只有队长可招募) CL:

		// 技能
		public static const MsgId_Skill_Update:int=1101;                          /// [CL\LC] 技能升级(学习) CL: ulong nSkillId    LC: ulong nSkillId(旧ID), ulong nNewId(新ID)
		public static const MsgId_Skill_ChangeSeries:int=1102;                    /// [CL\LC] 技能系变换 CL: byte nType(技能系类型; 三系: 0,1,2), [ulong nSkillId] * n; LC: byte nType(技能系类型; 三系: 0,1,2)
		public static const MsgId_Skill_MoveSeat:int=1103;                        /// [CL\LC] 技能栏技能换位(系统设置栏) CL: byte nSrcIndex(源位置), byte nTargetIndex(目标位置), byte nType(0表示是技能栏, 1表示系统设置栏)  LC: byte nSuccess(1成功), byte nType(0表示是技能栏, 1表示系统设置栏)
		public static const MsgId_Skill_Info:int=1104;                            /// [LC] 角色当前技能树的技能ID LC: byte nRace(种族), byte nVocation(职业,技能系), [ulong nSkillId, byte needLearn(0不需要学习, 1为需要学习)] * n
		public static const MsgId_Skill_SetSkill:int=1105;                        /// [CL\LC] 设置技能到技能栏 CL: uint nSkillId(技能ID), byte nTargetIndex(目标位置); LC: byte nSuccess(1成功)
		public static const MsgId_Skill_DeleteSkill:int=1106;                     /// [CL\LC] 技能栏卸载技能 CL: byte nIndex(位置); LC:  byte nIndex(位置)
		public static const MsgId_Skill_Colding:int=1107;                         /// [LC] 技能的剩余冷却时间 LC:[ulong nSkillId, ulong nColding(剩余冷却时间)]*n
		public static const MsgId_Skill_SysConfigSkep:int=1108;                   /// [LC] 系统设置技能栏信息 LC: [ulong nSkillId] * n   // 从左到右 (0表示空)
		public static const MsgId_SysConfig_Shortcut:int=1109;                    /// [CL\LC] 系统设置快捷键信息 LC: [int nKey, byte nFuncIndex] * n  CL:[int nKey, byte nFuncIndex] * n
		public static const MsgId_Skill_Rune_Info:int=1110;                       /// [LC] 技能符文信息 LC: uint nCount开放的符文数,[uint nSkillType 技能Type, uint nOpenCount技能对应开放的符文孔数，[uint nRuneBlessID(技能符文ID), uint nLv]*n  ]*n
		public static const MsgId_Skill_Rune_Grade:int=1111;                      /// [CL\LC] 技能符文升级 CL: uint nSkillType (技能Type), uint nRuneBlessID(技能符文ID，如果一键培养则为0), byte OneKey(0: 培养，1: 一键培养) LC: uint nSkillType (技能Type), byte OneKey(0: 培养，1: 一键培养) ,[uint nRuneBlessID(技能符文ID), uint nLv]*n
		public static const MsgId_Skill_Rune_Act:int=1112;                        /// [CL\LC] 技能符文激活 CL：uint nSkillType (技能Type), uint nRuneBlessID(技能符文ID) LC: uint nSkillType (技能Type), uint nRuneBlessID(技能符文ID)
		public static const MsgId_Skill_TmpSkill:int=1113;                        /// [CL\LC] 获得临时技能; LC：byte nType(0默认), uint nSkillId(技能ID), uint nBuffId; CL：byte nType(0默认), uint nSkillId(技能ID), uint nBuffId;
		public static const MsgId_Skill_OneKeyUpSkill:int=1114;                   /// [CL\LC] 一键技能升级(学习) CL: byte nSeries(技能系0-11) LC: byte nSuc(是否成功), [ulong nSkillId(旧ID), ulong nNewId(新ID)]*n

		// 称号系统
		public static const MsgId_Title_Update:int=1151;                          /// [CL\LC] 更新 CL:(); LC:uint nCurTitle, [uint nTitle, uint nExpTime]*n(nCurTitle为0表示没有使用称号，nTitle是所有获得的称号, nExpTime是过期时间)
		public static const MsgId_Title_PutOnOff:int=1152;                        /// [CL\LC] 请求佩带或卸下称号 CL:uint nTitle, byte byOnOff(0，卸下；1, 佩带); LC:uint nActorID, uint nCurTitle(当前使用的称号，0表示没有使用称号)
		public static const MsgId_Title_AddRemove:int=1153;                       /// [LC] 通知客户端获得或失去称号 LC:uint nTitle, uint nExpTime, byte byState(0，失去；1，获得)

		// 坐骑系统
		public static const MsgId_Ride_UpDown:int=1201;                           /// [CL] 上马/下马 CL: byte nState(0表示下马, 1表示上马),ushort nPhase(乘骑第几阶马)
		public static const MsgId_Ride_ChangeRide:int=1202;                       /// [LC] 上马/下马状态变化(通知场景所有人) LC: [UID creatureUID(角色Id), byte nState(0表示下马, 1表示上马), ushort nPhase(特殊坐骑: 当前显示乘骑的是第几阶,非特殊坐骑: 幻化ID),uint nFootprints(足迹Id), uint nStrap(挂饰Id)] *n
		public static const MsgId_Ride_Add:int=1203;                              /// [LC] 添加坐骑 LC: ushort nPhase(坐骑当前等阶), ushort nPhase(坐骑乘骑等阶),uint nBless(坐骑进阶当前祝福值),byte nState(0表示下马, 1表示上马)，int nFight(战斗力),uint nNums(数值培养数组数量),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(数值属性培养集合) ,uint nNums(比例培养数组数量),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(比例属性培养集合) ,[int nAttack(攻击),int nDefense(防御),int nCurHp(生命值),int nCrit(暴击),int nTenacity(韧性),int nAppendHurt(附加伤害值),int nOutAttack(卓越攻击),int nAttackPerc(攻击加成),int nLgnoreDefense(无视防御),int nAbsorbHurt(吸收伤害),int nDefenseSuccess(防御成功率),int nDefensePerc(防御加成),int nOutHurtPerc(减伤比例),int nVampire(吸血),int nMoveSpeed(移动速度)]*2(0、当前属性  1、下一阶属性)
		public static const MsgId_Ride_Info:int=1204;                             /// [LC] 角色当前坐骑信息 LC: ushort nPhase(坐骑当前等阶), ushort nPhase(坐骑乘骑等阶),uint nBless(坐骑进阶当前祝福值), uint nBlessExt(假数据),byte nState(0表示下马, 1表示上马)，int nFight(战斗力),uint nNums(数值培养数组数量),uint nSize(数值培养个数),  [byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(数值属性培养集合) ,uint nNums(比例培养数组数量),uint nSize(比例培养个数),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(比例属性培养集合)
		public static const MsgId_Ride_Train:int=1205;                            /// [CL\LC] 坐骑培养 CL: ushort nType(培养类型，Bless表的Type),byte nProperty(培养属性类型，服务端配置); LC: ushort nType(培养类型),byte nProperty(培养属性类型，服务端配置),uint nNum(培养次数)
		public static const MsgId_Ride_Grade:int=1206;                            /// [CL\LC] 坐骑进阶 CL: byte nOneKey(0普通进阶,1一键进阶); LC:  byte nSuccess(0失败，1成功),ushort nPhase(坐骑等阶),uint nBless(坐骑进阶当前祝福值), uint nBlessExt(假数据)
		public static const MsgId_Ride_AutoUpDown:int=1207;                       /// [LC] 坐骑自动上马状态 LC:byte nType(1自动上马状态，0取消自动上马状态)
		public static const MsgId_Ride_Flying:int=1208;                           /// [LC] 玩家正在飞翔(客户端需限制移动/使用技能/翻滚消息) LC:byte nFlying(0下飞骑;1上飞骑)
		public static const MsgId_Ride_SetChangeModel:int=1209;                   /// [CL\LC] 幻化 CL: int nChangeModelId(幻化ID)   LC: int nCurModelId(当前幻化ID)
		public static const MsgId_Ride_UpgradeChangeModel:int=1210;               /// [CL\LC] 升级幻化 CL: int nChangeModelId(幻化ID)   LC: int nChangeModelId(幻化ID), ushort nLevel(当前等级)
		public static const MsgId_Ride_ChangeModelInfo:int=1211;                  /// [LC] 幻化信息 LC: int nCurModelId(当前幻化ID) [int nChangeModelId(幻化ID), ushort nLevel(等级,0表示未激活)]*n
		public static const MsgId_Ride_ChangePower:int=1212;                      /// [LC] 坐骑战力变化 CL: uint nPower(战力)

		// 翅膀系统
		public static const MsgId_Wing_Showing:int=1251;                          /// [CL] 显示翅膀/隐藏翅膀 CL: byte nShow(0表示隐藏, 1表示显示),ushort nPhase(显示第几阶翅膀)
		public static const MsgId_Wing_ChangeWing:int=1252;                       /// [LC] 显示/隐藏状态变化(通知场景所有人) LC: [UID creatureUID(角色Id), byte nShow(0表示隐藏, 1表示显示), ushort nPhase(当前显示翅膀第几阶)] *n
		public static const MsgId_Wing_Add:int=1253;                              /// [LC] 添加翅膀 LC: ushort nPhase(翅膀当前等阶), ushort nPhase(翅膀显示等阶),uint nBless(翅膀进阶当前祝福值),byte nState(0表示隐藏, 1表示显示),int nFight(战斗力),uint nNums(数值培养数组数量),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(数值属性培养集合) ,uint nNums(比例培养数组数量),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(比例属性培养集合) ,[int nAttack(攻击),int nDefense(防御),int nCurHp(生命值),int nCrit(暴击),int nTenacity(韧性),int nAppendHurt(附加伤害值),int nOutAttack(卓越攻击),int nAttackPerc(攻击加成),int nLgnoreDefense(无视防御),int nAbsorbHurt(吸收伤害),int nDefenseSuccess(防御成功率),int nDefensePerc(防御加成),int nOutHurtPerc(减伤比例),int nVampire(吸血)]*2(0、当前属性  1、下一阶属性)
		public static const MsgId_Wing_Info:int=1254;                             /// [LC] 角色当前翅膀信息 LC: ushort nPhase(翅膀当前等阶), ushort nPhase(翅膀显示等阶),uint nBless(翅膀进阶当前祝福值), uint nBlessExt(假数据),byte nState(0表示隐藏, 1表示显示),int nFight(战斗力),uint nNums(数值培养数组数量),uint nSize(数值培养个数),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(数值属性培养集合) ,uint nNums(比例培养数组数量),uint nSize(比例培养个数),[byte nProperType(属性类型，服务端配置),uint nNum(培养数量),uint nBlessId(Bless表对应Id)]*n(比例属性培养集合)
		public static const MsgId_Wing_Train:int=1255;                            /// [CL\LC] 翅膀培养 CL: ushort nType(培养类型，Bless表的Type),byte nProperty(培养属性类型，服务端配置);; LC: ushort nType(培养类型),byte nProperty(培养属性类型，服务端配置),uint nNum(培养次数)
		public static const MsgId_Wing_Grade:int=1256;                            /// [CL\LC] 翅膀进阶 CL: byte nOneKey(0普通进阶,1一键进阶); LC:  byte nSuccess(0失败，1成功),ushort nPhase(坐骑等阶),uint nBless(坐骑进阶当前祝福值), uint nBlessExt(假数据)
		public static const MsgId_Wing_SetChangeModel:int=1257;                   /// [CL\LC] 幻化翅膀 CL: int nChangeModelId(幻化ID)   LC: int nCurModelId(当前幻化ID)
		public static const MsgId_Wing_UpgradeChangeModel:int=1258;               /// [CL\LC] 升级翅膀幻化 CL: int nChangeModelId(幻化ID)   LC: int nChangeModelId(幻化ID), ushort nLevel(当前等级)
		public static const MsgId_Wing_ChangeModelInfo:int=1259;                  /// [LC] 翅膀幻化信息 LC: int nCurModelId(当前幻化ID) [int nChangeModelId(幻化ID), ushort nLevel(等级,0表示未激活)]*n
		public static const MsgId_Wing_ChangePower:int=1260;                      /// [LC] 翅膀战力变化 CL: uint nPower(战力)

		// 阵营系统
		public static const MsgId_Camp_Join:int=1301;                             /// [CL] 加入阵营 CL: uint nCamp(0无阵营，1部落，2联盟); LC: uint nRecommendedCamp(推荐的阵营)// 要拉取推荐阵营时，就发个0
		public static const MsgId_Camp_Announce:int=1302;                         /// [CL] 发布阵营公告 CL: utf8* sText(公告内容)
		public static const MsgId_Camp_PostWanted:int=1303;                       /// [CL] 发布悬赏令 CL: uint nMoneyType(货币类型), uint nMoney(悬赏金额), uint nActorId(被通缉者ID), utf8* sText(悬赏说明)
		public static const MsgId_Camp_AcceptWanted:int=1304;                     /// [CL] 接受悬赏令 CL: uint64 nWantedId(悬赏令ID)
		public static const MsgId_Camp_RequestWantedPos:int=1305;                 /// [CL\LC] 请求悬赏令目标的信息 CL: uint64 nWantedId(悬赏令ID); LC: byte byOnline(是否在线), uint nMapId(目标所在地图ID), MapPos pos(目标坐标)
		public static const MsgId_Camp_RequestUpdate:int=1306;                    /// [CL] 更新阵营信息 CL: () 更新信息分几条发给客户端
		public static const MsgId_Camp_UpdateRank:int=1307;                       /// [LC] 更新阵营军衔详细信息 LC: byte byCamp(阵营), uint nAnnouceRank(可以发公告的军衔), [byte byRank(军衔), uint nCountByRank(该军衔的玩家数量)]*n(表中军衔的数量)
		public static const MsgId_Camp_UpdateMaster:int=1308;                     /// [LC] 更新师徒军衔信息 LC: [utf8* sName(角色名), uint nActorId, byte byRank(军衔), ushort wLevel(等级), uint nWizard(种族), uint nCredit(荣誉值), uint nFightPower(战斗力), byte byOnline(是否在线)]*1,(师父的军衔信息) uint nCount(徒弟的数量), [utf8* sName(角色名), uint nActorId, byte byRank(军衔), ushort wLevel(等级), uint nWizard(种族), uint nCredit(荣誉值), uint nFightPower(战斗力), byte byOnline(是否在线)]*nCount
		public static const MsgId_Camp_UpdateBattle:int=1309;                     /// [LC] 更新阵营战场信息 LC: byte byState(当前战场状态，0未开启，1可以进入，2已关闭), byte byWinner(获胜的阵营), [uint nActorId(角色ID), byte byRank(军衔), byte byPosition(排名), uint nWizardId(精灵Id), uint nLevel(角色等级), const utf8* sName(角色名), uint nDays(在位天数), uint nTitle(称号ID), uint nFightPower(战斗力), uint nBattleKill(战场击杀数), uint nArenaRank(个人竞技场排名), uint nWeaponLeft(左手武器ID), uint nWeaponRight(右手武器ID), uint nWeaponLevel(武器强化等级), uint nWingModelId(幻化翅膀ID), uint nRideModelId(幻化坐骑ID)]*n
		public static const MsgId_Camp_UpdateAnnounce:int=1310;                   /// [LC] 更新阵营公告信息 LC: [utf8* sName(角色名), uint nActorId(0表示系统发布的公告), byte byRank(军衔), uint nTime(发布时间), utf8* sText(发布内容)]*n
		public static const MsgId_Camp_UpdateExploit:int=1311;                    /// [LC] 更新阵营军功信息 LC: byte byCamp(阵营), [uint nActorId(本阵营玩家A的角色ID), utf8* sName(A的角色名), byte byRank(A的军衔), uint nMap(击杀的地图ID), uint nHostileId(敌对阵营的玩家B的角色ID), utf8* sHostile(B的角色名), byte byRankHostile(B的军衔)]*n
		public static const MsgId_Camp_UpdateWanted:int=1312;                     /// [LC] 更新本阵营的悬赏令信息 LC: byte byNumber(玩家当天发布悬赏令的数量), [uint64 nWantedId(悬赏令Id), uint nActorId(发布者的角色ID), utf8* sName(发布者角色名), uint nMoneyType(赏金货币类型), uint nMoney(赏金数量), uint nTime(到期时间), byte byState(0，未完成；1，已完成), utf8* sText(悬赏说明), uint nHostileId(被通缉者角色ID), utf8* sHostile(被通缉者角色名), uint nWizard(被通缉者种族ID), uint nHostileRank(被通缉者军衔), uint nHostileLvl(被通缉者等级), byte byHostileVIP(被通缉者VIP等级), byte byOnline(1在线，0不在线)]*n
		public static const MsgId_Camp_UpdateActorWanted:int=1313;                /// [LC] 更新该玩家的悬赏令信息 LC: byte byNumber(玩家当天发布悬赏令的数量), uint nCooldown(玩家接取悬赏令的冷却时间，单位秒，0表示不在冷却), uint64 nWantedId(悬赏令Id，0表示当前没有悬赏令), uint nActorId(发布者的角色ID), utf8* sName(发布者角色名), uint nMoneyType(赏金货币类型), uint nMoney(赏金数量), uint nTime(剩余时间), byte byState(0，未完成；1，已完成), utf8* sText(悬赏说明), uint nHostileId(被通缉者角色ID), utf8* sHostile(被通缉者角色名)
		public static const MsgId_Camp_UpdateActors:int=1314;                     /// [LC] 更新阵营玩家信息 LC: byte byCamp(阵营), byte byHasMore(是否还有玩家信息包，1表示有，0表示没有), [utf8* sName(角色名), uint nActorId, byte byRank(军衔), ushort wLevel(等级), uint nWizard(种族), uint nCredit(荣誉值), uint nFightPower(战斗力), byte byOnline(是否在线), byte byVIP(VIP等级)]*n
		public static const MsgId_Camp_GetMaster:int=1315;                        /// [CL] 拜师 CL: uint nMasterId(师父/徒弟的ActorId), uint nAction(徒弟发起时2；师父答复拒绝0，同意1); LC: uint nActorId(徒弟的ActorId), utf8* sName(徒弟的角色名) 徒弟C-L-师父C-L
		public static const MsgId_Camp_GetApprentice:int=1316;                    /// [CL] 收徒 CL: uint nMasterId(徒弟/师父的ActorId), uint nAction(师父发起时2；徒弟答复拒绝0，同意1); LC: uint nActorId(师父的ActorId), utf8* sName(师父的角色名) 师父C-L-徒弟C-L
		public static const MsgId_Camp_GreetMaster:int=1317;                      /// [CL\LC] 问候师父 CL: uint nYesOrNo(是否问候，0表示不问候，非0表示问候); LC: uint nActorId(导师角色ID), utf8* sName(导师角色名), uint nLevel(导师等级), uint nFightPower(导师战斗力), uint nMapId(导师所在地图), uint nWizard(种族) 服务端发包先发包通知客户端可以问候师父，然后客户端回复是否问候
		public static const MsgId_Camp_PresentApprentice:int=1318;                /// [CL\LC] 赠与徒弟 CL: uint nActorId(发送礼盒，徒弟的ActorId); LC: uint nActorId(徒弟角色ID), utf8* sName(徒弟角色名), uint nLevel(徒弟等级), uint nFightPower(徒弟战斗力), uint nMapId(徒弟所在地图), uint nWizard(种族) 服务端先发包通知客户端有徒弟发问候，如果师父赠与，客户端再回复
		public static const MsgId_Camp_MasterApprenticeInfo:int=1319;             /// [LC] 更新师徒信息 LC: uint nMasterId(师父的ActorId，0表示没有师父), utf8* sName(师父的角色名), [uint nApprenticeId(徒弟的ActorId), utf8* sApprenticeName(徒弟的角色名)]*n
		public static const MsgId_Camp_ApprenticeUpgrade:int=1320;                /// [CL\LC] 徒弟升级 CL: uint nCommentId(评价的Id); LC: uint nActorId(导师角色ID), utf8* sName(导师角色名), uint nLevel(导师等级), uint nFightPower(导师战斗力), byte byOnline(是否在线，1在线，0不在线), uint nMapId(导师所在地图), uint nWizard(种族) 服务端先发包通知客户端可以评价师父，客户端将评价结果发给客户端
		public static const MsgId_Camp_ApprenticeUpgradeMaster:int=1321;          /// [CL\LC] 徒弟升级给师父奖励 CL: uint nActorId(升级的徒弟ActorId); LC: uint nActorId(升级的徒弟ActorId), uint nCommentId(徒弟评价ID), uint nLevel(徒弟等级), utf8* sName(徒弟角色名), uint nFightPower(徒弟战斗力), uint nMapId(徒弟所在地图), uint nWizard(种族) 服务端先发包通知客户端有徒弟升级评价，师父领取时，客户端再回复
		public static const MsgId_Camp_RemoveApprenticeMaster:int=1322;           /// [CL] 解除师徒关系 CL: uint nActorId(徒弟解除填0；师父解除填徒弟ActorId)
		public static const MsgId_Camp_RecommendMasterApprentice:int=1323;        /// [CL\LC] 请求推荐师父或徒弟 CL: uint nMasterOrApprentice(0要师父，1要徒弟); LC: utf8* sName(角色名), uint nActorId, byte byRank(军衔), ushort wLevel(等级), uint nWizard(种族), uint nCredit(荣誉值), uint nFightPower(战斗力)
		public static const MsgId_Camp_EscortUpdate:int=1324;                     /// [LC] 更新押镖信息 LC: uint nEscortRemain(押镖剩余次数), uint nHijackRemain(劫镖剩余次数), uint nEscortLevel(当前的镖车档次，1-5，1是白色，5是橙色，0表示没有镖车), UID uidEscort(镖车的UID）
		public static const MsgId_Camp_EscortRefresh:int=1325;                    /// [CL\LC] 刷新镖车 CL: byte byType(0，免费，在第一次打开窗口时发送；1，花魔晶刷新；2，花金币刷新）; LC: uint nEscortLevel(刷到的镖车档次，1-5，1是白色，5是橙色）
		public static const MsgId_Camp_EscortSelect:int=1326;                     /// [CL] 选择镖车 CL: uint byFree(0，免费，选择刷到的镖车；1，花钱，直接选择最高级的镖车）
		public static const MsgId_Camp_EscortHelp:int=1327;                       /// [CL] 镖车被劫求助 CL: ()
		public static const MsgId_Camp_EscortFollow:int=1328;                     /// [CL] 角色跟随镖车 CL: byte byAction(1，跟随；0，停止); LC: byte byAction(1，跟随；0，停止)
		public static const MsgId_Camp_EscortPosition:int=1329;                   /// [LC] 更新镖车的位置 LC: UID uid(镖车UID), uint nMapId(地图ID), const MapPos& pos(位置)
		public static const MsgId_Camp_NewMasterApprentice:int=1330;              /// [LC] 获得新的导师或徒弟 LC: byte byType(0是新导师，1是新徒弟), uint nActorId(角色ID), utf8* sName(角色名)
		public static const MsgId_Camp_TakeRankReward:int=1331;                   /// [CL\LC] 玩家领取军衔奖励 CL: (); LC: byte byHasReward(是否有奖励可以领)
		public static const MsgId_Camp_BriefInfo:int=1332;                        /// [LC] 更新阵营概况 LC: uint nCamp(阵营), uint nLevel(阵营等级), uint64 nFightPower(总战力), uint nActorTotal(总人数), [uint nOrder(排名，1-5), uint nActorId(角色ID), byte byRank(军衔), uint nWizardId(精灵Id), uint nLevel(角色等级), const utf8* sName(角色名),uint nTitle(称号ID), uint nFightPower(战斗力), uint nArenaRank(个人竞技场排名), uint nWeaponLeft(左手武器ID), uint nWeaponRight(右手武器ID), uint nWeaponLevel(武器强化等级), uint nWingModelId(幻化翅膀ID), uint nRideModelId(幻化坐骑ID)]*n
		public static const MsgId_Camp_GrowthInfo:int=1333;                       /// [LC] 更新阵营成长信息 LC: uint nCamp(阵营), uint nLevel(等级), uint nContribution(个人捐献值), uint64 nMoney(总金币), int nExp(经验值)
		public static const MsgId_Camp_Donate:int=1334;                           /// [CL] 捐献阵营材料 CL: [uint nItemId(材料ID), uint nCount(数量)]*n
		public static const MsgId_Camp_DonationInfo:int=1335;                     /// [LC] 更新阵营的捐献信息 LC: uint nCamp(阵营), [uint nActorId(角色ID), uint nRank(军衔), utf8* sName(角色名), uint nItemId(物品ID), uint nCount(数量)]*n
		public static const MsgId_Camp_HeroTempleReward:int=1336;                 /// [CL\LC] 英雄圣殿奖励领取和信息更新 CL:(); LC: uint nRank(英雄圣殿排名，0表示没有排名), byte byRewardTaken(奖励是否已经领取，0没有领，1已领)
		public static const MsgId_Camp_EscortReward:int=1337;                     /// [LC] 资源护送获得的奖励 LC: uint nEscortLevel(镖车档次，1-5，1是白色，5是橙色）, [uint nItemId(物品ID), uint nCount(数量)]*n
		public static const MsgId_Camp_ActorInfo:int=1338;                        /// [CL\LC] 阵营角色信息 CL: uint nActorId(角色ID), uint nOp(操作码); LC: uint nActorId(角色ID), uint nOp(操作码), byte byFound(是否找到该玩家，0没找到), const utf8* sName(角色名), uint nCamp(阵营), uint nLevel(等级), uint nWizardId(生物ID), uint nVIPLv(VIP等级), uint nRank(军衔), byte byOnline(是否在线，0不在线)
		public static const MsgId_Camp_GroupEscortTime:int=1339;                  /// [LC] 玩家离开阵营护送镖车的时间 LC: uint nCamp(当前护送阵营), uint nTime(剩余返回时间，0表示回到镖车周围)
		public static const MsgId_Camp_GroupEscortEnd:int=1340;                   /// [LC] 阵营护送结束 LC: uint nCamp(当前护送阵营), byte bySucceed(是否护送成功，0表示失败，1成功), uint nPercent(最终奖励的百分比）, int nHit(对镖车的击打次数), int nDead(角色在镖车周围的死亡次数)
		public static const MsgId_Camp_GroupEscortPos:int=1341;                   /// [LC] 阵营护送的镖车位置 LC: uint nCamp(镖车归属阵营), UID uid(镖车UID), int nMapId(镖车所在地图), int x(镖车坐标X), int y(镖车坐标Y) , int nActors(镖车周围敌对玩家数量)
		public static const MsgId_Camp_GroupEscortReward:int=1342;                /// [CL\LC] 阵营护送奖励 CL: ();LC: int nFollowTime(玩家在镖车周围的时间)
		public static const MsgId_Camp_GroupEscortFollow:int=1343;                /// [CL\LC] 阵营护送跟随镖车 CL: byte byAction(1，跟随；0，停止); LC: byte camp(1混沌，2秩序)
		public static const MsgId_Camp_UpgradeRank:int=1344;                      /// [CL] 玩家升级军衔 CL: ()

		// 构装系统
		public static const MsgId_Package_Info:int=1351;                          /// [LC] 角色当前构装属性信息 LC: uint nFightPower(构装战力),int nAttack(攻击),int nDefense(防御),int nCurHp(生命值),int nCrit(暴击),int nTenacity(韧性),int nAppendHurt(附加伤害值),int nOutAttack(卓越攻击),int nAttackPerc(攻击加成),int nLgnoreDefense(无视防御),int nAbsorbHurt(吸收伤害),int nDefenseSuccess(防御成功率),int nDefensePerc(防御加成),int nOutHurtPerc(减伤比例),int nVampire(吸血)
		public static const MsgId_Package_PlugInfo:int=1352;                      /// [LC] 角色当前构装插件信息 LC: uint 激活的插件位数量, [byte 插件位置, ushort 插件等级，ushort 插件等阶，uint 插件等阶对应的Bless]*n  ,uint nFightPower(当前战力), uint nGroupNum(套装数量), [uint nPackageItemId(构装套装的物品Id),byte nGroup(构装套装当前等级),uint nSkillId(技能Id),byte nCount(插件数量),[byte nPos(插件位置),uint nItemId(物品Id)]*nCount]*nGroupNum
		public static const MsgId_Package_EquipPlug:int=1353;                     /// [CL\LC] 装备插件 CL:UID nItemUID(插件的物品UID)
		public static const MsgId_Package_GradePlug:int=1354;                     /// [CL\LC] 插件位进阶 CL: byte 插件位位置, byte bOneKey(是否自动进阶 0否，1是),byte bAutoBuy(是否自动购买 0否，1是); LC:byte 插件位位置, byte nSuccess(0失败，1成功),ushort 插件位等阶, uint nBless(插件进阶当前祝福值),byte bOneKey(是否自动进阶 0否，1是)
		public static const MsgId_Package_SetPackage:int=1355;                    /// [CL\LC] 选择构装套装 CL: uint nPackageItemId(当前构装套装的物品Id); LC:uint nPackageItemId(当前构装套装的物品Id)
		public static const MsgId_Package_GradePlugLv:int=1356;                   /// [CL\LC] 插件位升级 CL: byte 插件位位置, byte bAutoBuy(是否自动购买 0否，1是); LC:byte 插件位位置, ushort 插件位等级, byte nSuccess(0失败，1成功)

		// VIP系统
		public static const MsgId_VIP_Update:int=1401;                            /// [CL\LC] 角色当前的VIP信息 CL:(); LC: byte byVIPLevel(VIP等级), uint nVP(角色的VP值), byte byVIPDaily(VIP日享礼包，0, 还没领;1, 已经领了), [byte byVIPLevelPrize(0表示领，1表示已领)]*10, uint nCount(月卡种类数量), [byte byMonthCardLevel(月卡等级), uint nRemainTime(月卡剩余时间，以秒为单位，0表示没有开启), byte byDailyPrize(月卡日享礼包，0,还没领;1,已经领了), byte byTrial(是否是体验卡，1是体验卡)]*nCount,  uint nBuyTimes(购买次数)]*nCount,uint nRemainPresent(月卡赠送本周剩余次数)
		public static const MsgId_VIP_GetPrize:int=1402;                          /// [CL] 角色领取VIP或月卡礼包 CL: byte byType(1，VIP日享礼包；2，月卡；3，VIP等级礼包), byte byIndex(VIP等级礼包填1-10；月卡，填月卡等级1-3)
		public static const MsgId_VIP_BuyVIPCard:int=1403;                        /// [CL\LC] 角色购买VIP卡，自己用或赠送；赠送时服务器反馈是否成功 CL: byte byCardLevel(VIP卡等级1-3), int nDays(购买VIP卡天数（升级时不包括旧卡的天数）), byte byForSelf(是否自己用，1自己用，0赠送), utf8* sActor(接受的玩家名，自己用填""); LC: byte byResult(赠送VIP卡时返回结果，1表示成功，0表示失败)
		public static const MsgId_VIP_SysConfig:int=1404;                         /// [LC] VIP系统配置信息 CL: [byte nFlag(标记位), byte nState(0锁定,1开放)]*n
		public static const MsgId_VIP_AutoDecomposeTime:int=1405;                 /// [CL\LC] 自动分解装备的时间 CL:(); LC: int nCDTime(自动分解的冷却时间，单位秒。-1表示没有自动分解的权限)
		public static const MsgId_VIP_CardTime:int=1406;                          /// [LC] 通知VIP卡的时间 LC: int nLevel(VIP卡等级), byte byTrial(是否是体验卡，1是体验卡), int nLeftTime(剩余时间，0表示过期)
		public static const MsgId_VIP_BuyAllVIPCard:int=1407;                     /// [CL] 角色一次购买全部VIP卡 CL: ()
		// 通用活动系统
		public static const MsgId_Activity_Update:int=1451;                       /// [CL\LC] 获取活动的信息 CL:uint nAct(活动ID，0表示拉取所有活动的信息); LC: uint nAct(活动ID，0表示拉取所有活动的信息，1表示更新活动奖励计数),  [uint nAct(活动ID), byte byOpen(活动是否开启), byte byNew(活动是否显示“新”), uint nStart(开启时间，未开启就表示下一次开启的时间), uint nStop(结束时间，未开启就表示下一次开放时的结束时间), uint nLeftTime(距离活动结束或下一次开启的时间，以秒为单位), uint nPrizeLevelCount(奖励级别的数量), [byte byLevel(奖励的级别), int nValue1(MajorKey1当前的值), int nValue2(MajorKey2当前的值), int nValue3(MajorKey3当前的值),  [byte byIndex(物品的索引), byte byState(奖励状态，0不能领取，1,可以领取，2已领取), int nValue(MinorKey当前的值)]*5]*nPrizeLevelCount ]*n
		public static const MsgId_Activity_GetPrize:int=1452;                     /// [CL] 角色领取奖励 CL: uint nAct(活动ID), byte byLevel(级别), byte byIndex(物品索引，0表示这一级别的所有物品)
		public static const MsgId_Activity_PromotionsInfo:int=1453;               /// [CL\LC] 获取促销活动的信息 CL:uint nProId(促销ID，0表示拉取所有促销的信息);LC: [uint nProId(促销ID), byte byOpen(促销活动是否开启), uint nStart(开启时间，未开启就表示下一次开启的时间), uint nStop(结束时间，未开启就表示下一次开放时的结束时间), uint nLeftTime(距离活动结束或下一次开启的时间，以秒为单位), byte byState(奖励状态，0不能领取，1,可以领取，2已领取),uint nReceivedNum(已经领取奖励的人数)]*n
		public static const MsgId_Activity_GetProPrize:int=1454;                  /// [CL] 角色领取促销奖励 CL:uint nProId(领取奖励的促销ID);
		public static const MsgId_Activity_ClickAct:int=1455;                     /// [CL] 角色查看了某个活动（不再显示为新） CL:uint nAct(活动ID)
		public static const MsgId_Activity_StatusUpdate:int=1456;                 /// [LC] 更新活动状态 LC: uint nNow(当前时间), uint nActId, uint nStatus(活动状态，0未开启，1等待，2已开启), uint nTime(时间单位秒，nStatus=0时为0，nStatus=1时是离开始的时间，nStatus=2时是距离活动结束的时间)
		public static const MsgId_Activity_WorldOpenTime:int=1457;                /// [LC] 游戏世界开服时间 LC: uint nWorldOpenTime(服务器的开服时间)
		public static const MsgId_Activity_StatusUpdateAll:int=1458;              /// [LC] 更新活动状态 LC: uint nNow(当前时间), [uint nActId(活动ID), uint nStatus(活动状态，0未开启，1等待，2已开启), uint nTime(时间单位秒，nStatus=0时为0，nStatus=1时是离开始的时间，nStatus=2时是距离活动结束的时间)]*n
		public static const MsgId_Activity_MicroLoginReward:int=1459;             /// [CL\LC] 领取微端登陆的奖励 CL:(); LC: byte byTaken(0表示今天还没有领取，1表示今天已经领取)
		public static const MsgId_Activity_ExchangeInfo:int=1460;                 /// [CL\LC] 超值兑换活动,卡牌大兑换,卡牌大收集活动信息 CL: uint活动ID  LC: uint活动ID, uint nCount, [uint 兑换ID， uint 已兑换次数， int 总兑换次数（-1 无次数限制,0 不能兑换)]*nCount
		public static const MsgId_Activity_Exchange:int=1461;                     /// [CL\LC] 超值兑换活动,卡牌大兑换,卡牌大收集活动兑换或收集 CL: uint活动ID, uint 兑换ID  LC: uint活动ID, uint 兑换ID, uint 已兑换次数
		public static const MsgId_Activity_ServerRank:int=1462;                   /// [CL\LC] 至尊天下活动排名 CL: uint nType（排行榜类型，1-7：总积分、魔晶、荣誉、精华、星空、虚空、物资）, uint nStart(排名起始), uint nEnd(排名终止); LC: uint nType(排行榜类型), uint nStart(排名起始), [uint nActorId(角色ID), uint nWorldId(游戏世界ID), uint nWizardId(生物ID), utf8* sName(角色名), uint nPoint(积分)]*n
		public static const MsgId_Activity_ServerRankInfo:int=1463;               /// [CL\LC] 至尊天下活动玩家信息 CL: (); LC: uint nUpdateTime(距离下次更新的时间), [uint nType(排行榜类型), uint nRank(排名，0未上榜), uint nPoint(积分), uint nActorId(排名第一的玩家角色ID), uint nWorldId(游戏世界ID), uint nWizardId(生物ID), utf8* sName(角色名), uint nPoint(第一的积分)]*n
		public static const MsgId_Activity_Entries:int=1464;                      /// [LC] 更新活动表 LC: uint nCount(活动数量), [uint nActId(活动ID), ...]*nCount(按activity表的顺序，string和int[]格式的都是utf8*，其他的是int)
		public static const MsgId_Activity_NextOpenTime:int=1465;                 /// [LC] 活动的下次开放时间 LC: [uint nActId(活动ID), uint nTime(下一次开放时间)]*n
		public static const MsgId_Activity_OpenEffect:int=1466;                   /// [LC] 活动开放的效果 LC: [uint nEffectId(效果编号), int nParam(参数)]*n // 1,降低装备强化宝石消耗的百分比；2,降低坐骑进阶宝石消耗的百分比；3,降低翅膀进阶宝石消耗的百分比；4,降低血脉进阶宝石消耗的百分比。
		public static const MsgId_Activity_ActExchangeEntries:int=1467;           /// [LC] 更新活动兑换表 LC: uint nCount(活动兑换数量), [uint nId(兑换ID), uint nActId(活动ID), utf8* sDirection(兑换条件说明), int nType(兑换类型), int nTimes(次数), int nDisplayPriority(显示级别), utf8* sCondition(条件), utf8* sReward(兑换)]*nCount(按activityexchange表的顺序，string和int[]格式的都是utf8*，其他的是int)

		// 血脉系统
		public static const MsgId_Blood_Info:int=1501;                            /// [LC] 角色当前血脉信息 LC: uint nSelBloodId(当前选择的血脉Id),[uint nBloodId(激活的血脉Id),uint nBless(血脉当前祝福值),uint nGradeId(血脉当前的等阶Id),uint nStarNum(当前阶点亮的星星数目),uint nLastGradeId(血脉上阶Id，没有就为0)]* n
		public static const MsgId_Blood_Activation:int=1502;                      /// [CL\LC] 血脉激活 CL: uint nBloodId(血脉激活ID); LC: uint nBloodId(血脉激活ID),byte bSuccess(0失败，1成功)
		public static const MsgId_Blood_Refining:int=1503;                        /// [CL\LC] 血脉碎炼 CL: uint nBloodId(血脉当前等阶ID), uint nRefiningId(血脉碎炼ID),byte nAuto(0非自动，1自动碎炼),byte nClick(0 点星，1 点培养);  LC: uint nBloodId(血脉当前等阶ID),byte bSuccess(0失败，1成功),uint nExp(失败返回的经验) ,[uint nRefiningId(血脉碎炼当前ID)]*n
		public static const MsgId_Blood_Grade:int=1504;                           /// [CL\LC] 血脉进阶 CL: uint nBloodId(血脉当前等阶ID),byte nOnekey(0非一键进阶，1一键进阶),byte nAutoBuy(0不自动购买材料，1自动购买材料); LC:uint nBloodId(血脉对应的激活Id),uint nId(血脉当前等阶ID), byte nSuccess(0失败，1成功),uint nBless(当前祝福值),uint nLastGradeId(血脉上阶Id，没有就为0),byte nOnekey(0非一键进阶，1一键进阶)
		public static const MsgId_Blood_SetBloodId:int=1505;                      /// [CL] 选择当前血脉 CL: uint nBloodId(当前选择的血脉Id)
		public static const MsgId_Blood_FightPower:int=1506;                      /// [LC] 血脉战斗力变化 LC: uint nFightPower(血脉当前战斗力)
		public static const MsgId_Blood_PetInfo:int=1507;                         /// [LC] 血脉宠物信息 LC: uint nBloodType(血脉类型40-48), uint nPetId(宠物ID), uint nLevel(等级), uint nExp(当前经验值), uint nStar(星级), uint nStarBless(升星祝福值), string szName(宠物名称;没有修改,则为空字符串), uint nPower(战力值),ushort nSkillCount(主动技能数量), [uint nSkillId(技能ID), ushort nLv(技能等级), ulong nItem(对应的物品ID)]*n, ushort nAttrCount(被动属性数量),  [ushort nAttrId(属性类型), short nLv(等级), ulong nItem(对应的物品ID)] * n
		public static const MsgId_Blood_PetSkillUpgrade:int=1508;                 /// [CL\LC] 宠物主动技能升级 CL: uint nPetId(宠物ID), uint nSkillId(技能ID)   LC:uint nPetId(宠物ID), uint nSkillId(技能ID), ushort nLv(当前等级), uint nReplaceSkillId(被替换的技能ID，无则为0), ushort nReplaceLv(被替换的技能对应等级)
		public static const MsgId_Blood_PetAttrUpgrade:int=1509;                  /// [CL\LC] 宠物被动技能升级 CL: uint nPetId(宠物ID) LC:uint nPetId(宠物ID), ushort nAttrId(被动属性ID), ushort nLv(当前等级), uint nPower(战斗力)
		public static const MsgId_Blood_PetStarUpgrade:int=1510;                  /// [CL\LC] 宠物升星 CL: uint nPetId(宠物ID), byte nOnekey(1一键进阶),byte nAutoBuy(1自动购买材料)  LC: uint nPetId(宠物ID), uint nStar(当前星级), uint nStarBless(祝福值), uint nPower(战斗力)
		public static const MsgId_Blood_PetLevelUpgrade:int=1511;                 /// [CL\LC] 宠物升级 CL:uint nPetId(宠物ID), int nItemId(消耗物品ID), byte bOneKey(是否一键喂养; 1一键)  LC: UID nOwnerUID(拥有者UID), uint nPetId(宠物ID), uint nLevel(当前等级), uint nExp(当前经验值), uint nPower(战斗力)
		public static const MsgId_Blood_PetChangeName:int=1512;                   /// [CL\LC] 宠物修改名称 CL: uint nPetId(宠物ID), string nName(名称);    LC: uint nPetId(宠物ID), string nName(名称)
		public static const MsgId_Blood_PetJoinBattle:int=1513;                   /// [CL\LC] 宠物参战或休息 CL: uint nPetId(宠物ID), byte nJoin(0休息,1参战);  LC: uint nPetId(宠物ID), byte nJoin(0休息,1参战)
		public static const MsgId_Blood_PetPower:int=1514;                        /// [LC] 宠物战力改变 LC: uint nPetId(宠物ID), uint nPower(战斗力)
		public static const MsgId_Blood_BloodValue:int=1515;                      /// [LC] 血气值变化 LC: uint nBloodVal(血气值), uint nBloodValMax(最大血气值), byte nPopBloodAttach(0 不弹购买血气上限框，1 弹购买血气上限框)
		public static const MsgId_Blood_PetReviveInfo:int=1516;                   /// [LC] 宠物复活信息 LC：[uint nPetId(宠物ID),uint nReviveTime(复活时间)]*n
		public static const MsgId_Blood_PetBloodPoolValue:int=1517;               /// [LC] 血脉宠物血池血量变化 LC: uint nCurPetBloodPoolVal(当前血池血量)，uint nMaxPetBloodPoolVal(血池最大容量),uint nPoolItemId(血池对应ItemId)
		public static const MsgId_Blood_PetAttackType:int=1518;                   /// [CL\LC] 血脉宠物攻击方式 CL: byte nType(0: 被动 1： 主动) LC:byte nType(0: 被动 1： 主动)
		public static const MsgId_Blood_PetMaster:int=1519;                       /// [LC] 宠物大师增加宠物属性 LC: uint nBuffId(宠物大师BuffId, 为0取消出战宠物增加的属性)

		// 送礼系统
		public static const MsgId_Gift_Send:int=1551;                             /// [CL] 角色送礼 CL: UID uid(物品的GUID), uint nCount(物品数量), utf8* sActorName(对方的角色名)
		public static const MsgId_Gift_Notify:int=1552;                           /// [LC] 通知玩家收到礼物 LC: UID uidIndex(礼物的编号), uint nActorId(送礼者的ActorId), uint nItemId(物品ID), uint nCount(物品数量), utf8* sActorName(送礼者的角色名)
		public static const MsgId_Gift_Open:int=1553;                             /// [CL\LC] 角色打开礼物 CL: UID uidIndex(礼物的编号); LC: UID uidIndex(礼物的编号), byte byResult(1领取成功，0领取失败)
		public static const MsgId_Gift_Update:int=1554;                           /// [CL\LC] 更新角色的送礼信息 CL:(); LC: uint nTimesMax(最大的送礼次数), uint nTimesRemain(剩余的送礼次数), uint nBuyTimes(购买的次数)
		public static const MsgId_Gift_BuyTime:int=1555;                          /// [CL] 购买送礼次数 CL:()

		// 快捷键系统
		public static const MsgId_Shortcuts_SetInfo:int=1601;                     /// [LC] 快捷健消息 LC: [int nKey, byte nFuncIndex] * n  CL:[int nKey, byte nFuncIndex] * n
		public static const MsgId_SysConfig_Value:int=1602;                       /// [CL\LC] 系统设置保存数字信息 LC: [byte nFuncIndex, int nVal] * n  CL:[byte nFuncIndex, int nVal] * n

		// 排行榜系统
		public static const MsgId_Leaderboard_FightPower:int=1651;                /// [CL\LC] 战斗力排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nFightPower(战斗力),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Level:int=1652;                     /// [CL\LC] 等级排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nLevel(等级),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Ride:int=1653;                      /// [CL\LC] 坐骑排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nRideLevel(坐骑等阶),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Wing:int=1654;                      /// [CL\LC] 翅膀排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nWingLevel(翅膀等阶),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Package:int=1655;                   /// [CL\LC] 构装排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nPackageLevel(构装总等阶),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Blood:int=1656;                     /// [CL\LC] 血脉排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nFightPower(血脉总战力),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Gem:int=1657;                       /// [CL\LC] 宝石排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nGemLevel(宝石等级和),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Boss:int=1658;                      /// [CL\LC] 野外BOSS排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nNum(野外BOSS击杀数),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Honor:int=1659;                     /// [CL\LC] 荣誉排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nHonor(荣誉总数),uint nArmyLevel(军衔),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Achieve:int=1660;                   /// [CL\LC] 成就排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nAchieve(成就权重),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Update:int=1661;                    /// [LC] 排行榜已更新 LC:byte nType(排行榜类型),byte nUpdate(1，排行榜已更新)
		public static const MsgId_Leaderboard_ActorInfo:int=1662;                 /// [CL\LC] 获取用户外观信息 CL:uint nPlayerId(用户Id);LC:uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nTitleId(玩家称号id),uint nWeapon(玩家武器ItemId),uint RideGrade(坐骑等阶),uint WingGrade(翅膀等阶)
		public static const MsgId_Leaderboard_Abyss:int=1663;                     /// [CL\LC] 深渊排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nChapter(深渊关卡数，从1开始),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_Fortress:int=1664;                  /// [CL\LC] 要塞排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nFortressLevel(要塞等级和),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Bossfight_Info:int=1665;                        /// [CL\LC] BOSS争夺显示信息 CL:;LC:[uint nBossId(世界BOSSId)，uint nActorId(最后一个击杀BOSS的玩家Id),utf8 szName(最后一个击杀BOSS的玩家呢称)，int nRefTime(刷新倒计时，0已刷新，-1获取时间失败)]*n
		public static const MsgId_Leaderboard_BarrierChess:int=1666;              /// [CL\LC] 魔幻棋局排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nBarrierChessPoint(魔幻棋局积分),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_QuizScore:int=1667;                 /// [CL\LC] 答题排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nQuizScore(答对的题目总数),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_HandBook:int=1668;                  /// [CL\LC] 图鉴排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nHandBookFight(图鉴战力),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_WeaponSoul:int=1669;                /// [CL\LC] 器魂排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nWeaponSoulFight(器魂战力),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n
		public static const MsgId_Leaderboard_WarCb:int=1670;                     /// [CL\LC] 战姬排行榜 CL:uint nFirst(1首次获取数据),LC:byte nUpdate(是否更新数据0不更，1更新),uint nMyRank(玩家当前排名,0没有排名),[uint nRank(排名，从1开始),uint nPlayerId(用户Id),utf8* nName(用户昵称),byte nRace(种族),byte nCamp(阵营),uint nWarCbFight(战姬战力),byte nYellowVipType, byte nYellowVipLv, byte nVipLevel(Vip等级)]*n

		// 投资系统
		public static const MsgId_Investment_Info:int=1701;                       /// [LC] 投资信息 LC:[uint nId(投资Id), int nRewardIndexMax(当前可领返利的最大索引), int nRewardCount(已经领取返利的次数), [byte byRewardIndex(已经领取返利的索引（从1开始）)]*nRewardCount]*n
		public static const MsgId_Investment_Invest:int=1702;                     /// [CL] 购买投资产品 CL:nId(投资Id)
		public static const MsgId_Investment_Reward:int=1703;                     /// [CL\LC] 领取返利 CL: int nId(投资Id),int nIndex(领取的索引); LC: uint nId(投资Id), int nRewardIndexMax(当前可领返利的最大索引), int nRewardCount(已经领取返利的次数), [byte byRewardIndex(已经领取返利的索引（从1开始）)]*nRewardCount

		// 交易系统
		public static const MsgId_Transactions_Request:int=1751;                  /// [CL\LC] 请求交易 CL:uint nActorId(对方玩家Id) LC:uint nActorId(发送交易的玩家Id),utf8* nName(发送交易的用户昵称)
		public static const MsgId_Transactions_Recv:int=1752;                     /// [CL\LC] 接收交易请求 CL:byte nStatus(0取消交易，1接收交易),uint nActorId(接收发送交易请求的玩家Id) LC:uint nActorId(对方玩家Id),utf8* nName(对方用户昵称),byte nRace(对方种族),ushort nLevel(对方等级)
		public static const MsgId_Transactions_Add:int=1753;                      /// [CL\LC] 往交易栏添加物品 CL:uint nSkepId(物品在背包栏所在的位置，从0开始) CL:byte bType(0自己的物品，1对方的物品),uint nSkepId(交易栏的位置，从0开始) ,[AttrList aItem]*n(交易的物品属性，第一个是装备，后面的是宝石)
		public static const MsgId_Transactions_Remove:int=1754;                   /// [CL\LC] 从交易栏移除物品 CL:uint nSkepId(交易栏的位置，从0开始) CL:byte bType(0自己的物品，1对方的物品),uint nSkepId(交易栏的位置，从0开始)
		public static const MsgId_Transactions_Cancel:int=1755;                   /// [CL\LC] 取消交易 LC:byte nRes(0取消交易，1交易成功)
		public static const MsgId_Transactions_Confirm:int=1756;                  /// [CL\LC] 交易确认 LC:byte nObj(0自己，1对方)
		public static const MsgId_Transactions_Lock:int=1757;                     /// [CL\LC] 交易锁定 CL::byte nstatus(0解锁，1锁定)， LC:byte nstatus(0解锁，1锁定)，byte nObj(0自己，1对方)
		public static const MsgId_Transactions_AddMoney:int=1758;                 /// [CL\LC] 往交易栏添加魔金 CL:uint nMoney(魔金数量) CL:byte bType(0自己的物品，1对方的物品),uint nMoney(魔金数量)

		// 摆摊系统
		public static const MsgId_Stall_ChangeStall:int=1801;                     /// [LC] 摊位状态变化(通知场景所有人) LC: byte nState(0表示关闭摆摊，发送给正在查看摊位的玩家)
		public static const MsgId_Stall_AddItem:int=1802;                         /// [CL\LC] 摊位栏上添加物品 CL:UID nItemUID(物品UID),int nNum(数量), int nMoney(出售单价) ,uint nSkepId(摆摊栏位置); LC:UID nItemUID(出售的物品UID),int nMoney(出售单价)
		public static const MsgId_Stall_DeleteItem:int=1803;                      /// [CL\LC] 从摊位栏下架物品 CL:UID nItemUID(下架的物品UID) LC:UID nItemUID(下架的物品UID)
		public static const MsgId_Stall_UpdateItem:int=1804;                      /// [CL\LC] 更改摊位栏物品售价 CL:UID nItemUID(摊位栏物品UID), int nMoney(新的价格) LC:UID nItemUID(摊位栏物品UID), int nMoney(新的价格)
		public static const MsgId_Stall_Stall:int=1805;                           /// [CL\LC] 开启,关闭摆摊 CL:byte bStatus(0关闭摆摊，1开始摆摊); LC:byte bStatus(0关闭摆摊，1开始摆摊),utf8* szName(摊位名称)
		public static const MsgId_Stall_SetStallName:int=1806;                    /// [CL\LC] 设置摊位昵称 CL:byte nType(0读取，1修改)，utf8* szName(摊位昵称); LC:byte nType(0默认，1修改)，utf8* szName(摊位昵称)
		public static const MsgId_Stall_FindActorId:int=1807;                     /// [CL\LC] 查看玩家摊位 CL:uint nActorId(玩家Id)，byte bStatus(0关闭，1查看) LC:uint nActorId(玩家Id)，utf8* szName(玩家名称)，uint nRace(玩家种族), utf8* szStallName(摊位名称)，uint nSkepNum（摊位栏最大数）,uint nSize(物品数量),[uint nSkepNum(摊位栏序号),AttrList aItem(物品属性)]*n,[AttrList aItem(宝石物品属性)]*n
		public static const MsgId_Stall_FindItemMoney:int=1808;                   /// [CL\LC] 查看物品单价 CL:uint nActorId(玩家Id)，[uint64 nItemUID(物品唯一UID)]*n; LC:[uint64 nItemUID(物品唯一UID),uint nMoney(物品单价)]*n
		public static const MsgId_Stall_Buy:int=1809;                             /// [CL\LC] 购买摊位栏上的物品 CL:uint nActorId(摆摊的玩家Id),uint nNum(购买的物品数量),uint nMoney(购买的总价格),UID nItemUID(物品UID),UID nSlot1(第一个孔位) ,UID nSlot2(第二个孔位) ,UID nSlot3(第三个孔位) ,UID nSlot4(第四个孔位) ,ushort nStrong(强化等级),ushort nIdentify(鉴定等级),ushort nRecoin(重铸等级);LC:utf8* szActorName(购买者昵称), int nBuyMoney(购买者花费魔金),utf8* szItemName(物品名称)，int nNum(物品数量) ,int nPro(扣税比例),int nMoney(实际所得魔金),uint nTime(购买时间),byte bQuality(品质)
		public static const MsgId_Stall_ChangeItem:int=1810;                      /// [LC] 玩家修改摆摊栏物品时，更新给正在查看的玩家 LC:byte nType(0上架，1下架，2修改数量)，uint nSkepNum(摊位栏序号),uint nNum(数量),uint nMoney(价格), AttrList aItem(物品属性),[AttrList aItem(宝石物品属性)]*n
		public static const MsgId_Stall_ItemMoney:int=1811;                       /// [LC] 初始化物品价格信息 LC:[UID nItemUID(出售的物品UID),int nMoney(出售单价)]*n

		// 竞技场系统
		public static const MsgId_Arena_Order:int=1851;                           /// [LC] 竞技场排名发给玩家 LC: [uint nActorId(角色Id), utf8 szName(角色名), uint nOrder(排名), uint nWizarId(精灵Id),uint race(种族),uint angle(角度), uint x(X坐标),uint y(Y坐标),uint nSize(模型大小), uint power(战斗力), uint lv(等级), uint weaponLeft(角左手武器),uint weaponRight(右手武器),uint weaponStrongLv(强化等级) , uint camp(阵营),uint armyLevel(军衔等级)]*n
		public static const MsgId_Arena_Challenge:int=1852;                       /// [CL\LC] 挑战玩家 CL:uint nActorId(玩家Id) LC:uint nTime(倒计时时间,0表示开始),uint nEndTime(竞技场战斗时间)
		public static const MsgId_Arena_ChallengeRes:int=1853;                    /// [LC] 挑战结束 LC:uint nOrder(最新排名), byte nSuccess(0失败, 1成功)，uint nTime(关闭面板倒计时时间),uint nIndId(奖励Id)
		public static const MsgId_Arena_BuyTimes:int=1854;                        /// [CL\LC] 竞技场购买信息 CL:byte ntype(0购买次数,1清除时间);LC:uint nCount(挑战剩余次数),uint nTimes(下次挑战倒计时时间),uint nOrder(我的排名),uint nReward(我的奖励Id),byte bReceive(是否领取了奖励:0未领取，1已领取),uint nBuyCountMoney(下次购买价格，0次数已买完),ushort nBuyCount(剩余购买次数)
		public static const MsgId_Arena_OrderInfo:int=1855;                       /// [CL\LC] 竞技场面板排名信息 LC: [uint nActorId(角色Id), utf8 szName(角色名), uint nOrder(排名), uint nWizarId(精灵Id),uint race(种族)，uint power(战斗力), uint lv(等级), uint weaponLeft(角左手武器),uint weaponRight(右手武器),uint weaponStrongLv(强化等级) , uint camp(阵营),uint armyLevel(军衔等级)]*n
		public static const MsgId_Arena_FindReward:int=1856;                      /// [CL\LC] 查询排名奖励 CL:uint nReward(奖励Id);LC: uint nReward(奖励Id),[uint nActorId(角色Id), utf8 szName(角色名), uint nOrder(排名), uint power(战斗力), uint lv(等级)]*n
		public static const MsgId_Arena_ReceiveAwards:int=1857;                   /// [CL] 领取排名奖励
		public static const MsgId_Arena_Records:int=1858;                         /// [CL\LC] 获取挑战记录 LC: [byte nType(类型 0:发动挑战,1:被挑战),uint nTime(挑战时间),byte bSuccess(结果0:挑战失败,1挑战成功)，uint nOrder(增加或降低的排名)， utf8 szName(挑战\被挑战玩家角色名)]*n

		// 成就系统
		public static const MsgId_Achieve_Show:int=1901;                          /// [LC] 所有成就信息 LC: [ulong nAchieveId, ulong nParentId(父级ID, 0表示木有父亲), ulong nFirstLvId(第一级ID, 0表示木有父亲), byte nLv(第几级成就 0,1,2), byte bTrack(是否追踪; 0不;1追踪), byte nGetReward(是否领取了奖励; 0未领,1已领), byte nFinish(是否完成, 0未完成,1完成;), ulong nFinishCount(已完成次数), ulong nTotalNum(需要完成的次数）]*n
		public static const MsgId_Achieve_Update:int=1902;                        /// [LC] 更新某些成就 LC: [ulong nAchieveId, ulong nParentId(父级ID, 0表示木有父亲), ulong nFirstLvId(第一级ID, 0表示木有父亲), byte nLv(第几级成就 0,1,2), byte bTrack(是否追踪; 0不;1追踪), byte nGetReward(是否领取了奖励; 0未领,1已领), byte nFinish(是否完成, 0未完成,1完成;), ulong nFinishCount(已完成次数), ulong nTotalNum(需要完成的次数）]*n
		public static const MsgId_Achieve_Track:int=1903;                         /// [CL\LC] 追踪成就 CL: [ulong nAchieveId, byte nTrack(0不追踪, 1追踪)]*n   LC: [ulong nAchieveId, byte nTrack(0不追踪, 1追踪)]*n
		public static const MsgId_Achieve_ReveiveReward:int=1904;                 /// [CL] 领取成就奖励 CL: [ulong nAchieveId]*n
		public static const MsgId_Achieve_NoticeFinish:int=1905;                  /// [LC] 通知成就完成(可领取奖励) LC: [ulong nAchieveId, byte nLv(第几级成就 0,1,2)]*n
		public static const MsgId_Achieve_Add:int=1906;                           /// [LC] 添加某些成就 LC: [ulong nAchieveId, ulong nParentId(父级ID, 0表示木有父亲), ulong nFirstLvId(第一级ID, 0表示木有父亲), byte nLv(第几级成就 0,1,2), byte bTrack(是否追踪; 0不;1追踪), byte nGetReward(是否领取了奖励; 0未领,1已领), byte nFinish(是否完成, 0未完成,1完成;), ulong nFinishCount(已完成次数), ulong nTotalNum(需要完成的次数）]*n

		// 要塞系统
		public static const MsgId_Fortress_BriefInfo:int=1951;                    /// [CL\LC] 更新要塞基础的信息 CL:(); LC: uint nCountSupport(支持类建筑数量), [uint nID(要塞表中的编号), uint nLevel(等级)]*nCountSupport, uint nCountDefensive(防御类建筑数量), [uint nID(要塞表中的编号), uint nLevel(等级)]*nCountDefensive, uint nPopulation(人口数), uint nPopMax(人口上限), int nExploit(战绩), uint nFortressLevel(要塞等级), uint nFortressPower(要塞战斗力), uint nTroopCount(兵的数量）
		public static const MsgId_Fortress_BuildInfo:int=1952;                    /// [CL\LC] 更新单个建筑信息 CL: UID uidMonster(建筑物的UID); LC: UID uidMonster(建筑物的UID), uint nID(要塞表中的编号), uint nLevel(等级), uint nBless(祝福值)
		public static const MsgId_Fortress_WarehouseInfo:int=1953;                /// [LC] 更新仓库信息 LC: uint nReserves(存储量), uint nExpansion(扩充的容量), uint nCapacity(仓库容量，包括扩容的部分)
		public static const MsgId_Fortress_StrongRoomInfo:int=1954;               /// [LC] 更新保险库信息 LC: uint nReserves(仓库存储量), uint nCapacity(仓库容量), uint nFactoryRes(资源工厂产出量)
		public static const MsgId_Fortress_BarrackInfo:int=1955;                  /// [LC] 更新已召唤的部队信息 LC: [uint nID(要塞表中的编号), uint nCount(招募的数量)]*n（只发招募数量大于0的）
		public static const MsgId_Fortress_InstituteInfo:int=1956;                /// [LC] 更新已升级的建筑和兵种信息 LC: [uint nID(要塞表中的编号), uint nLevel(等级)]*n（只发等级大于1的）
		public static const MsgId_Fortress_WarMillInfo:int=1957;                  /// [LC] 更新战场工坊放置陷阱信息 LC: [uint nID(要塞表中的ID), uint nCount(召唤数量)]*n（只发数量大于0的）
		public static const MsgId_Fortress_ShopInfo:int=1958;                     /// [LC] 更新要塞商店商品信息 LC: uint nCount(冷却商品的数量), [uint nID(要塞表中的ID), uint nCdTime(冷却时间)]*nCount（不在冷却的不发）, [uint nID(要塞表中的Id)]*n(删除的商品)
		public static const MsgId_Fortress_Upgrade:int=1959;                      /// [CL\LC] 要塞建筑提升祝福值 CL: UID uidMonster(建筑物的UID), byte bOneKey(是否自动进阶 0否，1是),byte bAutoBuy(是否自动购买 0否，1是); LC: UID uidOld(旧建筑的UID), UID uidNew(新建筑的UID)（在建筑升级时发送）
		public static const MsgId_Fortress_SettleBuild:int=1960;                  /// [CL\LC] 在地图上放建筑 CL: uint nID(要塞表中的ID), int nPosX(X坐标), int nPosY(Y坐标); LC: byte byResult(是否可以放置，1表示可以，0表示不可以), UID uidMonster(新建筑的UID)
		public static const MsgId_Fortress_MoveBuild:int=1961;                    /// [CL\LC] 在地图上移动建筑 CL: UID uidMonster(建筑物的UID), int nPosX(X坐标), int nPosY(Y坐标); LC: byte byResult(是否可以放置，1表示可以，0表示不可以), UID uidMonster(建筑物的UID)
		public static const MsgId_Fortress_DestroyBuild:int=1962;                 /// [CL|LC] 拆除地图上的建筑 CL: UID uidMonster(建筑物的UID); LC: byte byResult(是否可以拆除，1表示拆除了，0表示不能拆除), UID uidMonster(建筑物的UID)
		public static const MsgId_Fortress_BuildHarvest:int=1963;                 /// [CL] 要塞建筑收获资源 CL: UID uid(建筑UID); LC: UID uid(建筑UID), uint nItemId(收获的物品ID), uint nHarvest(收获的资源量)
		public static const MsgId_Fortress_BarrackCallUp:int=1964;                /// [CL] 兵营招募 CL: uint nID(要塞表中的ID), uint nCount(招募的数量)
		public static const MsgId_Fortress_BarrackDismiss:int=1965;               /// [CL] 兵营遣散 CL: uint nID(要塞表中的ID), uint nCount(遣散的数量)
		public static const MsgId_Fortress_InstituteUpgrade:int=1966;             /// [CL] 战争研究院升级兵种和建筑 CL: uint nID(要塞表中的ID)
		public static const MsgId_Fortress_ShopBuy:int=1967;                      /// [CL] 要塞商店中兑换商品 CL: uint nID(要塞表中的ID)
		public static const MsgId_Fortress_ShopClearCD:int=1968;                  /// [CL] 要塞商店中清除商品冷却时间 CL: uint nID(要塞表中的ID)
		public static const MsgId_Fortress_EnterScene:int=1969;                   /// [CL\LC] 进入个人要塞场景 CL: uint nPosX(传入的坐标X), uint nPosY(传入的坐标Y); LC: byte byResult(0，失败；1，成功)
		public static const MsgId_Fortress_BattleEnd:int=1970;                    /// [CL\LC] 要塞副本结束 CL:(); LC: byte byWin(是否获胜), int nExploits(战绩), uint nResource(资源数), uint nGold(金币数), [uint nFortressId(要塞ID), uint nCount(损失的数量)]*n
		public static const MsgId_Fortress_BattleBuildInfo:int=1971;              /// [LC] 更新要塞副本内的建筑信息 LC: int64 nHallCurHP(堡垒当前血量), int64 nHallMaxHP(堡垒最大血量), [uint nType(类型), uint nTotal(总数), uint nCount(当前数量)]*n
		public static const MsgId_Fortress_BattleTroopAll:int=1972;               /// [LC] 在要塞副本中更新部队信息 LC: [uint nID(要塞表中的ID), int nTotal(总数量), int nSummoned(已招募的), int nDead(已死亡的), int nSummonCurCD(当前CD内招募数量), int nTotalInCD(一个CD内可以的招募总数), int nCDTime(CD剩余时间，毫秒)]*n
		public static const MsgId_Fortress_BattleSummon:int=1973;                 /// [CL] 在要塞副本中召唤部队 LC: uint nID(要塞表中的ID), uint nCount(数量)
		public static const MsgId_Fortress_BattleSelfBuildInfo:int=1974;          /// [LC] 更新要塞副本内本方的建筑信息 LC: int64 nHallCurHP(堡垒当前血量), int64 nHallMaxHP(堡垒最大血量), [uint nType(类型), uint nTotal(总数), uint nCount(当前数量)]*n
		public static const MsgId_Fortress_BattleScout:int=1975;                  /// [CL\LC] 要塞副本侦察 CL: byte byBattle(是否进入战斗，0不进入，1进入); LC: uint nTime(侦察的剩余时间，0表示结束) 后台先通知前端侦察的时间；前端结束的时候通知后台
		public static const MsgId_Fortress_BattleRobStart:int=1976;               /// [CL\LC] 玩家发起要塞掠夺匹配 CL: byte byFree(1花魔晶，0免费); LC: uint nActorId(角色ID，ID为0表示没有匹配到), utf8* sName(角色名), uint nWizardId(生物ID), uint nFortressLv(要塞等级), uint nResource(资源数量), uint nCountDown(倒计时，单位秒)
		public static const MsgId_Fortress_BattleRobMatchRsp:int=1977;            /// [CL\LC] 玩家响应要塞掠夺匹配 CL: byte byAccept(1表示开始，0表示拒绝); LC: byte byResult(0表示不能进副本，1表示进副本)
		public static const MsgId_Fortress_BattleCompeteStart:int=1978;           /// [CL\LC] 玩家发起要塞对抗匹配 CL: byte byAction(1表示开始，0表示停止); LC: uint nActorId(角色ID), utf8* sName(角色名), uint nWizardId(生物ID), uint nFortressLv(要塞等级), uint nResource(资源数量), uint nCountDown(倒计时，单位秒)
		public static const MsgId_Fortress_BattleCompeteRsp:int=1979;             /// [CL\LC] 玩家响应要塞对抗匹配 CL: byte byAccept(1表示开始，0表示拒绝); LC: byte byEnter(1表示进副本，0表示不进副本)
		public static const MsgId_Fortress_BattleLogUpdate:int=1980;              /// [LC] 向客户端同步战报 LC: [uint nId(战报ID), uint nAttacker(进攻者ID), utf8* sAttacker(进攻者角色名), uint nTime(战斗时间), byte byResult(结果，0表示防守方失败，1表示防守方胜利), uint nExploit(战绩), uint nReward(奖励数量), uint nRobbed(被掠夺的资源量), byte byTaken(是否已经领取奖励，0表示没有，1表示领取了), byte byRevenged(是否已经反击并获胜了，0表示没有), byte byRevengRob(是否是其他玩家的反击，0不是), uint nRevengeCount(反击的次数), uint nTroopCount(部队数量), [uint nFortressId(部队在要塞表的ID), uint nTotal(总数), uint nDead(死亡数量)]*nTroopCount]*n
		public static const MsgId_Fortress_BattleLogNew:int=1981;                 /// [LC] 通知客户端新的战报 LC: uint nId(战报ID), uint nAttacker(进攻者ID), utf8* sAttacker(进攻者角色名), uint nTime(战斗时间), byte byResult(结果，0表示防守方失败，1表示防守方胜利), uint nExploit(战绩), uint nReward(奖励数量), uint nRobbed(被掠夺的资源量), byte byTaken(是否已经领取奖励，0表示没有，1表示领取了), byte byRevenged(是否已经反击并获胜了，0表示没有), byte byRevengRob(是否是其他玩家的反击，0不是), uint nRevengeCount(反击的次数), uint nTroopCount(部队数量), [uint nFortressId(部队在要塞表的ID), uint nTotal(总数), uint nDead(死亡数量)]*nTroopCount
		public static const MsgId_Fortress_BattleLogReward:int=1982;              /// [CL\LC] 领取战报奖励 CL: uint nId(战报ID); LC: uint nID(战报ID), byte byTaken(是否已经领取奖励，0表示没有，1表示领取了)
		public static const MsgId_Fortress_BattleLogRob:int=1983;                 /// [CL\LC] 要塞战报反击 CL: uint nId(战报ID); LC: uint nID(战报ID), byte byRevenged(是否已经反击并获胜了，0表示没有), uint nRevengeCount(反击的次数)
		public static const MsgId_Fortress_ResFactoryInfo:int=1984;               /// [LC] 更新资源工厂产出信息 LC: [UID uid(建筑UID), uint nLasHarvestTime(上一次收获到现在的时间，单位秒), uint nResource(存在建筑中已经收获的资源数), uint nExpand(扩容的次数)]*n
		public static const MsgId_Fortress_HallInfo:int=1985;                     /// [LC] 更新堡垒产出信息 LC: UID uid(建筑UID), uint nLasHarvestTime(上一次收获到现在的时间，单位秒), uint nResource(存在建筑中已经收获的金币数), uint nExpand(扩容的次数)
		public static const MsgId_Fortress_SceneTime:int=1986;                    /// [LC] 通知要塞副本的结束时间 LC: uint nTime(距离场景结束的时间，单位秒)
		public static const MsgId_Fortress_NotifyHarvest:int=1987;                /// [LC] 通知要塞资源可以采集了 LC: uint nFortressId(建筑id), uint nResCount(资源量), uint nPosX(坐标X), uint nPosY(坐标Y), uint nID(建筑索引)
		public static const MsgId_Fortress_Expand:int=1988;                       /// [CL] 要塞建筑扩容 CL: UID uid(建筑UID)
		public static const MsgId_Fortress_DestroyTrap:int=1989;                  /// [CL] 拆除陷阱 CL: uint nMinorClass(建筑小类)
		public static const MsgId_Fortress_BuildHarvestByID:int=1990;             /// [CL\LC] 要塞建筑收获资源 CL: uint nID(建筑索引); LC: uint nID(建筑索引), uint nItemId(收获的物品ID), uint nHarvest(收获的资源量)
		public static const MsgId_Fortress_BattleTroopCD:int=1991;                /// [LC] 要塞部队的CD更新 LC: uint nFortressID(要塞ID), int nSummonCurCD(当前CD内招募数量), int nTotalInCD(一个CD内的招募总数), int nCDTime(CD剩余时间，毫秒)
		public static const MsgId_Fortress_BattleTroopCount:int=1992;             /// [LC] 要塞内部分数量更新 LC: uint nID(要塞表中的ID), int nSummoned(已招募的), int nDead(已死亡的)
		public static const MsgId_Fortress_RobTimes:int=1993;                     /// [LC] 要塞掠夺成功次数 LC: uint nTimes(掠夺成功的次数)

		// 献祭系统
		public static const MsgId_Worship_GetInfo:int=2001;                       /// [CL\LC] 献祭物品 CL:[UID itemUID(献祭的物品UID)]*n ;LC:int nValue(献祭所得到的值),int nOverValue(献祭剩余价值)，int nAddValue(献祭称号增加的值)，[byte nType（献祭类型:0已选择的物品栏,大于0为献祭类型）,ushort nSkepIndex(物品序号，从0开始),uint nItemId(物品Id),uint nItemValue(物品价值),uint nItemNum(物品数量),int ExchangeNum(兑换数量(-1无限兑换)]*n
		public static const MsgId_Worship_MoveItem:int=2002;                      /// [CL\LC] 选中献祭物品 CL:byte nType(献祭类型),ushort nSkepIndex(物品序号位置),uint nNum(数量);LC:int nValue(献祭所得到的值),int nOverValue(献祭剩余价值)，int nAddValue(献祭称号增加的值)，byte nType（献祭类型:0已选择的物品栏,大于0为献祭类型）,byte updateALl(0修改数据,1删除类型列表),[ushort nSkepIndex(物品序号，从0开始),uint nItemId(物品Id,Id为0表示清除从已选中的物品),uint nItemValue(物品价值),uint nItemNum(物品数量),int ExchangeNum(兑换数量(-1无限兑换))]*n
		public static const MsgId_Worship_Receive:int=2003;                       /// [CL\LC] 领取献祭物品 LC:byte bSuccess(0,失败 1，成功)
		public static const MsgId_Worship_Start:int=2004;                         /// [CL] 开始\关闭献祭物品界面 CL:byte bType(0开始,1关闭) LC:byte bType(0不显示材料界面,1显示材料界面),uint nTitleId(称号Id),uint nCur(当前信仰度),uint nNext(下阶信仰度),byte nFaithLevel(信仰度等级)
		public static const MsgId_Worship_NpcAction:int=2005;                     /// [LC] 献祭龙动作 LC:ushort nType(动作类型);
		public static const MsgId_Worship_PrayLuckInfo:int=2006;                  /// [CL\LC] 祈福信息 CL: LC:int nPrayCount(剩余次数),int nTotayCount(今日已祈福次数)
		public static const MsgId_Worship_PrayLuck:int=2007;                      /// [CL\LC] 祈福 CL: LC:bool bSuccess, int nPrayCount(剩余次数), int nTotayCount(今日已祈福次数)
		public static const MsgId_Worship_PrayBossInfo:int=2008;                  /// [CL\LC] 膜拜城主信息 CL: LC: int nScornNum(鄙视数量), int nWorshipNum(膜拜数量), byte nGiftLv(礼品等级0,1,2,3), int nPrayCount(已投票次数),int nTotalCount(今日总次数)
		public static const MsgId_Worship_PrayBoss:int=2009;                      /// [CL] 膜拜城主 CL: byte nType(0鄙视,1膜拜,2刷新礼品)
		// 怪物攻城活动
		public static const MsgId_CastleAttack_Open:int=2051;                     /// [LC] 怪物攻城活动开启状态 LC: uint nStatus(活动状态，0未开启，1正在准备，2已开启), uint nTime(时间，nStatus=0时为0，nStatus=1时是离开始的时间，nStatus=2时是距离活动结束的时间)
		public static const MsgId_CastleAttack_Enter:int=2052;                    /// [CL\LC] 参加怪物攻城活动 CL:(); LC: byte byResult(1进入，0不能进入)
		public static const MsgId_CastleAttack_StageInfo:int=2053;                /// [LC] 广播怪物攻城的关卡信息 LC: uint nStageTotal(总关卡数), uint nCurStage(当前关卡数), uint nStageTime(本关卡剩余时间)
		public static const MsgId_CastleAttack_TotalRank:int=2054;                /// [CL\LC] 更新怪物攻城的排行榜 CL: uint nAction(0第一次请求；1后续请求); LC: [uint nActorId, utf8* sName, uint64 nDamage(对怪物的伤害)]*n
		public static const MsgId_CastleAttack_Reward:int=2055;                   /// [CL] 怪物攻城的奖励 CL:()
		public static const MsgId_CastleAttack_End:int=2056;                      /// [LC] 怪物攻城结果 LC: byte byResult(是否获胜), uint nRank(最终排名)
		public static const MsgId_CastleAttack_GuardHP:int=2057;                  /// [LC] 怪物攻城NPC和龙的血量 LC: int64 nNPCHP(NPC的血量), int64 nNPCHPMax(NPC的血量上限), int64 nDragonHP(龙的血量), int64 nDragonHPMax(龙的血量上限)

		// 跨服战场匹配
		public static const MsgId_CrossBattle_CreateTeam:int=2101;                /// [CL] 创建跨服战场队伍 CL: uint nMapId(地图ID), uint nFightPower(战斗力), utf8* sPassword(队伍密码)
		public static const MsgId_CrossBattle_LeaveTeam:int=2102;                 /// [CL\LC] 离开战场队伍 CL:(); LC: byte byKicked(1被踢的；0自己离开的)
		public static const MsgId_CrossBattle_DismissTeam:int=2103;               /// [CL] 解散战场队伍 CL:()
		public static const MsgId_CrossBattle_JoinTeam:int=2104;                  /// [CL] 加入战场队伍 CL: nMapId(地图ID), nTeamId(队伍ID), utf8* sPassword(密码)
		public static const MsgId_CrossBattle_KickMember:int=2105;                /// [CL] 队长踢人 CL:uint nActorId(玩家ID)
		public static const MsgId_CrossBattle_TeamMemberList:int=2106;            /// [LC] 更新战场队伍的成员列表 LC: uint nMapId(地图ID), uint nTeamId(队伍ID), byte byInScene(是否已在场景中，0不在), [uint nActorId(角色ID), uint nLevel(等级), uint nWizard(种族), uint nWorldId(游戏世界), uint nFightPower(战斗力), uint nSkillSerie(技能系), utf8* sName(角色名)]*n
		public static const MsgId_CrossBattle_TeamEnterMatch:int=2107;            /// [CL] 队伍加入匹配 CL:()
		public static const MsgId_CrossBattle_QuitMatch:int=2108;                 /// [CL] 退出匹配 CL:()
		public static const MsgId_CrossBattle_MatchStatus:int=2109;               /// [LC] 玩家或队伍的匹配状态 LC:byte byState(1，正在匹配；0不在匹配), uint nMapId(地图ID), byte byTeam(1，队伍匹配；0，单人匹配)
		public static const MsgId_CrossBattle_EnterScene:int=2110;                /// [CL\LC] 进入副本 CL:(); LC:uint nTime(剩余时间), uint nMapId(地图ID), uint nRivalCount(对手人数), [uint nActorId(角色名), uint nWorldId(游戏世界), utf8* sName(角色名), uint nFightPower(战斗力), uint nLevel(等级)]*nRivalCount
		public static const MsgId_CrossBattle_QuickJoin:int=2111;                 /// [CL] 快速加入战场队伍 CL: uint nMapId(地图ID)
		public static const MsgId_CrossBattle_SearchTeam:int=2112;                /// [CL] 查找队伍 CL: uint nMapId(地图ID), uint nFightPower(战斗力), uint nTeamId(队伍ID)
		public static const MsgId_CrossBattle_UpdateTeamList:int=2113;            /// [CL\LC] 更新队伍状态 CL: uint nMapId(地图ID), [uint nTeamId(房间队伍ID)]*n; LC: uint nMapId(地图ID), [uint nTeamId(队伍ID), uint nFightPower(战斗力), ushort wLevel(队长等级), utf8* sName(队长角色名), byte byHasPassword(1有密码，0没有密码), byte byMemberCount(队员人数)]*n

		// 捕鱼系统
		public static const MsgId_Fish_Join:int=2151;                             /// [CL] 进入捕鱼地图
		public static const MsgId_Fish_Integral:int=2152;                         /// [CL\LC] 兑换积分 CL: [uint64 nItemGUID, uint nNum]*n; LC:uint nIngegral(积分，0兑换失败)
		public static const MsgId_Fish_StartCountdown:int=2153;                   /// [LC] 捕鱼活动开始倒计时 LC:byte nType(0活动开始倒计时，1活动结束倒计时，2活动结束后结束场景倒计时),ushort nTime(活动开始倒计时);

		// 阵营篝火
		public static const MsgId_Camp_BonefireEnter:int=2201;                    /// [CL\LC] 进入阵营篝火地图 CL:(); LC: uint nTime(活动剩余时间)
		public static const MsgId_Camp_BonefireUpdate:int=2202;                   /// [LC] 更新阵营篝火的数据 LC: [uint nCamp(阵营), uint nExp(阵营篝火的成长值)]*n
		public static const MsgId_Camp_BonefireAdd:int=2203;                      /// [CL] 添加材料 CL: uint nItemId(材料ID)
		public static const MsgId_Camp_BonefireExpGain:int=2204;                  /// [LC] 玩家获得的经验 LC: uint nExp(活动获得的经验)
		public static const MsgId_Camp_FireEvent:int=2205;                        /// [LC] 场景内的篝火事件 LC: uint nCamp(阵营), uint nEvent(1，怪物捣乱；2，有干柴掉落；3，刮风；4，下雨)
		public static const MsgId_Camp_BonefireEnd:int=2206;                      /// [LC] 阵营篝火活动结束 LC: uint nExp(活动获得的经验)

		// 战场
		public static const MsgId_Battle_KillBroadcast:int=2251;                  /// [LC] 广播场景内杀人 LC: uint nKillerId(击杀者ID), utf8* sName(击杀者角色名), uint nKillWizardId(击杀者生物ID), uint nKillerGroup(击杀者所在组), uint nDeadId(被杀者ID), utf8* sDeadName(被杀者角色名), uint nDeadWizardId(被杀者生物ID), uint nCombo(连击数), [uint nAssistant(助攻者ID), uint nWizarId(生物ID)]*n
		public static const MsgId_Battle_BattleTime:int=2252;                     /// [LC] 跨服战场战斗的时间 LC: byte byStatus(战场的阶段，0准备中，1战斗中，2已结束), uint nTime(准备中是距离开始的秒数；战斗中是距离结束的时间；已结束时是0)
		public static const MsgId_Battle_BattleEnd:int=2253;                      /// [LC] 跨服战场结束 LC: byte byWinner(获胜方)
		public static const MsgId_CrossBattle_Tactics:int=2254;                   /// [CL\LC] 跨服战场场景内战术 CL: uint nAction(指令), uint nPosX(X坐标), uint PosY(Y坐标); LC: uint nAction(指令), uint nPosX(X坐标), uint nPosY(Y坐标)
		public static const MsgId_CrossBattle_ActorLeaveBroadcast:int=2255;       /// [LC] 跨服战场内广播角色离开 LC: uint nActorId(离开的角色ID), byte byGroup(角色的分组)
		public static const MsgId_CrossBattle_MobaInfoUpdate:int=2256;            /// [CL\LC] 蒸汽之桥内信息更新 CL: (); LC: ()
		public static const MsgId_CrossBattle_MobaDataUpdate:int=2257;            /// [CL\LC] 蒸汽之桥内统计数据更新 CL: (); LC: uint nCount1(分组1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nKill(击杀次数), uint nAssist(助攻次数), int64 nDamage(总伤害), int64 nHeal(总治疗), uint nDead(死亡次数), uint nHonor(获得荣誉), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount1, uint nCount2(分组2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nKill(击杀次数), uint nAssist(助攻次数), int64 nDamage(总伤害), int64 nHeal(总治疗), uint nDead(死亡次数), uint nHonor(获得荣誉), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount2
		public static const MsgId_CrossBattle_MobaBuildInfo:int=2258;             /// [LC] 蒸汽之桥战场内的建筑信息 LC: byte byResource(资源点数), [UID uidResource(资源点的UID), byte byGroup(占领方)]*byResource, [byte byGroup(分组), byte byBuildTotal(总建筑数), byte byAlive(当前存活的建筑数), uint nKillCount(击杀人数), uint nResCount(资源量)]*n
		public static const MsgId_CrossBattle_3CDataUpdate:int=2259;              /// [CL\LC] 暴风山谷内统计数据更新 CL: (); LC: uint nCount1(分组1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nKill(击杀次数), uint nAssist(助攻次数), int64 nDamage(总伤害), int64 nHeal(总治疗), uint nDead(死亡次数), uint nHonor(获得荣誉), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount1, uint nCount2(分组2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nKill(击杀次数), uint nAssist(助攻次数), int64 nDamage(总伤害), int64 nHeal(总治疗), uint nDead(死亡次数), uint nHonor(获得荣誉), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount2
		public static const MsgId_CrossBattle_3CBuildInfo:int=2260;               /// [LC] 暴风山谷内的建筑信息 LC: byte byResource(资源点数), [UID uidResource(资源点的UID), byte byGroup(占领方)]*byResource, [byte byGroup(分组), byte byBuildTotal(总建筑数), byte byHallCount(存活堡垒数), byte byAlive(当前存活的建筑数), uint nKillCount(击杀人数)]*n
		public static const MsgId_CrossBattle_RongYanDataUpdate:int=2261;         /// [CL\LC] 熔岩庄园内统计数据更新 CL: (); LC: uint nCount1(分组1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nWizardId(生物ID), uint nKill(击杀次数), uint nAssist(助攻次数), uint nDead(死亡次数), uint nKillPoint(击杀积分), uint nMinePoint(矿脉积分), uint nFlagPoint(旗塔积分), uint nBossPoint(Boss积分), uint nTotalPoint(总积分), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount1, uint nCount2(分组2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWorldId(游戏世界ID), ushort wLevel(等级), uint nWizardId(生物ID), uint nKill(击杀次数), uint nAssist(助攻次数), uint nDead(死亡次数), uint nKillPoint(击杀积分), uint nMinePoint(矿脉积分), uint nFlagPoint(旗塔积分), uint nBossPoint(Boss积分), uint nTotalPoint(总积分), uint nExploit(获得功勋), byte byFirstWin(是否首胜)]*nCount2
		public static const MsgId_CrossBattle_RongYanPointInfo:int=2262;          /// [LC] 熔岩庄园内积分更新 LC: [uint nGroup(分组), uint nPoint(总分)]*n
		public static const MsgId_CrossBattle_PassCount:int=2263;                 /// [LC] 跨服战场的通关次数 LC: [uint nMapId(地图ID), uint nPassCount(通关次数)]*n
		public static const MsgId_CrossBattle_ResPointOccupied:int=2264;          /// [LC] 跨服战场资源点归属变化 LC: UID uid(资源点UID), uint nGroup(归属分组)
		public static const MsgId_CrossBattle_ResPointInfo:int=2265;              /// [LC] 跨服战场资源点信息 LC: [UID uid(资源点UID), uint nWizardId(生物ID), int nPosX, int nPosY(坐标), uint nGroup(归属分组)]*n
		public static const MsgId_CrossBattle_BuildDead:int=2266;                 /// [LC] 跨服战场建筑被摧毁 LC: UID uid(建筑UID), byte byDead(1表示死亡，0表示复活）
		public static const MsgId_CrossBattle_BuildInfo:int=2267;                 /// [LC] 跨服战场中建筑信息 LC: [UID uid(建筑UID), uint nWizardId(生物ID), int nPosX, int nPosY(坐标), uint nGroup(分组), byte byDead(1表示已死亡，0表示还活着)]*n
		public static const MsgId_Battle_MonsterDead:int=2268;                    /// [LC] 战场内怪物死亡 LC: UID uid(怪物UID), uint nWizardId(生物ID)
		public static const MsgId_Battle_MonsterRevive:int=2269;                  /// [LC] 战场内怪物复活 LC: UID uid(怪物UID), uint nWizardId(生物ID)

		// 阵营攻城战
		public static const MsgId_Camp_CastleDailyWelfare:int=2301;               /// [CL] 领取王城战每日福利 CL:()
		public static const MsgId_Camp_CastleDailyBoss:int=2302;                  /// [CL] 召唤王城战Boss CL:()
		public static const MsgId_Camp_CastleRide:int=2303;                       /// [CL] 领取王城战城主坐骑 CL:()
		public static const MsgId_Camp_CastleWing:int=2304;                       /// [CL] 领取王城战城主翅膀 CL:()
		public static const MsgId_Camp_CastleInfo:int=2305;                       /// [LC] 王城之争信息同步 LC: uint nCamp(王城占领方), uint nCastellan(城主ID), byte byBoss(是否召唤了Boss，0未召唤), [byte byRank(军衔), uint nWizardId(精灵Id), uint nLevel(角色等级), const utf8* sName(角色名), uint nTitle(称号ID), uint nFightPower(战斗力), uint nWeaponLeft(左手武器ID), uint nWeaponRight(右手武器ID), uint nWeaponLevel(武器强化等级), uint nWingModelId(幻化翅膀ID), uint nRideModelId(幻化坐骑ID)]*n
		public static const MsgId_Camp_CastleWelfareInfo:int=2306;                /// [LC] 王城福利信息 LC: byte byDailyReward(是否领取了每日福利，0未领取), byte byRide(是否领取了城主坐骑，0未领取), byte byWing(是否领取了城主翅膀，0未领取), uint nCastellan(城主ID), byte byBoss(是否召唤了Boss，0未召唤，1已召唤)
		public static const MsgId_Camp_BattleEnter:int=2307;                      /// [CL\LC] 进入阵营战场 CL: (); LC: byte byOwner(王城占领方)
		public static const MsgId_Camp_BattleDataUpdate:int=2308;                 /// [CL\LC] 阵营战场内统计数据更新 CL: (); LC: uint nCount1(阵营1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数),uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount1, uint nCount2(阵营2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数), uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount2
		public static const MsgId_Camp_BattleBuildInfo:int=2309;                  /// [LC] 战场内的建筑信息 LC: [UID uid(建筑UID), int64 nCurHP(当前生命值), int64 nMaxHP(总生命值)]*n
		public static const MsgId_Camp_BattleDragonFeed:int=2310;                 /// [CL\LC] 战场内喂食飞龙 CL: uint nItemId(物品ID，0更新数据), uint nCount(食物数量); LC: uint nHunger(饥饿值)
		public static const MsgId_Camp_BattleDragonRide:int=2311;                 /// [CL\LC] 战场内上飞龙 CL:(); LC: uint nTime(飞行时间)
		public static const MsgId_Camp_BattleRush:int=2312;                       /// [CL] 战场内突袭 CL:()
		public static const MsgId_Camp_BattleCount:int=2313;                      /// [LC] 角色参加王城战的次数统计 LC: uint nWin(获胜次数), uint nEnterCount(参加次数)
		public static const MsgId_Camp_CastellanCandidate:int=2314;               /// [LC] 王城城主候选人信息 LC: uint nCamp(阵营), uint nActorId(角色ID), utf8* szName(角色名), uint nCredit(总荣誉), uint nTime(决出城主的时间)
		public static const MsgId_Camp_BattleCommander:int=2315;                  /// [LC] 国战指挥信息 LC: uint nActorId(角色ID), utf8* sName(角色名)
		public static const MsgId_Camp_BattleChangeCommander:int=2316;            /// [CL] 国战更换指挥 CL: uint nActorId(角色ID)
		public static const MsgId_Camp_BattleCommanderAttack:int=2317;            /// [CL\LC] 国战指挥设置攻击坐标 CL: uint nMapId(地图ID), int nPosX(X坐标), int nPosY(Y坐标); LC: uint nMapId(地图ID), int nPosX(X坐标), int nPosY(Y坐标)
		public static const MsgId_Camp_BattlePoint:int=2318;                      /// [LC] 国战双方比分 LC: [byte byCamp(阵营), uint nPoint(分数)]*n
		public static const MsgId_Camp_BattleDragonHP:int=2319;                   /// [LC] 国战守护龙的血量 LC: int64 nCurHP(当前血量), int64 nMaxHP(最大血量)
		public static const MsgId_Camp_BattleBossHP:int=2320;                     /// [LC] 国战大祭祀的血量 LC: int64 nCurHP(当前血量), int64 nMaxHP(最大血量)
		public static const MsgId_Camp_BattleTakeReward:int=2321;                 /// [CL] 领取国战排名奖励 CL: ();
		public static const MsgId_Camp_BattleEnd:int=2322;                        /// [LC] 国战结束 LC: byte byWinner(获胜方)
		public static const MsgId_Camp_PartyPoint:int=2323;                       /// [LC] 欢聚一堂双方积分 LC: [byte byCamp(阵营), uint nPoint(分数)]*n
		public static const MsgId_Camp_PartyEnd:int=2324;                         /// [LC] 欢聚一堂结束 LC: byte byWinner(获胜方)
		public static const MsgId_Camp_PartyDataUpdate:int=2325;                  /// [CL\LC] 欢聚一堂统计数据更新 CL: (); LC: uint nCount1(阵营1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数),uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount1, uint nCount2(阵营2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数), uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount2
		public static const MsgId_Camp_PartyDrop:int=2326;                        /// [LC] 欢聚一堂祭坛准备掉落 LC: uint nTime(距离掉落的时间，单位秒), int nPosX(中心点X), int nPosY(中心点Y), int nRadius(半径)
		public static const MsgId_Camp_PartyTakeReward:int=2327;                  /// [CL] 领取欢聚一堂排名奖励 CL:()
		public static const MsgId_Camp_PartyDropTime:int=2328;                    /// [LC] 欢聚一堂祭坛掉落的时间 LC: uint nNextDropTime(距离下次掉落的时间，单位秒)
		public static const MsgId_Camp_CastleProgress:int=2329;                   /// [LC] 主城战进度 LC: int64 nTotalHP(), int64 nCurHP()
		public static const MsgId_Camp_CastleEnd:int=2330;                        /// [LC] 主城战结束 LC: byte byWinner(获胜方)
		public static const MsgId_Camp_CastleDataUpdate:int=2331;                 /// [CL\LC] 主城战统计数据更新 CL:(); LC: uint nCount1(阵营1的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数),uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount1, uint nCount2(阵营2的人数), [uint nActorId(角色ID), utf8* sActorName(角色名), uint nWizardId(生物ID), byte byRank(军衔), ushort wLevel(等级), uint nFightPower(战力), uint nKill(击杀次数), uint nAssist(助攻次数), uint nDead(死亡次数), uint64 nDamage(总伤害), uint nPoint(积分)]*nCount2
		public static const MsgId_Camp_CastleTakeReward:int=2332;                 /// [CL] 主城战排名奖励 CL: ();
		public static const MsgId_Camp_HomelandInfo:int=2333;                     /// [LC] 阵营战大领主信息更新 LC: uint nCamp(领地占领方), uint nLord(领主ID), byte byBoss(0，暂时空), [byte byRank(军衔), uint nWizardId(精灵Id), uint nLevel(角色等级), const utf8* sName(角色名), uint nTitle(称号ID), uint nFightPower(战斗力), uint nWeaponLeft(左手武器ID), uint nWeaponRight(右手武器ID), uint nWeaponLevel(武器强化等级), uint nWingModelId(幻化翅膀ID), uint nRideModelId(幻化坐骑ID)]*n


		public static const MsgId_Camp_HomelandWing:int=2334;                     /// [CL] 领取领主翅膀 CL:()
		public static const MsgId_Camp_HomelandWelfareInfo:int=2335;              /// [LC] 领主福利信息 LC: uint nLord(领主ID), byte byTakenWing(是否领取了领主翅膀)
		// 器魂系统
		public static const MsgId_WeaponSoul_Activation:int=2351;                 /// [CL\LC] 器魂激活 CL: uint nActWSTypeID(激活的器魂类型ID900001-900009) LC: uint nActWSTypeID(激活的器魂类型ID900001-900009,0表示未成功)
		public static const MsgId_WeaponSoul_Fill:int=2352;                       /// [CL\LC] 器魂灌入 CL: uint nSelWSTypeID(当前选择的器魂类型ID） CL: uint nSelWSTypeID(当前选择的器魂类型ID,0表示未成功）
		public static const MsgId_WeaponSoul_Grade:int=2353;                      /// [CL\LC] 器魂升阶 CL: uint nSelWSTypeID(当前选择的器魂类型ID)   byte byOnKey(0普通; 1:一键升阶)   LC：uint nSelWSTypeID(当前选择的器魂类型ID) ， byte bySucces(0:失败；1：成功)， uint nLevel（当前器魂等阶）， uint nBless(当前祝福值)
		public static const MsgId_WeaponSoul_Info:int=2354;                       /// [LC] 角色当前器魂信息 LC: uint nSelWSTypeID(当前选择的器魂类型ID) , uint nFillWSTypeID(当前灌入器魂类型), [uint nWSType(器魂类型), uint nLevel(器魂等阶,0未激活)，uint nBless(当前祝福值)]*n
		public static const MsgId_WeaponSoul_Select:int=2355;                     /// [CL\LC] 选择显示器魂 CL: uint nSelWSTypeID(当前选择的器魂类型ID) LC: uint nSelWSTypeID(激活的器魂类型ID900001-900009,0表示未成功)
		public static const MsgId_WeaponSoul_RmFill:int=2356;                     /// [CL\LC] 取消灌入 CL:() LC : uint (激活的器魂类型ID900001-900009,0表示未成功)

		// 战姬系统
		public static const MsgId_WarConcubine_Unlock:int=2401;                   /// [CL\LC] 战姬解封 CL: uint 选择的战姬ID, uint 点击格子index（1-20） ; LC: uint 选择的战姬ID(破冰首次充值失败时，为0(格子破冰成功发送消息，失败除破冰首冲失败外，不发消息)), uint 点击格子index, byte 是否激活（0 未激活，1 激活）
		public static const MsgId_WarConcubine_Intimacy_Grade :int=2402;          /// [CL\LC] 战姬属性升阶 CL:uint 选择的战姬ID, byte 是否一键培养（0 普通培养 1 一键培养）;  LC: uint 当前选择战姬ID，  byte 是否成功（0：升祝福值，1：升阶）， uint 当前战姬亲密度等阶， uint 当前战姬亲密度对应祝福值
		public static const MsgId_WarConcubine_Tease_Grade:int=2403;              /// [CL\LC] 战姬能力升阶 CL: uint 选择的战姬ID, byte 是否一键培养（0 普通培养 1 一键培养）; LC: uint 当前选择战姬ID，byte 是否成功（0：升祝福值，1：升阶），uint 当前战姬挑逗等阶，uint 当前战姬挑逗对应祝福值
		public static const MsgId_WarConcubine_Escort:int=2404;                   /// [CL\LC] 战姬陪护 CL: uint 选择的战姬ID, byte 休息或参战（0：休息，1：参战）; LC: uint 当前陪护战姬ID, byte 休息或参战（0：休息，1：参战）
		public static const MsgId_WarConcubine_Info:int=2405;                     /// [LC] 战姬信息  LC: uint 角色登录天数, uint 当前陪护战姬ID，uint 战姬数量，[uint 战姬ID，uint 格子数量, [破冰格子index]*n ]*n,uint 激活战姬数量, [uint 战姬ID，uint 战姬亲密度等阶 ，uint 战姬亲密度对应祝福值，uint 战姬挑逗等阶，uint 战姬挑逗对应祝福值，uint 技能1ID，uint 技能2ID]*n
		public static const MsgId_WarConcubine_Skill_Study :int=2406;             /// [CL\LC] 战姬技能学习 CL:uint 选择的战姬ID, uint 技能书ItemId   LC: uint 当前选择战姬ID，uint 技能书ItemId，uint 技能1Id，uint 技能2Id

		// 野外杀怪双倍经验活动
		public static const MsgId_DoubleExp_Enter:int=2451;                       /// [CL] 进入野外地图 CL:()

		// 答题活动
		public static const MsgId_QuizAct_StageTime:int=2501;                     /// [LC] 答题活动副本时间和阶段 LC: byte byStatus(答题的阶段，0准备中，1答题中，2已结束), uint nPrepareTime(准备中距离开始的秒数), uint nQuizTime(答题中距离结束的时间)
		public static const MsgId_QuizAct_QuestionInfo:int=2502;                  /// [LC] 答题活动的题目信息 LC: uint nTotalCount(总的题目数), uint nCurCount(当前是第几数), uint nQuestionIdCur(当前的题目ID), uint nTime(当前题目的剩余答题时间，单位秒), uint nActTime(距离结束的时间，单位秒)
		public static const MsgId_QuizAct_Rank:int=2503;                          /// [LC] 答题活动排名 LC: [uint nActorId(角色ID), utf8* sName(角色名), uint nWorldId(游戏世界ID), uint nWizardId(生物ID), uint nCorrectCount(答题题目数量), uint nRank(排名), uint nExpTotal(获得的总经验)]*n
		public static const MsgId_QuizAct_SceneAddActor:int=2504;                 /// [LC] 答题活动副本有玩家进入 LC: uint nActorId(角色ID), utf8* sName(角色名), uint nWorldId(游戏世界ID), uint nWizardId(生物ID), uint nCorrectCount(答题题目数量)
		public static const MsgId_QuizAct_ActorData:int=2505;                     /// [LC] 答题活动副本玩家的信息 LC: uint nExp(活动获得的经验)
		public static const MsgId_QuizAct_TotalData:int=2506;                     /// [LC] 答题活动副本的总榜 LC: [uint nActorId(角色ID), utf8* sName(角色名), uint nWorldId(游戏世界ID), uint nWizardId(生物ID), uint nCorrectCount(答题题目数量)]*n
		public static const MsgId_QuizAct_CorrectActor:int=2507;                  /// [LC] 答题活动中上一题答对的玩家ID LC: [uint nActorId(角色ID)]*n
		public static const MsgId_QuizAct_Answer:int=2508;                        /// [LC] 答题活动是否回答正确 LC: uint nQuestionId(题目Id), byte byCorrect(1回答正确，0回答错误)
		public static const MsgId_QuizAct_Enter:int=2509;                         /// [CL] 进入答题活动场景 CL: ()

		// 灵魂图鉴系统
		public static const MsgId_SoulHandBook_Activation  :int=2551;             /// [CL\LC] 灵魂图鉴激活 CL: uint64 激活的ItemUID; LC: uint64 激活的ItemUID
		public static const MsgId_SoulHandBook_Change:int=2552;                   /// [CL\LC] 灵魂图鉴更换 CL: uint64 当前激活的ItemUID，uint64 要更换的ItemUID; LC: uint64 更换前的ItemUID，uint64 更换后的ItemUID
		public static const MsgId_SoulHandBook_Extract:int=2553;                  /// [CL\LC] 灵魂图鉴金币，魔晶抽取 CL: byte 抽取类型（0 金币单抽，1 金币十连抽，2，魔晶单抽，3，魔晶十连抽）   LC: byte 抽取类型，uint 金币抽取每日免费次数, uint 获得的积分, [uint64  抽取到的ItemUID]*n
		public static const MsgId_SoulHandBook_Info:int=2554;                     /// [CL] 灵魂图鉴信息 uint 金币抽取每日免费次数, uint 图鉴免费兑换次数，[uint nItemId(图鉴兑换物品)]*n
		public static const MsgId_SoulHandBook_Sell:int=2555;                     /// [CL\LC] 图鉴出售 CL: [uint64 需要出售的物品ItemUID]*n  LC: uint 出售所得的金币,[uint64 已出售的物品ItemUID]*n
		public static const MsgId_SoulHandBook_Grade_Exp:int=2556;                /// [CL\LC] 图鉴经验升级/升阶  CL: uint64 要升的ItemUID, uint 消耗物品个数，[uint64 升级消耗的物品ItemUID]*n， byte 升级或升阶(0: 升级，1：升阶) LC：uint64 要升的ItemUID, byte 升级或升阶(0: 升级，1：升阶), byte 是否成功， uint64 升阶后新的ItemUID(升阶且升成功的时候才有), uint 图鉴等级或等阶, uint 累计经验，[uint64 消耗的物品ItemUID]*n
		public static const MsgId_SoulHandBook_Exchange:int=2557;                 /// [CL\LC] 图鉴兑换 CL: uint 图鉴兑换ItemId, byte 图鉴兑换消耗类型（0：图鉴消耗；1：魔晶消耗）  LC: uint 图鉴兑换ItemId, byte 图鉴兑换消耗类型（0：图鉴消耗；1：魔晶消耗）,byte 是否成功（0:失败 1:成功）
		public static const MsgId_SoulHandBook_Refresh:int=2558;                  /// [CL] 图鉴兑换刷新 CL:()
		public static const MsgId_SoulHandBook_ReqNextRefreshTime:int=2559;       /// [CL\LC] 请求图鉴下次刷新剩余时间 CL:() LC: int nSurplusTime(系统下次刷新倒计时，-1表示获取失败)

		// 灵魂Boss
		public static const MsgId_SoulBoss_Enter:int=2601;                        /// [CL] 进入灵魂Boss场景 CL: ()
		public static const MsgId_SoulBoss_TotalData:int=2602;                    /// [LC] 灵魂Boss场景统计数据 LC: [uint nActorId(角色ID), utf8* sName(角色名), uint nCamp(阵营), int64 nTotalDamage(总伤害)]*n
		public static const MsgId_SoulBoss_RankReward:int=2603;                   /// [CL\LC] 灵魂Boss的排名奖励 CL:(); LC: uint nRank(排名，0表示没有排名), int64 nDamage(对Boss的伤害值), uint nRewardItem(奖励物品ID)
		public static const MsgId_SoulBoss_ActorRank:int=2604;                    /// [LC] 玩家在灵魂Boss场景中的排名 LC: uint nRank(排名，0表示没有排名), int64 nDamageTotal(总伤害)

		// 每日签到
		public static const MsgId_Sign_Sign:int=2651;                             /// [CL\LC] 每日签到  CL:() LC: uint 累计签到次数，uint 可抽取次数，byte 当天是否已签到（0：已签，1：未签）
		public static const MsgId_Sign_LuckyDraw:int=2652;                        /// [CL\LC] 抽奖 CL: () LC: uint 抽取后可抽取次数，uint 抽取后已抽取次数，uint 物品ID，uint 物品数量
		public static const MsgId_Sign_Confirm :int=2653;                         /// [CL\LC] 确定(领取抽奖物品) CL:() LC:()
		public static const MsgId_Sign_Info:int=2654;                             /// [CL] 签到信息 CL: uint 累计签到次数，uint 可抽取次数，uint 已抽取次数，byte 当天是否已签到（0：已签，1：未签）
		public static const MsgId_Sign_ActiveCode:int=2655;                       /// [CL\LC] 领取激活码奖励 CL: utf8* sCode(激活码)

		// 巡城
		public static const MsgId_Patrol_Join:int=2701;                           /// [CL\LC] 加入巡城 CL:(); LC:()
		public static const MsgId_Patrol_Quit:int=2702;                           /// [CL\LC] 退出巡城 CL:(); LC:()
		public static const MsgId_Patrol_FixedGain:int=2703;                      /// [LC] 巡城获得的固定收益 LC: uint nExp(活动获得的经验), uint nGold(活动获得的金币)
		public static const MsgId_Patrol_ActorOutput:int=2704;                    /// [LC] 队员头顶出现（或消失）交互收益 LC: uint nActorId(角色ID), byte byAppear(1表示出现，0表示消失), byte byType(1，金币；2，经验；3，血气值)
		public static const MsgId_Patrol_CaptureOutput:int=2705;                  /// [CL] 收取队员头顶的交互收益 CL: uint nActorId(角色ID)
		public static const MsgId_Patrol_CaptureTime:int=2706;                    /// [LC] 收取交互收益的次数 LC: uint nTimes(收取交互收益的次数)
		public static const MsgId_Patrol_Members:int=2707;                        /// [LC] 巡城队伍的成员 LC: [uint nActorId(角色ID)]*n
		public static const MsgId_Patrol_GainOnce:int=2708;                       /// [LC] 巡城单次获得的收益 LC: [uint nItemId(物品ID), uint nCount(数量)]*n
		public static const MsgId_Patrol_PrepareJoin:int=2709;                    /// [LC] 准备巡城 LC:()

		// 资源找回
		public static const MsgId_Retrieve_Single:int=2751;                       /// [CL\LC] 单个找回  CL: uint 要找回资源ID, byte 资源找回类型(0 普通找回，1 完美找回)  LC: uint 要找回资源ID
		public static const MsgId_Retrieve_Onekey :int=2752;                      /// [CL\LC] 一键找回 CL: byte 资源找回类型(0 一键普通，1 一键完美)  LC : byte 资源找回类型(0 一键普通，1 一键完美),[uint 找回的资源ID]*n
		public static const MsgId_Retrieve_Info:int=2753;                         /// [LC] 资源找回信息 LC: uint 要找回资源个数，[uint 找回资源ID，uint 奖励物品个数，[uint 奖励ItemID，uint 奖励数量]*n , byte 找回状态(0 未找回，1 找回), uint 完美找回消耗魔晶]*n

		// 玩家数据
		public static const MsgId_PlayerData_Info:int=2801;                       /// [LC] 玩家死亡信息 LC: 数据组数n, [Freshen表Id，玩家死亡次数]*n
		public static const MsgId_PlayerData_MoneyCost:int=2802;                  /// [CL\LC] 玩家魔晶消耗 CL:() LC: uint nMoneyCost(魔晶消耗)

		// 大乐斗活动
		public static const MsgId_Fuzion_EventTime:int=2851;                      /// [LC] 大乐斗场景事件的事件和经验倍率 LC: uint nItemCount(掉落宝箱时间数), [uint nTime(剩余时间，0表示已经刷了，单位秒)]*nItemCount, uint nBossCount(刷新Boss数), [uint nTime(剩余时间，0表示已经刷了，单位秒)]*nBossCount, uint nDamageRatio(当前打击经验倍率，百分比), uint nFixedRatio(当前固定经验倍率，百分比)
		public static const MsgId_Fuzion_Exp:int=2852;                            /// [LC] 大乐斗场景玩家获得的经验 LC: uint nExp(玩家获得的经验)
		public static const MsgId_Fuzion_Enter:int=2853;                          /// [CL] 进入大乐斗场景 CL: ()
		public static const MsgId_Fuzion_DamageExp:int=2854;                      /// [LC] 玩家攻击其他人获得的经验 LC: UID uidTarget(目标的UID), uint nExp(获得的经验)
		public static const MsgId_Fuzion_ItemBossCount:int=2855;                  /// [LC] 场景内物品和boss的数量 LC: uint nItemTotal(刷新物品总数), uint nItemLeft(剩余物品数量), uint nBossTotal(刷新boss总数), uint nBossLeft(剩余boss总数)
		public static const MsgId_Fuzion_HitInfo:int=2856;                        /// [LC] 玩家的击打次数和档次奖励 LC: uint nHit(击打次数), uint nLevel(档次), uint nRewardLevel(已经领取的档次奖励)
		public static const MsgId_Fuzion_HitReward:int=2857;                      /// [CL] 玩家领取击打次数奖励 CL:()

		// 星阵
		public static const MsgId_StarArray_Info:int=2901;                        /// [CL] 星阵数据信息 byte nCount1(已解过锁的星阵数量), [uint 星阵ID，byte nUnLockLineNum(解锁星阵线数量), [uint 星阵已解锁的线idx]*nUnLockLineNum]*nCount1,byte nCount2(已领过奖励的星阵数量), [uint 星阵ID，byte nHasRecieveNum(领取奖励数量) [uint 星阵已领取奖励idx]*nHasRecieveNum]*nCount2
		public static const MsgId_StarArray_UnLock:int=2902;                      /// [CL\LC] 星阵线解锁  CL: uint 星阵ID, uint 星阵线Idx  LC: uint 星阵ID, uint 星阵线Idx, byte 是否解锁(0 未解锁，1 解锁)
		public static const MsgId_StarArray_GetRwd:int=2903;                      /// [CL\LC] 领取星阵奖励 CL: uint 星阵ID  uint 星阵奖励Idx  LC: uint 星阵ID  uint 星阵奖励Idx, byte 是否领取(0 未领取, 1 领取)

		// QQ开放平台
		public static const MsgId_YellowVip_Update:int=2951;                      /// [LC] 角色当前黄钻信息 CL:();  LC: byte nYellowVipType(黄钻类型), byte nYellowLv(黄钻等级)，byte nNewGift(新手礼包 0表未领，1表示已领), byte nDailyGift(每日礼包 0表未领，1表示已领)，[uint nLv(已领的等级礼包)]*n
		public static const MsgId_YellowVip_GetReward:int=2952;                   /// [CL\LC] 领取黄钻礼包奖励 CL: byte nType(1 新手礼包，2 每日礼包，3 等级礼包)， unit nLv(等级礼包对应的等级)  LC: CL: byte nType(1 新手礼包，2 每日礼包，3 等级礼包)， unit nLv(等级礼包对应的等级)
		public static const MsgId_QQOpen_Buy:int=2953;                            /// [CL\LC] 玩家使用QQ支付购买商品 CL: uint nItemId(物品ID), uint nCount(数量); LC: utf8* sUrl(QQ平台返回的购买Url)
		public static const MsgId_QQOpen_ReLogin:int=2954;                        /// [LC] 通知玩家需要重新登陆 LC: ()

		// 炼金系统
		public static const MsgId_Alchemy_UseInfo:int=3001;                       /// [LC] 万灵药使用信息 LC: [uint nItemId, uint nCurUseNum(当前使用次数), uint nDailyUseNum(当天使用次数)]*n
		public static const MsgId_Alchemy_Use:int=3002;                           /// [LC] 使用万灵药 LC: uint nItemId, uint nUseNum

		// 副本一键扫荡
		public static const MsgId_Barrier_DupOneKeyClean:int=3051;                /// [CL\LC] 剧情副本一键扫荡 CL: uint mapId(剧情副本地图ID) LC: uint mapId(剧情副本地图ID), byte nSuccese(0: 失败 1: 成功)，uint nSweepingTime(扫荡中时间)，uint nSweepCDTime(扫荡CD),[uint nItemId, uint nItemNum]*n
		public static const MsgId_Barrier_DupCleanGetRwd:int=3052;                /// [CL] 领取剧情副本一键扫荡奖励 CL:[byte nDecQuality(1-4 依次表示绿，蓝，紫，橙)]*n
		public static const MsgId_Barrier_BuySweepTimes:int=3053;                 /// [CL\LC] 购买剧情副本一键扫荡冷却时间 CL:()  LC: uint nLastSweepMapId(上次扫荡mapID), uint nSurplusTimes(剩余冷却时间)
		public static const MsgId_Barrier_ReqSurplusSweepTimes:int=3054;          /// [CL\LC] 请求剧情副本一键扫荡冷却时间倒计时 CL:()  LC: uint nLastSweepMapId(上次扫荡mapID), uint nSurplusTimes(剩余冷却时间)

		// 在线时间
		public static const MsgId_Online_LoginDays:int=3101;                      /// [LC] 玩家登陆天数 LC: uint nLoginDaysTotal(玩家登陆天数)
		public static const MsgId_Online_RegDays:int=3102;                        /// [LC] 玩家注册天数 LC: uint nRegDays(注册天数)

		// 副本
		public static const MsgId_Barrier_FortressAbyssInfo:int=3151;             /// [LC] 要塞精英试炼副本信息 LC: ulong nMapId(通关的地图ID，0表示没有通过的地图)
		public static const MsgId_Barrier_NewRoomBroadcast:int=3152;              /// [LC] 多人副本房间创建广播 LC: uint nMapId(地图ID), uint nRoomId(房间ID), int nConditionPower(房间的战斗力条件), byte nCurNum(当前人数，人数为0表示房间被删除了), [byte bySkillSerie(技能系)]*nCurNum
		public static const MsgId_Barrier_RoomAddRobot:int=3153;                  /// [CL] 房主在房间内添加机器人 CL: byte byType(机器人类型)
		public static const MsgId_Barrier_RoomRobotTime:int=3154;                 /// [CL\LC] 房间内添加机器人的CD时间 CL:(); LC: uint nSeconds(添加机器人的CD时间，0表示可以添加，单位秒)

		// 红包系统
		public static const Msg_RedPacket_Send:int=3201;                          /// [CL\LC] 发送红包 CL: byte nType(红包类型), uint nRedPacketValue(红包价值)，ushort nRedPacketNum(红包数量)，string strExplain(捎句话) LC: [string 红包ID, uint nSendActorID(发送红包的ActorID)，string strName(发送玩家名字)，byte nRace(种族)，uint nRedPacketValue(红包价值)，ushort nSurplusNum(红包个数), byte nType(红包类型)]*n
		public static const Msg_RedPacket_Grab:int=3202;                          /// [CL\LC] 抢红包 CL: uint nSendActorID(发送红包的ActorID), string strRedPacketId(红包ID)  LC: uint nSendActorID(发送红包的ActorID), string strRedPacketId(红包ID)，byte nSuccess(0: 失败; 1: 成功)，ushort nSurplusGrabNum剩余可抢红包次数，[uint nItemId(奖励物品ItemID), uint nItemNum(奖励物品数量)]*n
		public static const Msg_RedPacket_ReqRecord:int=3203;                     /// [CL\LC] 请求红包发送和领取记录 CL: byte nType(0 发送记录, 1 领取红包记录)  LC: byte nType(0发送记录) ,uint nRedPacketNum(发送红包个数), [uint nRedPacketValue(红包价值多少魔晶)，uint nRedPacketNum(红包个数) uint nSendTime(发送时间)， uint nRecieveNum(领取人数), [string strName, uint nTakeTime(领取时间), uint nRwdNum(奖励个数), [uint nItemId, uint nNum]*nRwdNum, ]*nRecieveNum ]*nRedPacketNum ； byte nType(1领取记录), uint nTakenNum(领取个数)，[string strSendActorName(发送玩家名字), uint nTakenTime(领取时间), uint nRwdNum(奖励个数), [uint nItemId, uint nNum]*nRwdNum ]*nTakenNum
		public static const Msg_RedPacket_Reset:int=3204;                         /// [LC] 红包信息重置 LC: ()
		public static const Msg_RedPacket_ReqGrabRecord:int=3205;                 /// [CL\LC] 请求单条红包领取记录 CL: uint nSendActorID(发送红包的ActorID), string strRedPacketId(红包ID) LC: uint nRecieveNum(领取人数), [string strName, uint nTakeTime(领取时间), uint nRwdNum(奖励个数), [uint nItemId, uint nNum]*nRwdNum, ]*nRecieveNum

		// 挖宝互动
		public static const Msg_Treasure_BuryInfoAll:int=3251;                    /// [CL\LC] 请求所有埋宝信息 CL: () LC: uint nBuryNum(埋宝个数), [uint nItemId(时空宝箱ItemId)，uint nMapId，ushort nDugNum(已挖宝人数)，uint nSurplusTime(藏宝剩余时间), uint nBuryTime(埋宝时间), bool bFinish(是否结束挖宝互动 true 结束，false 未结束)，uint nBuryLv(挖宝时等级)]*nBuryNum, ushort nDugNum(已挖宝次数), bool bDugLimit(是否达到挖宝上限), uint nCanDugNum(可挖宝个数), [uint nBuryActorId(埋宝人ActorId), uint nItemId(时空宝箱ItemID), uint nMapId, string strBuryName(埋宝人名字), ushort nSuplusDugNum(剩余可挖次数)，uint nSurplusTime(剩余时间),uint nBuryTime(埋宝时间)，uint nPosX, uint nPosY]*nCanDugNum
		public static const Msg_Treasure_Bury:int=3252;                           /// [LC] 埋宝信息 LC: uint nItemId(时空宝箱ItemId)，uint nMapId，ushort nDugNum(已挖宝人数)，uint nSurplusTime(藏宝剩余时间), uint nBuryTime(埋宝时间), bool bFinish(是否结束挖宝互动 true 结束，false 未结束)，uint nBuryLv(挖宝时等级)
		public static const Msg_Treasure_CallPartner:int=3253;                    /// [CL] 呼叫小伙伴 CL: uint nBuryTime(埋宝时间)
		public static const Msg_Treasure_Dug:int=3254;                            /// [CL\LC] 挖宝 CL: uint nBuryActorId(埋宝人ActorId), uint nBuryTime(埋宝时间)  LC: byte(0:失败 1:成功)，uint 埋宝人ActorID, uint nBuryTime(埋宝时间)
		public static const Msg_Treasure_Reset:int=3255;                          /// [LC] 挖宝互动重置 LC:()
		public static const Msg_Treasure_UpdateCanDugInfo:int=3256;               /// [LC] 更新玩家可挖宝信息 LC: uint nBuryActorId(埋宝人ActorId), uint nItemId(时空宝箱ItemID), uint nMapId, string strBuryName(埋宝人名字), ushort nSuplusDugNum(剩余可挖次数)，uint nSurplusTime(剩余时间),uint nBuryTime(埋宝时间)，uint nPosX, uint nPosY

		// 副本
		public static const MsgId_Barrier_DoomRate:int=3301;                      /// [LC] 末日战场副本评级 LC: int nCurRate(当前评级), int nLeftTime(剩余时间，单位秒), int nAddPercent(奖励加成的百分比), int nDuration(评级时长)
		public static const MsgId_Barrier_DoomActorExpAdd:int=3302;               /// [LC] 末日战场杀怪的经验加成 LC: int nActorCount(玩家数量), int nAddPercent(加成的百分比)
		public static const MsgId_Barrier_ActorBriefInfo:int=3303;                /// [LC] 进入副本的玩家信息 LC: [uint nActorId(角色ID), utf8* sName(角色名), uint nRace(种族), uint nSeries(技能系)]*n
		public static const MsgId_Barrier_GoldStageInfo:int=3304;                 /// [LC] 金币副本关卡信息 LC: uint nStageTotal(总关卡数), uint nCurStage(当前关卡数), uint nMonsterTotal(小怪总数), uint nMonsterDead(小怪死亡数), uint nBossTotal(Boss总数), uint nBossDead(Boss死亡数)
		public static const MsgId_Barrier_GoldRewardInfo:int=3305;                /// [LC] 金币副本奖励信息 LC: uint nCollectCount(拾取物品数量), [uint nItemId(物品ID), uint nCount(数量)]*nCollectCount, uint nRewardCount(关卡奖励物品数量), [uint nItemId(物品ID), uint nCount(数量)]*nRewardCount

		// 开服寻宝
		public static const MsgId_OpenLuckyDraw_AllInfo :int=3351;                /// [CL\LC] 开服寻宝所有信息 CL: (); LC: uint nDrawCount(抽奖次数), [byte nIndex(第几次), uint nLuckyDrawId(奖励ID)]*nDrawCount, uint nSepcialRwdCount(全服收获显示区显示特殊奖励信息条数), [string strName(玩家名字), uint nLuckyDrawId(奖励ID), uint nDrawTime(抽奖时间)]*nSepcialRwdCount
		public static const MsgId_OpenLuckyDraw_Draw :int=3352;                   /// [CL\LC] 开服寻宝抽奖 CL: (); LC: byte nSucces(0: 失败，1: 成功), byte nDrawIndex(第几次抽), uint nLuckyDrawId(奖励ID)
		public static const MsgId_OpenLuckyDraw_UpdateInfo :int=3353;             /// [LC] 更新开服寻宝抽奖信息    LC: string strName(玩家名字), uint nLuckyDrawId(奖励ID), uint nDrawTime(抽奖时间)
		public static const MsgId_OpenLuckyDraw_TakeRwd:int=3354;                 /// [CL] 通知开服寻宝领取奖励 CL:()

		// 黄金Boss
		public static const MsgId_GoldBoss_Info:int=3401;                         /// [CL\LC] 黄金Boss信息 CL:() LC: uint nBossId(黄金BOSSId)，uint nActorId(最后一个击杀BOSS的玩家Id),string szName(最后一个击杀BOSS的玩家呢称)，int nRefTime(刷新倒计时，0已刷新；>0 未刷新，下次刷新倒计时(单位秒)，-1未刷新), uint nMapId, uint nPosX, uint nPosY
		public static const MsgId_BossHome_Bubble:int=3402;                       /// [LC] Boss之家Boss气泡 LC: uint nBossId(怪物ID), byte nRefresh(0: 死亡 1: 刷新)，uint nMapId, uint nPosX, uint nPosY

	}
}