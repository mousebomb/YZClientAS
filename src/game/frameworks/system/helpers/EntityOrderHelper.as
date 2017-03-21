/**
 * Created by gaord on 2017/3/7.
 */
package game.frameworks.system.helpers
{
	import flash.utils.ByteArray;

	import game.frameworks.system.model.vo.ItemVO;

	import tl.Net.MsgKey;
	import tl.Net.Socket.Connect;
	import tl.core.DataSources.Attr;
	import tl.core.role.RoleVO;

	public class EntityOrderHelper
	{

		public static function refreshEntity(vo:RoleVO, data:ByteArray):void
		{
			if (vo.DataArray == null)
			{
				vo.DataArray = new Array(attrListRole.length);
			}
			var _keyLength:int = data.readInt();
			var KeyArgs:Array  = [];
			for (var i:int = 0; i < int(_keyLength / 4); i++)
			{
				KeyArgs.push(data.readInt());
			}
			var ss:int = data.readInt();
			for (i = 0; i < attrListRole.length; i++)
			{
				//利用位与与位移算法来判断当前数据是否要更新
				if (int(KeyArgs[int(i >> 5)] & (1 << (i & 31))) != 0)
				{
					readData(vo, data, Attr.AttrType[attrListRole[i]], i, true);
				}
			}

			vo.Entity_UID = vo.DataArray[0]; //  0  0 实体UID

			vo.WEntity_SceneId = vo.DataArray[1]; // 73  2 世界实体的场景ID
			vo.WEntity_PosX    = vo.DataArray[2]; // 74  3 世界实体位置X
			vo.WEntity_PosY    = vo.DataArray[3]; // 75  4 世界实体位置Y
			vo.WEntity_PosH    = vo.DataArray[4]; // 76  5 世界实体位置H

			vo.Creature_Race           = vo.DataArray[5]; // 77  6 种族
			vo.Creature_Vocation       = vo.DataArray[6]; // 78  7 职业(技能系)
			vo.Creature_Gender         = vo.DataArray[7]; // 79  8 性别
			vo.Creature_Level          = vo.DataArray[8]; // 80  9 等级
			vo.Creature_Bless          = vo.DataArray[9]; // 81 10 祝福值
			vo.Creature_WizardId       = vo.DataArray[10]; // 82 11 精灵ID
			vo.Creature_MasterUID      = vo.DataArray[11]; // 83 12 主人ID
			vo.Creature_MoveSpeed      = vo.DataArray[12]; // 84 14 移动速度
			vo.Creature_FightPower     = vo.DataArray[13]; // 85 15 战力
			vo.Creature_Attack         = vo.DataArray[14]; // 86 16 攻击
			vo.Creature_Defense        = vo.DataArray[15]; // 87 17 防御
			vo.Creature_CurHp          = vo.DataArray[16]; // 88 18 生命值
			vo.Creature_MaxHp          = vo.DataArray[17]; // 89 20 生命值上限
			vo.Creature_Crit           = vo.DataArray[18]; // 90 22 暴击
			vo.Creature_Tenacity       = vo.DataArray[19]; // 91 23 韧性
			vo.Creature_AppendHurt     = vo.DataArray[20]; // 92 24 附加伤害
			vo.Creature_OutAttack      = vo.DataArray[21]; // 93 25 卓越攻击
			vo.Creature_AttackPerc     = vo.DataArray[22]; // 94 26 攻击加成
			vo.Creature_LgnoreDefense  = vo.DataArray[23]; // 95 27 无视防御
			vo.Creature_AbsorbHurt     = vo.DataArray[24]; // 96 28 吸收伤害
			vo.Creature_DefenseSuccess = vo.DataArray[25]; // 97 29 防御成功率
			vo.Creature_DefensePerc    = vo.DataArray[26]; // 98 30 防御加成
			vo.Creature_OutHurtPerc    = vo.DataArray[27]; // 99 31 减伤比例
			vo.Creature_Vampire        = vo.DataArray[28]; // 100 32 吸血
			vo.Creature_Hit            = vo.DataArray[29]; // 101 33 命中
			vo.Creature_Dodge          = vo.DataArray[30]; // 102 34 闪避
			vo.Creature_ThreatPerc     = vo.DataArray[31]; // 103 35 仇恨值比例
			vo.Creature_Skill1         = vo.DataArray[32]; // 104 36 当前技能1
			vo.Creature_Skill2         = vo.DataArray[33]; // 105 37 当前技能2
			vo.Creature_Skill3         = vo.DataArray[34]; // 106 38 当前技能3
			vo.Creature_Skill4         = vo.DataArray[35]; // 107 39 当前技能4
			vo.Creature_Skill5         = vo.DataArray[36]; // 108 40 当前技能5
			vo.Creature_Skill6         = vo.DataArray[37]; // 109 41 当前技能6
			vo.Creature_OwnerActorId   = vo.DataArray[38]; // 110 42 生物主人角色ID
			vo.Creature_OwnerActorName = vo.DataArray[39]; // 111 43 生物主人角色名
			vo.Creature_AppendThreat   = vo.DataArray[40]; // 112 59 附加仇恨值
			vo.Creature_WizardIdChange = vo.DataArray[41]; // 113 60 变身ID
			vo.Creature_Flag           = vo.DataArray[42]; // 114 61 标记(是否隐身/无敌等标记)
			vo.Player_Camp             = vo.DataArray[43]; // 115 62 阵营
			vo.Creature_ChangeSize     = vo.DataArray[44]; // 116 63 改变大小
			vo.Creature_WeaponLeft     = vo.DataArray[45]; // 117 64 左手武器
			vo.Creature_WeaponRight    = vo.DataArray[46]; // 118 65 右手武器
			vo.Creature_WeaponStrongLv = vo.DataArray[47]; // 119 66 武器强化等级
			vo.Creature_Wing           = vo.DataArray[48]; // 120 67 翅膀信息
			vo.Creature_Ride           = vo.DataArray[49]; // 121 66 坐骑信息
			vo.Creature_Equipset1      = vo.DataArray[50]; // 122 69 套装信息1(品质|强化)
			vo.Creature_Equipset2      = vo.DataArray[51]; // 123 70 套装信息2(鉴定|重铸)
			vo.Creature_TmpGroup       = vo.DataArray[52]; // 124 71 战场临时分组

			vo.Player_UserId         = vo.DataArray[53]; // 125 70 帐号ID
			vo.Player_ActorId        = vo.DataArray[54]; // 126 71 角色ID
			vo.Player_Exp            = vo.DataArray[55]; // 127 72 经验
			vo.Player_Stamina        = vo.DataArray[56]; // 128 73 体力
			vo.Player_MaxStamina     = vo.DataArray[57]; // 129 74 体力上限
			vo.Player_Credit         = vo.DataArray[58]; // 130 75 声望(荣誉)
			vo.Player_ArmyLevel      = vo.DataArray[59]; // 131 76 军衔
			vo.Player_CreditMaximum  = vo.DataArray[60]; // 132 77 声望(荣誉)的历史最大值
			vo.Player_QuestLevel     = vo.DataArray[61]; // 133 78 主任务级别
			vo.Player_WeaponStrongLv = vo.DataArray[62]; // 134 79 武器强化等级
			vo.Player_BagSize        = vo.DataArray[63]; // 135 80 背包栏有效个数
			vo.Player_Name           = vo.DataArray[64]; // 136 81 角色名
			vo.Player_VipCard        = vo.DataArray[65]; // 137 97 VIP卡
			vo.Player_Vip            = vo.DataArray[66]; // 138 98 VIP等级
			vo.Player_VipExp         = vo.DataArray[67]; // 139 99 VIP经验值
			vo.Player_Exploit        = vo.DataArray[68]; // 140 100 功勋
			vo.Player_CurWorldId     = vo.DataArray[69]; // 141 101 所在世界ID
			vo.Player_Right          = vo.DataArray[70]; // 142 102 玩家权限
			vo.Player_Pay            = vo.DataArray[71]; // 143 103 充值总数
			vo.Player_Money          = vo.DataArray[72]; // 144 104 元宝(魔晶)
			vo.Player_Gold           = vo.DataArray[73]; // 145 105 银两(金币)
			vo.Player_GiftGold       = vo.DataArray[74]; // 146 106 礼券
			vo.Player_BakSceneId     = vo.DataArray[75]; // 147 107 备份的场景ID
			vo.Player_BakPosX        = vo.DataArray[76]; // 148 108 备份的位置X
			vo.Player_BakPosY        = vo.DataArray[77]; // 149 109 备份的位置Y
			vo.Player_Title          = vo.DataArray[78]; // 150 110 当前称号
			vo.Player_Flags1         = vo.DataArray[79]; // 151 111 标志1
			vo.Player_Flags2         = vo.DataArray[80]; // 152 112 标志2
			vo.Player_Flags3         = vo.DataArray[81]; // 153 113 标志3
			vo.Player_WeaponLeft     = vo.DataArray[82]; // 154 114 左手武器
			vo.Player_WeaponRight    = vo.DataArray[83]; // 155 115 右手武器
			vo.Player_Fetch          = vo.DataArray[84]; // 156 116 提取元宝数量
			vo.Player_HBIntegral     = vo.DataArray[85]; // 157 117 图鉴积分
			vo.Player_PKModle        = vo.DataArray[86]; // 158 118 PK模式
			vo.Player_WeaponSoulLvId = vo.DataArray[87]; // 159 119 当前灌入的器魂等级ID
			vo.Player_Integral       = vo.DataArray[88]; // 160 120 积分(捕鱼兑换)
			vo.Player_Energy         = vo.DataArray[89]; // 161 121 能量值
			vo.Player_StallNickName  = vo.DataArray[90]; // 162 122 摆摊昵称

		}

		public static function refreshItem(vo:ItemVO ,data:ByteArray):void
		{
			if (vo.DataArray == null)
			{
				vo.DataArray = new Array(attrListRole.length);
			}
			var _keyLength:int = data.readInt();
			var KeyArgs:Array  = [];
			for (var i:int = 0; i < int(_keyLength / 4); i++)
			{
				KeyArgs.push(data.readInt());
			}
			var ss:int = data.readInt();
			for (i = 0; i < attrListRole.length; i++)
			{
				//利用位与与位移算法来判断当前数据是否要更新
				if (int(KeyArgs[int(i >> 5)] & (1 << (i & 31))) != 0)
				{
					readData(vo, data, Attr.AttrType[attrListRole[i]], i, false);
				}
			}
			vo.Entity_UID                    = vo.DataArray[ 0]; //  0  0 实体UID

			vo.Item_ItemId                   = vo.DataArray[ 1]; //  1  2 物品ID
			vo.Item_Guid                     = vo.DataArray[ 2]; //  2  3 唯一标识
			vo.Item_BindFlags                = vo.DataArray[ 3]; //  3  5 绑定标志
			vo.Item_Num                      = vo.DataArray[ 4]; //  4  6 物品数量
			vo.Item_Slot0                    = vo.DataArray[ 5]; //  5  7 插槽0
			vo.Item_Slot1                    = vo.DataArray[ 6]; //  6  8 插槽1
			vo.Item_Slot2                    = vo.DataArray[ 7]; //  7  9 插槽2
			vo.Item_Slot3                    = vo.DataArray[ 8]; //  8 10 插槽3
			vo.Item_Slot4                    = vo.DataArray[ 9]; //  9 11 插槽4
			vo.Item_Attack                   = vo.DataArray[10]; // 10 12 (基本)攻击
			vo.Item_Defense                  = vo.DataArray[11]; // 11 13 (基本)防御
			vo.Item_CurHp                    = vo.DataArray[12]; // 12 14 (基本)生命值
			vo.Item_Crit                     = vo.DataArray[13]; // 13 15 (基本)暴击
			vo.Item_Tenacity                 = vo.DataArray[14]; // 14 16 (基本)韧性
			vo.Item_AppendHurt               = vo.DataArray[15]; // 15 17 (基本)附加伤害
			vo.Item_OutAttack                = vo.DataArray[16]; // 16 18 (基本)卓越攻击
			vo.Item_AttackPerc               = vo.DataArray[17]; // 17 19 (基本)攻击加成
			vo.Item_LgnoreDefense            = vo.DataArray[18]; // 18 20 (基本)无视防御
			vo.Item_AbsorbHurt               = vo.DataArray[19]; // 19 21 (基本)吸收伤害
			vo.Item_DefenseSuccess           = vo.DataArray[20]; // 20 22 (基本)防御成功率
			vo.Item_DefensePerc              = vo.DataArray[21]; // 21 23 (基本)防御加成
			vo.Item_OutHurtPerc              = vo.DataArray[22]; // 22 24 (基本)减伤比例
			vo.Item_Vampire                  = vo.DataArray[23]; // 23 25 (基本)吸血
			vo.Item_Power                    = vo.DataArray[24]; // 24 26 能力值
			vo.Item_Expire                   = vo.DataArray[25]; // 25 27 到期时间
			vo.Item_StrongLevel              = vo.DataArray[26]; // 26 28 强化等级
			vo.Item_StrongAttack             = vo.DataArray[27]; // 27 29 (强化)攻击
			vo.Item_StrongDefense            = vo.DataArray[28]; // 28 30 (强化)防御
			vo.Item_StrongCurHp              = vo.DataArray[29]; // 29 31 (强化)生命值
			vo.Item_StrongCrit               = vo.DataArray[30]; // 30 32 (强化)暴击
			vo.Item_StrongTenacity           = vo.DataArray[31]; // 31 33 (强化)韧性
			vo.Item_StrongAppendHurt         = vo.DataArray[32]; // 32 34 (强化)附加伤害
			vo.Item_StrongOutAttack          = vo.DataArray[33]; // 33 35 (强化)卓越攻击
			vo.Item_StrongAttackPerc         = vo.DataArray[34]; // 34 36 (强化)攻击加成
			vo.Item_StrongLgnoreDefense      = vo.DataArray[35]; // 35 37 (强化)无视防御
			vo.Item_StrongAbsorbHurt         = vo.DataArray[36]; // 36 38 (强化)吸收伤害
			vo.Item_StrongDefenseSuccess     = vo.DataArray[37]; // 37 39 (强化)防御成功率
			vo.Item_StrongDefensePerc        = vo.DataArray[38]; // 38 40 (强化)防御加成
			vo.Item_StrongOutHurtPerc        = vo.DataArray[39]; // 39 41 (强化)减伤比例
			vo.Item_StrongVampire            = vo.DataArray[40]; // 40 42 (强化)吸血
			vo.Item_RecoinTimes              = vo.DataArray[41]; // 41 43 重铸次数
			vo.Item_RecoinAttack             = vo.DataArray[42]; // 42 44 (重铸)攻击
			vo.Item_RecoinDefense            = vo.DataArray[43]; // 43 45 (重铸)防御
			vo.Item_RecoinCurHp              = vo.DataArray[44]; // 44 46 (重铸)生命值
			vo.Item_RecoinCrit               = vo.DataArray[45]; // 45 47 (重铸)暴击
			vo.Item_RecoinTenacity           = vo.DataArray[46]; // 46 48 (重铸)韧性
			vo.Item_RecoinAppendHurt         = vo.DataArray[47]; // 47 49 (重铸)附加伤害
			vo.Item_RecoinOutAttack          = vo.DataArray[48]; // 48 50 (重铸)卓越攻击
			vo.Item_RecoinAttackPerc         = vo.DataArray[49]; // 49 51 (重铸)攻击加成
			vo.Item_RecoinLgnoreDefense      = vo.DataArray[50]; // 50 52 (重铸)无视防御
			vo.Item_RecoinAbsorbHurt         = vo.DataArray[51]; // 51 53 (重铸)吸收伤害
			vo.Item_RecoinDefenseSuccess     = vo.DataArray[52]; // 52 54 (重铸)防御成功率
			vo.Item_RecoinDefensePerc        = vo.DataArray[53]; // 53 55 (重铸)防御加成
			vo.Item_RecoinOutHurtPerc        = vo.DataArray[54]; // 54 56 (重铸)减伤比例
			vo.Item_RecoinVampire            = vo.DataArray[55]; // 55 57 (重铸)吸血
			vo.Item_IdentifyTimes            = vo.DataArray[56]; // 56 58 鉴定次数
			vo.Item_IdentifyAttack           = vo.DataArray[57]; // 57 59 (鉴定)攻击
			vo.Item_IdentifyDefense          = vo.DataArray[58]; // 58 60 (鉴定)防御
			vo.Item_IdentifyCurHp            = vo.DataArray[59]; // 59 61 (鉴定)生命值
			vo.Item_IdentifyCrit             = vo.DataArray[60]; // 60 62 (鉴定)暴击
			vo.Item_IdentifyTenacity         = vo.DataArray[61]; // 61 63 (鉴定)韧性
			vo.Item_IdentifyAppendHurt       = vo.DataArray[62]; // 62 64 (鉴定)附加伤害
			vo.Item_IdentifyOutAttack        = vo.DataArray[63]; // 63 65 (鉴定)卓越攻击
			vo.Item_IdentifyAttackPerc       = vo.DataArray[64]; // 64 66 (鉴定)攻击加成
			vo.Item_IdentifyLgnoreDefense    = vo.DataArray[65]; // 65 67 (鉴定)无视防御
			vo.Item_IdentifyAbsorbHurt       = vo.DataArray[66]; // 66 68 (鉴定)吸收伤害
			vo.Item_IdentifyDefenseSuccess   = vo.DataArray[67]; // 67 69 (鉴定)防御成功率
			vo.Item_IdentifyDefensePerc      = vo.DataArray[68]; // 68 70 (鉴定)防御加成
			vo.Item_IdentifyOutHurtPerc      = vo.DataArray[69]; // 69 71 (鉴定)减伤比例
			vo.Item_IdentifyVampire          = vo.DataArray[70]; // 70 72 (鉴定)吸血
			vo.Item_Bless                    = vo.DataArray[71]; // 71 73 祝福值(宝石经验值)
			vo.Item_Identification           = vo.DataArray[72]; // 72 74 辨识

		}

		/** isPlayer 标识是否玩家， false用于Item */
		private static function readData(vo:*, dataArgs:ByteArray, length:String, key:int, isPlayer:Boolean = true):void
		{
			if (isPlayer && (key == 16 || key == 17 || key == 55 || key == 73))
			{
				vo.DataArray[key] = Connect.getInstance().readUint64(dataArgs);
			} else
			{
				switch (length)
				{
					case MsgKey._int:
						vo.DataArray[key] = dataArgs.readInt();
						break;
					case MsgKey._float:
						vo.DataArray[key] = dataArgs.readFloat();
						break;
					case MsgKey._boolean:
						vo.DataArray[key] = dataArgs.readBoolean();
						break;
					case MsgKey._byte:
						vo.DataArray[key] = dataArgs.readByte();
						break;
					case MsgKey._double:
						vo.DataArray[key] = dataArgs.readDouble();
						break;
					case MsgKey._String:
						vo.DataArray[key] = dataArgs.readUTF();
						break;
					case MsgKey._unit:
						vo.DataArray[key] = dataArgs.readUnsignedInt();
						break;
					default:
						vo.DataArray[key] = dataArgs.readUTFBytes(int(length));
						break;
				}
			}
		}


		private static const attrListRole:Array = [

			0,     // Entity_UID                     实体UID
			73,     // WEntity_SceneId                世界实体的场景ID
			74,     // WEntity_PosX                   世界实体位置X
			75,     // WEntity_PosY                   世界实体位置Y
			76,     // WEntity_PosH                   世界实体位置H
			77,     // Creature_Race                  种族
			78,     // Creature_Vocation              职业(技能系)
			79,     // Creature_Gender                性别
			80,     // Creature_Level                 等级
			81,     // Creature_Bless                 祝福值
			82,     // Creature_WizardId              精灵ID
			83,     // Creature_MasterUID             主人ID
			84,     // Creature_MoveSpeed             移动速度
			85,     // Creature_FightPower            战力
			86,     // Creature_Attack                攻击
			87,     // Creature_Defense               防御
			88,     // Creature_CurHp                 生命值
			89,     // Creature_MaxHp                 生命值上限
			90,     // Creature_Crit                  暴击
			91,     // Creature_Tenacity              韧性
			92,     // Creature_AppendHurt            附加伤害
			93,     // Creature_OutAttack             卓越攻击
			94,     // Creature_AttackPerc            攻击加成
			95,     // Creature_LgnoreDefense         无视防御
			96,     // Creature_AbsorbHurt            吸收伤害
			97,     // Creature_DefenseSuccess        防御成功率
			98,     // Creature_DefensePerc           防御加成
			99,     // Creature_OutHurtPerc           减伤比例
			100,     // Creature_Vampire               吸血
			101,     // Creature_Hit                   命中
			102,     // Creature_Dodge                 闪避
			103,     // Creature_ThreatPerc            仇恨值比例
			104,     // Creature_Skill1                当前技能1
			105,     // Creature_Skill2                当前技能2
			106,     // Creature_Skill3                当前技能3
			107,     // Creature_Skill4                当前技能4
			108,     // Creature_Skill5                当前技能5
			109,     // Creature_Skill6                当前技能6
			110,     // Creature_OwnerActorId          生物主人角色ID
			111,     // Creature_OwnerActorName        生物主人角色名
			112,     // Creature_AppendThreat          附加仇恨值
			113,     // Creature_WizardIdChange        变身ID
			114,     // Creature_Flag                  标记(是否隐身/无敌等标记)
			115,     // Player_Camp                    阵营
			116,     // Creature_ChangeSize            改变大小
			117,     // Creature_WeaponLeft            左手武器
			118,     // Creature_WeaponRight           右手武器
			119,     // Creature_WeaponStrongLv        武器强化等级
			120,     // Creature_Wing                  翅膀信息
			121,     // Creature_Ride                  坐骑信息
			122,     // Creature_Equipset1             套装信息1(品质|强化)
			123,     // Creature_Equipset2             套装信息2(鉴定|重铸)
			124,     // Creature_TmpGroup              战场临时分组
			125,     // Player_UserId                  帐号ID
			126,     // Player_ActorId                 角色ID
			127,     // Player_Exp                     经验
			128,     // Player_Stamina                 体力		(qqvip类型)
			129,     // Player_MaxStamina              体力上限	(qqvip等级)
			130,     // Player_Credit                  声望(荣誉)
			131,     // Player_ArmyLevel               军衔
			132,     // Player_CreditMaximum           声望(荣誉)的历史最大值
			133,     // Player_QuestLevel              主任务级别
			134,     // Player_WeaponStrongLv          武器强化等级
			135,     // Player_BagSize                 背包栏有效个数
			136,     // Player_Name                    角色名
			137,     // Player_VipCard                 VIP卡
			138,     // Player_Vip                     VIP等级
			139,     // Player_VipExp                  VIP经验值
			140,     // Player_Exploit                 功勋
			141,     // Player_CurWorldId              所在世界ID
			142,     // Player_Right                   玩家权限
			143,     // Player_Pay                     充值总数
			144,     // Player_Money                   元宝(魔晶)
			145,     // Player_Gold                    银两(金币)
			146,     // Player_GiftGold                礼券
			147,     // Player_BakSceneId              备份的场景ID
			148,     // Player_BakPosX                 备份的位置X
			149,     // Player_BakPosY                 备份的位置Y
			150,     // Player_Title                   当前称号
			151,     // Player_Flags1                  标志1
			152,     // Player_Flags2                  标志2
			153,     // Player_Flags3                  标志3
			154,     // Player_WeaponLeft              左手武器
			155,     // Player_WeaponRight             右手武器
			156,     // Player_Fetch                   提取元宝数量
			157,     // Player_HBIntegral              图鉴积分
			158,     // Player_PKModle                 PK模式
			159,     // Player_WeaponSoulLvId          当前灌入的器魂等级ID
			160,     // Player_Integral                积分(捕鱼兑换)
			161,     // Player_Energy                  能量值
			162,     // Player_StallNickName           摆摊昵称

		];


		private static const attrListItem:Array = [

			0,     // Entity_UID                     实体UID
			1,     // Item_ItemId                    物品ID
			2,     // Item_Guid                      唯一标识
			3,     // Item_BindFlags                 绑定标志
			4,     // Item_Num                       物品数量
			5,     // Item_Slot0                     插槽0
			6,     // Item_Slot1                     插槽1
			7,     // Item_Slot2                     插槽2
			8,     // Item_Slot3                     插槽3
			9,     // Item_Slot4                     插槽4
			10,     // Item_Attack                    (基本)攻击
			11,     // Item_Defense                   (基本)防御
			12,     // Item_CurHp                     (基本)生命值
			13,     // Item_Crit                      (基本)暴击
			14,     // Item_Tenacity                  (基本)韧性
			15,     // Item_AppendHurt                (基本)附加伤害
			16,     // Item_OutAttack                 (基本)卓越攻击
			17,     // Item_AttackPerc                (基本)攻击加成
			18,     // Item_LgnoreDefense             (基本)无视防御
			19,     // Item_AbsorbHurt                (基本)吸收伤害
			20,     // Item_DefenseSuccess            (基本)防御成功率
			21,     // Item_DefensePerc               (基本)防御加成
			22,     // Item_OutHurtPerc               (基本)减伤比例
			23,     // Item_Vampire                   (基本)吸血
			24,     // Item_Power                     能力值
			25,     // Item_Expire                    到期时间
			26,     // Item_StrongLevel               强化等级
			27,     // Item_StrongAttack              (强化)攻击
			28,     // Item_StrongDefense             (强化)防御
			29,     // Item_StrongCurHp               (强化)生命值
			30,     // Item_StrongCrit                (强化)暴击
			31,     // Item_StrongTenacity            (强化)韧性
			32,     // Item_StrongAppendHurt          (强化)附加伤害
			33,     // Item_StrongOutAttack           (强化)卓越攻击
			34,     // Item_StrongAttackPerc          (强化)攻击加成
			35,     // Item_StrongLgnoreDefense       (强化)无视防御
			36,     // Item_StrongAbsorbHurt          (强化)吸收伤害
			37,     // Item_StrongDefenseSuccess      (强化)防御成功率
			38,     // Item_StrongDefensePerc         (强化)防御加成
			39,     // Item_StrongOutHurtPerc         (强化)减伤比例
			40,     // Item_StrongVampire             (强化)吸血
			41,     // Item_RecoinTimes               重铸次数
			42,     // Item_RecoinAttack              (重铸)攻击
			43,     // Item_RecoinDefense             (重铸)防御
			44,     // Item_RecoinCurHp               (重铸)生命值
			45,     // Item_RecoinCrit                (重铸)暴击
			46,     // Item_RecoinTenacity            (重铸)韧性
			47,     // Item_RecoinAppendHurt          (重铸)附加伤害
			48,     // Item_RecoinOutAttack           (重铸)卓越攻击
			49,     // Item_RecoinAttackPerc          (重铸)攻击加成
			50,     // Item_RecoinLgnoreDefense       (重铸)无视防御
			51,     // Item_RecoinAbsorbHurt          (重铸)吸收伤害
			52,     // Item_RecoinDefenseSuccess      (重铸)防御成功率
			53,     // Item_RecoinDefensePerc         (重铸)防御加成
			54,     // Item_RecoinOutHurtPerc         (重铸)减伤比例
			55,     // Item_RecoinVampire             (重铸)吸血
			56,     // Item_IdentifyTimes             鉴定次数
			57,     // Item_IdentifyAttack            (鉴定)攻击
			58,     // Item_IdentifyDefense           (鉴定)防御
			59,     // Item_IdentifyCurHp             (鉴定)生命值
			60,     // Item_IdentifyCrit              (鉴定)暴击
			61,     // Item_IdentifyTenacity          (鉴定)韧性
			62,     // Item_IdentifyAppendHurt        (鉴定)附加伤害
			63,     // Item_IdentifyOutAttack         (鉴定)卓越攻击
			64,     // Item_IdentifyAttackPerc        (鉴定)攻击加成
			65,     // Item_IdentifyLgnoreDefense     (鉴定)无视防御
			66,     // Item_IdentifyAbsorbHurt        (鉴定)吸收伤害
			67,     // Item_IdentifyDefenseSuccess    (鉴定)防御成功率
			68,     // Item_IdentifyDefensePerc       (鉴定)防御加成
			69,     // Item_IdentifyOutHurtPerc       (鉴定)减伤比例
			70,     // Item_IdentifyVampire           (鉴定)吸血
			71,     // Item_Bless                     祝福值(宝石经验值)
			72,     // Item_Identification            辨识
			73,		// Item_ProhibitedTransaction     是否可以摆摊 交易

		];


	}
}
