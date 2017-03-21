/**
 * Created by gaord on 2016/12/26.
 */
package tl.core.role
{
	import game.frameworks.system.model.vo.CsvRoleVO;

    import tl.core.mapnode.Node;

    public class RoleVO
	{

		/**移动路径*/
		public var movePath:Vector.<Node>;
		/**移动过程数据*/
		public var moveVO:RoleMoveVO;
		/** 配置表内的数据 */
		public var csvVO:CsvRoleVO ;
	    /**凶手UID,0表示自杀或系统击杀的*/
        public var killerUid:Number;
	    /**死亡标志*/
        public var isDead:Boolean;
	    /**死亡类型 0-原地死;1-击退 2-击飞 3-击倒*/
        public var killType:int;
	    /**在视野范围标志*/
        public var inMyEyes:Boolean;
        /** 是否隐身中(0:非隐身中,1:隐身中 ,2:半隐身) **/
        public var stealthType:int;
	    /**设置随机聊天ID*/
        public var spokenId:uint;
		public function RoleVO()
		{
		}

		/** 客户端显示坐标x */
		public function get x ():Number{return  WEntity_PosX; }
		/** 转化为客户端的z*/
		public function get z ():Number{return  -WEntity_PosY; }

		/**浮空*/
		private var _float:Number = 0.0;

		/**浮空*/
		public function get float():Number
		{
			return _float;
		}

		public function set float(value:Number):void
		{
			_float = value;
		}

		/** 移动速度 (每秒移动几格） */
		public function get moveSpeed():uint
		{
			if (Creature_MoveSpeed < 1)
				return csvVO.MoveSpeed;
			else
				return Creature_MoveSpeed;
		}

		// #pragma mark --  服务器数据字段  ------------------------------------------------------------
		public var DataArray:Array;
		public var Entity_UID                    : Number    ;     //  0  0 Entity_UID                     实体UID

		public var WEntity_SceneId               : uint      ;     // 73  2 WEntity_SceneId                世界实体的场景ID
		public var WEntity_PosX                  : uint      ;     // 74  3 WEntity_PosX                   世界实体位置X
		public var WEntity_PosY                  : uint      ;     // 75  4 WEntity_PosY                   世界实体位置Y
		public var WEntity_PosH                  : uint      ;     // 76  5 WEntity_PosH                   世界实体位置H

		public var Creature_Race                 : uint      ;     // 77  6 Creature_Race                  种族
		public var Creature_Vocation             : uint      ;     // 78  7 Creature_Vocation              职业(技能系)
		public var Creature_Gender               : uint      ;     // 79  8 Creature_Gender                性别
		public var Creature_Level                : uint      ;     // 80  9 Creature_Level                 等级
		public var Creature_Bless                : uint      ;     // 81 10 Creature_Bless                 祝福值
		public var Creature_WizardId             : uint      ;     // 82 11 Creature_WizardId              精灵ID
		public var Creature_MasterUID            : Number    ;     // 83 12 Creature_MasterUID             主人ID
		public var Creature_MoveSpeed            : uint      ;     // 84 14 Creature_MoveSpeed             移动速度
		public var Creature_FightPower           : uint      ;     // 85 15 Creature_FightPower            战力
		public var Creature_Attack               : uint      ;     // 86 16 Creature_Attack                攻击
		public var Creature_Defense              : uint      ;     // 87 17 Creature_Defense               防御
		public var Creature_CurHp                : Number    ;     // 88 18 Creature_CurHp                 生命值

		public var Creature_MaxHp                : Number    ;     // 89 20 Creature_MaxHp                 生命值上限
		public var Creature_Crit                 : uint      ;     // 90 22 Creature_Crit                  暴击
		public var Creature_Tenacity             : uint      ;     // 91 23 Creature_Tenacity              韧性
		public var Creature_AppendHurt           : uint      ;     // 92 24 Creature_AppendHurt            附加伤害
		public var Creature_OutAttack            : uint      ;     // 93 25 Creature_OutAttack             卓越攻击
		public var Creature_AttackPerc           : uint      ;     // 94 26 Creature_AttackPerc            攻击加成
		public var Creature_LgnoreDefense        : uint      ;     // 95 27 Creature_LgnoreDefense         无视防御
		public var Creature_AbsorbHurt           : uint      ;     // 96 28 Creature_AbsorbHurt            吸收伤害
		public var Creature_DefenseSuccess       : uint      ;     // 97 29 Creature_DefenseSuccess        防御成功率
		public var Creature_DefensePerc          : uint      ;     // 98 30 Creature_DefensePerc           防御加成
		public var Creature_OutHurtPerc          : uint      ;     // 99 31 Creature_OutHurtPerc           减伤比例
		public var Creature_Vampire              : uint      ;     // 100 32 Creature_Vampire               吸血
		public var Creature_Hit                  : uint      ;     // 101 33 Creature_Hit                   命中
		public var Creature_Dodge                : uint      ;     // 102 34 Creature_Dodge                 闪避
		public var Creature_ThreatPerc           : uint      ;     // 103 35 Creature_ThreatPerc            仇恨值比例
		public var Creature_Skill1               : uint      ;     // 104 36 Creature_Skill1                当前技能1
		public var Creature_Skill2               : uint      ;     // 105 37 Creature_Skill2                当前技能2
		public var Creature_Skill3               : uint      ;     // 106 38 Creature_Skill3                当前技能3
		public var Creature_Skill4               : uint      ;     // 107 39 Creature_Skill4                当前技能4
		public var Creature_Skill5               : uint      ;     // 108 40 Creature_Skill5                当前技能5
		public var Creature_Skill6               : uint      ;     // 109 41 Creature_Skill6                当前技能6
		public var Creature_OwnerActorId         : uint      ;     // 110 42 Creature_OwnerActorId          生物主人角色ID
		public var Creature_OwnerActorName       : String    ;     // 111 43 Creature_OwnerActorName        生物主人角色名
		public var Creature_AppendThreat         : uint      ;     // 112 59 Creature_AppendThreat          附加仇恨值
		public var Creature_WizardIdChange       : uint      ;     // 113 60 Creature_WizardIdChange        变身ID
		public var Creature_Flag                 : uint      ;     // 114 61 Creature_Flag                  标记(是否隐身/无敌等标记)
		public var Player_Camp                   : uint      ;     // 115 62 Player_Camp                    阵营
		public var Creature_ChangeSize           : int       ;     // 116 63 Creature_ChangeSize            改变大小
		public var Creature_WeaponLeft           : int       ;     // 117 64 Creature_WeaponLeft            左手武器
		public var Creature_WeaponRight          : int       ;     // 118 65 Creature_WeaponRight           右手武器
		public var Creature_WeaponStrongLv       : int       ;     // 119 66 Creature_WeaponStrongLv        武器强化等级
		public var Creature_Wing                 : int       ;     // 120 67 Creature_Wing                  翅膀信息
		public var Creature_Ride                : int       ;     // 121 68 Creature_Save1                 保留
		public var Creature_Equipset1            : int       ;     // 122 69 Creature_Equipset1             套装信息1(品质|强化)
		public var Creature_Equipset2            : int       ;     // 123 70 Creature_Equipset2             套装信息2(鉴定|重铸)
		public var Creature_TmpGroup             : uint      ;     // 124 71 Creature_TmpGroup              战场临时分组


		public var Player_UserId                 : uint      ;     // 125 70 Player_UserId                  帐号ID
		public var Player_ActorId                : uint      ;     // 126 71 Player_ActorId                 角色ID
		public var Player_Exp                    : Number     ;     // 127 72 Player_Exp                     经验
		public var Player_Stamina                : uint      ;     // 128 73 Player_Stamina                 体力
		public var Player_MaxStamina             : uint      ;     // 129 74 Player_MaxStamina              体力上限
		public var Player_Credit                 : uint      ;     // 130 75 Player_Credit                  声望(荣誉)
		public var Player_ArmyLevel              : uint      ;     // 131 76 Player_ArmyLevel               军衔
		public var Player_CreditMaximum          : uint      ;     // 132 77 Player_CreditMaximum           声望(荣誉)的历史最大值
		public var Player_QuestLevel             : uint      ;     // 133 78 Player_QuestLevel              主任务级别
		public var Player_WeaponStrongLv         : uint      ;     // 134 79 Player_WeaponStrongLv          武器强化等级
		public var Player_BagSize                : uint      ;     // 135 80 Player_BagSize                 背包栏有效个数
		public var Player_Name                   : String    ;     // 136 81 Player_Name                    角色名
		public var Player_VipCard                : uint      ;     // 137 97 Player_VipCard                 VIP卡
		public var Player_Vip                    : uint      ;     // 138 98 Player_Vip                     VIP等级
		public var Player_VipExp                 : uint      ;     // 139 99 Player_VipExp                  VIP经验值
		public var Player_Exploit                : uint      ;     // 140 100 Player_Exploit                 功勋
		public var Player_CurWorldId             : uint      ;     // 141 101 Player_CurWorldId              所在世界ID
		public var Player_Right                  : uint      ;     // 142 102 Player_Right                   玩家权限
		public var Player_Pay                    : uint      ;     // 143 103 Player_Pay                     充值总数
		public var Player_Money                  : uint      ;     // 144 104 Player_Money                   元宝(魔晶)
		public var Player_Gold                   : Number      ;     // 145 105 Player_Gold                    银两(金币)
		public var Player_GiftGold               : uint      ;     // 146 106 Player_GiftGold                礼券
		public var Player_BakSceneId             : uint      ;     // 147 107 Player_BakSceneId              备份的场景ID
		public var Player_BakPosX                : uint      ;     // 148 108 Player_BakPosX                 备份的位置X
		public var Player_BakPosY                : uint      ;     // 149 109 Player_BakPosY                 备份的位置Y
		public var Player_Title                  : uint      ;     // 150 110 Player_Title                   当前称号
		public var Player_Flags1                 : uint      ;     // 151 111 Player_Flags1                  标志1
		public var Player_Flags2                 : uint      ;     // 152 112 Player_Flags2                  标志2
		public var Player_Flags3                 : uint      ;     // 153 113 Player_Flags3                  标志3
		public var Player_WeaponLeft             : uint      ;     // 154 114 Player_WeaponLeft              左手武器
		public var Player_WeaponRight            : uint      ;     // 155 115 Player_WeaponRight             右手武器
		public var Player_Fetch                  : uint      ;     // 156 116 Player_Fetch                   提取元宝数量
		public var Player_HBIntegral             : uint      ;     // 157 117 Player_HBIntegral              图鉴积分
		public var Player_PKModle                : uint      ;     // 158 118 Player_PKModle                 PK模式
		public var Player_WeaponSoulLvId         : uint      ;     // 159 119 Player_WeaponSoulLvId          当前灌入的器魂等级ID
		public var Player_Integral               : uint      ;     // 160 120 Player_Integral                积分(捕鱼兑换)
		public var Player_Energy                 : uint      ;     // 161 121 Player_Energy                  能量值
		public var Player_StallNickName          : String    ;     // 162 122 Player_StallNickName           摆摊昵称



	}
}
