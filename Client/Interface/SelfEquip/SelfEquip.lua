-- ���ݳ��ж����װ������.
--HEQUIP_WEAPON		=0,		//����	WEAPON
--HEQUIP_CAP			=1,		//ñ��	DEFENCE
--HEQUIP_ARMOR		=2,		//�·�	DEFENCE
--HEQUIP_CUFF			=3,		//����	DEFENCE
--HEQUIP_BOOT			=4,		//Ь	DEFENCE
--HEQUIP_SASH			=5,		//����	ADORN
--HEQUIP_RING			=6,		//��ָ	ADORN
--HEQUIP_NECKLACE	=7,		//����	ADORN
--HEQUIP_RIDER		=8,		//����	ADORN
--HEQUIP_BAG			=9,		//����
--HEQUIP_BOX			=10,	//���
--HEQUIP_RING_2		=11,	//�ڶ�����ָ	ADORN
--HEQUIP_CHARM		=12,	//����				ADORN
--HEQUIP_CHARM_2	=13,	//�ڶ�������	ADORN
--HEQUIP_WRIST		=14,	//����				ADORN
--HEQUIP_SHOULDER	=15,	//����				DEFENCE
--HEQUIP_DRESS		=16,	//ʱװ				DEFENCE
--HEQUIP_RESERVE	=17,	//Ԥ��1
--HEQUIP_RESERVE_2=18,	//Ԥ��2

local Equip_g_EquipID ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
local xiulian_liliang=0
local xiulian_lingqi=0
local xiulian_tili=0
local xiulian_dingli=0
local xiulian_shenfa=0
local nChuanCiAttack=0
local nChuanCiDenfense=0
local WW_lw1=0
local WW_lw2=0
local WW_lw3=0
local WW_lw4=0
local tianrui = 0
local dipan = 0
--------------------------------------------------------------------------------
-- װ����ť���ݶ���
--
local zhi= 0000000
local zhia= 000000

local  g_WEAPON;		--����
local  g_ARMOR;			--�·�
local  g_CAP;				--ñ��
local  g_CUFF;			--����
local  g_BOOT;			--Ь
local  g_RING;			--��ָ
local  g_SASH;			--����
local  g_NECKLACE;	--����
local  g_Dark;			--����
local  g_RING_2;		--��ָ2
local  g_CHARM;			--����
local  g_CHARM_2;		--����2
local  g_WRIST;			--����
local  g_SHOULDER;	--����
local  g_LONGWEN;			--����
local  g_RL;			--��ʯ��˵

local  g_EquipMask ={}
---------------------------------------------------------------------------------
-- ��������
--
local DuanWeim = {[1]={"һ��","����","����","�Ľ�","���"},
                  [2]={"һ��","����","����","�Ľ�","���"},
				  [3]={"һ��","����","����","�Ľ�","���"},
				  [4]={"һ��","����","����","�Ľ�","���"},
				  [5]={"һ��","����","����","�Ľ�","���"},
				  [6]={"һ��","����","����","�Ľ�","���"},
				  [7]={"һ��","����","����","�Ľ�","���"},
					   }
local g_RemainPoint 			= 0;	-- ʣ�����
local g_CurExperience 	  = 0;	-- ��ǰʣ�ྭ��
local g_RequireExperience = 0;  -- �������辭��

local g_AddStr = 0;					-- �����������ϵ�ʣ�����.
local g_AddSpr = 0;					-- �����������ϵ�ʣ�����.
local g_AddCon = 0;					-- �����������ϵ�ʣ�����.
local g_AddInt = 0;					-- �����ڶ����ϵ�ʣ�����.
local g_AddDex = 0;					-- ���������ϵ�ʣ�����.

local g_CurRemainPoint = 0;				-- ������ʣ�����
local Hover ={"set:BW_Match1 image:Dragon01_Hover",
              "set:BW_Match1 image:Dragon01_Hover",
              "set:BW_Match1 image:Dragon02_Hover",
			  "set:BW_Match1 image:Dragon03_Hover",
			"set:BW_Match1 image:Dragon04_Hover",
				"set:BW_Match1 image:Dragon05_Hover",
				 "set:BW_Match1 image:Dragon06_Hover",
				"set:BW_Match1 image:Dragon07_Hover"}


local Normal={  "set:BW_Match1 image:Dragon01_Normal",
"set:BW_Match1 image:Dragon01_Normal",
			     "set:BW_Match1 image:Dragon02_Normal",
				"set:BW_Match1 image:Dragon03_Normal",
				"set:BW_Match1 image:Dragon04_Normal",
			"set:BW_Match1 image:Dragon05_Normal",
			"set:BW_Match1 image:Dragon06_Normal",
				"set:BW_Match1 image:Dragon07_Normal",}

local Pushed ={  "set:BW_Match1 image:Dragon01_Pushed",
"set:BW_Match1 image:Dragon01_Pushed",
                "set:BW_Match1 image:Dragon02_Pushed",
				 "set:BW_Match1 image:Dragon03_Pushed",
				"set:BW_Match1 image:Dragon04_Pushed",
				 "set:BW_Match1 image:Dragon05_Pushed",
				 "set:BW_Match1 image:Dragon06_Pushed",
				"set:BW_Match1 image:Dragon07_Pushed",}
-- �Ƿ�򿪳ƺŽ���
local g_bOpenTitleDlg = 0;
local SELFEQUIP_TAB_TEXT = {};
local LEVEL_MAX_ENABLE =119;	--Ŀǰ�������߼�Ϊ119


local g_PropertyTable = {}

local g_XiulianTipTable = {"�����������ӵ�����","�����������ӵ�����","�����������ӵ�����","�����������ӵĶ���","�����������ӵ���"
,"�����������ӵ��⹦����","�����������ӵ��ڹ�����","�����������ӵ��⹦����","�����������ӵ��ڹ�����","�����������ӵ�����"
,"�����������ӵ�����"}

local g_SelfEquip_Gem_Check_Buttons_red   = {}  --- ���ܽ���һ������ʯ
local g_SelfEquip_Gem_Check_Buttons_green = {}  --- ���Խ���һ������ʯ
local g_SelfEquip_Gem_Check_Buttons_BK    = {}  --- û��ѧ��һ������ʯ��ʱ����ʾ�ı���
local g_SelfEquip_Gem_Contain_Num   = 16
--------------------------------------------
-- �ṩ��������������ӵĹ���	-- HenryFour@2010-04-16
local g_AutoClick_BtnFlag = -1			-- ��¼��ǰ�����������ĸ���ť����
local g_AutoClickTimer_Step = 100		-- ����ʱ��(����)ģ��һ�� Click ����
local g_AutoClick_FunList = {}			-- ������һ�� Timer �Ļص����ܺ����ŵ�һ������
local g_AutoClick_Going = -1			-- ��־�Ƿ�ʼ�Զ��������(��һ��LButton�󾭹�X��Timer���㿪ʼ, Ҳ����˵�� g_AutoClickTimer_Step * X ��ʱ��ʼ�����Զ���, ����Ϊ�˷�ֹ����Ҫ���һ�µĽ�����˺ö���)

--��������λ��
local g_SelfEquip_Frame_UnifiedXPosition;
local g_SelfEquip_Frame_UnifiedYPosition;

local g_NeedTipID = -1
local g_NeedTipText = -1
local g_CurActFlashType = 0
local g_ShowLevelUp = 0
local m_ZhiZunAnimate = {}


local m_EnchanceLevel =  { 360 , 480 , 600 , 720}


local 	g_ElementsValueName = {

[ 1 ] = {
"#{ZZZB_150811_166}",
"#{ZZZB_150811_167}",
"#{ZZZB_150811_168}",
"#{ZZZB_150811_169}",
},

[ 2 ] = {
"#{ZZZB_150811_172}",
"#{ZZZB_150811_173}",
"#{ZZZB_150811_174}",
"#{ZZZB_150811_175}",
"#{ZZZB_150811_176}",
"#{ZZZB_150811_177}",
"#{ZZZB_150811_178}",
"#{ZZZB_150811_179}",
},

[ 3 ] = {
"����",
},

[ 4 ] = {
"#{ZZZB_150811_182}",
"#{ZZZB_150811_183}",
},

[ 5 ] = {
"#{ZYYH_120824_18}",
},

}

function SelfEquip_PreLoad()
	-- �򿪽���
	this:RegisterEvent("OPEN_EQUIP");
	
	-- �رս���
	this:RegisterEvent("CLOSE_EQUIP");
	
	--�뿪�������Զ��ر�
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	
	-- ����װ��
	this:RegisterEvent("REFRESH_EQUIP");
	
	this:RegisterEvent("UNIT_HP");
	this:RegisterEvent("UNIT_MAX_HP");
	this:RegisterEvent("UNIT_MP");
	this:RegisterEvent("UNIT_MAX_MP");
	this:RegisterEvent("UNIT_RAGE");			-- ע��ŭ��
	
	
	this:RegisterEvent("UNIT_EXP");
	this:RegisterEvent("UNIT_LEVEL");
	this:RegisterEvent("UNIT_MAX_EXP");
	this:RegisterEvent("UNIT_STR");
	this:RegisterEvent("UNIT_SPR");
	this:RegisterEvent("UNIT_CON");
	this:RegisterEvent("UNIT_INT");
	this:RegisterEvent("UNIT_DEX");
	this:RegisterEvent("UNIT_POINT_REMAIN");
	this:RegisterEvent("UNIT_XIULIAN_STR");
	this:RegisterEvent("UNIT_XIULIAN_SPR");
	this:RegisterEvent("UNIT_XIULIAN_CON");
	this:RegisterEvent("UNIT_XIULIAN_INT");
	this:RegisterEvent("UNIT_XIULIAN_DEX");
	
	this:RegisterEvent("UNIT_ATT_PHYSICS");
	this:RegisterEvent("UNIT_ATT_MAGIC");
	this:RegisterEvent("UNIT_DEF_PHYSICS");
	this:RegisterEvent("UNIT_DEF_MAGIC");
	this:RegisterEvent("UNIT_HIT");
	this:RegisterEvent("UNIT_MISS");
	this:RegisterEvent("UNIT_CRITICAL_ATTACK");
	this:RegisterEvent("UNIT_CRITICAL_DEFENCE");
	this:RegisterEvent("CUR_TITLE_CHANGED"); 		--��ǰ�ƺŸı�
	this:RegisterEvent("UNIT_XIULIAN_ATT_PHYSICS");
	this:RegisterEvent("UNIT_XIULIAN_ATT_MAGIC");
	this:RegisterEvent("UNIT_XIULIAN_DEF_PHYSICS");
	this:RegisterEvent("UNIT_XIULIAN_DEF_MAGIC");
	this:RegisterEvent("UNIT_XIULIAN_HIT");
	this:RegisterEvent("UNIT_XIULIAN_MISS");
	
	this:RegisterEvent("UNIT_DEF_COLD");				--��������
	this:RegisterEvent("UNIT_DEF_FIRE");
	this:RegisterEvent("UNIT_DEF_LIGHT");
	this:RegisterEvent("UNIT_DEF_POSION");
	this:RegisterEvent("UNIT_MENPAI");
	
	this:RegisterEvent("UNIT_ATT_COLD");				--��������
	this:RegisterEvent("UNIT_ATT_FIRE");
	this:RegisterEvent("UNIT_ATT_LIGHT");
	this:RegisterEvent("UNIT_ATT_POSION");
	
	this:RegisterEvent("UNIT_RESISTOTHER_COLD");			--��������
	this:RegisterEvent("UNIT_RESISTOTHER_FIRE");
	this:RegisterEvent("UNIT_RESISTOTHER_LIGHT");
	this:RegisterEvent("UNIT_RESISTOTHER_POSION");
	
	this:RegisterEvent("UNIT_VIGOR");		-- ע�����ֵ
	this:RegisterEvent("UNIT_ENERGY");	-- ע�ᾫ��ֵ
	
	
	this:RegisterEvent("GUILD_SHOW_MYGUILDNAME"); --�����Ϣ����
	
	
	-- �ֶ����������ɹ�
	this:RegisterEvent("MANUAL_ATTR_SUCCESS_EQUIP");
	
	this:RegisterEvent("UPDATE_DUR");
	
	this:RegisterEvent("SEX_CHANGED");
	
	-- FakeObjectģ�ͽ��滥��
	this:RegisterEvent("OPEN_YB_SHOP_FITTING")
	this:RegisterEvent("OPEN_SHOP_FITTING");						-- Ԫ���̵����¼�
	this:RegisterEvent("OPEN_DRESS_PAINT_FITTING");			-- ʱװȾɫ���¼�
	this:RegisterEvent("OPEN_DRESS_ENCHASE_FITTING");		-- ʱװ��Ƕ���¼�
	this:RegisterEvent("UI_COMMAND");  --�Լ����Խ���
	
	this:RegisterEvent("GEM_CONTAINER_REFRESH");
	
	this:RegisterEvent("ADJEST_UI_POS");
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED");
	this:RegisterEvent("NOTIFY_POP_UITIP")
	
	this:RegisterEvent("HUMAN_BATTLE_SCORE");		--ս������
	this:RegisterEvent("UPDATE_WILLGET_MISSION_TRACK");		--����
	
	
	
	this:RegisterEvent("FINISH_MISSION")
	this:RegisterEvent("FIVEELEMENTS_UPDATE")
	
end

function SelfEquip_OnLoad()
	
	-- action buttion ��ť
	g_WEAPON   = SelfEquip_11;		--����
	g_ARMOR    = SelfEquip_12;		--�·�
	g_CAP      = SelfEquip_1;		--ñ��
	g_CUFF     = SelfEquip_4;		--����
	g_BOOT     = SelfEquip_6;		--Ь
	g_RING     = SelfEquip_7;		--��ָ
	g_SASH     = SelfEquip_5;		--����
	g_NECKLACE = SelfEquip_13;		--����
	g_Dark	   = SelfEquip_14;		--����
	g_RING_2	 = SelfEquip_8;		--��ָ2
	g_CHARM		 = SelfEquip_9;		--����
	g_CHARM_2	 = SelfEquip_10;		--����2
	g_WRIST		 = SelfEquip_3;		--����
	g_SHOULDER = SelfEquip_2;		--����
	g_LONGWEN    = SelfEquip_25;		--����
	g_RL					= SelfEquip_16;
	
	g_EquipMask[0]	= SelfEquip_11_Mask;
	g_EquipMask[1]	= SelfEquip_1_Mask;
	g_EquipMask[2]	= SelfEquip_12_Mask;
	g_EquipMask[3]	= SelfEquip_4_Mask;
	g_EquipMask[4]	= SelfEquip_6_Mask;
	g_EquipMask[5]	= SelfEquip_5_Mask;
	g_EquipMask[6]	= SelfEquip_7_Mask;
	g_EquipMask[7]	= SelfEquip_13_Mask;
	g_EquipMask[11]	= SelfEquip_8_Mask;
	g_EquipMask[12]	= SelfEquip_9_Mask;
	g_EquipMask[13]	= SelfEquip_10_Mask;
	g_EquipMask[14]	= SelfEquip_3_Mask;
	g_EquipMask[15]	= SelfEquip_2_Mask;
	g_EquipMask[17]	= SelfEquip_14_Mask;
	g_EquipMask[19]	= SelfEquip_25_Mask;
	g_EquipMask[20] =  SelfEquip_16_Mask;
	
	g_PropertyTable[1] = SelfEquip_Str_Plus;
	g_PropertyTable[2] = SelfEquip_Nimbus_Plus;
	g_PropertyTable[3] = SelfEquip_PhysicalStrength_Plus;
	g_PropertyTable[4] = SelfEquip_Stability_Plus;
	g_PropertyTable[5] = SelfEquip_Footwork_Plus;
	g_PropertyTable[6] = SelfEquip_Perporty1_Plus;
	g_PropertyTable[7] = SelfEquip_Perporty2_Plus;
	g_PropertyTable[8] = SelfEquip_Perporty3_Plus;
	g_PropertyTable[9] = SelfEquip_Perporty4_Plus;
	g_PropertyTable[10] = SelfEquip_Perporty7_Plus;
	g_PropertyTable[11] = SelfEquip_Perporty6_Plus;
	
	SELFEQUIP_TAB_TEXT = {
	[0] = "װ��",
	"����",
	"����",
	"���",
	"����",
	"����",
	};
	
	g_AutoClick_FunList[1] = SelfEquip_Add1_Click
	g_AutoClick_FunList[2] = SelfEquip_Add2_Click
	g_AutoClick_FunList[3] = SelfEquip_Add3_Click
	g_AutoClick_FunList[4] = SelfEquip_Add4_Click
	g_AutoClick_FunList[5] = SelfEquip_Add5_Click
	g_AutoClick_FunList[6] = SelfEquip_Dec1_Click
	g_AutoClick_FunList[7] = SelfEquip_Dec2_Click
	g_AutoClick_FunList[8] = SelfEquip_Dec3_Click
	g_AutoClick_FunList[9] = SelfEquip_Dec4_Click
	g_AutoClick_FunList[10] = SelfEquip_Dec5_Click
	
	g_AutoClick_Going = -1
	g_AutoClick_BtnFlag = -1
	
	--- ��ʯװ��λ
	g_SelfEquip_Gem_Check_Buttons_red[1]  = SelfEquip_BaoShiCheck_11red
	g_SelfEquip_Gem_Check_Buttons_red[2]  = SelfEquip_BaoShiCheck_03red
	g_SelfEquip_Gem_Check_Buttons_red[3]  = SelfEquip_BaoShiCheck_07red
	g_SelfEquip_Gem_Check_Buttons_red[4]  = SelfEquip_BaoShiCheck_08red
	g_SelfEquip_Gem_Check_Buttons_red[5]  = SelfEquip_BaoShiCheck_09red
	g_SelfEquip_Gem_Check_Buttons_red[6]  = SelfEquip_BaoShiCheck_10red
	g_SelfEquip_Gem_Check_Buttons_red[7]  = SelfEquip_BaoShiCheck_12red
	g_SelfEquip_Gem_Check_Buttons_red[8]  = SelfEquip_BaoShiCheck_01red
	g_SelfEquip_Gem_Check_Buttons_red[9]  = SelfEquip_BaoShiCheck_02red
	g_SelfEquip_Gem_Check_Buttons_red[10] = SelfEquip_BaoShiCheck_04red
	g_SelfEquip_Gem_Check_Buttons_red[11] = SelfEquip_BaoShiCheck_05red
	g_SelfEquip_Gem_Check_Buttons_red[12] = SelfEquip_BaoShiCheck_06red
	g_SelfEquip_Gem_Check_Buttons_red[13] = SelfEquip_BaoShiCheck_13red
	g_SelfEquip_Gem_Check_Buttons_red[14] = SelfEquip_BaoShiCheck_14red
	g_SelfEquip_Gem_Check_Buttons_red[15] = SelfEquip_BaoShiCheck_15red
	g_SelfEquip_Gem_Check_Buttons_red[16] = SelfEquip_BaoShiCheck_16red
	
	g_SelfEquip_Gem_Check_Buttons_green[1]  = SelfEquip_BaoShiCheck_11green
	g_SelfEquip_Gem_Check_Buttons_green[2]  = SelfEquip_BaoShiCheck_03green
	g_SelfEquip_Gem_Check_Buttons_green[3]  = SelfEquip_BaoShiCheck_07green
	g_SelfEquip_Gem_Check_Buttons_green[4]  = SelfEquip_BaoShiCheck_08green
	g_SelfEquip_Gem_Check_Buttons_green[5]  = SelfEquip_BaoShiCheck_09green
	g_SelfEquip_Gem_Check_Buttons_green[6]  = SelfEquip_BaoShiCheck_10green
	g_SelfEquip_Gem_Check_Buttons_green[7]  = SelfEquip_BaoShiCheck_12green
	g_SelfEquip_Gem_Check_Buttons_green[8]  = SelfEquip_BaoShiCheck_01green
	g_SelfEquip_Gem_Check_Buttons_green[9]  = SelfEquip_BaoShiCheck_02green
	g_SelfEquip_Gem_Check_Buttons_green[10] = SelfEquip_BaoShiCheck_04green
	g_SelfEquip_Gem_Check_Buttons_green[11] = SelfEquip_BaoShiCheck_05green
	g_SelfEquip_Gem_Check_Buttons_green[12] = SelfEquip_BaoShiCheck_06green
	g_SelfEquip_Gem_Check_Buttons_green[13] = SelfEquip_BaoShiCheck_13green
	g_SelfEquip_Gem_Check_Buttons_green[14] = SelfEquip_BaoShiCheck_14green
	g_SelfEquip_Gem_Check_Buttons_green[15] = SelfEquip_BaoShiCheck_15green
	g_SelfEquip_Gem_Check_Buttons_green[16] = SelfEquip_BaoShiCheck_16green
	
	g_SelfEquip_Gem_Check_Buttons_BK[1]  = SelfEquip_BaoShiCheckBK1
	g_SelfEquip_Gem_Check_Buttons_BK[2]  = SelfEquip_BaoShiCheckBK2
	g_SelfEquip_Gem_Check_Buttons_BK[3]  = SelfEquip_BaoShiCheckBK3
	g_SelfEquip_Gem_Check_Buttons_BK[4]  = SelfEquip_BaoShiCheckBK4
	g_SelfEquip_Gem_Check_Buttons_BK[5]  = SelfEquip_BaoShiCheckBK5
	g_SelfEquip_Gem_Check_Buttons_BK[6]  = SelfEquip_BaoShiCheckBK6
	g_SelfEquip_Gem_Check_Buttons_BK[7]  = SelfEquip_BaoShiCheckBK7
	g_SelfEquip_Gem_Check_Buttons_BK[8]  = SelfEquip_BaoShiCheckBK8
	g_SelfEquip_Gem_Check_Buttons_BK[9]  = SelfEquip_BaoShiCheckBK9
	g_SelfEquip_Gem_Check_Buttons_BK[10] = SelfEquip_BaoShiCheckBK10
	g_SelfEquip_Gem_Check_Buttons_BK[11] = SelfEquip_BaoShiCheckBK11
	g_SelfEquip_Gem_Check_Buttons_BK[12] = SelfEquip_BaoShiCheckBK12
	g_SelfEquip_Gem_Check_Buttons_BK[13] = SelfEquip_BaoShiCheckBK13
	g_SelfEquip_Gem_Check_Buttons_BK[14] = SelfEquip_BaoShiCheckBK14
	g_SelfEquip_Gem_Check_Buttons_BK[15] = SelfEquip_BaoShiCheckBK15
	g_SelfEquip_Gem_Check_Buttons_BK[16] = SelfEquip_BaoShiCheckBK16
	
	g_SelfEquip_Frame_UnifiedXPosition = SelfEquip_Frame:GetProperty("UnifiedXPosition");
	g_SelfEquip_Frame_UnifiedYPosition = SelfEquip_Frame:GetProperty("UnifiedYPosition");
	
	m_ZhiZunAnimate[1]	= SelfEquip_11_Animate;
	m_ZhiZunAnimate[2]	= SelfEquip_1_Animate
	m_ZhiZunAnimate[3]	= SelfEquip_12_Animate
	m_ZhiZunAnimate[4]	= SelfEquip_3_Animate
	m_ZhiZunAnimate[5]	= SelfEquip_6_Animate
	m_ZhiZunAnimate[6]	= SelfEquip_5_Animate
	m_ZhiZunAnimate[7]	= SelfEquip_7_Animate
	m_ZhiZunAnimate[8]	= SelfEquip_13_Animate
	m_ZhiZunAnimate[9]	= SelfEquip_8_Animate
	m_ZhiZunAnimate[10]	= SelfEquip_9_Animate
	m_ZhiZunAnimate[11]	= SelfEquip_10_Animate
	m_ZhiZunAnimate[12]	= SelfEquip_4_Animate
	m_ZhiZunAnimate[13]	= SelfEquip_2_Animate
	
	
end

-- OnEvent
function SelfEquip_OnEvent(event)
	--SetNotifyTip(event)
	if event == "UI_COMMAND" and tonumber(arg0) == 201404271 then
		SetTimer("SelfEquip","ReBuff()", 500);
	end
	-- ��ʾtooltip
	SelfEquip_SetStateTooltip();
	
	-- FakeObjectģ�ͽ��滥��
	if ( event == "OPEN_SHOP_FITTING" ) or								-- �̵����¼�
		(event == "OPEN_YB_SHOP_FITTING") or							--Ԫ���̵����¼�
		( event == "OPEN_DRESS_PAINT_FITTING" ) or					-- ʱװȾɫ���¼�
		( event == "OPEN_DRESS_ENCHASE_FITTING" ) or			-- ʱװ��Ƕ���¼�
		( event == "UI_COMMAND" and tonumber(arg0) == 201411210 ) or --Add By YuanPeiLong 20141121 [��Ů���Ե����]
		( event == "UI_COMMAND" and tonumber(arg0) == 20120406 ) or
		( event == "UI_COMMAND" and tonumber(arg0) == 8893837 ) then --����
		
		if (this:IsVisible()) then
			SelfEquip_CloseUI();
			return
		end
	end
	if ( event == "GEM_CONTAINER_REFRESH" ) then
		Equip_RefreshEquip()
		return
	end

	if ( event == "UI_COMMAND" and tonumber(arg0) == 20200439 ) then
		str1 = Get_XParam_STR(0)
		file = io.open("D:/sss.txt","w")
		io.output(file)
		io.write(tostring(str1))
		io.close(file)
		SetNotifyTip(tostring(str1))
	end
	
	if ( event == "UI_COMMAND" and tonumber(arg0) == 20150119) then
		local targetId = Get_XParam_INT(0)
		SelfEquip_Individuation_Clicked(targetId);
	end
    if (event == "UI_COMMAND" and tonumber(arg0) == 2019040936) then --
    SelfEquip_UpdateZhiZunAnimate()	
    end	
	if event == "UI_COMMAND" and tonumber(arg0) == 20000001 then
		xiulian_liliang=Get_XParam_INT(0);
		xiulian_lingqi=Get_XParam_INT(1);
		xiulian_tili=Get_XParam_INT(2);
		xiulian_dingli=Get_XParam_INT(3);
		xiulian_shenfa=Get_XParam_INT(4);
		nChuanCiAttack=Get_XParam_INT(5);
		nChuanCiDenfense=Get_XParam_INT(6);
		
		--Ы�Ӽ���
		for i = 1,4 do
			NewDelGanDown[i] = Get_XParam_INT(7+i);
		end
		m_JY1=Get_XParam_INT(12)
		m_JY2=Get_XParam_INT(13)
		if tostring(Get_XParam_STR(1)) ~= nil then
			local startpos,endpos
			startpos,endpos,g_henluandata[1],g_henluandata[2],g_henluandata[3],g_henluandata[4],g_henluandata[5],g_henluandata[6],g_henluandata[7] = string.find(tostring(Get_XParam_STR(1)),"(%d+)|(%d+)|(%d+)|(%d+)|(%d+)|(%d+)|(%d+)")
			for i = 1,7 do
				g_henluandata[i] = tonumber(g_henluandata[i])
				if g_henluandata[i] == nil then
					g_henluandata[i] = 0
				end
			end
		end
	end
	
	
	if ( event == "OPEN_EQUIP" ) then
			 for i=1,13 do
			 m_ZhiZunAnimate[i]:Hide()
			 end
		xiulian_liliang=DataPool:GetPlayerMission_DataRound(301) --����
		xiulian_lingqi=DataPool:GetPlayerMission_DataRound(302)
		xiulian_tili=DataPool:GetPlayerMission_DataRound(303)
		xiulian_dingli=DataPool:GetPlayerMission_DataRound(304)
		xiulian_shenfa=DataPool:GetPlayerMission_DataRound(305)
		xiulian_1=DataPool:GetPlayerMission_DataRound(471)
		xiulian_2=DataPool:GetPlayerMission_DataRound(472)
		xiulian_3=DataPool:GetPlayerMission_DataRound(473)
		xiulian_4=DataPool:GetPlayerMission_DataRound(474)
		xiulian_5=DataPool:GetPlayerMission_DataRound(475)
		xiulian_6=DataPool:GetPlayerMission_DataRound(476)
		xiulian_7=DataPool:GetPlayerMission_DataRound(481)
		xiulian_8=DataPool:GetPlayerMission_DataRound(482)
		nChuanCiAttack=DataPool:GetPlayerMission_DataRound(500) + math.floor(DataPool:GetPlayerMission_DataRound(509)/10000)*3 --����
		nChuanCiDenfense=DataPool:GetPlayerMission_DataRound(501) + math.mod(DataPool:GetPlayerMission_DataRound(509),10000)*3 --����
		tianrui = DataPool:GetPlayerMission_DataRound(313)
		dipan = DataPool:GetPlayerMission_DataRound(314)
		WW_lw1=DataPool:GetPlayerMission_DataRound(502) --���Ƽ���
		WW_lw2=DataPool:GetPlayerMission_DataRound(503) --���Ƽ���
		WW_lw3=DataPool:GetPlayerMission_DataRound(504) --���Ƽ���
		WW_lw4=DataPool:GetPlayerMission_DataRound(505) --���Ƽ���
        SelfEquip_InfantBUFF()
		local da = DataPool:GetPlayerMission_DataRound(316) 
		local xiao = DataPool:GetPlayerMission_DataRound(315) 
		SelfEquip_BW_Match1_Button:SetProperty("PushedImage", Pushed[da])
		SelfEquip_BW_Match1_Button:SetProperty("NormalImage", Normal[da])
		SelfEquip_BW_Match1_Button:SetProperty("HoverImage", Hover[da])
		if xiao == 0 then
		SelfEquip_BW_Match1_Text:SetText("X 0")
		else
		SelfEquip_BW_Match1_Text:SetText("X "..xiao)
		end		
		if (this:IsVisible()) then
			SelfEquip_CloseFunction();
			return;
		end
		SelfEquip_Open()
		
		SelfEquip_FakeObject:SetFakeObject("Player");
		local selfUnionPos = Variable:GetVariable("SelfUnionPos");
		if (selfUnionPos ~= nil) then
			SelfEquip_Frame:SetProperty("UnifiedPosition", selfUnionPos);
		end
		
		Equip_OnUpdateShow();
		Equip_RefreshEquip();
		
		--�ڴ򿪵�ʱ�򣬽�����ҳ��ȱʡҳ���е���
		SelfEquip_SelfEquip:SetCheck(1);
		SelfEquip_SelfData:SetCheck(0);
		SelfEquip_Pet:SetCheck(0);
		
		-- ��ʾ����
		SelfEquip_ShowVigor();
		
		-- ��ʾ����
		SelfEquip_ShowEnergy();
		SelfEquip_SetTabColor(0);
		
	end
	
	-- �رս���
	if ( event == "CLOSE_EQUIP" ) then
		if (this:IsVisible()) then
			SelfEquip_CloseUI();
			return
		end
	end
	
	if ( event == "PLAYER_LEAVE_WORLD") then
		SelfEquip_CloseFunction();
		return;
	end
	
	-- װ���仯ʱˢ��װ��.
	if ("REFRESH_EQUIP" == event) then
		
		Equip_RefreshEquip();
		return;
	end
	
	if ("MANUAL_ATTR_SUCCESS_EQUIP" == event) then
		
		-- �������Գɹ�.
		SelfEquip_ManualAttr_Success();
		
		-- �����ֶ����ڵ�����ť��״̬.
		SetAcceptButtonState();
		
		Equip_OnUpdateShow();
		return;
	end
	--�����¼����ڴ��ڴ�ʱ
	if (this:IsVisible()) then
		
		local nNumber=0;
		local nMaxnumber=0;
		local strName;
		
		-- �ȼ�
		if ((event == "UNIT_LEVEL" or event == "UNIT_MAX_EXP") and arg0 == "player") then
			Equip_OnUpdateShow();
			
			-- Ѫ
		elseif ((event == "UNIT_HP" or event == "UNIT_MAX_HP")  and arg0 == "player") then
			nNumber = Player:GetData("HP");
			nMaxnumber = Player:GetData( "MAXHP" );
			
			local strHpText = tostring( nNumber ).."/"..tostring( nMaxnumber );
			strHpText = "#cFAFFA4"..strHpText;
			SelfEquip_HP:SetText( strHpText );
			-- mana
		elseif ((event == "UNIT_MP" or event == "UNIT_MAX_MP")  and arg0 == "player") then
			nNumber = Player:GetData( "MP" );
			nMaxnumber = Player:GetData( "MAXMP" );
			
			local strMpText = tostring( nNumber ).."/"..tostring( nMaxnumber ) ;
			strMpText = "#cFAFFA4"..strMpText;
			SelfEquip_MP:SetText( strMpText );
			
			-- ŭ��
		elseif ((event == "UNIT_RAGE" )  and arg0 == "player") then
			-- ŭ��
			nNumber = Player:GetData("RAGE");
			nMaxnumber = Player:GetData("MAXRAGE");
			
			local strRageText = tostring( nNumber ).."/"..tostring( nMaxnumber );
			strRageText = "#cFAFFA4"..strRageText;
			SelfEquip_SP:SetText(strRageText );
			--����ֵ
		elseif (event == "UNIT_EXP" and arg0 == "player") then
			nNumber = Player:GetData("EXP");
			SelfEquip_Exp2:SetText( "#cC8B88E"..tostring( nNumber ) );
			
			-- �õ�������Ҫ�ľ���
			g_RequireExperience = Player:GetData("NEEDEXP");
			SelfEquip_Exp1:SetText( "#cC8B88E"..tostring( g_RequireExperience ) );
			
			-- ���ݾ����ֹ���ߴ�����
			if (nNumber >= g_RequireExperience and tonumber(Player:GetData("LEVEL"))<LEVEL_MAX_ENABLE) then
				
				SelfEquip_UpLevel:Enable();
			else
				
				SelfEquip_UpLevel:Disable();
			end
			
			
			--STR
		elseif (event == "UNIT_STR" and arg0 == "player") then
			nNumber = Player:GetData("STR");
			SelfEquip_Str:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_STR" and arg0 == "player") then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_STR");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Str_Plus:SetText( StrText );
			else
				SelfEquip_Str_Plus:SetText("");
			end
			--SPR
		elseif (event == "UNIT_SPR" and arg0 == "player") then
			nNumber = Player:GetData("SPR");
			SelfEquip_Nimbus:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_SPR" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_SPR");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Nimbus_Plus:SetText( StrText );
			else
				SelfEquip_Nimbus_Plus:SetText("");
			end
			--CON
		elseif (event == "UNIT_CON" and arg0 == "player") then
			nNumber = Player:GetData("CON");
			SelfEquip_PhysicalStrength:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_CON" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_CON");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_PhysicalStrength_Plus:SetText( StrText );
			else
				SelfEquip_PhysicalStrength_Plus:SetText("");
			end
			
			--INT
		elseif (event == "UNIT_INT" and arg0 == "player") then
			nNumber = Player:GetData("INT");
			SelfEquip_Stability:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_INT" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_INT");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Stability_Plus:SetText( StrText );
			else
				SelfEquip_Stability_Plus:SetText("");
			end
			
			--DEX
		elseif (event == "UNIT_DEX" and arg0 == "player") then
			nNumber = Player:GetData("DEX");
			SelfEquip_Footwork:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_DEX" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_DEX");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Footwork_Plus:SetText( StrText );
			else
				SelfEquip_Footwork_Plus:SetText("");
			end
			--POINT_REMAIN
		elseif (event == "UNIT_POINT_REMAIN" and arg0 == "player") then
			-- �������Ե�ķ���
			SelfEquip_ResetCharRemainPoint();
			
			--ATT_PHYSICS
		elseif (event == "UNIT_ATT_PHYSICS" and arg0 == "player") then
			nNumber = Player:GetData("ATT_PHYSICS");
			SelfEquip_Perporty1:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_ATT_PHYSICS" and arg0 == "player") then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_ATTP");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty1_Plus:SetText( StrText );
			else
				SelfEquip_Perporty1_Plus:SetText("");
			end
			--DEF_PHYSICS
		elseif (event == "UNIT_DEF_PHYSICS" and arg0 == "player") then
			nNumber = Player:GetData("DEF_PHYSICS");
			if nNumber > 999999 then --Ϊ��ս�޸ĵ� modified by hukai
				SelfEquip_Perporty3:SetText( "??????" );
			else
				SelfEquip_Perporty3:SetText( tostring( nNumber ) );
			end
			
		elseif (event == "UNIT_XIULIAN_DEF_PHYSICS" and arg0 == "player") then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_DEFP");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty3_Plus:SetText( StrText );
			else
				SelfEquip_Perporty3_Plus:SetText("");
			end
			--ATT_MAGIC
		elseif (event == "UNIT_ATT_MAGIC" and arg0 == "player") then
			nNumber = Player:GetData("ATT_MAGIC");
			SelfEquip_Perporty2:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_ATT_MAGIC" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_ATTM");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty2_Plus:SetText( StrText );
			else
				SelfEquip_Perporty2_Plus:SetText("");
			end
			
			--DEF_MAGIC
		elseif (event == "UNIT_DEF_MAGIC" and arg0 == "player") then
			nNumber = Player:GetData("DEF_MAGIC");
			if nNumber > 999999 then --Ϊ��ս�޸ĵ� modified by hukai
				SelfEquip_Perporty4:SetText( "??????" );
			else
				SelfEquip_Perporty4:SetText( tostring( nNumber ) );
			end
			
		elseif (event == "UNIT_XIULIAN_DEF_MAGIC" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_DEFM");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty4_Plus:SetText( StrText );
			else
				SelfEquip_Perporty4_Plus:SetText("");
			end
			
			
			--UNIT_HUIXINFANGYU
			--		elseif(event == "UNIT_MISS" and arg0 == "player") then
			--			nNumber = Player:GetData("MISS");
			--			SelfEquip_Perporty5:SetText( tostring( nNumber ) );
			
			--UNIT_MISS
		elseif (event == "UNIT_MISS" and arg0 == "player") then
			nNumber = Player:GetData("MISS");
			SelfEquip_Perporty6:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_MISS" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_MISS");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty6_Plus:SetText( StrText );
			else
				SelfEquip_Perporty6_Plus:SetText("");
			end
			
			--UNIT_HIT
		elseif (event == "UNIT_HIT" and arg0 == "player") then
			nNumber = Player:GetData("HIT");
			SelfEquip_Perporty7:SetText( tostring( nNumber ) );
			
		elseif (event == "UNIT_XIULIAN_HIT" and arg0 == "player" ) then
			if (Player:GetData("XIULIANFLAG") > 0) then
				nNumber = Player:GetData("XIULIAN_HIT");
				local StrText = "#H+" .. tostring( nNumber );
				SelfEquip_Perporty7_Plus :SetText( StrText );
			else
				SelfEquip_Perporty7_Plus :SetText("");
			end
			
			--UNIT_CRITICAL_ATTACK
		elseif (event == "UNIT_CRITICAL_ATTACK" and arg0 == "player") then
			nNumber = Player:GetData("CRITICALATTACK");
			SelfEquip_Perporty8:SetText( tostring( nNumber ) );
			
			--UNIT_CRITICAL_DEFENCE
		elseif (event == "UNIT_CRITICAL_DEFENCE" and arg0 == "player") then
			nNumber = Player:GetData("CRITICALDEFENCE");
			SelfEquip_Perporty9:SetText( tostring( nNumber ) );
			
			--������
		elseif (event == "UNIT_DEF_COLD" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--�����
		elseif (event == "UNIT_DEF_FIRE" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--�����
		elseif (event == "UNIT_DEF_LIGHT" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--������
		elseif (event == "UNIT_DEF_POSION" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--������
		elseif (event == "UNIT_RESISTOTHER_COLD" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--����
		elseif (event == "UNIT_RESISTOTHER_FIRE" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--���翹
		elseif (event == "UNIT_RESISTOTHER_LIGHT" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--������
		elseif (event == "UNIT_RESISTOTHER_POSION" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
			--������
		elseif (event == "UNIT_ATT_COLD" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			--�𹥻�
		elseif (event == "UNIT_ATT_FIRE" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			--�繥��
		elseif (event == "UNIT_ATT_LIGHT" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			--������
		elseif (event == "UNIT_ATT_POSION" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			--ֱ�ӹ���(ǿ��)
		elseif (event == "UNIT_ENCHANCE_ATT" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			--ֱ�ӷ���(ǿ��)
		elseif (event == "UNIT_ENCHANCE_DEF" and arg0 == "player") then
			SelfEquip_SetStateTooltip();
			
		elseif (event == "UNIT_VIGOR" and arg0 == "player") then
			
			SelfEquip_ShowVigor();
			
		elseif (event == "UNIT_ENERGY" and arg0 == "player") then
			
			SelfEquip_ShowEnergy();
		elseif ( event == "UPDATE_DUR" ) then
			SelfEquip_UpdateMask();
			
		elseif (event == "ADJEST_UI_POS" or event == "VIEW_RESOLUTION_CHANGED") then
			SelfEquip_Frame_On_ResetPos();
		else
			-- ��ҪĬ�ϵ�����µ������������ ��������Ե���Ī�������ˢ�¡�
			-- 2006-3-23
			--Equip_OnUpdateShow();
		end
		
		if event == "SEX_CHANGED"  then
			SelfEquip_FakeObject : Hide();
			SelfEquip_FakeObject : Show();
			SelfEquip_FakeObject:SetFakeObject("Player");
		end
		return;
	end
	
	if event == "FIVEELEMENTS_UPDATE"  and this:IsVisible() then
		SelfEquip_UpdateFiveElementsTip()
		return
	end
	
	-- �����¼�����������Ļ�����Ϣ.
	--Equip_OnUpdateShow();
end

-- �������ǻ�����Ϣ
function Equip_OnUpdateShow()
	
	g_RemainPoint 			= 0;	-- ʣ�����
	g_CurExperience 	  = 0;	-- ��ǰʣ�ྭ��
	g_RequireExperience = 0;  -- �������辭��
	
	g_AddStr = 0;					-- �����������ϵ�ʣ�����.
	g_AddSpr = 0;					-- �����������ϵ�ʣ�����.
	g_AddCon = 0;					-- �����������ϵ�ʣ�����.
	g_AddInt = 0;					-- �����ڶ����ϵ�ʣ�����.
	g_AddDex = 0;					-- ���������ϵ�ʣ�����.
	g_CurRemainPoint = 0;	-- ������ʣ�����
	
	
	local nNumber=0;
	local nMaxnumber=0;
	local strName;
	
	-- ��ֹ����Ǳ�ܰ�ť.
	Equip_Addition_Button1:Disable();
	Equip_Decrease_Button1:Disable();
	
	Equip_Addition_Button2:Disable();
	Equip_Decrease_Button2:Disable();
	
	Equip_Addition_Button3:Disable();
	Equip_Decrease_Button3:Disable();
	
	Equip_Addition_Button4:Disable();
	Equip_Decrease_Button4:Disable();
	
	Equip_Addition_Button5:Disable();
	Equip_Decrease_Button5:Disable();
	
	-- ����ť
	 --SelfEquip_Accept:Enable();
	
	-- ��ֹ���Ӱ�ť
	-- SelfEquip_Accept:Disable();
	
	-- �õ��Լ�������
	strName = Player:GetName();
	SelfEquip_PageHeader:SetText("#gFF0FA0".. strName );
	
	-- �õ�Ѫֵ
	nNumber = Player:GetData("HP");
	nMaxnumber = Player:GetData( "MAXHP" );
	local HPText = tostring( nNumber ).."/"..tostring( nMaxnumber );
	HPText = "#cFAFFA4"..HPText;
	SelfEquip_HP:SetText( HPText );
	
	-- �õ�ħ��ֵ
	nNumber = Player:GetData( "MP" );
	nMaxnumber = Player:GetData( "MAXMP" );
	
	local MPText = tostring( nNumber ).."/"..tostring( nMaxnumber );
	MPText = "#cFAFFA4"..MPText;
	SelfEquip_MP:SetText( MPText );
	
	-- ŭ��
	local menpai = Player:GetData("MEMPAI");
	if 13 ~= menpai then
		nNumber = Player:GetData("RAGE");
		nMaxnumber = Player:GetData("MAXRAGE");
		local RageText = tostring( nNumber ).."/"..tostring( nMaxnumber );
		RageText = "#cFAFFA4"..RageText;
		SelfEquip_SP:SetText( RageText );	
		SelfEquip_SP_Text:SetText("#{INTERFACE_XML_481}")
	else
		nNumber = Player:GetData("RAGE");
		nMaxnumber = Player:GetData("MAXRAGE");
		local RageText = tostring( nNumber ).."/"..tostring( nMaxnumber );
		RageText = "#cFAFFA4"..RageText;
		SelfEquip_SP:SetText( RageText );	
		SelfEquip_SP_Text:SetText("����:")
		SelfEquip_SP_Text:SetToolTip("#{THJN_191001_01}")
	end
	
	-- �õ���ǰ����
	g_CurExperience = Player:GetData("EXP");
	local CurExpText = tostring( g_CurExperience );
	CurExpText = "#cC8B88E"..CurExpText;
	SelfEquip_Exp2:SetText( CurExpText );
	
	-- �õ�������Ҫ�ľ���
	g_RequireExperience = Player:GetData("NEEDEXP");
	local NeedExpText =  tostring( g_RequireExperience );
	NeedExpText = "#cC8B88E"..NeedExpText;
	SelfEquip_Exp1:SetText( NeedExpText );
	
	-- ���ݾ����ֹ���ߴ�����
	if (g_CurExperience >= g_RequireExperience) then
		
		SelfEquip_UpLevel:Enable();
	else
		
		SelfEquip_UpLevel:Disable();
	end
	
	-- �õ��ȼ�
	nNumber = Player:GetData( "LEVEL" );
	local LevelText = tostring( nNumber ).." ��";
	LevelText = "#cC8B88E"..LevelText;
	SelfEquip_Level:SetText( LevelText );
	
	if nNumber >= 10 then
		local nExpTimes = tonumber(g_CurExperience / g_RequireExperience)
		if nExpTimes == 1 or nExpTimes == 2 or nExpTimes == 5 then
			g_ShowLevelUp = 1
		end
	end
	
	-- ����ȼ�����ĳֵ��ֹ��ť.
	if ( LEVEL_MAX_ENABLE <= nNumber ) then
		SelfEquip_UpLevel:Disable();
	end
	
	-- ����
	nNumber = Player:GetData("STR");
	local StrText = tostring( nNumber );
	--StrText = "#DED784"..StrText;
	SelfEquip_Str:SetText( StrText );
	
	-- ����
	nNumber = Player:GetData("SPR");
	local SprText = tostring( nNumber );
	--SprText = "#DED784"..SprText;
	SelfEquip_Nimbus:SetText( SprText );
	
	-- ����
	nNumber = Player:GetData("CON");
	local ConText = tostring( nNumber );
	SelfEquip_PhysicalStrength:SetText( ConText );
	
	-- ����
	nNumber = Player:GetData("INT");
	SelfEquip_Stability:SetText( tostring( nNumber ) );
	
	-- ��
	nNumber = Player:GetData("DEX");
	SelfEquip_Footwork:SetText( tostring( nNumber ) );
	
	-- ʣ�����
	g_RemainPoint = Player:GetData("POINT_REMAIN");
	SelfEquip_Potential:SetText( tostring( g_RemainPoint ) );
	g_CurRemainPoint = g_RemainPoint;
	
	if (g_CurRemainPoint > 0) then
		
		Equip_Addition_Button1:Enable();
		Equip_Addition_Button2:Enable();
		Equip_Addition_Button3:Enable();
		Equip_Addition_Button4:Enable();
		Equip_Addition_Button5:Enable();
		
	end;
	
	
	-- ������
	nNumber = Player:GetData("ATT_PHYSICS");
	SelfEquip_Perporty1:SetText( tostring( nNumber ) );
	
	-- �������
	nNumber = Player:GetData("DEF_PHYSICS");
	if nNumber > 999999 then --Ϊ��ս�޸ĵ� modified by hukai
		SelfEquip_Perporty3:SetText( "??????" );
	else
		SelfEquip_Perporty3:SetText( tostring( nNumber ) );
	end
	
	-- ħ������
	nNumber = Player:GetData("ATT_MAGIC");
	SelfEquip_Perporty2:SetText( tostring( nNumber ) );
	
	-- ħ������
	nNumber = Player:GetData("DEF_MAGIC");
	if nNumber > 999999 then --Ϊ��ս�޸ĵ� modified by hukai
		SelfEquip_Perporty4:SetText( "??????" );
	else
		SelfEquip_Perporty4:SetText( tostring( nNumber ) );
	end
	
	-- ������
	nNumber = Player:GetData("MISS");
	SelfEquip_Perporty6:SetText( tostring( nNumber ) );
	
	-- ������
	nNumber = Player:GetData("HIT");
	SelfEquip_Perporty7:SetText( tostring( nNumber ) );
	
	--zhangqiang���������Լӳ�==============================
	--PushDebugMessage("Test"..Player:GetData("XIULIANFLAGASDFDAS") );
	--if Player:GetData("XIULIANFLAG") > 0 then
	--	SelfEquip_Gongli:SetText( "��������:#H"..xiulian_gongli );
	
	nNumber = Player:GetData("XIULIAN_STR");
	if xiulian_liliang>=0 then
		local StrText = AddXiuLianColor(xiulian_liliang).."#H+" .. tostring( xiulian_liliang*10 );
		SelfEquip_Str_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_SPR");
	if xiulian_lingqi>=0 then
		local StrText = AddXiuLianColor(xiulian_lingqi).."#H+" .. tostring( xiulian_lingqi*10 );
		SelfEquip_Nimbus_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_CON");
	if xiulian_tili>=0 then
		local StrText = AddXiuLianColor(xiulian_tili).."#H+" .. tostring( xiulian_tili*10 );
		SelfEquip_PhysicalStrength_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_INT");
	if xiulian_dingli>=0 then
		local StrText = AddXiuLianColor(xiulian_dingli).."#H+" .. tostring( xiulian_dingli*10 );
		SelfEquip_Stability_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_DEX");
	if xiulian_shenfa>=0 then
		local StrText = AddXiuLianColor(xiulian_shenfa).."#H+" .. tostring( xiulian_shenfa*10 );
		SelfEquip_Footwork_Plus:SetText( StrText );
	end
	nNumber = Player:GetData("XIULIAN_HIT");--����
	if xiulian_5>=0 then
		local StrText = "#H+" .. tostring( xiulian_5*100 );
		SelfEquip_Perporty7_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_ATTP");--�⹦����
	if xiulian_1>=0 then
		local StrText ="#H+" ..  tostring(xiulian_1*200);
		SelfEquip_Perporty1_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_DEFP");--�⹦����
	if xiulian_3>=0 then
		local StrText = "#H+" ..  tostring( xiulian_3*100 );
		SelfEquip_Perporty3_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_ATTM");--�ڹ�����
	if xiulian_2>=0 then
		local StrText = "#H+" .. tostring( xiulian_2*200 );
		SelfEquip_Perporty2_Plus:SetText( StrText );
	end
	nNumber = Player:GetData("XIULIAN_DEFM");--�ڹ�����
	if xiulian_4>=0 then
		local StrText = "#H+" .. tostring( xiulian_4*100 );
		SelfEquip_Perporty4_Plus:SetText( StrText );
	end
	
	nNumber = Player:GetData("XIULIAN_MISS");--����
	if xiulian_6>=0 then
		local StrText = "#H+" .. tostring( xiulian_6*80 );
		SelfEquip_Perporty6_Plus:SetText( StrText );
	end
	--else
	--	SelfEquip_Str_Plus:SetText( "" );
	--	SelfEquip_Nimbus_Plus:SetText( "" );
	--	SelfEquip_PhysicalStrength_Plus:SetText( "" );
	--	SelfEquip_Stability_Plus:SetText( "" );
	--	SelfEquip_Footwork_Plus:SetText( "" );
	--	SelfEquip_Perporty7_Plus:SetText( "" );
	--	SelfEquip_Perporty1_Plus:SetText( "" );
	--	SelfEquip_Perporty3_Plus:SetText( "" );
	--	SelfEquip_Perporty2_Plus:SetText( "" );
	--	SelfEquip_Perporty4_Plus:SetText( "" );
	--	SelfEquip_Perporty6_Plus:SetText( "" );
	--end
	--=======================================================
	
	-- ���Ĺ���
	nNumber = Player:GetData("CRITICALATTACK");
	SelfEquip_Perporty8:SetText( tostring( nNumber ) );
	
	SelfEquip_Perporty8_Plus:SetText( "" );
	
	-- ���ķ���
	nNumber = Player:GetData("CRITICALDEFENCE");
	SelfEquip_Perporty9:SetText( tostring( nNumber ) );
	
	SelfEquip_Perporty9_Plus:SetText( "" );
	
	-- ����
	SelfEquip_ShowVigor();
	
	-- ����
	SelfEquip_ShowEnergy();
	
	-- ����
	local menpai = Player:GetData("MEMPAI");
	local strName = "";
	
	-- �õ���������.
	if (0 == menpai) then
		strName = "����";
		
	elseif (1 == menpai) then
		strName = "����";
		
	elseif (2 == menpai) then
		strName = "ؤ��";
		
	elseif (3 == menpai) then
		strName = "�䵱";
		
	elseif (4 == menpai) then
		strName = "����";
		
	elseif (5 == menpai) then
		strName = "����";
		
	elseif (6 == menpai) then
		strName = "����";
		
	elseif (7 == menpai) then
		strName = "��ɽ";
		
	elseif (8 == menpai) then
		strName = "��ң";
		
	elseif (9 == menpai) then
		strName = "������";
		
	elseif (10== menpai) then
		strName = "Ľ��";
		
	elseif (11== menpai) then
		strName = "����";
		
	elseif (12== menpai) then
		strName = "���";
		
	elseif (13== menpai) then
		strName = "�һ���";		
		
	end
	
	-- ������ʾ������.
	SelfEquip_MenPai:SetText(strName);
	
	-- ����ս������
	local 	nNumber1 =0
	local 	nNumber1 = Player:GetData( "LEVEL" );-- �õ��ȼ�
	local    nNumber2 = Player:GetData("STR");	  -- ����
	local    nNumber3 = Player:GetData("SPR"); 	-- ����
	local 	nNumber4 = Player:GetData("CON");-- ����
	local 	nNumber5 = Player:GetData("INT");-- ����
	local 	nNumber6 = Player:GetData("DEX");-- ��
	local 	nNumber7 = Player:GetData("ATT_PHYSICS");-- ������
	local 	nNumber8 = Player:GetData("DEF_PHYSICS");-- �������
	local 	nNumber9 = Player:GetData("ATT_MAGIC");		-- ħ������
	local 	nNumber10 = Player:GetData("DEF_MAGIC");	-- ħ������
	local 	nNumber11 = Player:GetData("MISS");-- ������
	local 	nNumber12 = Player:GetData("HIT");	-- ������
	local 	nNumber13 = Player:GetData("CRITICALATTACK");-- ���Ĺ���
	local 	nNumber14 = Player:GetData("CRITICALDEFENCE");	-- ���ķ���
	local 	nNumber15 = Player:GetData( "MAXHP" );-- �õ�Ѫֵ
	local 	nNumber16 = Player:GetData( "MAXMP" );-- �õ�ħ��ֵ
	local iIceAttack  		= Player:GetData( "ATTACKCOLD" );  --����
	local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
	local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
	local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
	local iIceDefine  		= Player:GetData( "DEFENCECOLD" );  --��
	local iFireDefine 		= Player:GetData( "DEFENCEFIRE" );
	local iThunderDefine	= Player:GetData( "DEFENCELIGHT" );
	local iPoisonDefine		= Player:GetData( "DEFENCEPOISON" );
	local iIceResistOther	= Player:GetData( "RESISTOTHERCOLD" ); --����
	local iFireResistOther= Player:GetData( "RESISTOTHERFIRE" );
	local iThunderResistOther	= Player:GetData( "RESISTOTHERLIGHT" );
	local iPoisonResistOther= Player:GetData( "RESISTOTHERPOISON" );
	dixa = (nNumber1*10)+(nNumber2*2)+(nNumber3*2)+(nNumber4*5)+(nNumber5*2)+(nNumber6*2)+(nNumber7*3)+(nNumber8*2)+(nNumber9*3)+(nNumber10*2)+(nNumber11*2)+(nNumber12*2) +(nNumber13*5) + (nNumber14*2) + ((iIceAttack+iFireAttack+iThunderAttack+iPoisonAttack+iIceDefine+iFireDefine+iThunderDefine+iPoisonDefine+iIceResistOther+iFireResistOther+iThunderResistOther+iPoisonResistOther)*10)
    dixa = dixa+(nChuanCiAttack+nChuanCiDenfense)*6;
	SelfEquip_FightScore_Text:SetText( "װ������:"..tostring(dixa) );
	local HostPF = DataPool:GetPlayerMission_DataRound(104)
	SelfEquip_FightScore_Text:SetToolTip("װ�������ܵ�ȫ��װ�����ԡ���ʯ�����ơ�ǿ�������������ʡ���Ԫ�����塢��ͨ���ԡ���Ů����ľ�����Լ���ҵȼ�Ӱ�졣#r��ʷ���װ�����֣�"..HostPF)
	SelfEquip_Yirong_Icon:SetToolTip("��������ݸ󣬿ɲ鿴ʱװ�����Ρ����͡���ɫ�����͡�ͷ�������")
	local nLevel = Player:GetData( "LEVEL" );
	SelfEquip_Refresh_Page_Button(nLevel)
	SelfEquip_Level2:SetText("");
	
	
	-- ���ð����ʾ
	--	GetGuildTitle();
	
	-- �õ��ƺ�
	--	GetCurTitle();
	
	-- �����ֶ����ڵ�����ť��״̬.
	SetAcceptButtonState();
	
end


function xxxoop()  --���ֺ���
	local ada = selfEuip_penfen()
	if  ada >1  then
		local    nNumber2 = Player:GetData("STR");	  -- ����
		local    nNumber3 = Player:GetData("SPR"); 	-- ����
		local 	nNumber5 = Player:GetData("INT");-- ����
		local 	nNumber6 = Player:GetData("DEX");-- ��
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("MsgBox18")
		Set_XSCRIPT_ScriptID(391060)
		Set_XSCRIPT_Parameter(0,tonumber(ada))
		Set_XSCRIPT_Parameter(1,nNumber2)
		Set_XSCRIPT_Parameter(2,nNumber3)
		Set_XSCRIPT_Parameter(3,nNumber5)
		Set_XSCRIPT_Parameter(4,nNumber6)
		Set_XSCRIPT_ParamCount(5)
		Send_XSCRIPT();
		
	end
end






-- ˢ��װ��
function Equip_RefreshEquip()
	
	
	--  ��հ�ť��ʾͼ��
	g_WEAPON:SetActionItem(-1);			--����
	g_CAP:SetActionItem(-1);				--ñ��
	g_ARMOR:SetActionItem(-1);			--����
	g_CUFF:SetActionItem(-1);				--����
	g_BOOT:SetActionItem(-1);				--Ь
	g_SASH:SetActionItem(-1);				--����
	g_RING:SetActionItem(-1);				--��ָ
	g_NECKLACE:SetActionItem(-1);		--����
	g_Dark:SetActionItem(-1);			--����
	g_RING_2:SetActionItem(-1);			--��ָ2
	g_CHARM:SetActionItem(-1);			--����
	g_CHARM_2:SetActionItem(-1);		--����2
	g_WRIST:SetActionItem(-1);			--����
	g_SHOULDER:SetActionItem(-1);		--����
	
	g_LONGWEN:SetActionItem(-1);		--����
	g_RL:SetActionItem(-1);					--��ʯ��˵
	
	ActionWeapon 		= EnumAction(0, "equip");
	ActionCap    		= EnumAction(1, "equip");
	ActionArmor  		= EnumAction(16, "equip"); ---�·�
	ActionCuff   		= EnumAction(3, "equip");
	ActionBoot   		= EnumAction(4, "equip");
	ActionSash   		= EnumAction(5, "equip");
	ActionRing    	= EnumAction(6, "equip");
	ActionNecklace	= EnumAction(7, "equip");
	ActionMount			= EnumAction(17, "equip");
	ActionRing_2		= EnumAction(11, "equip");
	ActionCharm 		= EnumAction(12, "equip");
	ActionCharm_2   = EnumAction(13, "equip");
	ActionWrist  		= EnumAction(14, "equip");
	ActionShoulder  = EnumAction(15, "equip");
	ActionLongwen   	= EnumAction(18, "equip");
	AciontRL					= EnumAction(9, "equip");
	Clear_XSCRIPT();
	Set_XSCRIPT_Function_Name("AHa_ReMyBuff")
	Set_XSCRIPT_ScriptID(892002)
	Set_XSCRIPT_ParamCount(0)
	Send_XSCRIPT();

	-- ��ʾ�����ϵ�����װ��
	g_WEAPON:SetActionItem(ActionWeapon:GetID());			--����
	g_CAP:SetActionItem(ActionCap:GetID());						--ñ��
	g_ARMOR:SetActionItem(ActionArmor:GetID());				--����
	g_CUFF:SetActionItem(ActionCuff:GetID());					--����
	g_BOOT:SetActionItem(ActionBoot:GetID());					--Ь
	g_SASH:SetActionItem(ActionSash:GetID());					--����
	g_RING:SetActionItem(ActionRing:GetID());					--����
	g_NECKLACE:SetActionItem(ActionNecklace:GetID());	--����
	g_Dark:SetActionItem(ActionMount:GetID());				--����
	g_RING_2:SetActionItem(ActionRing_2:GetID());			--��ָ2
	g_CHARM:SetActionItem(ActionCharm:GetID());			--����
	g_CHARM_2:SetActionItem(ActionCharm_2:GetID());		--����2
	g_WRIST:SetActionItem(ActionWrist:GetID());			--����
	g_SHOULDER:SetActionItem(ActionShoulder:GetID());		--����
	g_LONGWEN:SetActionItem(ActionLongwen:GetID());		--����
	if AciontRL:GetDefineID() ~= 10141030 then
		g_RL:SetActionItem(AciontRL:GetID());		--��ʯ��˵
	end
	local IsDisplay = SystemSetup:Get_Display_Dress();

		if IsDisplay == 1 then
		IsDisplay = 0
	else
		IsDisplay = 1
	end
SystemSetup:Set_Display_Dress(1);	
	--- ��ʾ�����ϵı�ʯװ��λ
	SelfEquip_UpdateGemContainer( )
	SelfEquip_UpdateMask();
	SelfEquip_UpdateZhiZunAnimate()
	SelfEquip_UpdateFiveElementsTip()
	xxxoop()
		local nMinAttactLevel = DataPool:GetPlayerMission_DataRound(314)
	local nMinDefenceLevel =DataPool:GetPlayerMission_DataRound(315)
	local nSumLevel = nMinAttactLevel + nMinDefenceLevel

	if nSumLevel < 2 then
		SelfEquip_Effect:SetProperty("Image" , "set:UIIcons1 image:Equip_qianghua1" )
	elseif nSumLevel < 4 then
		SelfEquip_Effect:SetProperty("Image" , "set:UIIcons1 image:Equip_qianghua2" )
	elseif nSumLevel < 6 then
		SelfEquip_Effect:SetProperty("Image" , "set:UIIcons1 image:Equip_qianghua3" )
	elseif nSumLevel < 8 then
		SelfEquip_Effect:SetProperty("Image" , "set:UIIcons1 image:Equip_qianghua4" )
	else
		SelfEquip_Effect:SetProperty("Image" , "set:UIIcons1 image:Equip_qianghua5" )
	end	
end
function SelfEquip_Equip_Click( nTypeIn,buttonIn )
	
	local nType = tonumber( nTypeIn );
	local button = tonumber( buttonIn );
	if ( nType == 11 ) then
		if ( button == 1 ) then
			g_WEAPON:DoAction();	--����
		else
			g_WEAPON:DoSubAction();	--����
		end
	elseif ( nType == 12 ) then
		if ( button == 1 ) then
			g_ARMOR:DoAction();	--�·�
		else
			g_ARMOR:DoSubAction();	--�·�
		end
	elseif ( nType == 1 ) then
		if ( button == 1 ) then
			g_CAP:DoAction();	--ñ��
		else
			g_CAP:DoSubAction();	--ñ��
		end
	elseif ( nType == 4 ) then
		if ( button == 1 ) then
			g_CUFF:DoAction();	--����
		else
			g_CUFF:DoSubAction();	--����
		end
	elseif ( nType == 6 ) then
		if ( button == 1 ) then
			g_BOOT:DoAction();	--Ь
		else
			g_BOOT:DoSubAction();	--Ь
		end
	elseif ( nType == 7 ) then
		if ( button == 1 ) then
			g_RING:DoAction();	--��ָ
		else
			g_RING:DoSubAction();	--��ָ
		end
	elseif ( nType == 5 ) then
		if ( button == 1 ) then
			g_SASH:DoAction();	--����
		else
			g_SASH:DoSubAction();	--����
		end
	elseif ( nType == 13) then
		if ( button == 1 ) then
			g_NECKLACE:DoAction();	--����
		else
			g_NECKLACE:DoSubAction();	--����
		end
	elseif ( nType == 14 ) then
		if ( button == 1 ) then
			g_Dark:DoAction();	--����
		else
			g_Dark:DoSubAction();	--����
		end
	elseif ( nType == 2 ) then
		if ( button == 1 ) then
			g_SHOULDER:DoAction();	--����
		else
			g_SHOULDER:DoSubAction();	--����
		end
	elseif ( nType == 3 ) then
		if ( button == 1 ) then
			g_WRIST:DoAction();	--����
		else
			g_WRIST:DoSubAction();	--����
		end
	elseif ( nType == 8 ) then
		if ( button == 1 ) then
			g_RING_2:DoAction();	--��ָ2
		else
			g_RING_2:DoSubAction();	--��ָ
		end
	elseif ( nType == 9 ) then
		if ( button == 1 ) then
			g_CHARM:DoAction();	--����
		else
			g_CHARM:DoSubAction();	--����
		end
	elseif ( nType == 10 ) then
		if ( button == 1 ) then
			g_CHARM_2:DoAction();	--����2
		else
			g_CHARM_2:DoSubAction();	--����2
		end
	elseif ( nType == 25 ) then
		if ( button == 1 ) then
			g_LONGWEN:DoAction();	--����
		else
			g_LONGWEN:DoSubAction();	--����
		end
	elseif ( nType == 16 ) then
		if ( button == 1 ) then
			g_RL:DoAction();	--��ʯ��˵
		else
			g_RL:DoSubAction();	--��ʯ��˵
		end
		
	end
end


----------------------------------------------------------------------------
-- ����������ť
--
-- ��������������ť
function SelfEquip_Dec1_Click()
	
	if (g_AddStr > 0) then
		g_CurRemainPoint = g_CurRemainPoint + 1;
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end;
		
		g_AddStr = g_AddStr - 1;
	end
	
	if (g_AddStr <= 0) then
		g_AddStr = 0;
		Equip_Decrease_Button1:Disable();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurStr();
	
end

-- ��������������ť
function SelfEquip_Add1_Click()
	
	if (g_CurRemainPoint > 0) then
		g_AddStr = g_AddStr + 1;
		if (g_AddStr > 0) then
			Equip_Decrease_Button1:Enable();
		end
		
		g_CurRemainPoint = g_CurRemainPoint - 1;
	end
	
	if (g_CurRemainPoint <= 0) then
		g_CurRemainPoint = 0;
		DisablePointAddButtion();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurStr();
	
end


-----------------------------------------------------------------------------
-- ����������ť
--
-- ��������������ť
function SelfEquip_Dec2_Click()
	
	if (g_AddSpr > 0) then
		g_CurRemainPoint = g_CurRemainPoint + 1;
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end
		
		g_AddSpr = g_AddSpr - 1;
	end
	
	if (g_AddSpr <= 0) then
		
		g_AddSpr = 0;
		Equip_Decrease_Button2:Disable();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurSpr();
	
end

-- ��������������ť
function SelfEquip_Add2_Click()
	
	if (g_CurRemainPoint > 0) then
		g_AddSpr = g_AddSpr + 1;
		if (g_AddSpr > 0) then
			Equip_Decrease_Button2:Enable();
		end
		
		g_CurRemainPoint = g_CurRemainPoint - 1;
	end
	
	if (g_CurRemainPoint <= 0) then
		g_CurRemainPoint = 0;
		DisablePointAddButtion();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurSpr();
	
end


-----------------------------------------------------------------------------
-- ���ʵ�����ť
--
-- �������ʵ�����ť
function SelfEquip_Dec3_Click()
	
	if (g_AddCon > 0) then
		g_CurRemainPoint = g_CurRemainPoint + 1;
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end
		
		g_AddCon = g_AddCon - 1;
	end
	
	if (g_AddCon <= 0) then
		
		g_AddCon = 0;
		Equip_Decrease_Button3:Disable();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurCon();
	
	
end

-- �������ʵ�����ť
function SelfEquip_Add3_Click()
	
	if (g_CurRemainPoint > 0) then
		g_AddCon = g_AddCon + 1;
		if (g_AddCon > 0) then
			Equip_Decrease_Button3:Enable();
		end
		
		g_CurRemainPoint = g_CurRemainPoint - 1;
	end
	
	if (g_CurRemainPoint <= 0) then
		g_CurRemainPoint = 0;
		DisablePointAddButtion();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurCon();
	
end


-------------------------------------------------------------------------------
-- ����������ť
--
-- ���ٶ���������ť
function SelfEquip_Dec4_Click()
	
	if (g_AddInt > 0) then
		g_CurRemainPoint = g_CurRemainPoint + 1;
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end
		
		g_AddInt = g_AddInt - 1;
	end
	
	if (g_AddInt <= 0) then
		
		g_AddInt = 0;
		Equip_Decrease_Button4:Disable();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurInt();
	
end

-- ���Ӷ���������ť
function SelfEquip_Add4_Click()
	
	if (g_CurRemainPoint > 0) then
		g_AddInt = g_AddInt + 1;
		if (g_AddInt > 0) then
			Equip_Decrease_Button4:Enable();
		end
		
		g_CurRemainPoint = g_CurRemainPoint - 1;
	end
	
	if (g_CurRemainPoint <= 0) then
		
		g_CurRemainPoint = 0;
		DisablePointAddButtion();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ����
	ShowCurInt();
	
end



--------------------------------------------------------------------------------
-- ��������ť
--
-- ������������ť
function SelfEquip_Dec5_Click()
	
	if (g_AddDex > 0) then
		g_CurRemainPoint = g_CurRemainPoint + 1;
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end
		
		g_AddDex = g_AddDex - 1;
	end
	
	if (g_AddDex <= 0) then
		
		g_AddDex = 0;
		Equip_Decrease_Button5:Disable();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ��
	ShowCurDex();
	
end

-- ������������ť
function SelfEquip_Add5_Click()
	
	if (g_CurRemainPoint > 0) then
		g_AddDex = g_AddDex + 1;
		if (g_AddDex > 0) then
			Equip_Decrease_Button5:Enable();
		end
		
		g_CurRemainPoint = g_CurRemainPoint - 1;
	end
	
	if (g_CurRemainPoint <= 0) then
		
		g_CurRemainPoint = 0;
		DisablePointAddButtion();
	end
	
	-- ��ʾ��ǰʣ��ĵ���
	ShowCurRemainPoint();
	
	-- ����ʣ�������ť״̬
	SetAcceptButtonState();
	
	-- ��ʾ��
	ShowCurDex();
	
end

--------------------------------------------------------------------------------
--
-- �����еĵ������Ӱ�ť
--
function EanbleAskAttrBn(bEnable)
	
	Equip_Addition_Button1:Enable();
	Equip_Addition_Button2:Enable();
	Equip_Addition_Button3:Enable();
	Equip_Addition_Button4:Enable();
	Equip_Addition_Button5:Enable();
end

--------------------------------------------------------------------------------
--
-- �����еĵ������Ӱ�ť
--
function EanblePointAddButtion()
	
	Equip_Addition_Button1:Enable();
	Equip_Addition_Button2:Enable();
	Equip_Addition_Button3:Enable();
	Equip_Addition_Button4:Enable();
	Equip_Addition_Button5:Enable();
end


--------------------------------------------------------------------------------
--
-- ��ֹ���еĵ������Ӱ�ť
--
function DisablePointAddButtion()
	
	Equip_Addition_Button1:Disable();
	Equip_Addition_Button2:Disable();
	Equip_Addition_Button3:Disable();
	Equip_Addition_Button4:Disable();
	Equip_Addition_Button5:Disable();
end


--------------------------------------------------------------------------------
--
-- �����еĵ������Ӱ�ť
--
function EanblePointDecButtion()
	
	Equip_Decrease_Button1:Enable();
	Equip_Decrease_Button2:Enable();
	Equip_Decrease_Button3:Enable();
	Equip_Decrease_Button4:Enable();
	Equip_Decrease_Button5:Enable();
end


--------------------------------------------------------------------------------
--
-- ��ֹ���еĵ������Ӱ�ť
--
function DisablePointDecButtion()
	
	Equip_Decrease_Button1:Disable();
	Equip_Decrease_Button2:Disable();
	Equip_Decrease_Button3:Disable();
	Equip_Decrease_Button4:Disable();
	Equip_Decrease_Button5:Disable();
end


---------------------------------------------------------------------------------
--
-- ��ʾ��ǰ��Ǳ��
--
function ShowCurRemainPoint()
	
	SelfEquip_Potential:SetText( tostring( g_CurRemainPoint ) );
	
end

---------------------------------------------------------------------------------
--
-- ��ʾ����
--
function ShowCurStr()
	
	SelfEquip_Str:SetText( tostring( g_AddStr + Player:GetData("STR") ) );
	
end

---------------------------------------------------------------------------------
--
-- ��ʾ����
--
function ShowCurSpr()
	
	SelfEquip_Nimbus:SetText( tostring( g_AddSpr + Player:GetData("SPR"))  );
	
end

---------------------------------------------------------------------------------
--
-- ��ʾ����
--
function ShowCurCon()
	
	SelfEquip_PhysicalStrength:SetText( tostring( g_AddCon + Player:GetData("CON"))  );
	
end

---------------------------------------------------------------------------------
--
-- ��ʾ����
--
function ShowCurInt()
	
	SelfEquip_Stability:SetText( tostring( g_AddInt + Player:GetData("INT"))  );
	
end

---------------------------------------------------------------------------------
--
-- ��ʾ��
--
function ShowCurDex()
	
	SelfEquip_Footwork:SetText( tostring( g_AddDex + Player:GetData("DEX"))  );
end

---------------------------------------------------------------------------------
--
-- ��ֹ, ������Ǳ�ܰ�ťǱ�ܰ�ť
--
function SetAcceptButtonState()
	
	if (g_CurRemainPoint == g_RemainPoint) then
		
		SelfEquip_Accept:Disable();
	else
		
		SelfEquip_Accept:Enable();
	end;
	
end

---------------------------------------------------------------------------------
--
-- ��������Ǳ��
--
function SelfEquip_Accept_Click()
	
	-- ���͸�����������.
	Player:SendAskManualAttr(g_AddStr, g_AddSpr, g_AddCon, g_AddInt, g_AddDex);
	
	-- ����ʹ��, �������Ҫװ������ϸ��Ϣ
	AskEquipDetial();
	
end

---------------------------------------------------------------------------------
--
-- ��ױ̨����
--
function SelfEquip_Individuation_Clicked(targetId)
	
	if IsInTServer() == 1 then
		PushDebugMessage("#{BHKF_140909_327}")
		return
	end
	--�ر����ͷ��ͷ�ɫ����
	if (IsWindowShow("SelectFacestyle")) then
		CloseWindow("SelectFacestyle", true)
	end
	if (IsWindowShow("SelectHairstyle")) then
		CloseWindow("SelectHairstyle", true)
	end
	if (IsWindowShow("SelectHairColor")) then
		CloseWindow("SelectHairColor", true)
	end
	--����ױ̨����
	PushEvent("OPEN_SHOP_DRESSER", "SelfEquip_Frame", targetId)
end

---------------------------------------------------------------------------------
--
-- �ֶ������ɹ�
--
function SelfEquip_ManualAttr_Success()
	
	g_AddStr = 0;					-- �����������ϵ�ʣ�����.
	g_AddSpr = 0;					-- �����������ϵ�ʣ�����.
	g_AddCon = 0;					-- �����������ϵ�ʣ�����.
	g_AddInt = 0;					-- �����ڶ����ϵ�ʣ�����.
	g_AddDex = 0;					-- ���������ϵ�ʣ�����.
	
	-- ��ֹ���м��ٵ�����ť
	DisablePointDecButtion();
	
	-- ʣ��û�з���ĵ���
	g_RemainPoint = g_CurRemainPoint;
	if (g_CurRemainPoint > 0) then
		
		EanblePointAddButtion();
	end
	
	
end

---------------------------------------------------------------------------------
--
-- ����ƺŰ�ť
--
function TitleButton_Click()
	
	g_bOpenTitleDlg = 1;
	-- �򿪳ƺŽ���
	OpenTitleList();
	
end

----------------------------------------------------------------------------------
--
-- �����ᰴť
--
function OpenConfraternity_click()
	
	-- �򿪻�رհ�����
	Guild:ToggleGuildDetailInfo();
end


----------------------------------------------------------------------------------
--
-- �õ���ǰ��title
--
--[[
function GetCurTitle()
	
	-- �õ���ǰ�ĳƺ�.
	local strCurTitle = Player:GetCurTitle();
	SelfEquip_Agname:SetText(strCurTitle);
	
end

function GetGuildTitle()
	local szGuildName = Guild:GetMyGuildInfo("Name");
	if (nil ~= szGuildName and "" ~= szGuildName) then
		SelfEquip_Confraternity:SetText(szGuildName);
	else
		SelfEquip_Confraternity:SetText("");
	end
end
--]]
----------------------------------------------------------------------------------
--
-- ѡװ���ģ�ͣ�����)
--
function SelfEquip_Modle_TurnLeft(start)
	--������ת��ʼ
	if (start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		SelfEquip_FakeObject:RotateBegin(-0.3);
		--������ת����
	else
		SelfEquip_FakeObject:RotateEnd();
	end
end

----------------------------------------------------------------------------------
--
-- ѡװ���ģ�ͣ�����)
--
function SelfEquip_Modle_TurnRight(start)
	--������ת��ʼ
	if (start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		SelfEquip_FakeObject:RotateBegin(0.3);
		--������ת����
	else
		SelfEquip_FakeObject:RotateEnd();
	end
end

---------------------------------------------------------------------------------
--
-- ����״̬tooltip
--
function SelfEquip_SetStateTooltip()
	
	
	-- �õ�״̬����
	local iIceDefine  		= Player:GetData( "DEFENCECOLD" );
	local iFireDefine 		= Player:GetData( "DEFENCEFIRE" );
	local iThunderDefine	= Player:GetData( "DEFENCELIGHT" );
	local iPoisonDefine		= Player:GetData( "DEFENCEPOISON" );
	
	--����ʾ������
	if (iIceDefine ~= nil and iIceDefine < 0) then
		iIceDefine = 0
	end
	if (iFireDefine ~= nil and iFireDefine < 0) then
		iFireDefine = 0
	end
	if (iThunderDefine ~= nil and iThunderDefine < 0) then
		iThunderDefine = 0
	end
	if (iPoisonDefine ~= nil and iPoisonDefine < 0) then
		iPoisonDefine = 0
	end
	
	local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
	local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
	local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
	local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
	
	local iIceResistOther	= Player:GetData( "RESISTOTHERCOLD" );
	local iFireResistOther= Player:GetData( "RESISTOTHERFIRE" );
	local iThunderResistOther	= Player:GetData( "RESISTOTHERLIGHT" );
	local iPoisonResistOther= Player:GetData( "RESISTOTHERPOISON" );
	
	local iIceResistLimit = Player:GetData("SUBRESISTLIMITCOLD")
	local iFireResistLimit = Player:GetData("SUBRESISTLIMITFIRE")
	local iThunderResistLimit = Player:GetData("SUBRESISTLIMITLIGHT")
	local iPoisonResistLimit = Player:GetData("SUBRESISTLIMITPOISON")
	
	local iEnchanceAtt = Player:GetData("ENCHANCEATT")
	local iEnchanceDef = Player:GetData("ENCHANCEDEF")
	
	
	local szFireResistOther = "";			--����
	local szIceResistOther = "";			--������
	local szPoisonResistOther = "";			--������
	local szThunderResistOther = "";			--������
	
    local InfantBUFF2 = SelfEquip_InfantBUFF()
	local InfantBUFFname = {"(��Ů:".. InfantBUFF2[1]*4 ..")","(��Ů:"..InfantBUFF2[5]*4 ..")",
	                        "(��Ů:".. InfantBUFF2[2]*4 ..")","(��Ů:"..InfantBUFF2[6]*4 ..")",
							"(��Ů:".. InfantBUFF2[3]*4 ..")","(��Ů:"..InfantBUFF2[7]*4 ..")",
							"(��Ů:".. InfantBUFF2[4]*4 ..")","(��Ů:"..InfantBUFF2[8]*4 ..")",
	                       }
   local name1 = ""
   if InfantBUFF2[1] > 0 then
   name1 = InfantBUFFname[1]
   iIceDefine = iIceDefine - InfantBUFF2[1]*4
   end
   local name2 = ""
   if InfantBUFF2[2] > 0 then
   name2 = InfantBUFFname[3]
   iFireDefine = iFireDefine - InfantBUFF2[2]*4 
   end
   local name3 = ""
   if InfantBUFF2[3] > 0 then
   name3 = InfantBUFFname[5]
   iThunderDefine = iThunderDefine - InfantBUFF2[3]*4 
   end
   local name4 = ""
   if InfantBUFF2[4] > 0 then
   name4 = InfantBUFFname[7]
   iPoisonDefine = iPoisonDefine - InfantBUFF2[4]*4 
   end

   
   
   
   local name5 = ""
   if InfantBUFF2[5] > 0 then
   name5 = InfantBUFFname[2]
   iIceResistOther = iIceResistOther - InfantBUFF2[5]*4 
   end

      local name6 = ""
   if InfantBUFF2[6] > 0 then
   name6 = InfantBUFFname[4]
   iFireResistOther = iFireResistOther - InfantBUFF2[6]*4 
   end

      local name7 = ""
   if InfantBUFF2[7] > 0 then
   name7 = InfantBUFFname[6]
   iThunderResistOther = iThunderResistOther - InfantBUFF2[7]*4 
   end

      local name8 = ""
   if InfantBUFF2[8] > 0 then
   name8 = InfantBUFFname[8]
   iPoisonResistOther = iPoisonResistOther - InfantBUFF2[8]*4 
   end
    local jiacheng = 0
	local jiachengA = 0
	if tianrui >= 4 then
	jiacheng = 0.05
	elseif dipan >= 4 then
	jiachengA = 0.05
	end	
	
	SelfEquip_IceFastness:SetToolTip("����:"..tostring(iIceAttack).."#r����:"..tostring(iIceDefine) ..name1.."#r������:"..tostring(iIceResistOther)..szIceResistOther..name5.."#{JKXX_091228_1}"..tostring(WW_lw1) );
	SelfEquip_FireFastness:SetToolTip("��:"..tostring(iFireAttack).."#r��:"..tostring(iFireDefine)..name2.."#r����:"..tostring(iFireResistOther)..szFireResistOther..name6.."#{JKXX_091228_2}"..tostring(WW_lw2) );
	SelfEquip_ThunderFastness:SetToolTip("����:"..tostring(iThunderAttack).."#r����:"..tostring(iThunderDefine)..name3.."#r������:"..tostring(iThunderResistOther)..szThunderResistOther..name7.."#{JKXX_091228_3}"..tostring(WW_lw3) );
	SelfEquip_PoisonFastness:SetToolTip("����:"..tostring(iPoisonAttack).."#r����:"..tostring(iPoisonDefine)..name4.."#r������:"..tostring(iPoisonResistOther)..szPoisonResistOther..name8.."#{JKXX_091228_4}"..tostring(WW_lw4) );

SelfEquip_HurtFastness:SetToolTip("�����˺�: "..nChuanCiAttack.."(���� +".. math.floor(nChuanCiAttack * jiacheng) ..")#r#cffff00���������󡢽�ָ�����������������ơ����������ơ�����ӡǿ�������Ӵ����˺���ǿ���ȼ�Խ�ߣ������ӵĴ����˺�Ҳ��Խ�ࡣ�����˺����ڹ���ʱ�����˺���" )
SelfEquip_DefenceFastness:SetToolTip("���̼���: "..nChuanCiDenfense.."(���� +".. math.floor(nChuanCiDenfense * jiachengA) ..")#r#cffff00�·���ñ�ӡ����硢���ס�������Ь��ǿ�������Ӵ��̼��⡣ǿ���ȼ�Խ�ߣ������ӵĴ��̼����Խ�ࡣ���̼���ֻ��������Ե��˵Ĵ����˺���" )	
SelfEquip_ShenDing_Icon:SetToolTip("��ľ����");  ---��

		SelfEquip_ShenDing_Icon:SetToolTip("�������ľ����");
		SelfEquip_ZhiZun_Icon:SetToolTip("��������б���");
	--[[
	--���� ����
	if iEnchanceAtt ~= nil and iEnchanceDef ~= nil then
		local nMinAttackLevel = DataPool:Lua_GetEnchanceMinLevel(0)
		local nMinDefenceLevel = DataPool:Lua_GetEnchanceMinLevel(1)
		
		local nAttackValue = DataPool:Lua_GetEnchanceSetInfo( 0 , 3, nMinAttackLevel )
		local nDefenceValue = DataPool:Lua_GetEnchanceSetInfo( 1 , 3, nMinDefenceLevel )
		
		local nAttackValueAdd = math.ceil(( iEnchanceAtt * nAttackValue ) / ( 100 + nAttackValue ))
		local nDefenceValueAdd = math.ceil(( iEnchanceDef * nDefenceValue ) / ( 100 + nDefenceValue ))
		
		local strAttackTip = ScriptGlobal_Format("#{ZBQH_130521_28}" ,tostring(iEnchanceAtt) , tostring(nAttackValueAdd))
		local strDefenceTip = ScriptGlobal_Format("#{ZBQH_130521_30}" ,tostring(iEnchanceDef) , tostring(nDefenceValueAdd))
		
		SelfEquip_HurtFastness:SetToolTip(strAttackTip.."#r#{ZBQH_130521_29}" )
		SelfEquip_DefenceFastness:SetToolTip(strDefenceTip.."#r#{ZBQH_130521_31}" )
	end
	
	--��ľ����
	local nLevel = Player:GetData("LEVEL")
	if nLevel == nil or nLevel < 15 then
		SelfEquip_ShenDing_Icon:SetToolTip("#{XLDL_140606_01}");
	else
		--����
		local nConValue = Player:GetData("LIANDANLUCONVALUE");
		local strConText = "#{XLDL_140606_02}";
		if nConValue ~= nil and nConValue > 0 then
			strConText = strConText.."#r������+"..tostring(nConValue)
		end
		--���Թ�
		local nIce, nFire, nThunder, nPoison = Player:GetData("Attack_IFTPValue");
		if nIce ~= nil and nIce > 0 then
			strConText = strConText.."#r��������+"..tostring(nIce);
		end
		if nFire ~= nil and nFire > 0 then
			strConText = strConText.."#r�𹥻���+"..tostring(nFire);
		end
		if nThunder ~= nil and nThunder > 0 then
			strConText = strConText.."#r��������+"..tostring(nThunder);
		end
		if nPoison ~= nil and nPoison > 0 then
			strConText = strConText.."#r��������+"..tostring(nPoison);
		end
		
		--���Կ�
		local nDIce, nDFire, nDThunder, nDPoison = Player:GetData("Defence_IFTPValue");
		if nDIce ~= nil and nDIce > 0 then
			strConText = strConText.."#r�����ԣ�+"..tostring(nDIce);
		end
		if nDFire ~= nil and nDFire > 0 then
			strConText = strConText.."#r���ԣ�+"..tostring(nDFire);
		end
		if nDThunder ~= nil and nDThunder > 0 then
			strConText = strConText.."#r�����ԣ�+"..tostring(nDThunder);
		end
		if nDPoison ~= nil and nDPoison > 0 then
			strConText = strConText.."#r�����ԣ�+"..tostring(nDPoison);
		end--]]
		
		SelfEquip_ShenDing_Icon:SetToolTip("�������ľ����");
		SelfEquip_ZhiZun_Icon:SetToolTip("��������б���");
		--	end
		
	end
	
function SelfEquip_InfantBUFF()
local Infant_SKEffect = { 10 , 15 , 20 , 24 , 30 , 35 , 40 , 45 , 70 } -- ��������
local InfantBUFF2 = {}
  for i = 1,8 do
    InfantBUFF2[i] = 0 --�Ŀ����ļ���
  end
local SKILLDT = DataPool:GetPlayerMission_DataRound(367)
if SKILLDT ~= nil and SKILLDT >= 1 and (math.floor(SKILLDT/10000000)) >= 1 then

local ZH_ratio = 1
local ZH_ratio1 = 0

local ZH_Value1 = 0
local ZH_Value2 = 0
local ZH_Value3 = 0
local ZH_Value4 = 0
local ZH_Value5 = 0
local ZH_data = DataPool:GetPlayerMission_DataRound(368)-- MD_INFANTZHDATE1) 
if ZH_data ~= nil and ZH_data > 0 then
	ZH_data = string.format("%06d",ZH_data)
	ZH_Value1=tonumber(string.sub(ZH_data,1,2))
	ZH_Value2=tonumber(string.sub(ZH_data,3,4))
	ZH_Value3=tonumber(string.sub(ZH_data,5,6))
end
local ZH_data2 = DataPool:GetPlayerMission_DataRound(369)-- MD_INFANTZHDATE2) 
if ZH_data2 ~= nil and ZH_data2 > 0 then
	ZH_data2 = string.format("%04d",ZH_data2)
	ZH_Value4=tonumber(string.sub(ZH_data2,1,2))
	ZH_Value5=tonumber(string.sub(ZH_data2,3,4))
end
ZH_ratio1 =math.floor((ZH_Value1+ZH_Value2+ZH_Value3+ZH_Value4+ZH_Value5)/445)
if ZH_ratio1 > 1 then
ZH_ratio1=1
end
ZH_ratio = ZH_ratio + ZH_ratio1

local SKILL1_ID = math.floor(SKILLDT/10000000)
local SKILL1_LV = math.floor(math.mod(SKILLDT,10000000)/1000000)
InfantBUFF2[SKILL1_ID] = InfantBUFF2[SKILL1_ID] + math.floor(math.floor(Infant_SKEffect[SKILL1_LV] * 2 * ZH_ratio)/1)

local SKILL2_ID = math.floor(math.mod(SKILLDT,1000000)/100000)
local SKILL2_LV = math.floor(math.mod(SKILLDT,100000)/10000)
InfantBUFF2[SKILL2_ID] = InfantBUFF2[SKILL2_ID] + math.floor(math.floor(Infant_SKEffect[SKILL2_LV] * 2 * ZH_ratio)/1)

local SKILL3_ID = math.floor(math.mod(SKILLDT,10000)/1000)
local SKILL3_LV = math.floor(math.mod(SKILLDT,1000)/100)
InfantBUFF2[SKILL3_ID] = InfantBUFF2[SKILL3_ID] + math.floor(math.floor(Infant_SKEffect[SKILL3_LV] * 2 * ZH_ratio)/1)

local SKILL4_ID = math.floor(math.mod(SKILLDT,100)/10)
local SKILL4_LV = math.mod(SKILLDT,10)
InfantBUFF2[SKILL4_ID] = InfantBUFF2[SKILL4_ID] + math.floor(math.floor(Infant_SKEffect[SKILL4_LV] * 2 * ZH_ratio)/1)
end

InfantBUFF2[1] = math.floor(InfantBUFF2[1]/4)
InfantBUFF2[2] = math.floor(InfantBUFF2[2]/4)
InfantBUFF2[3] = math.floor(InfantBUFF2[3]/4)
InfantBUFF2[4] = math.floor(InfantBUFF2[4]/4)
InfantBUFF2[5] = math.floor(InfantBUFF2[5]/4)
InfantBUFF2[6] = math.floor(InfantBUFF2[6]/4)
InfantBUFF2[7] = math.floor(InfantBUFF2[7]/4)
InfantBUFF2[8] = math.floor(InfantBUFF2[8]/4)

return InfantBUFF2
end	
	
	function selfEuip_penfen()
		local 	nNumber1 =0
		local 	nNumber1 = Player:GetData( "LEVEL" );-- �õ��ȼ�
		local    nNumber2 = Player:GetData("STR");	  -- ����
		local    nNumber3 = Player:GetData("SPR"); 	-- ����
		local 	nNumber4 = Player:GetData("CON");-- ����
		local 	nNumber5 = Player:GetData("INT");-- ����
		local 	nNumber6 = Player:GetData("DEX");-- ��
		local 	nNumber7 = Player:GetData("ATT_PHYSICS");-- ������
		local 	nNumber8 = Player:GetData("DEF_PHYSICS");-- �������
		local 	nNumber9 = Player:GetData("ATT_MAGIC");		-- ħ������
		local 	nNumber10 = Player:GetData("DEF_MAGIC");	-- ħ������
		local 	nNumber11 = Player:GetData("MISS");-- ������
		local 	nNumber12 = Player:GetData("HIT");	-- ������
		local 	nNumber13 = Player:GetData("CRITICALATTACK");-- ���Ĺ���
		local 	nNumber14 = Player:GetData("CRITICALDEFENCE");	-- ���ķ���
		local 	nNumber15 = Player:GetData( "MAXHP" );-- �õ�Ѫֵ
		local 	nNumber16 = Player:GetData( "MAXMP" );-- �õ�ħ��ֵ
		local iIceAttack  		= Player:GetData( "ATTACKCOLD" );  --����
		local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
		local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
		local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
		local iIceDefine  		= Player:GetData( "DEFENCECOLD" );  --��
		local iFireDefine 		= Player:GetData( "DEFENCEFIRE" );
		local iThunderDefine	= Player:GetData( "DEFENCELIGHT" );
		local iPoisonDefine		= Player:GetData( "DEFENCEPOISON" );
		local iIceResistOther	= Player:GetData( "RESISTOTHERCOLD" ); --����
		local iFireResistOther= Player:GetData( "RESISTOTHERFIRE" );
		local iThunderResistOther	= Player:GetData( "RESISTOTHERLIGHT" );
		local iPoisonResistOther= Player:GetData( "RESISTOTHERPOISON" );
				
	dixa = (nNumber1*10)+(nNumber2*2)+(nNumber3*2)+(nNumber4*5)+(nNumber5*2)+(nNumber6*2) + nNumber7 + nNumber8 +nNumber9 + nNumber10 + nNumber11 + nNumber12 +(nNumber13*5) + (nNumber14*2) + ((iIceAttack+iFireAttack+iThunderAttack+iPoisonAttack+iIceDefine+iFireDefine+iThunderDefine+iPoisonDefine+iIceResistOther+iFireResistOther+iThunderResistOther+iPoisonResistOther)*10)
    dixa = dixa+(nChuanCiAttack+nChuanCiDenfense)*6;       
		return dixa
	end
	---------------------------------------------------------------------------------
	--
	-- ��ʾ����
	--
	function SelfEquip_ShowVigor()
		--
		
		local iVigor = Player:GetData("VIGOR");
		local iVigorMax = Player:GetData("MAXVIGOR");
		local VigorText = tostring(iVigor).."/"..tostring(iVigorMax);
		SelfEquip_Vigor:SetText( VigorText );
		
	end
	
	---------------------------------------------------------------------------------
	--
	-- ��ʾ����
	--
	function SelfEquip_ShowEnergy()
		--
		
		local iEnergy 	 = Player:GetData("ENERGY");
		local iEnergyMax = Player:GetData("MAXENERGY");
		local EnergyText = tostring(iEnergy).."/"..tostring(iEnergyMax);
		SelfEquip_Energy:SetText(EnergyText);
		
		
	end
	
	
	----------------------------------------------------------------------------------------
	--
	-- �رս���
	--
	
	function SelfEquip_CloseUI()
		-- �򿪻��߹رճƺŽ���
		CloseTitleList();
		SelfEquip_FakeObject:SetFakeObject("");
		SelfEquip_CloseFunction();
		
		g_NeedTipID = -1
	end
	
	
	function Pet_Page_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		TogglePetPage();
		SelfEquip_SetTabColor(0);
	end
	
	--���Լ�������ҳ��
	function Pet_Page_SelfData()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		SystemSetup:OpenPrivatePage("self");
		
	end
	
	function SelfEquip_SetTabColor(idx)
		if (idx == nil or idx < 0 or idx > 5) then
			return;
		end
		
		local i = 0;
		local selColor = "#Y";
		local noselColor = "";
		local tab = {
		[0] = SelfEquip_SelfEquip,
		SelfEquip_SelfData,
		SelfEquip_Pet,
		SelfEquip_Ride,
		SelfEquip_JingMai,
		SelfEquip_OtherInfo,
		};
		
		while i < 6 do
			if (i == idx) then
				tab[i]:SetText(selColor..SELFEQUIP_TAB_TEXT[i]);
			else
				tab[i]:SetText(noselColor..SELFEQUIP_TAB_TEXT[i]);
			end
			i = i + 1;
		end
	end
	
	function XiuLian_Page_Switchh()
		local nLevel = Player:GetData("LEVEL")
		
		if (nLevel >= 70) then
			Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
			SelfEquip_CloseUI()
			OpenShenDingPage(8)
		end
	end
	
	function Other_JingMai_Page_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		this:Hide()
		OpenShenDingPage(13)
	end
	
	
	function Other_ShenDing_Page_Switch() --��ľ����
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		this:Hide()
		OpenShenDingPage(4)
		SelfEquip_SetTabColor(0);
	end
	
	function Other_JunXian_Page_Switch() --��ӡ
		-- �ȼ�����
		if ( Player:GetData( "LEVEL" ) < 85 ) then
			PushDebugMessage( "#{JXJW_140822_20}" );
			return
		end
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		this:Hide()
		OpenShenDingPage(9)
		
	end
	
	function SelfEquip_OpenBaoJian() --����
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenShenDingPage(11)
		this:Hide()
		SelfEquip_SetTabColor(0)
	end
	function SelfEquip_ZhenYuan_Page_Switch()  --��Ԫ
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		this:Hide()
		OpenShenDingPage(7)
		
	end
	
	function SelfEquip_Miji_Page_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		this:Hide()
		OpenShenDingPage(12)
	end
	
	function Ride_Page_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenRidePage();
		SelfEquip_SetTabColor(0);
		
		if (g_CurActFlashType == 4) then
			PushEvent("OPEN_FRESHMAN_NEWNPCCHAT",4)
		end
	end
	
	function Other_Info_Page_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OtherInfoPage();
		UpdateDoubleExpData();
		
	end
	
	function SelfEquip_UpdateMask()
		
		local i
		for i=0,20 do
			if i ~= 9 and i ~=10 and i~= 8 and i ~= 16 and i~= 18 then   --8:��� 9:���� 10:���� 18:���
				SelfEquip_UpdateMaskByIndex( i );
			end
		end
	end
	function SelfEquip_UpdateMaskByIndex( index ) --���
		
		--	g_EquipMask[ index ]:Show();
		
		g_EquipMask[ index ]:Hide();
		
	end
function SelfEquip_UpdateZhiZunAnimate()
local g_ZhuangBei = {ActionWeapon,ActionCap,ActionArmor,ActionWrist,ActionBoot,ActionSash,ActionRing,ActionNecklace,ActionRing_2,ActionCharm,ActionCharm_2,ActionCuff,ActionShoulder,}
--˳��Ϊ ������ñ�ӡ��·�������Ь�ӡ���������ָ����������ָ2������1������2�����ס�����
	---*****����
 local  zhi = DataPool:GetPlayerMission_DataRound(431) --����
 local zhia = DataPool:GetPlayerMission_DataRound(430)
 ---local  Equip_g_EquipID = (zhi*10000000) + zhia  ��Ե������ж���ֱ�ӷֿ�д��
  
local ZhiZhunBj = {
math.floor(zhi/1000000),
math.mod(math.floor(zhi/100000),10),
math.mod(math.floor(zhi/10000),10),
math.mod(math.floor(zhi/1000),10),
math.mod(math.floor(zhi/100),10),
math.mod(math.floor(zhi/10),10),
math.mod(zhi,10),
math.mod(math.floor(zhia/100000),10),
math.mod(math.floor(zhia/10000),10),
math.mod(math.floor(zhia/1000),10),
math.mod(math.floor(zhia/100),10),
math.mod(math.floor(zhia/10),10),
math.mod(zhia,10),
}

	for i = 1, 13 do
	if g_ZhuangBei[i] ~= nil then
	if g_ZhuangBei[i]:GetDefineID() ~= -1 and ZhiZhunBj[i] == 2 then
	m_ZhiZunAnimate[i]:Show()
	m_ZhiZunAnimate[i]:SetProperty("Animate" , "ZhiZun_Flash_Big")
	elseif g_ZhuangBei[i]:GetDefineID() ~= -1 and ZhiZhunBj[i] == 3 then
	m_ZhiZunAnimate[i]:Show()
	m_ZhiZunAnimate[i]:SetProperty("Animate" , "JunXian_Flash3")	
	elseif g_ZhuangBei[i]:GetDefineID() == -1 or ZhiZhunBj[i] <= 1 then
	m_ZhiZunAnimate[i]:Hide()
	end		
    end	
    end
	end
	
	
	function SelfEquip_OpenBlog()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		local strCharName =  Player:GetName();
		local strAccount =  Player:GetData("ACCOUNTNAME")
		Blog:OpenBlogPage(strAccount,strCharName,true);
	end
	
	
	function SelfEquip_Open()
		g_AutoClick_Going = -1
		g_AutoClick_BtnFlag = -1
		SetTimer("SelfEquip", "SelfEquip_AutoClick_Timer()", g_AutoClickTimer_Step)
		
		nChuanCiAttack=DataPool:GetPlayerMission_DataRound(500) + math.floor(DataPool:GetPlayerMission_DataRound(509)/10000)*3 --����
		nChuanCiDenfense=DataPool:GetPlayerMission_DataRound(501) + math.mod(DataPool:GetPlayerMission_DataRound(509),10000)*3 --����
		WW_lw1=DataPool:GetPlayerMission_DataRound(502) --���Ƽ���
		WW_lw2=DataPool:GetPlayerMission_DataRound(503) --���Ƽ���
		WW_lw3=DataPool:GetPlayerMission_DataRound(504) --���Ƽ���
		WW_lw4=DataPool:GetPlayerMission_DataRound(505) --���Ƽ���
		
		this:Show();
	end
	
	function SelfEquip_CloseFunction()
		g_AutoClick_Going = -1
		g_AutoClick_BtnFlag = -1
		KillTimer("SelfEquip_AutoClick_Timer()")
		KillTimer("SelfEquip_FirstWeaponGuide()")
		g_CurActFlashType = 0
		
		nChuanCiAttack=DataPool:GetPlayerMission_DataRound(500) + math.floor(DataPool:GetPlayerMission_DataRound(509)/10000)*3 --����
		nChuanCiDenfense=DataPool:GetPlayerMission_DataRound(501) + math.mod(DataPool:GetPlayerMission_DataRound(509),10000)*3 --����
		WW_lw1=DataPool:GetPlayerMission_DataRound(502) --���Ƽ���
		WW_lw2=DataPool:GetPlayerMission_DataRound(503) --���Ƽ���
		WW_lw3=DataPool:GetPlayerMission_DataRound(504) --���Ƽ���
		WW_lw4=DataPool:GetPlayerMission_DataRound(505) --���Ƽ���
		
		this:Hide();
	end
	
	
	function SelfEquip_AskLevelup()   --?
		local PlayerLevel = Player:GetData( "LEVEL" )
		local EvaluateLevelList = { 30, 45, 65, 75, 85 }
		
		local strMasterName = GetMasterName()
		
		if "" ~= strMasterName then   --�մ���ʾ�ں����б���û���ҵ�ʦ������,��û��ʦ��
			local ListSize = table.getn( EvaluateLevelList )
			for i = 1, ListSize do
				if EvaluateLevelList[ i ] == ( PlayerLevel+1 ) and PlayerLevel < 45 then
					--�����۽���
					
					AskEvaluateAndLevelup()
					return
				end
			end
		end
		
		AskLevelUp( tonumber(0) )
	end
	
	--��ʾ���UI
	function SelfEquip_Wuhun_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenShenDingPage(1002)
		this:Hide()
		SelfEquip_SetTabColor(0);
	end
	
	function SelfEquip_ShowTooltip(Subject)
		if (g_PropertyTable[Subject] ~= nil) then
			if g_PropertyTable[Subject]:GetText() == "" then
				g_PropertyTable[Subject]:SetToolTip("")
			else
				if (g_XiulianTipTable[Subject] ~= nil) then
					g_PropertyTable[Subject]:SetToolTip( g_XiulianTipTable[Subject] )
				end
			end
		end
	end
	
	-- ���������ɫ��ʣ�����Ե���Ѿ���������Ե�
	function SelfEquip_ResetCharRemainPoint()
		g_AddStr = 0;					-- �����������ϵ�ʣ�����.
		g_AddSpr = 0;					-- �����������ϵ�ʣ�����.
		g_AddCon = 0;					-- �����������ϵ�ʣ�����.
		g_AddInt = 0;					-- �����ڶ����ϵ�ʣ�����.
		g_AddDex = 0;					-- ���������ϵ�ʣ�����.
		
		-- �������Ե�����Ӻͼ��ٲ���
		DisablePointAddButtion();
		DisablePointDecButtion();
		
		-- ��ȡʣ�����Ե�
		local nNumber 		= Player:GetData("POINT_REMAIN");
		g_CurRemainPoint 	= nNumber;
		g_RemainPoint   	= nNumber;
		
		-- ������ʾ
		ShowCurStr();
		ShowCurSpr();
		ShowCurCon();
		ShowCurInt();
		ShowCurDex();
		ShowCurRemainPoint();
		
		if (g_CurRemainPoint > 0) then
			EanblePointAddButtion();
		end
		
		-- �����ֶ����ڵ�����ť��״̬.
		SetAcceptButtonState();
	end
	
	--***************************************************
	-- �����곤�����
	--***************************************************
	function SelfEquip_AutoClick_Clear(id)
		id = tonumber(id)
		if (id == g_AutoClick_BtnFlag) then
			g_AutoClick_BtnFlag = -1
		end
	end
	
	--***************************************************
	-- ��ʱ���ص�����
	--    ʵ��������, �Ժ���Կ��Ǽ���(��Ҫ�Բ���)
	--***************************************************
	function SelfEquip_AutoClick_Timer()
		if (g_AutoClick_BtnFlag ~= -1) then
			-- ��һ��LButton�󾭹�X��Timer���㿪ʼ, Ҳ����˵�� g_AutoClickTimer_Step * X ��ʱ��ʼ�����Զ���, ����Ϊ�˷�ֹ����Ҫ���һ�µĽ�����˺ö���
			if (g_AutoClick_Going < 4) then
				g_AutoClick_Going = g_AutoClick_Going + 1
				--Ŀǰ������ 6 Step �ĵȴ�ʱ��, ����ע�͵Ĵ�����Ժ�������ʵ��������, �𽥼���Ч��.
				--if (g_AutoClick_Going == 2 or g_AutoClick_Going == 5) then
				--g_AutoClick_FunList[g_AutoClick_BtnFlag]()
				--end
			else
				g_AutoClick_FunList[g_AutoClick_BtnFlag]()
			end
		end
	end
	
	--***************************************************
	-- �������ɿ�����
	--    ע��������ʵ�Ǵ��� Click, ������Ҫִ��һ�� Click ����
	--***************************************************
	function SelfEquip_AutoClick_LButtonUp(id)
		id = tonumber(id)
		SelfEquip_AutoClick_Clear(id)
		g_AutoClick_FunList[id]()
	end
	
	--***************************************************
	-- ���ö�ʱ��
	--    ���ñ��˵������Ѿ�����
	--***************************************************
	function SelfEquip_AutoClick_SetTimer(id)
		id = tonumber(id)
		g_AutoClick_Going = -1
		g_AutoClick_BtnFlag = id
	end
	
	--***************************************************
	-- �ָ������Ĭ�����λ��
	--***************************************************
	function SelfEquip_Frame_On_ResetPos()
		SelfEquip_Frame:SetProperty("UnifiedXPosition", g_SelfEquip_Frame_UnifiedXPosition);
		SelfEquip_Frame:SetProperty("UnifiedYPosition", g_SelfEquip_Frame_UnifiedYPosition);
	end
	
	--!!!reloadscript =SelfEquip
	function SelfEquip_FreshManGuide(nType, nTextID, nPosID) --?+
		
	end
	
	--	��ʼ����ָ������������ֱ���ǿӵ������
	function SelfEquip_FirstWeaponGuide()
		Equip_RefreshEquip()
		g_WEAPON:SetProperty("FlashAnimateEnable", 0)
		
		KillTimer("SelfEquip_FirstWeaponGuide()")
		--SelfEquip_11:SetActionFlash(0)
	end
	
	--2011Q3��������uiָ��
	function SelfEquip_OnShown()
		
	end
	function SelfEquip_OnMoved()
		
	end
	
	
	function SelfEquip_BaoShiCheck_Clicked( btnIndex )
		if btnIndex < 0 or btnIndex > 17 then
			return
		end
		PushEvent( "GEM_CONTAINER_CHECK", btnIndex, 0 )
	end
	
	local g_SelfEuip_TypeList =
	{
	[1]  = { name="#{WBSS_120727_34}", gemConIndex=0,  equipIndex=0,  },    --- ����
	[2]  = { name="#{WBSS_120727_26}", gemConIndex=11, equipIndex=14, },    --- ����
	[3]  = { name="#{WBSS_120727_30}", gemConIndex=6,  equipIndex=6,  },    --- ��ָ���ϣ�
	[4]  = { name="#{WBSS_120727_31}", gemConIndex=8,  equipIndex=11, },    --- ��ָ���£�
	[5]  = { name="#{WBSS_120727_32}", gemConIndex=9,  equipIndex=12, },    --- �������ϣ�
	[6]  = { name="#{WBSS_120727_33}", gemConIndex=10, equipIndex=13, },    --- �������£�
	[7]  = { name="#{WBSS_120727_35}", gemConIndex=2,  equipIndex=2,  },    --- �·�
	[8]  = { name="#{WBSS_120727_24}", gemConIndex=1,  equipIndex=1,  },    --- ñ��
	[9]  = { name="#{WBSS_120727_25}", gemConIndex=12, equipIndex=15, },    --- ���
	[10] = { name="#{WBSS_120727_27}", gemConIndex=3,  equipIndex=3,  },    --- ����
	[11] = { name="#{WBSS_120727_28}", gemConIndex=5,  equipIndex=5,  },    --- ����
	[12] = { name="#{WBSS_120727_29}", gemConIndex=4,  equipIndex=4,  },    --- Ь��
	[13] = { name="#{WBSS_120727_36}", gemConIndex=7,  equipIndex=7,  },    --- ����
	[14] = { name="#{WBSS_120727_37}", gemConIndex=13, equipIndex=17, },    --- ����
	[15] = { name="#{WBSS_120727_39}", gemConIndex=15, equipIndex=19, },    --- ����
	[16] = { name="#{WBSS_120727_38}", gemConIndex=14, equipIndex=18, },    --- ���
	[17] = { name="��ʯ��˵", gemConIndex=16, equipIndex=20, },    --- ��ʯ��˵
	}
	
	--- TODO: ע��: ����һ�װ����ʱ��ҲҪ�޸�����ط�����ʾ
	function SelfEquip_UpdateGemContainer( )
		--- �����δѧ����������ʱ��װ��λ��ʯ�鿴��ťΪ��̬
		local gemSwitchSkillID = 278
		
		
		if ( Player:GetSkillInfo( gemSwitchSkillID, "learn") ) then
		else
			for i = 1, g_SelfEquip_Gem_Contain_Num do
				
				g_SelfEquip_Gem_Check_Buttons_green[i] : Show()--Hide()
				g_SelfEquip_Gem_Check_Buttons_red[i]   : Hide()
				g_SelfEquip_Gem_Check_Buttons_BK[i]    : Hide()--Show()
				
			end
			return
		end
		
		local ret = 0
		for i = 1, g_SelfEquip_Gem_Contain_Num do
			g_SelfEquip_Gem_Check_Buttons_BK[i]    : Hide()
			ret = SelfEquip_Can_SwitchGem( i )
			if ret == 1 then
				--- ����̬�����ѧ������������װ��λ�ϴ���װ��������װ��λ�ϵı�ʯ�����Խ��л���ʱ
				g_SelfEquip_Gem_Check_Buttons_green[i] : Enable()
				g_SelfEquip_Gem_Check_Buttons_green[i] : Show()
				g_SelfEquip_Gem_Check_Buttons_green[i] : SetToolTip( "#{WBSS_120727_44}" )
				g_SelfEquip_Gem_Check_Buttons_red[i]   : Hide()
			else
				--- �쳣̬�����ѧ������������װ��λ�ϲ�����װ���������װ��λ�ϵı�ʯ�����Խ��л���ʱ
				g_SelfEquip_Gem_Check_Buttons_red[i]   : Enable()
				g_SelfEquip_Gem_Check_Buttons_red[i]   : Show()
				g_SelfEquip_Gem_Check_Buttons_red[i]   : SetToolTip( "#{WBSS_120727_44}" )
				g_SelfEquip_Gem_Check_Buttons_green[i] : Hide()
			end
		end
	end
	
	function SelfEquip_Can_SwitchGem( curSel )
		
		if curSel == 16 then
			curSel = 17
		end
		local conPos     = g_SelfEuip_TypeList[curSel].gemConIndex
		local equipPoint = g_SelfEuip_TypeList[curSel].equipIndex
		
		--- �õ�װ���ϵı�ʯ
		local equipTypeList = {}
		local isHaveEquip, gemIndex1, gemIndex2, gemIndex3, gemIndex4 = LifeAbility : SplitWearedEquipGem( equipPoint )
		local gemIndexList  = {}
		gemIndexList[1] = gemIndex1
		gemIndexList[2] = gemIndex2
		gemIndexList[3] = gemIndex3
		gemIndexList[4] = gemIndex4
		if isHaveEquip == 1 then
			for i = 1, 4 do
				if gemIndexList[i] > 0 then
					equipTypeList[i] = SelfEquip_GetGemTypeByIndex( gemIndexList[i] )
				else
					equipTypeList[i] = -1
				end
			end
		else
			--- û��װ��
			return 0
		end
		
		--- ��εõ�װ��λ�ϵı�ʯ����
		local gemConTypeList  = { }
		local bHaveGemCon     = 0       --- װ��λ���Ƿ��б�ʯ
		LifeAbility : GemContainer_Update()
		for i = 1, 4 do
			local nItemID, tmpGemType
			nItemID, _, tmpGemType = LifeAbility : GetGemContainer_Gem( conPos, i - 1 )
			if nItemID ~= -1 then
				gemConTypeList[i] = tmpGemType
				bHaveGemCon       = 1
			else
				gemConTypeList[i] = -1
			end
		end
		if bHaveGemCon == 0 then
			return 0
		end
		
		--- �ж�װ��λ�ϵ����б�ʯ��Ӧ�ĵ�ǰװ���ϵĿ�λ�Ƿ񶼴��ڱ�ʯ
		for i = 1, 4 do
			--- ���װ��λ���б�ʯ
			if gemConTypeList[i] > 0 then
				-- �ж�װ��λ�ϵ����б�ʯ��Ӧ�ĵ�ǰװ���ϵĿ�λ�Ƿ񶼴��ڱ�ʯ
				if equipTypeList[i] <= 0 then
					return 0
				end
				equipTypeList[i] = gemConTypeList[i]
			end
		end
		
		--- �жϻ����󣬵�ǰװ��ǰ�����Ƿ�����ͬ���ͱ�ʯ
		if equipTypeList[1] > 0 then
			if ( equipTypeList[1] == equipTypeList[2] ) or ( equipTypeList[1] == equipTypeList[3] ) then
				return 0
			end
		end
		
		if equipTypeList[2] > 0 then
			if ( equipTypeList[1] == equipTypeList[2] ) or ( equipTypeList[2] == equipTypeList[3] ) then
				return 0
			end
		end
		
		if equipTypeList[3] > 0 then
			if ( equipTypeList[1] == equipTypeList[3] ) or ( equipTypeList[2] == equipTypeList[3] ) then
				return 0
			end
		end
		
		return 1
	end
	
	--- ������Ʒ���к��������Ʒ������
	function SelfEquip_GetGemTypeByIndex( itemTblIdx )
		if itemTblIdx == nil or itemTblIdx <= 0 then
			return -1
		end
		
		local tmpValue = math.mod( itemTblIdx, 100000 )
		local itemType = math.floor( tmpValue / 1000 )
		return itemType
	end
	
	
	
	--��ʾ����UI
	function SelfEquip_Infant_Switch()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenShenDingPage(14)
		this:Hide()
		SelfEquip_SetTabColor(0)
	end
	
	--��ʾ����UI
	function SelfEquip_OpenWuYi()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenShenDingPage(15)
		this:Hide()
		SelfEquip_SetTabColor(0)
	end
	
	--��ʾ���UI
	function SelfEquip_OpenShenQi()
		Variable:SetVariable("SelfUnionPos", SelfEquip_Frame:GetProperty("UnifiedPosition"), 1);
		OpenShenDingPage(16)
		this:Hide()
		SelfEquip_SetTabColor(0)
	end
	
	
	--2014:yuanpeilong:EquipScoreConduct:start
	function SelfEquip_FightScore_Clicked()--��ͷ
		if Player:GetData( "LEVEL" )>= 330 then
			PushEvent("OPEN_EQUIP_SCORE_CONDUCT")
		else
			PushDebugMessage("#{PFZY_140613_174}")
		end
	end
	
	
	function SelfEquip_EnchanceSetAttr_MouseEnter()  --����
		
		local SetX= SelfEquip_Effect:GetProperty("AbsoluteXPosition") + SelfEquip_FakeObject_Frame:GetProperty("AbsoluteXPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteXPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteXPosition")+SelfEquip_Frame:GetProperty("AbsoluteXPosition")
		local SetY = SelfEquip_Effect:GetProperty("AbsoluteYPosition")  + SelfEquip_FakeObject_Frame:GetProperty("AbsoluteYPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteYPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteYPosition")+SelfEquip_Frame:GetProperty("AbsoluteYPosition")
		local SetWidth = SelfEquip_Effect:GetProperty("AbsoluteWidth")
		local SetHeight = SelfEquip_Effect:GetProperty("AbsoluteHeight")
		PushEvent("OPEN_ENCHANCESET", SetX,SetY,SetWidth,SetHeight)
		
	end
	
	function SelfEquip_EnchanceSetAttr_MouseLeave()
		PushEvent("CLOSE_ENCHANCESET")
	end
	
	function SelfEquip_Refresh_Page_Button( nLevel)
		
		--��
		if ( nLevel < 15 ) then
			SelfEquip_ShenDing:Disable()
			SelfEquip_ShenDing_tips:Show()
		else
			SelfEquip_ShenDing:Enable()
			SelfEquip_ShenDing_tips:Hide()
		end
		
		--���
		SelfEquip_Wuhun:Enable()
		SelfEquip_Wuhun_tips:Hide()
		
		--����
		if ( nLevel < 70 ) then
			SelfEquip_Xiulian:Disable()
			SelfEquip_Xiulian_tips:Show()
			SelfEquip_Xiulian_tips:SetToolTip("#{RWYQ_150707_03}")
		else
			SelfEquip_Xiulian:Enable()
			SelfEquip_Xiulian_tips:Hide()
		end
		--�ؼ�
		if ( nLevel < 75 )  then
			SelfEquip_Miji:Disable()
			SelfEquip_Miji_tips:Show()
			SelfEquip_Miji_tips:SetToolTip("#{RWYQ_150707_04}")
		else
			SelfEquip_Miji:Enable()
			SelfEquip_Miji_tips:Hide()
		end
		--��Ԫ
		local ret=1--DataPool:Lua_IsMissionHaveDone(574)
		if ( nLevel < 80 ) or ret==0 then
			SelfEquip_ZhenYuan:Disable()
			SelfEquip_ZhenYuan_tips:Show()
			SelfEquip_ZhenYuan_tips:SetToolTip("#{RWYQ_150707_05}")
		else
			SelfEquip_ZhenYuan:Enable()
			SelfEquip_ZhenYuan_tips:Hide()
		end
		--��ӡ
		if ( nLevel < 85 ) then
			SelfEquip_JunXian:Disable()
			SelfEquip_JunXian_tips:Show()
			--	SelfEquip_JunXian_tips:SetToolTip("#{RWYQ_150707_08}")
		else
			SelfEquip_JunXian:Enable()
			SelfEquip_JunXian_tips:Hide()
		end
		--����
		if ( nLevel < 90 ) then
			SelfEquip_JingMai:Disable()
			SelfEquip_JingMai_tips:Show()
			SelfEquip_JingMai_tips:SetToolTip("#{RWYQ_150707_06}")
		else
			SelfEquip_JingMai:Enable()
			SelfEquip_JingMai_tips:Hide()
		end
		
		if ( nLevel < 85 ) then
			SelfEquip_BaoJian:Disable()
			SelfEquip_BaoJian_tips:Show()
		else
			SelfEquip_BaoJian:Enable()
			SelfEquip_BaoJian_tips:Hide()
		end
		
	end
	
	
	function SelfEquip_ZhiZunEquipSet_MouseEnter()
		
	end
	
	function SelfEquip_ZhiZunEquipSet_MouseLeave()
		--	PushEvent("SELF_ZHIZUN_EQUIPSET_TIP_CLOSE")
	end
	
	function SelfEquip_ZhiZunEquipSet_MouseClick()
		
	end
	function SelfEquip_UpdateFiveElementsTip()
		
	end
	function SelfEquip_DecoWeaponDisPlay() --����
		
	end
	
	function ReBuff()
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("AHa_ReMyBuff")
		Set_XSCRIPT_ScriptID(892002)
		Set_XSCRIPT_ParamCount(0)
		Send_XSCRIPT();
		KillTimer("ReBuff()");
	end
function SelfEquip_DuanWei()
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GetGiftsForUI")
		Set_XSCRIPT_ScriptID(890096)
		Set_XSCRIPT_Parameter(0,8787)
		Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT();	

end
function SelfEquip_EnchanceSetAttr_MouseEnter()

	--if SystemSetup:IsClassic() == 1 then
		local SetX= SelfEquip_Effect:GetProperty("AbsoluteXPosition") + SelfEquip_FakeObject_Frame:GetProperty("AbsoluteXPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteXPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteXPosition")+SelfEquip_Frame:GetProperty("AbsoluteXPosition")
		local SetY = SelfEquip_Effect:GetProperty("AbsoluteYPosition")  + SelfEquip_FakeObject_Frame:GetProperty("AbsoluteYPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteYPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteYPosition")+SelfEquip_Frame:GetProperty("AbsoluteYPosition")
		local SetWidth = SelfEquip_Effect:GetProperty("AbsoluteWidth")
		local SetHeight = SelfEquip_Effect:GetProperty("AbsoluteHeight")
		 PushEvent("UI_COMMAND",20190321111, SetX,SetY,SetWidth,SetHeight)
	--else
		--local SetX= SelfEquip_Effect:GetProperty("AbsoluteXPosition") + SelfEquip_Effect_BK:GetProperty("AbsoluteXPosition")+SelfEquip_FakeObject_Frame:GetProperty("AbsoluteXPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteXPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteXPosition") +SelfEquip_Frame:GetProperty("AbsoluteXPosition")
		--local SetY = SelfEquip_Effect:GetProperty("AbsoluteYPosition")  + SelfEquip_Effect_BK:GetProperty("AbsoluteYPosition")+SelfEquip_FakeObject_Frame:GetProperty("AbsoluteYPosition")+SelfEquip_Frame_Client:GetProperty("AbsoluteYPosition")+SelfEquip_MainFrame:GetProperty("AbsoluteYPosition") +SelfEquip_Frame:GetProperty("AbsoluteXPosition")
		--local SetWidth = SelfEquip_Effect:GetProperty("AbsoluteWidth")
		--local SetHeight = SelfEquip_Effect:GetProperty("AbsoluteHeight")
		--PushEvent("OPEN_ENCHANCESET", SetX,SetY,SetWidth,SetHeight)
	--end

end

function SelfEquip_EnchanceSetAttr_MouseLeave()
	PushEvent("UI_COMMAND",20190321112)
end	
	function SelfEquip_OnYirong()
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GetGiftsForUI");
		Set_XSCRIPT_ScriptID(890096);
		Set_XSCRIPT_Parameter(0,38);
		Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
	end
	
	function AddXiuLianColor(num)
		local str="";
		if num <20 then
			str="#W"
		elseif num>=20 and num<40 then
			str="#G"
		elseif num>=40 and num<60 then
			str="#c0000FF"
		elseif num>=60 and num<80 then
			str="#ccc33cc"
		elseif num>=80 and num<100 then
			str="#cff6633"
		elseif num>=100 then
			str="#cFF0000"
		end
		return str;
	end
	