/**
 * Created by gaord on 2017/3/7.
 */
package game.frameworks.system.model.vo
{
	public class ItemVO
	{
		public var csvVO:CsvItemVO;

		public function ItemVO()
		{
		}






		// #pragma mark --  服务器数据字段  ------------------------------------------------------------
		public var DataArray:Array;
		public var Entity_UID                    : Number    ;     //  0  0 Entity_UID                     实体UID

		public var Item_ItemId                   : uint      ;     //  1  2 Item_ItemId                    物品ID
		public var Item_Guid                     : Number    ;     //  2  3 Item_Guid                      唯一标识
		public var Item_BindFlags                : uint      ;     //  3  5 Item_BindFlags                 绑定标志
		public var Item_Num                      : uint      ;     //  4  6 Item_Num                       物品数量
		public var Item_Slot0                    : uint      ;     //  5  7 Item_Slot0                     插槽0
		public var Item_Slot1                    : uint      ;     //  6  8 Item_Slot1                     插槽1
		public var Item_Slot2                    : uint      ;     //  7  9 Item_Slot2                     插槽2
		public var Item_Slot3                    : uint      ;     //  8 10 Item_Slot3                     插槽3
		public var Item_Slot4                    : uint      ;     //  9 11 Item_Slot4                     插槽4
		public var Item_Attack                   : uint      ;     // 10 12 Item_Attack                    (基本)攻击
		public var Item_Defense                  : uint      ;     // 11 13 Item_Defense                   (基本)防御
		public var Item_CurHp                    : uint      ;     // 12 14 Item_CurHp                     (基本)生命值
		public var Item_Crit                     : uint      ;     // 13 15 Item_Crit                      (基本)暴击
		public var Item_Tenacity                 : uint      ;     // 14 16 Item_Tenacity                  (基本)韧性
		public var Item_AppendHurt               : uint      ;     // 15 17 Item_AppendHurt                (基本)附加伤害
		public var Item_OutAttack                : uint      ;     // 16 18 Item_OutAttack                 (基本)卓越攻击
		public var Item_AttackPerc               : uint      ;     // 17 19 Item_AttackPerc                (基本)攻击加成
		public var Item_LgnoreDefense            : uint      ;     // 18 20 Item_LgnoreDefense             (基本)无视防御
		public var Item_AbsorbHurt               : uint      ;     // 19 21 Item_AbsorbHurt                (基本)吸收伤害
		public var Item_DefenseSuccess           : uint      ;     // 20 22 Item_DefenseSuccess            (基本)防御成功率
		public var Item_DefensePerc              : uint      ;     // 21 23 Item_DefensePerc               (基本)防御加成
		public var Item_OutHurtPerc              : uint      ;     // 22 24 Item_OutHurtPerc               (基本)减伤比例
		public var Item_Vampire                  : uint      ;     // 23 25 Item_Vampire                   (基本)吸血
		public var Item_Power                    : uint      ;     // 24 26 Item_Power                     能力值
		public var Item_Expire                   : uint      ;     // 25 27 Item_Expire                    到期时间
		public var Item_StrongLevel              : uint      ;     // 26 28 Item_StrongLevel               强化等级
		public var Item_StrongAttack             : uint      ;     // 27 29 Item_StrongAttack              (强化)攻击
		public var Item_StrongDefense            : uint      ;     // 28 30 Item_StrongDefense             (强化)防御
		public var Item_StrongCurHp              : uint      ;     // 29 31 Item_StrongCurHp               (强化)生命值
		public var Item_StrongCrit               : uint      ;     // 30 32 Item_StrongCrit                (强化)暴击
		public var Item_StrongTenacity           : uint      ;     // 31 33 Item_StrongTenacity            (强化)韧性
		public var Item_StrongAppendHurt         : uint      ;     // 32 34 Item_StrongAppendHurt          (强化)附加伤害
		public var Item_StrongOutAttack          : uint      ;     // 33 35 Item_StrongOutAttack           (强化)卓越攻击
		public var Item_StrongAttackPerc         : uint      ;     // 34 36 Item_StrongAttackPerc          (强化)攻击加成
		public var Item_StrongLgnoreDefense      : uint      ;     // 35 37 Item_StrongLgnoreDefense       (强化)无视防御
		public var Item_StrongAbsorbHurt         : uint      ;     // 36 38 Item_StrongAbsorbHurt          (强化)吸收伤害
		public var Item_StrongDefenseSuccess     : uint      ;     // 37 39 Item_StrongDefenseSuccess      (强化)防御成功率
		public var Item_StrongDefensePerc        : uint      ;     // 38 40 Item_StrongDefensePerc         (强化)防御加成
		public var Item_StrongOutHurtPerc        : uint      ;     // 39 41 Item_StrongOutHurtPerc         (强化)减伤比例
		public var Item_StrongVampire            : uint      ;     // 40 42 Item_StrongVampire             (强化)吸血
		public var Item_RecoinTimes              : uint      ;     // 41 43 Item_RecoinTimes               重铸次数
		public var Item_RecoinAttack             : uint      ;     // 42 44 Item_RecoinAttack              (重铸)攻击
		public var Item_RecoinDefense            : uint      ;     // 43 45 Item_RecoinDefense             (重铸)防御
		public var Item_RecoinCurHp              : uint      ;     // 44 46 Item_RecoinCurHp               (重铸)生命值
		public var Item_RecoinCrit               : uint      ;     // 45 47 Item_RecoinCrit                (重铸)暴击
		public var Item_RecoinTenacity           : uint      ;     // 46 48 Item_RecoinTenacity            (重铸)韧性
		public var Item_RecoinAppendHurt         : uint      ;     // 47 49 Item_RecoinAppendHurt          (重铸)附加伤害
		public var Item_RecoinOutAttack          : uint      ;     // 48 50 Item_RecoinOutAttack           (重铸)卓越攻击
		public var Item_RecoinAttackPerc         : uint      ;     // 49 51 Item_RecoinAttackPerc          (重铸)攻击加成
		public var Item_RecoinLgnoreDefense      : uint      ;     // 50 52 Item_RecoinLgnoreDefense       (重铸)无视防御
		public var Item_RecoinAbsorbHurt         : uint      ;     // 51 53 Item_RecoinAbsorbHurt          (重铸)吸收伤害
		public var Item_RecoinDefenseSuccess     : uint      ;     // 52 54 Item_RecoinDefenseSuccess      (重铸)防御成功率
		public var Item_RecoinDefensePerc        : uint      ;     // 53 55 Item_RecoinDefensePerc         (重铸)防御加成
		public var Item_RecoinOutHurtPerc        : uint      ;     // 54 56 Item_RecoinOutHurtPerc         (重铸)减伤比例
		public var Item_RecoinVampire            : uint      ;     // 55 57 Item_RecoinVampire             (重铸)吸血
		public var Item_IdentifyTimes            : uint      ;     // 56 58 Item_IdentifyTimes             鉴定次数
		public var Item_IdentifyAttack           : uint      ;     // 57 59 Item_IdentifyAttack            (鉴定)攻击
		public var Item_IdentifyDefense          : uint      ;     // 58 60 Item_IdentifyDefense           (鉴定)防御
		public var Item_IdentifyCurHp            : uint      ;     // 59 61 Item_IdentifyCurHp             (鉴定)生命值
		public var Item_IdentifyCrit             : uint      ;     // 60 62 Item_IdentifyCrit              (鉴定)暴击
		public var Item_IdentifyTenacity         : uint      ;     // 61 63 Item_IdentifyTenacity          (鉴定)韧性
		public var Item_IdentifyAppendHurt       : uint      ;     // 62 64 Item_IdentifyAppendHurt        (鉴定)附加伤害
		public var Item_IdentifyOutAttack        : uint      ;     // 63 65 Item_IdentifyOutAttack         (鉴定)卓越攻击
		public var Item_IdentifyAttackPerc       : uint      ;     // 64 66 Item_IdentifyAttackPerc        (鉴定)攻击加成
		public var Item_IdentifyLgnoreDefense    : uint      ;     // 65 67 Item_IdentifyLgnoreDefense     (鉴定)无视防御
		public var Item_IdentifyAbsorbHurt       : uint      ;     // 66 68 Item_IdentifyAbsorbHurt        (鉴定)吸收伤害
		public var Item_IdentifyDefenseSuccess   : uint      ;     // 67 69 Item_IdentifyDefenseSuccess    (鉴定)防御成功率
		public var Item_IdentifyDefensePerc      : uint      ;     // 68 70 Item_IdentifyDefensePerc       (鉴定)防御加成
		public var Item_IdentifyOutHurtPerc      : uint      ;     // 69 71 Item_IdentifyOutHurtPerc       (鉴定)减伤比例
		public var Item_IdentifyVampire          : uint      ;     // 70 72 Item_IdentifyVampire           (鉴定)吸血
		public var Item_Bless                    : uint      ;     // 71 73 Item_Bless                     祝福值(宝石经验值)
		public var Item_Identification           : uint      ;     // 72 74 Item_Identification            辨识
	}
}
