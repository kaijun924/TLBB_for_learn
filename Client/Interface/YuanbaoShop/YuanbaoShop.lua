local GOODS_BUTTONS_JiYuan_NUM = 6;
local GOODS_JiYuan_BUTTONS = {};
local GOODS_JiYuan_BUTTONS_Buy = {};
local GOODS_JiYuan_BUTTONS_ICON = {};
local GOODS_JiYuan_BUTTONS_RED = {};
local GOODS_JiYuan_DESCS = {};
local GOODS_JiYuan_BAD    = {};
local vipa = 0
local mypoint = 0
local GOODS_BUTTONSRECENTLY_NUM = 5;
local GOODSRECENTLY_BUTTONS = {};
local GOODSRECENTLY_DESCS = {};
local GOODSRECENTLY_BAD    = {};
local GOODS_BUTTONS_vip = {}
local GOODS_BUTTONS_NUM = 18;
local GOODS_BUTTONS = {};
local GOODS_DESCS = {};
local GOOD_BAD    = {};
local LAST_FENYE = 0;
local LAST_TAG   = 1;
local LAST_SHOP  = 1;
local straauua =""
--��ǩҳ����ֵ
local ShopTabIdx = {
	YuanBao 	= 0,	--Ԫ���̵�
	Bind		= 1,	--��Ԫ���̵�
	GiftToken	= 2,	--��ȯ�̵�
	IMDress		= 3,
	VipShop		= 4,
	Lijin     = 5,  --ͨ���̵�
}

local SHOP_LIST_A = {};
local SHOP_LIST_B = {};
local SHOP_SEARCH_LIST ={};

local SHOP_LIST_A_BIND = {};
local SHOP_LIST_B_BIND = {};
local SHOP_SEARCH_LIST_BIND ={};

local SHOP_LIST_A_GIFTTOKEN = {};		--���������µ�һ���˵� �� ������ ��ʯ�̳ǵ�
local SHOP_LIST_B_GIFTTOKEN = {};		--���������µĶ����˵� �� ��Ʒ�ϼ� ��
local SHOP_SEARCH_LIST_GIFTTOKEN ={};		--�����˵�

local SHOP_LIST_A_VIP = {};
local SHOP_LIST_B_VIP = {};
local SHOP_SEARCH_LIST_VIP ={};
local g_nDistanceBBtnY = 0;

local SHOP_LIST_A_LIJIN = {};		--ͨ��Ų������
local SHOP_LIST_B_LIJIN = {};
local SHOP_SEARCH_LIST_LIJIN ={};

local ab = {}
local red = {}
local jiyuanmibao = {20310185,20310186,20310187,20310189,20310190,
                     20501005,20502005,38001111,38001099,31001469,
                     38000398,38000401,38000947,38000952,38000438,
                     38000439,38000440,38000441,38000442,38000443,					 
                     50921109,50921209,50921309,50921409,50921409,					 
                     20310203,20310204,20309103,20309104,20309105,
                     20310128,20310137,20310146,20310155,20310159,
                     38002015,38000531,38000529,38001454,38001100}

local jiyuanmibaobuy = {7000,7000,7000,7000,7000,
                        3000,3000,13000,1200,1100,
                        630,1200,8000,28000,8000,
                        8000,8000,8000,8000,8000,			
                        21000,21000,21000,21000,21000,
                        600,900,900,3500,21000,
                        53000,53000,53000,53000,70,
                        400,1800,400,600,1200}

local nPageNum = 1;
local maxPage = 1;
local objCared = -1;
local lastA = 0
local lastB = 0
local lastA_Bind = 0
local lastB_Bind = 0
local lastSelect = 0
local lastSelect_Bind = 0

local lastA_GiftToken = 0
local lastB_GiftToken = 0
local lastSelect_GiftToken = 0

local lastA_VIP = 0
local lastB_VIP = 0

local lastA_Lijin = 0  --ͨ��
local lastB_Lijin = 0

local maxChildShop = 8
local isCareObj = 0

--�洢������������ֵ
local	g_tOrderPool	= {};
--��ǰ�̵����Ʒ����
local	g_nTotalNum		= 0;

local	g_changeTabFlag	= 0;
local	g_tabIndex	= 0;		-- 0��ʾԪ�� --1��ʾ��Ԫ��
local	g_jumpToShopTabIndex = 0;--����װ�̵�ת���������̵�ʱ�����������¼ת�����ĸ��̵�

local g_YuanbaoShop_Frame_UnifiedXPosition = 0;
local g_YuanbaoShop_Frame_UnifiedYPosition = 0;
local g_IsEnableFanQuanShop = 1 --�رշ�ȯ�̵깦�ܵĿ��أ���YuanBaoShop��XuanShop��������������أ����뱣��һ��

local g_PlayCard_Image = {
	[1] = "set:adpic1 image:adpic1_1",
	[2] = "set:adpic1 image:adpic1_2",
	[3] = "set:adpic2 image:adpic2_1",
	[4] = "set:adpic2 image:adpic2_2",
}
local g_PlayCard_CtlButton = {}
local g_PlayCard_URL = {
	[1] = "WEB_YBSDGUANGGAO_1", --"WEB_GUANWANG" ,
	[2] = "WEB_YBSDGUANGGAO_2", --"WEB_LUNTAN",
	[3] = "WEB_YBSDGUANGGAO_3", --"WEB_JIANYI",
	[4] = "WEB_YBSDGUANGGAO_4", --"WEB_VIPJIESHAO",
}
local g_PlayCard_CurPage = 0
local g_PlayCard_MaxPage = 4

function YuanbaoShop_PreLoad()

	this:RegisterEvent("OPEN_YUANBAOSHOP");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("UPDATE_BOOTH");
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("CLOSE_BOOTH");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	this:RegisterEvent("TOGGLE_YUANBAOSHOP");
	this:RegisterEvent("UPDATE_YUANBAO");
	this:RegisterEvent("UPDATE_BIND_YUANBAO");
	this:RegisterEvent("UPDATE_GIFTTOKEN");
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
	this:RegisterEvent("GAMELOGIN_OPEN_SELECT_CHARACTOR")
	this:RegisterEvent("OPEN_YUANBAOSHOP_RECENTLY")
	this:RegisterEvent("OPEN_JIYUAN_BOOTH")
	this:RegisterEvent("UPDATE_VIP_INFO")

	this:RegisterEvent("OPEN_LIJINSHOP")  --ͨ��
	this:RegisterEvent("UPDATE_LIJIN")
	this:RegisterEvent("FAKE_SWTICH_YUANBAO_SHOP")

	if 0 == 0 then	--���ͻ�����Ψ���棬����������ͼ����ԴΪΨ�����Ӧ����Դ
		IconTable = {
			["H"] = "set:WM_CommonFrame1 image:Re",
			["S"] = "set:WM_CommonFrame1 image:Te",
			["A"] = "set:WM_CommonFrame1 image:Huo",
			["D"] = "set:WM_CommonFrame1 image:Zhe",
			["N"] = "set:WM_CommonFrame1 image:Xin",
			["L"] = "set:WM_CommonFrame1 image:Xian",
		}
	end

end

function YuanbaoShop_OnLoad()

        GOODS_BUTTONS_vip[1]=YuanbaoShop_Button01_VIP
        GOODS_BUTTONS_vip[2]=YuanbaoShop_Button02_VIP
        GOODS_BUTTONS_vip[3]=YuanbaoShop_Button03_VIP
        GOODS_BUTTONS_vip[4]=YuanbaoShop_Button04_VIP
        GOODS_BUTTONS_vip[5]=YuanbaoShop_Button05_VIP
        GOODS_BUTTONS_vip[6]=YuanbaoShop_Button06_VIP

	GOODS_JiYuan_BUTTONS[1] = YuanbaoShop_ExItem1;
	GOODS_JiYuan_BUTTONS[2] = YuanbaoShop_ExItem2;
	GOODS_JiYuan_BUTTONS[3] = YuanbaoShop_ExItem3;
	GOODS_JiYuan_BUTTONS[4] = YuanbaoShop_ExItem4;
	GOODS_JiYuan_BUTTONS[5] = YuanbaoShop_ExItem5;
	GOODS_JiYuan_BUTTONS[6] = YuanbaoShop_ExItem6;

	GOODS_JiYuan_BUTTONS_Buy[1] = YuanbaoShop_ExItemInfo1_Buy
	GOODS_JiYuan_BUTTONS_Buy[2] = YuanbaoShop_ExItemInfo2_Buy
	GOODS_JiYuan_BUTTONS_Buy[3] = YuanbaoShop_ExItemInfo3_Buy
	GOODS_JiYuan_BUTTONS_Buy[4] = YuanbaoShop_ExItemInfo4_Buy
	GOODS_JiYuan_BUTTONS_Buy[5] = YuanbaoShop_ExItemInfo5_Buy
	GOODS_JiYuan_BUTTONS_Buy[6] = YuanbaoShop_ExItemInfo6_Buy

	GOODS_JiYuan_BUTTONS_ICON[1] = YuanbaoShop_ExItemIcon_1
	GOODS_JiYuan_BUTTONS_ICON[2] = YuanbaoShop_ExItemIcon_2
	GOODS_JiYuan_BUTTONS_ICON[3] = YuanbaoShop_ExItemIcon_3
	GOODS_JiYuan_BUTTONS_ICON[4] = YuanbaoShop_ExItemIcon_4
	GOODS_JiYuan_BUTTONS_ICON[5] = YuanbaoShop_ExItemIcon_5
	GOODS_JiYuan_BUTTONS_ICON[6] = YuanbaoShop_ExItemIcon_6

	GOODS_JiYuan_BUTTONS_RED[1] = YuanbaoShop_ExItemIcon_1_Red
	GOODS_JiYuan_BUTTONS_RED[2] = YuanbaoShop_ExItemIcon_2_Red
	GOODS_JiYuan_BUTTONS_RED[3] = YuanbaoShop_ExItemIcon_3_Red
	GOODS_JiYuan_BUTTONS_RED[4] = YuanbaoShop_ExItemIcon_4_Red
	GOODS_JiYuan_BUTTONS_RED[5] = YuanbaoShop_ExItemIcon_5_Red
	GOODS_JiYuan_BUTTONS_RED[6] = YuanbaoShop_ExItemIcon_6_Red

	GOODS_JiYuan_DESCS[1] = YuanbaoShop_ExItemInfo1_Text;
	GOODS_JiYuan_DESCS[2] = YuanbaoShop_ExItemInfo2_Text;
	GOODS_JiYuan_DESCS[3] = YuanbaoShop_ExItemInfo3_Text;
	GOODS_JiYuan_DESCS[4] = YuanbaoShop_ExItemInfo4_Text;
	GOODS_JiYuan_DESCS[5] = YuanbaoShop_ExItemInfo5_Text;
	GOODS_JiYuan_DESCS[6] = YuanbaoShop_ExItemInfo6_Text;

	GOODS_JiYuan_BAD[1] = YuanbaoShop_ExItemInfo1_GB;
	GOODS_JiYuan_BAD[2] = YuanbaoShop_ExItemInfo2_GB;
	GOODS_JiYuan_BAD[3] = YuanbaoShop_ExItemInfo3_GB;
	GOODS_JiYuan_BAD[4] = YuanbaoShop_ExItemInfo4_GB;
	GOODS_JiYuan_BAD[5] = YuanbaoShop_ExItemInfo5_GB;
	GOODS_JiYuan_BAD[6] = YuanbaoShop_ExItemInfo6_GB;

	GOODS_BUTTONS[1] = YuanbaoShop_Item1;
	GOODS_BUTTONS[2] = YuanbaoShop_Item2;
	GOODS_BUTTONS[3] = YuanbaoShop_Item3;
	GOODS_BUTTONS[4] = YuanbaoShop_Item4;
	GOODS_BUTTONS[5] = YuanbaoShop_Item5;
	GOODS_BUTTONS[6] = YuanbaoShop_Item6;
	GOODS_BUTTONS[7] = YuanbaoShop_Item7;
	GOODS_BUTTONS[8] = YuanbaoShop_Item8;
	GOODS_BUTTONS[9] = YuanbaoShop_Item9;
	GOODS_BUTTONS[10]= YuanbaoShop_Item10;
	GOODS_BUTTONS[11]= YuanbaoShop_Item11;
	GOODS_BUTTONS[12]= YuanbaoShop_Item12;
	GOODS_BUTTONS[13]= YuanbaoShop_Item13;
	GOODS_BUTTONS[14]= YuanbaoShop_Item14;
	GOODS_BUTTONS[15]= YuanbaoShop_Item15;
	GOODS_BUTTONS[16]= YuanbaoShop_Item16;
	GOODS_BUTTONS[17]= YuanbaoShop_Item17;
	GOODS_BUTTONS[18]= YuanbaoShop_Item18;

	GOODS_BUTTONS_ICON[1] = YuanbaoShop_ItemIcon_1;
	GOODS_BUTTONS_ICON[2] = YuanbaoShop_ItemIcon_2;
	GOODS_BUTTONS_ICON[3] = YuanbaoShop_ItemIcon_3;
	GOODS_BUTTONS_ICON[4] = YuanbaoShop_ItemIcon_4;
	GOODS_BUTTONS_ICON[5] = YuanbaoShop_ItemIcon_5;
	GOODS_BUTTONS_ICON[6] = YuanbaoShop_ItemIcon_6;
	GOODS_BUTTONS_ICON[7] = YuanbaoShop_ItemIcon_7;
	GOODS_BUTTONS_ICON[8] = YuanbaoShop_ItemIcon_8;
	GOODS_BUTTONS_ICON[9] = YuanbaoShop_ItemIcon_9;
	GOODS_BUTTONS_ICON[10]= YuanbaoShop_ItemIcon_10;
	GOODS_BUTTONS_ICON[11]= YuanbaoShop_ItemIcon_11;
	GOODS_BUTTONS_ICON[12]= YuanbaoShop_ItemIcon_12;
	GOODS_BUTTONS_ICON[13]= YuanbaoShop_ItemIcon_13;
	GOODS_BUTTONS_ICON[14]= YuanbaoShop_ItemIcon_14;
	GOODS_BUTTONS_ICON[15]= YuanbaoShop_ItemIcon_15;
	GOODS_BUTTONS_ICON[16]= YuanbaoShop_ItemIcon_16;
	GOODS_BUTTONS_ICON[17]= YuanbaoShop_ItemIcon_17;
	GOODS_BUTTONS_ICON[18]= YuanbaoShop_ItemIcon_18;

	GOODSRECENTLY_BUTTONS[1] = YuanbaoShop_LastItem1;
	GOODSRECENTLY_BUTTONS[2] = YuanbaoShop_LastItem2;
	GOODSRECENTLY_BUTTONS[3] = YuanbaoShop_LastItem3;
	GOODSRECENTLY_BUTTONS[4] = YuanbaoShop_LastItem4;
	GOODSRECENTLY_BUTTONS[5] = YuanbaoShop_LastItem5;
	--GOODSRECENTLY_BUTTONS[6] = YuanbaoShop_LastItem6;

	GOODSRECENTLY_DESCS[1] = YuanbaoShop_LastItemInfo1_Text;
	GOODSRECENTLY_DESCS[2] = YuanbaoShop_LastItemInfo2_Text;
	GOODSRECENTLY_DESCS[3] = YuanbaoShop_LastItemInfo3_Text;
	GOODSRECENTLY_DESCS[4] = YuanbaoShop_LastItemInfo4_Text;
	GOODSRECENTLY_DESCS[5] = YuanbaoShop_LastItemInfo5_Text;
	--GOODSRECENTLY_DESCS[6] = YuanbaoShop_LastItemInfo6_Text;

	GOODSRECENTLY_BAD[1] = YuanbaoShop_LastItemInfo1_GB;
	GOODSRECENTLY_BAD[2] = YuanbaoShop_LastItemInfo2_GB;
	GOODSRECENTLY_BAD[3] = YuanbaoShop_LastItemInfo3_GB;
	GOODSRECENTLY_BAD[4] = YuanbaoShop_LastItemInfo4_GB;
	GOODSRECENTLY_BAD[5] = YuanbaoShop_LastItemInfo5_GB;
	--GOODSRECENTLY_BAD[6] = YuanbaoShop_LastItemInfo6_GB;

	GOODS_DESCS[1] = YuanbaoShop_ItemInfo1_Text;
	GOODS_DESCS[2] = YuanbaoShop_ItemInfo2_Text;
	GOODS_DESCS[3] = YuanbaoShop_ItemInfo3_Text;
	GOODS_DESCS[4] = YuanbaoShop_ItemInfo4_Text;
	GOODS_DESCS[5] = YuanbaoShop_ItemInfo5_Text;
	GOODS_DESCS[6] = YuanbaoShop_ItemInfo6_Text;
	GOODS_DESCS[7] = YuanbaoShop_ItemInfo7_Text;
	GOODS_DESCS[8] = YuanbaoShop_ItemInfo8_Text;
	GOODS_DESCS[9] = YuanbaoShop_ItemInfo9_Text;
	GOODS_DESCS[10]= YuanbaoShop_ItemInfo10_Text;
	GOODS_DESCS[11]= YuanbaoShop_ItemInfo11_Text;
	GOODS_DESCS[12]= YuanbaoShop_ItemInfo12_Text;
	GOODS_DESCS[13]= YuanbaoShop_ItemInfo13_Text;
	GOODS_DESCS[14]= YuanbaoShop_ItemInfo14_Text;
	GOODS_DESCS[15]= YuanbaoShop_ItemInfo15_Text;
	GOODS_DESCS[16]= YuanbaoShop_ItemInfo16_Text;
	GOODS_DESCS[17]= YuanbaoShop_ItemInfo17_Text;
	GOODS_DESCS[18]= YuanbaoShop_ItemInfo18_Text;

	GOOD_BAD[1]  =     YuanbaoShop_ItemInfo1_GB;
	GOOD_BAD[2]  =     YuanbaoShop_ItemInfo2_GB;
	GOOD_BAD[3]  =     YuanbaoShop_ItemInfo3_GB;
	GOOD_BAD[4]  =     YuanbaoShop_ItemInfo4_GB;
	GOOD_BAD[5]  =     YuanbaoShop_ItemInfo5_GB;
	GOOD_BAD[6]  =     YuanbaoShop_ItemInfo6_GB;
	GOOD_BAD[7]  =     YuanbaoShop_ItemInfo7_GB;
	GOOD_BAD[8]  =     YuanbaoShop_ItemInfo8_GB;
	GOOD_BAD[9]  =     YuanbaoShop_ItemInfo9_GB;
	GOOD_BAD[10] =     YuanbaoShop_ItemInfo10_GB;
	GOOD_BAD[11] =     YuanbaoShop_ItemInfo11_GB;
	GOOD_BAD[12] =     YuanbaoShop_ItemInfo12_GB;
	GOOD_BAD[13] =     YuanbaoShop_ItemInfo13_GB;
	GOOD_BAD[14] =     YuanbaoShop_ItemInfo14_GB;
	GOOD_BAD[15] =     YuanbaoShop_ItemInfo15_GB;
	GOOD_BAD[16] =     YuanbaoShop_ItemInfo16_GB;
	GOOD_BAD[17] =     YuanbaoShop_ItemInfo17_GB;
	GOOD_BAD[18] =     YuanbaoShop_ItemInfo18_GB;

	--������
	SHOP_LIST_A[1] = {btn = YuanbaoShop_Button1 , shoplist = {}}
	SHOP_LIST_A[1].shoplist[1] = "#{YBSD_081225_019}"   --"��Ʒ�ϼ�";
	SHOP_LIST_A[1].shoplist[2] = "�ﹱ����"   --"�����̵�";	
	SHOP_LIST_A[1].shoplist[3] = "��Ů�̵�"   --"�����̵�";
	SHOP_LIST_A[1].shoplist[4] = "����̵�"   --"�����̵�";	
	SHOP_LIST_A[1].shoplist[5] = "������ӡ"   --"�����̵�";	
    SHOP_LIST_A[1].shoplist[6] = "�����̵�"   --"�����̵�";
	SHOP_LIST_A[1].shoplist[7] = "�����̳�"   --"�����̵�";
	SHOP_LIST_A[1].shoplist[8] = "����ͼ��"   --"�����̵�";
	--��ʯ�̳�
	SHOP_LIST_A[2] = {btn = YuanbaoShop_Button2 , shoplist = {}}
	SHOP_LIST_A[2].shoplist[1] = "������ʯի"	--"��ѱ�ʯի";
	SHOP_LIST_A[2].shoplist[2] = "�ļ���ʯի"	--"�˼���ʯի";
	SHOP_LIST_A[2].shoplist[3] = "������ʯի"	--"��ʯ�ӹ���";	
	SHOP_LIST_A[2].shoplist[4] = "�߼���ʯի"	--"��ʯ�ӹ���";	
	SHOP_LIST_A[2].shoplist[5] = "�ż���ʯի"	--"��ʯ������";	
	SHOP_LIST_A[2].shoplist[6] = "#{YBSD_081225_026}"	--"��ʯ�ӹ���";	

	--�����̳�
	SHOP_LIST_A[3] = {btn = YuanbaoShop_Button3 , shoplist = {}}
	SHOP_LIST_A[3].shoplist[1] = "��Ʒ���޹�"	--"��ͨ���޹�";
	SHOP_LIST_A[3].shoplist[2] = "ϡ�����޹�"	--"������޹�";
	SHOP_LIST_A[3].shoplist[3] = "������޹�"	--"ϡ�����޹�";
	SHOP_LIST_A[3].shoplist[4] = "�������޹�"	--"������ҩ��";	
	SHOP_LIST_A[3].shoplist[5] = "#{YBSD_081225_028}"	--"��ͨ���ܹ�";
	SHOP_LIST_A[3].shoplist[6] = "#{YBSD_081225_029}"	--"�߼����ܹ�";
	SHOP_LIST_A[3].shoplist[7] = "#{YBSD_081225_030}"	--"������ҩ��";


	--�ϱ��ӻ�
	SHOP_LIST_A[4] = {btn = YuanbaoShop_Button4 , shoplist = {}}
	SHOP_LIST_A[4].shoplist[1] = "#{YBSD_081225_091}"	--"�ɵ���ҩ";
	SHOP_LIST_A[4].shoplist[2] = "�����챦"   --"�����챦";		
	SHOP_LIST_A[4].shoplist[3] = "�칤����"	--"�����챦";
	SHOP_LIST_A[4].shoplist[4] = "#{YBSD_081225_032}"	--"�������";

	--����㳡
	SHOP_LIST_A[5] = {btn = YuanbaoShop_Button5 , shoplist = {}}	
	SHOP_LIST_A[5].shoplist[1] = "��������"	--"��ͳ�̻�";	
	SHOP_LIST_A[5].shoplist[2] = "����Ⱦɫ"	--"��ͳ�̻�";
	SHOP_LIST_A[5].shoplist[3] = "Ⱦɫʱװ"	--"�����̻�";
	SHOP_LIST_A[5].shoplist[4] = "����ʱװ"	--"ȫ�����̻�";
	SHOP_LIST_A[5].shoplist[5] = "�߼�ʱװ"	--"�ʻ�";
	SHOP_LIST_A[5].shoplist[6] = "����ʱװ"	--"�ʻ�";	
	SHOP_LIST_A[5].shoplist[7] = "����ʱװ"	--"�ʻ�";	
	SHOP_LIST_A[5].shoplist[8] = "��������"	--"�ʻ�";		

	
	--�����˼�
	SHOP_LIST_A[6] = {btn = YuanbaoShop_Button6 , shoplist = {}}
	SHOP_LIST_A[6].shoplist[1] = "��������"	--"�������ݷ�";
	SHOP_LIST_A[6].shoplist[2] = "��������"	--"�������ݷ�";	
	SHOP_LIST_A[6].shoplist[3] = "�߼�����"	--"�����̳�";
    SHOP_LIST_A[6].shoplist[4] = "�м�����"	--"�����̳�";
	SHOP_LIST_A[6].shoplist[5] = "��������"	--"�����̳�";
	--�书�ؼ�
	SHOP_LIST_A[7] = {btn = YuanbaoShop_Button7 , shoplist = {}}
	SHOP_LIST_A[7].shoplist[1] = "#{YBSD_081225_042}"	--"��ʩˮ��";
	SHOP_LIST_A[7].shoplist[2] = "��ʮ����"	--"��ʩˮ��";
	SHOP_LIST_A[7].shoplist[3] = "�ŋ���"	--"��ʩˮ��";
	SHOP_LIST_A[7].shoplist[4] = "�������"	--"��ʩˮ��";
	SHOP_LIST_A[7].shoplist[5] = "��۱���"	--"��ʩˮ��";
	
	--����ͼ
	SHOP_LIST_A[8] = {btn = YuanbaoShop_Button8 , shoplist = {}}
	SHOP_LIST_A[8].shoplist[1] = "#{YBSD_081225_043}"	--"������ǹ��";
	SHOP_LIST_A[8].shoplist[2] = "��˫�̺���"	--"���̺�˫��";
	SHOP_LIST_A[8].shoplist[3] = "�Ȼ�������"	--"�Ⱥͻ�";
	SHOP_LIST_A[8].shoplist[4] = "#{YBSD_081225_096}"	--"�·���ñ��";
	SHOP_LIST_A[8].shoplist[5] = "#{YBSD_081225_046}"	--"���׺�Ь��";
	SHOP_LIST_A[8].shoplist[6] = "#{YBSD_081225_047}"	--"����ͻ���";
	SHOP_LIST_A[8].shoplist[7] = "#{YBSD_081225_048}"	--"����������";
	SHOP_LIST_A[8].shoplist[8] = "#{YBSD_081225_049}"	--"��ָ�ͻ���";

	--�����̵�
	SHOP_LIST_B[1] = YuanbaoShop_Button01
	SHOP_LIST_B[2] = YuanbaoShop_Button02
	SHOP_LIST_B[3] = YuanbaoShop_Button03
	SHOP_LIST_B[4] = YuanbaoShop_Button04
	SHOP_LIST_B[5] = YuanbaoShop_Button05
	SHOP_LIST_B[6] = YuanbaoShop_Button06
	SHOP_LIST_B[7] = YuanbaoShop_Button07
	SHOP_LIST_B[8] = YuanbaoShop_Button08


	if lastA ~= nil and lastA > 0 and lastA < 9 then
		SHOP_LIST_A[lastA].btn:SetCheck(1)
	end

	if lastB ~= nil and lastB > 0 and lastB < 9 then
		SHOP_LIST_B[lastB]:SetCheck(1)
	end

	for i =1 ,8 do
		SHOP_LIST_B[i]:Hide()
	end
        YuanbaoShop_Bk3_VIP: Hide()

	--��Ҫ��ǿ��
	SHOP_SEARCH_LIST[1] = {}
	SHOP_SEARCH_LIST[1][1] = "#{YBSD_081225_023}"	--"���ݱ�ʯի";
	SHOP_SEARCH_LIST[1][2] = "#{YBSD_081225_024}"	--"������ʯի";
	SHOP_SEARCH_LIST[1][3] = "#{YBSD_081225_025}"	--"��ʯ������";
	SHOP_SEARCH_LIST[1][4] = "#{YBSD_081225_027}"	--"ϡ�����޹�";
	SHOP_SEARCH_LIST[1][5] = "#{YBSD_081225_091}"	--"�ɵ���ҩ";
	--��Ҫ��������
	SHOP_SEARCH_LIST[2] = {}
	SHOP_SEARCH_LIST[2][1] = "#{YBSD_081225_037}"	--"�����̳�";
	SHOP_SEARCH_LIST[2][2] = "#{YBSD_XML_1}"--�þ�ʱװ��
	SHOP_SEARCH_LIST[2][3] = "#{YBSD_XML_2}"--ʱ��ʱװ��
	SHOP_SEARCH_LIST[2][4] = "#{YBSD_081225_034}"	--"�������ի";
	SHOP_SEARCH_LIST[2][5] = "#{YBSD_081225_035}"	--"���﷢�չ�";
	SHOP_SEARCH_LIST[2][6] = "#{YBSD_081225_036}"	--"�������ݷ�";
	--��Ҫ���켫Ʒװ��
	SHOP_SEARCH_LIST[3] = {}
	SHOP_SEARCH_LIST[3][1] = "#{YBSD_081225_023}"	--"���ݱ�ʯի";
	SHOP_SEARCH_LIST[3][2] = "#{YBSD_081225_024}"	--"������ʯի";
	SHOP_SEARCH_LIST[3][3] = "#{YBSD_081225_026}"	--"��ʯ�ӹ���";
	SHOP_SEARCH_LIST[3][4] = "#{YBSD_XML_3}"	--"�칤����";
	SHOP_SEARCH_LIST[3][5] = "#{YBSD_081225_031}"	--"�����챦";
	SHOP_SEARCH_LIST[3][6] = "#{YBSD_081225_022}"	--"����ʯի";
	--��Ҫ���켫Ʒ����
	SHOP_SEARCH_LIST[4] = {}
	SHOP_SEARCH_LIST[4][1] = "#{YBSD_081225_027}"	--"ϡ�����޹�";
	SHOP_SEARCH_LIST[4][2] = "#{YBSD_081225_028}"	--"��ͨ���ܹ�";
	SHOP_SEARCH_LIST[4][3] = "#{YBSD_081225_029}"	--"�߼����ܹ�";
	SHOP_SEARCH_LIST[4][4] = "#{YBSD_081225_030}"	--"������ҩ��";

	--��Ҫ�ƶ��ĸ���
	SHOP_SEARCH_LIST[5] = {}
	SHOP_SEARCH_LIST[5][1] = "#{YBSD_081225_037}"	--"�����̳�";
	SHOP_SEARCH_LIST[5][2] = "#{YBSD_081225_032}"	--"�������";
	--��Ҫ����˱��
	SHOP_SEARCH_LIST[6] = {}
	SHOP_SEARCH_LIST[6][1] = "#{YBSD_081225_039}"	--"�����̻�";
	SHOP_SEARCH_LIST[6][2] = "#{YBSD_081225_040}"	--"ȫ�����̻�";
	SHOP_SEARCH_LIST[6][3] = "#{YBSD_081225_041}"	--"�ʻ�";
	SHOP_SEARCH_LIST[6][4] = "#{YBSD_XML_1}"--�þ�ʱװ��
	SHOP_SEARCH_LIST[6][5] = "#{YBSD_XML_2}"--ʱ��ʱװ��
	SHOP_SEARCH_LIST[6][6] = "#{YBSD_081225_037}"	--"�����̳�";
	--��Ҫѧϰ�¼���
	SHOP_SEARCH_LIST[7] = {}
	SHOP_SEARCH_LIST[7][1] = "#{YBSD_081225_042}"	--"��ʩˮ��";
	SHOP_SEARCH_LIST[7][2] = "#{YBSD_XML_4}"	--"��ʩˮ��";
	SHOP_SEARCH_LIST[7][3] = "#{YBSD_081225_028}"	--"��ͨ���ܹ�";
	SHOP_SEARCH_LIST[7][4] = "#{YBSD_081225_029}"	--"�߼����ܹ�";
	--�������
	SHOP_SEARCH_LIST[8] = {}
	SHOP_SEARCH_LIST[8][1] = "#{YBSD_xml_XX(01)}"	--"�������";


	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_055}" ,1)	--��Ҫ��ǿ��
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_056}" ,2)	--"��Ҫ��������"
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_057}" ,3)	--"��Ҫ���켫Ʒװ��"
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_058}",4)	--"��Ҫ���켫Ʒ����"
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_059}",5)	--"��Ҫ�ƶ��ĸ���"
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_060}",6)	--"��Ҫ����˱��"
	YuanbaoShop_SearchMode:AddTextItem("#{YBSD_081225_061}",7)	--"��Ҫѧϰ�¼���"
	--YuanbaoShop_SearchMode:AddTextItem("#{YBSD_xml_XX(02)}",8)	--"�鿴����������Ʒ"


	-- ��Ԫ��begin
	SHOP_LIST_A_BIND[1] = {btn = YuanbaoShop_Button1_Bind , shopname="������",shoplist = {}}
	SHOP_LIST_A_BIND[1].shoplist[1] = "��Ʒ����"		--"";
	-- SHOP_LIST_A_BIND[1].shoplist[2] = "�����ϼ�"		--"";
	-- SHOP_LIST_A_BIND[1].shoplist[3] = "ytm.fcloo.cn"		--"";
	-- SHOP_LIST_A_BIND[1].shoplist[4] = "�ؼ۵���"		--"";
	-- SHOP_LIST_A_BIND[1].shoplist[5] = "�ؼ۵��"		--"";
	-- SHOP_LIST_A_BIND[1].shoplist[6] = "���Ҹ���"		--"";


	--
	SHOP_LIST_A_BIND[2] = {btn = YuanbaoShop_Button2_Bind , shopname="������ʯ",shoplist = {}}
	SHOP_LIST_A_BIND[2].shoplist[1] = "#������ʯի"		--"";
	SHOP_LIST_A_BIND[2].shoplist[2] = "#�ļ���ʯի"		--"";
	SHOP_LIST_A_BIND[2].shoplist[3] = "#������ʯի"		--"";
	SHOP_LIST_A_BIND[2].shoplist[4] = "#�߼���ʯի"		--"";
	SHOP_LIST_A_BIND[2].shoplist[5] = "#��ʯ�ӹ���"		--"";
	--SHOP_LIST_A_BIND[2].shoplist[2] = "#e0e8de5�ż���ʯ"		--"";
	--SHOP_LIST_A_BIND[2].shoplist[3] = "#e0e8de5�߼�����"		--"";

	--
	SHOP_LIST_A_BIND[3] = {btn = YuanbaoShop_Button3_Bind , shopname="��������",shoplist = {}}
	SHOP_LIST_A_BIND[3].shoplist[1] = "#������Ʒ"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[2] = "#{YBSD_081225_028}"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[3] = "#{YBSD_081225_029}"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[1] = "#e0e8de5Ⱦɫʱװ"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[2] = "#e0e8de5����ʱװ"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[3] = "#e0e8de5��������"		--"";
	--SHOP_LIST_A_BIND[3].shoplist[4] = "#e0e8de5��������"		--"";

	--��������
	SHOP_LIST_A_BIND[4] = {btn = YuanbaoShop_Button4_Bind , shopname="�����ӻ�",shoplist = {}}
	SHOP_LIST_A_BIND[4].shoplist[1] = "#������Ʒ"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[1] = "#e0e8de5�û�����"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[2] = "#e0e8de5���籦��"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[3] = "#e0e8de5����"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[4] = "#e0e8de5����"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[5] = "#e0e8de5����"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[6] = "#e0e8de5����"		--"";
	--SHOP_LIST_A_BIND[4].shoplist[7] = "#e0e8de5Ь��"		--"";


	--
	SHOP_LIST_A_BIND[5] = {btn = YuanbaoShop_Button5_Bind , shopname="��ʯ�ӹ�",shoplist = {}}
	--SHOP_LIST_A_BIND[5].shoplist[1] = "#��ʯ�ӹ���"		--"";
	--SHOP_LIST_A_BIND[5].shoplist[2] = "#e0e8de5��ܶ�Ź"		--"";
       --SHOP_LIST_A_BIND[5].shoplist[3] = "#e0e8de5�ڰ��ķ�"		--"";
       --SHOP_LIST_A_BIND[5].shoplist[4] = "#e0e8de5jia���籦��"		--"";


	--
	--SHOP_LIST_A_BIND[6] = {btn = YuanbaoShop_Button6_Bind , shoplist = {}}
	--SHOP_LIST_A_BIND[6].shoplist[1] = "#e0e8de5��ͳ�̻�"		--"";
	--SHOP_LIST_A_BIND[6].shoplist[1] = "#e0e8de5�����̻�"		--"";
	--SHOP_LIST_A_BIND[6].shoplist[2] = "#e0e8de5�����̻�"		--"";
	--SHOP_LIST_A_BIND[6].shoplist[3] = "#e0e8de5�����̻�"		--"";
	--SHOP_LIST_A_BIND[6].shoplist[4] = "#e0e8de5���ǰٻ�"		--"";

	--
	--SHOP_LIST_A_BIND[7] = {btn = YuanbaoShop_Button7_Bind , shoplist = {}}
	--SHOP_LIST_A_BIND[7].shoplist[1] = "#e0e8de5�ռ�����"		--"";

	--
	--SHOP_LIST_A_BIND[8] = {btn = YuanbaoShop_Button8_Bind , shoplist = {}}
	--SHOP_LIST_A_BIND[8].shoplist[1] = "#{YBSD_081225_043}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[2] = "#{YBSD_081225_044}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[3] = "#{YBSD_081225_045}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[4] = "#{YBSD_081225_096}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[5] = "#{YBSD_081225_046}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[6] = "#{YBSD_081225_047}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[7] = "#{YBSD_081225_048}"		--"";
	--SHOP_LIST_A_BIND[8].shoplist[8] = "#{YBSD_081225_049}"		--"";

	--�����̵�
	SHOP_LIST_B_BIND[1] = YuanbaoShop_Button01_Bind
	SHOP_LIST_B_BIND[2] = YuanbaoShop_Button02_Bind
	SHOP_LIST_B_BIND[3] = YuanbaoShop_Button03_Bind
	SHOP_LIST_B_BIND[4] = YuanbaoShop_Button04_Bind
	SHOP_LIST_B_BIND[5] = YuanbaoShop_Button05_Bind
	SHOP_LIST_B_BIND[6] = YuanbaoShop_Button06_Bind
	SHOP_LIST_B_BIND[7] = YuanbaoShop_Button07_Bind
	SHOP_LIST_B_BIND[8] = YuanbaoShop_Button08_Bind


	if lastA_Bind ~= nil and lastA_Bind > 0 and lastA_Bind < 9 then
		SHOP_LIST_A_BIND[ lastA_Bind ].btn : SetCheck(1)
	end

	if lastB_Bind ~= nil and lastB_Bind > 0 and lastB_Bind < 9 then
		SHOP_LIST_B_BIND[ lastB_Bind ] : SetCheck(1)
	end

	for i =1 ,8 do
		SHOP_LIST_B_BIND[i]:Hide()
	end

	--
	SHOP_SEARCH_LIST_BIND[1] = {}
	SHOP_SEARCH_LIST_BIND[1][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[1][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[1][3] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[1][4] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[1][5] = "BindSearch1"	--"";
	--
	SHOP_SEARCH_LIST_BIND[2] = {}
	SHOP_SEARCH_LIST_BIND[2][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[2][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[2][3] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[2][4] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[2][5] = "BindSearch1"	--"";
	--
	SHOP_SEARCH_LIST_BIND[3] = {}
	SHOP_SEARCH_LIST_BIND[3][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[3][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[3][3] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[3][4] = "BindSearch1"	--"";

	--
	SHOP_SEARCH_LIST_BIND[4] = {}
	SHOP_SEARCH_LIST_BIND[4][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[4][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[4][3] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[4][4] = "BindSearch1"	--"";

	--
	SHOP_SEARCH_LIST_BIND[5] = {}
	SHOP_SEARCH_LIST_BIND[5][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[5][2] = "BindSearch1"	--"";
	--
	SHOP_SEARCH_LIST_BIND[6] = {}
	SHOP_SEARCH_LIST_BIND[6][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[6][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[6][3] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[6][4] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[6][5] = "BindSearch1"	--"";
	--
	SHOP_SEARCH_LIST_BIND[7] = {}
	SHOP_SEARCH_LIST_BIND[7][1] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[7][2] = "BindSearch1"	--"";
	SHOP_SEARCH_LIST_BIND[7][3] = "BindSearch1"	--"";


	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch1}" ,1)	--
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch2}" ,2)	--""
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch3}" ,3)	--""
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch4}",4)		--""
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch5}",5)		--""
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch6}",6)		--""
	YuanbaoShop_SearchMode_Bind:AddTextItem("BindSearch7}",7)		--""


	YuanbaoShop_Bk1_Bind : Hide();
	YuanbaoShop_Bk2_Bind : Hide();
	YuanbaoShop_SearchMode_Bind : Hide();
	YuanbaoShop_Text2_Bind : Hide();
	-- ��Ԫ��end

	------------------------------------------ ��ȯ�̵� -------------------------------------------------------
	--��ȯ�̵�Begin
	--if g_IsEnableFanQuanShop == 0 then
	 --   YuanbaoShop_Fanquan:Disable(); --�رշ�ȯ�̵�
	  --  YuanbaoShop_Fanquan:Hide();
	--  end

	--������
	SHOP_LIST_A_GIFTTOKEN[1] = {btn = YuanbaoShop_Button1 , shopname="#{YBSD_081225_003}" ,tooltips="#{FQ_101210_19}", shoplist = {}}
	SHOP_LIST_A_GIFTTOKEN[1].shoplist[1] = "#{YBSD_081225_019}"	--"��Ʒ�ϼ�";
	SHOP_LIST_A_GIFTTOKEN[1].shoplist[2] = "#{YBSD_081225_020}"	--"�����̵�";


	--����㳡
	SHOP_LIST_A_GIFTTOKEN[2] = {btn = YuanbaoShop_Button2 , shopname="#{YBSD_081225_007}",tooltips="#{FQ_101210_20}", shoplist = {}}
	SHOP_LIST_A_GIFTTOKEN[2].shoplist[1] = "#{YBSD_XML_2}"	--"ʱ��ʱװ��";
	SHOP_LIST_A_GIFTTOKEN[2].shoplist[2] = "#{YBSD_081225_037}"	--"�칬�����";
	--������
	SHOP_LIST_A_GIFTTOKEN[3] = {btn = YuanbaoShop_Button3 ,shopname="", shoplist = {}}

	--���ļ�
	SHOP_LIST_A_GIFTTOKEN[4] = {btn = YuanbaoShop_Button4 , shopname="",shoplist = {}}

	--�����
	SHOP_LIST_A_GIFTTOKEN[5] = {btn = YuanbaoShop_Button5 , shopname="",shoplist = {}}

	--������
	SHOP_LIST_A_GIFTTOKEN[6] = {btn = YuanbaoShop_Button6 , shopname="",shoplist = {}}

	--���߼�
	SHOP_LIST_A_GIFTTOKEN[7] = {btn = YuanbaoShop_Button7 , shopname="",shoplist = {}}

	--�ڰ˼�
	SHOP_LIST_A_GIFTTOKEN[8] = {btn = YuanbaoShop_Button8 , shopname="",shoplist = {}}

	--�����̵�
	SHOP_LIST_B_GIFTTOKEN[1] = YuanbaoShop_Button01
	SHOP_LIST_B_GIFTTOKEN[2] = YuanbaoShop_Button02
	SHOP_LIST_B_GIFTTOKEN[3] = YuanbaoShop_Button03
	SHOP_LIST_B_GIFTTOKEN[4] = YuanbaoShop_Button04
	SHOP_LIST_B_GIFTTOKEN[5] = YuanbaoShop_Button05
	SHOP_LIST_B_GIFTTOKEN[6] = YuanbaoShop_Button06
	SHOP_LIST_B_GIFTTOKEN[7] = YuanbaoShop_Button07
	SHOP_LIST_B_GIFTTOKEN[8] = YuanbaoShop_Button08


	if lastA ~= nil and lastA > 0 and lastA < table.getn(SHOP_LIST_A_GIFTTOKEN)+1 then
		SHOP_LIST_A_GIFTTOKEN[lastA].btn:SetCheck(1)
	end

	if lastB ~= nil and lastB > 0 and lastB < table.getn(SHOP_LIST_B_GIFTTOKEN)+1 then
		SHOP_LIST_B_GIFTTOKEN[lastB]:SetCheck(1)
	end

	for i =1 ,table.getn(SHOP_LIST_B_GIFTTOKEN) do
		SHOP_LIST_B_GIFTTOKEN[i]:Hide()
	end

	--����ѡ����
	SHOP_SEARCH_LIST_GIFTTOKEN[1] = {}

	-- VipԪ���̵�begin
	SHOP_LIST_A_VIP[1] = {btn = YuanbaoShop_Button1 , shopname="", tooltips = "" ,shoplist = {}, shoplisttips = {}}
--	SHOP_LIST_A_VIP[1].shoplist[1] = "#{FFSDGZ_120615_06}"	--"���������";
	SHOP_LIST_A_VIP[1].shoplist[1] = "#{FFSDGZ_120615_07}"	--"����ʯ��";
	SHOP_LIST_A_VIP[1].shoplist[2] = "#{FFSDGZ_120615_08}"	--"���������";
--	SHOP_LIST_A_VIP[1].shoplisttips[1] = "#{FFSDGZ_120615_124}"	--"���������";--��Ϊ����ڤʯ��
	SHOP_LIST_A_VIP[1].shoplisttips[1] = "#{FFSDGZ_120615_133}"	--"����ʯ��";--��Ϊ������ʯ��
	SHOP_LIST_A_VIP[1].shoplisttips[2] = "#{FFSDGZ_120615_125}"	--"���������";
	--
	SHOP_LIST_A_VIP[2] = {btn = YuanbaoShop_Button2 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[3] = {btn = YuanbaoShop_Button3 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[4] = {btn = YuanbaoShop_Button4 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[5] = {btn = YuanbaoShop_Button5 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[6] = {btn = YuanbaoShop_Button6 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[7] = {btn = YuanbaoShop_Button7 , shoplist = {}, shoplisttips = {}}
	--
	SHOP_LIST_A_VIP[8] = {btn = YuanbaoShop_Button8 , shoplist = {}, shoplisttips = {}}

	--�����̵�
	SHOP_LIST_B_VIP[1] = YuanbaoShop_Button01
	SHOP_LIST_B_VIP[2] = YuanbaoShop_Button02
	SHOP_LIST_B_VIP[3] = YuanbaoShop_Button03
	SHOP_LIST_B_VIP[4] = YuanbaoShop_Button04
	SHOP_LIST_B_VIP[5] = YuanbaoShop_Button05
	SHOP_LIST_B_VIP[6] = YuanbaoShop_Button06
	SHOP_LIST_B_VIP[7] = YuanbaoShop_Button07
	SHOP_LIST_B_VIP[8] = YuanbaoShop_Button08
	if lastA ~= nil and lastA > 0 and lastA < table.getn(SHOP_LIST_A_VIP)+1 then
		SHOP_LIST_A_VIP[lastA].btn:SetCheck(1)
	end

	g_nDistanceBBtnY = YuanbaoShop_Button02 : GetProperty("AbsoluteYPosition") - YuanbaoShop_Button01 : GetProperty("AbsoluteYPosition");

	if lastB ~= nil and lastB > 0 and lastB < table.getn(SHOP_LIST_B_VIP)+1 then
		SHOP_LIST_B_VIP[lastB]:SetCheck(1)
	end

	for i =1 ,table.getn(SHOP_LIST_B_GIFTTOKEN) do
		SHOP_LIST_B_VIP[i]:Hide()
	end
	--�����
	g_PlayCard_CtlButton[1] = YuanbaoShop_ExButton1
	g_PlayCard_CtlButton[2] = YuanbaoShop_ExButton2
	g_PlayCard_CtlButton[3] = YuanbaoShop_ExButton3
	g_PlayCard_CtlButton[4] = YuanbaoShop_ExButton4
	--YuanbaoShop_FanquanRateInfo : Hide();
	--YuanbaoShop_UpPage_Fanquan : Hide()
	--YuanbaoShop_CurrentlyPage_Fanquan : Hide()
	--YuanbaoShop_DownPage_Fanquan : Hide()
	--YuanbaoShop_Try_Fanquan : Hide()
	YuanbaoShop_Bk1_Fanquan : Hide()
	--��ȯ�̵�End

	--vip�̵�
	YuanbaoShop_Bk1_VIP:Hide()
	YuanbaoShop_Lace1:Hide()
	YuanbaoShop_Lace2:Hide()
	YuanbaoShop_Bk1_VIP_test2:SetText("#{FFSDGZ_120615_82}")
	--YuanbaoShop_Exgoumaiqueren:Hide()
	--YuanbaoShop_Exgoumaiqueren_Text:Hide()

	--ͨ��
--	YuanbaoShop_Lijin_Load()

	g_YuanbaoShop_Frame_UnifiedXPosition	= YuanbaoShop_Frame:GetProperty("UnifiedXPosition");
	g_YuanbaoShop_Frame_UnifiedYPosition	= YuanbaoShop_Frame:GetProperty("UnifiedYPosition");
end

function YuanbaoShop_OnEvent(event)

     vipa = DataPool:GetPlayerMission_DataRound(398)
     mypoint = DataPool:GetPlayerMission_DataRound(396)
     if vipa > 2 then
        vipa = 2
     end

	if ( event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LEAVE_WORLD") then
		YuanbaoShop_Close()
	end

	if event == "FAKE_SWTICH_YUANBAO_SHOP" then
		YuanbaoShop_ChangeTabIndex(0)
		YuanbaoShop_UpdateList(5)
		--Ϊ�˷�ֹ��ǰ�Ѿ���4ҳ��ˢ�¡�������
		YuanbaoShop_UpdateShop(3)
		YuanbaoShop_UpdateShop(4)
	end

	if ( event == "OPEN_YUANBAOSHOP"  or event == "OPEN_LIJINSHOP") then
		g_nTotalNum	= 0;
		local check  = tonumber(NpcShop:GetBuyDirectly());
		if(check>=1)then
			YuanbaoShop_querengoumai:SetCheck(0);
		else
			YuanbaoShop_querengoumai:SetCheck(1);
		end



		if( this:IsVisible() == false ) then
			YubanbaoShop_ADRandom()
			if (IsWindowShow("YbMarket")) then
				CloseWindow("YbMarket", true);
			end
			this:Show();
			if (IsWindowShow("XuanShop")) then
				CloseWindow("XuanShop", true);
			end

			YuanbaoShop_ChangeTabIndex(LAST_FENYE)		--֮ǰ��һ��
			if(LAST_FENYE == ShopTabIdx.GiftToken) then
				YuanbaoShop_UpdateList_GiftToken(LAST_TAG)
				YuanbaoShop_UpdateShop_GiftToken(LAST_SHOP)
			elseif (LAST_FENYE == ShopTabIdx.Bind) then
				YuanbaoShop_UpdateList_Bind(LAST_TAG)
				YuanbaoShop_UpdateShop_Bind(LAST_SHOP)
			elseif (LAST_FENYE == ShopTabIdx.YuanBao) then
				YuanbaoShop_UpdateList(LAST_TAG)
				YuanbaoShop_UpdateShop(LAST_SHOP)
			elseif (LAST_FENYE == ShopTabIdx.VipShop) then
				YuanbaoShop_UpdateList_VIP(LAST_TAG)
				YuanbaoShop_UpdateShop_VIP(LAST_SHOP)
			elseif (LAST_FENYE == ShopTabIdx.Lijin) then
				YuanbaoShop_UpdateList_Lijin(LAST_TAG)
				YuanbaoShop_UpdateShop_Lijin(LAST_SHOP)
			end


			OpenWindow("Packet")
			-- ���ȴ�NPC�̵꣬���Ԫ���̵��ʱ�򣬴���һ������
			-- Ԫ���̵��ڴ�ʱ��ر��Ѿ��򿪵�NPC�̵꣬���ر���������Ὣ�Ƿ���̵����״ֻ̬Ϊ�٣��Ӷ����¹�����ص��߼����ִ���
			-- Ŀǰ�Ľ���취����Show�ĵط��������Ƿ���̵��״̬Ϊ�档
			OpenBooth();
		end

		--��������Obj
		objCared = NpcShop:GetNpcId();
		this:CareObject(objCared, 1, "YuanbaoShop");

		NpcShop:CloseConfirm();
		YuanbaoShop_UpdatePage(1);
		
		if(IsWindowShow("Shop_Fitting")) then
			RestoreShopFitting();
			CloseWindow("Shop_Fitting", true);
		end
		SetDefaultMouse();			
	elseif ( event == "TOGGLE_YUANBAOSHOP") then
                YuanbaoShop_Button1:SetCheck(1)
		if( this:IsVisible() ) then
			YuanbaoShop_Close();
		else
			if (arg0 and arg0 == "MiniMap_Yuanbao") then
				if LAST_FENYE < 0 or LAST_FENYE > 5 then
					LAST_FENYE = 0
				end
				g_jumpToShopTabIndex = LAST_FENYE
			else
				if (arg0 and arg0 == "1") then
					--֤���Ǵ������̵���������
					g_jumpToShopTabIndex = 1--ת������Ԫ���̵�
					if (arg1 and arg2 and arg1 ~= "-1" and arg2 ~= "-1" ) then
						YuanbaoShop_Frame:SetProperty("UnifiedXPosition", arg1);
						YuanbaoShop_Frame:SetProperty("UnifiedYPosition", arg2);
					end
				elseif (arg0 and arg0 == "0") then--ת����Ԫ���̵�
					g_jumpToShopTabIndex = 0
					if (arg1 and arg2 and arg1 ~= "-1" and arg2 ~= "-1" ) then
						YuanbaoShop_Frame:SetProperty("UnifiedXPosition", arg1);
						YuanbaoShop_Frame:SetProperty("UnifiedYPosition", arg2);
					end
				elseif (arg0 and arg0 == "2") then--ת������ȯ�̵�
					g_jumpToShopTabIndex = 2
					if (arg1 and arg2 and arg1 ~= "-1" and arg2 ~= "-1" ) then
						YuanbaoShop_Frame:SetProperty("UnifiedXPosition", arg1);
						YuanbaoShop_Frame:SetProperty("UnifiedYPosition", arg2);
					end
				elseif (arg0 and arg0 == "4") then--ת���������̵�
					g_jumpToShopTabIndex = 4
					if (arg1 and arg2 and arg1 ~= "-1" and arg2 ~= "-1" ) then
						YuanbaoShop_Frame:SetProperty("UnifiedXPosition", arg1);
						YuanbaoShop_Frame:SetProperty("UnifiedYPosition", arg2);
					end
				elseif (arg0 and arg0 == "5") then--ת����ͨ���̵�
					g_jumpToShopTabIndex = 5
					if (arg1 and arg2 and arg1 ~= "-1" and arg2 ~= "-1" ) then
						YuanbaoShop_Frame:SetProperty("UnifiedXPosition", arg1);
						YuanbaoShop_Frame:SetProperty("UnifiedYPosition", arg2);
					end
				end
				--lastA = 1;
				--lastB = 1;

				if( tonumber(arg0) ~= nil and tonumber(arg3) ~= nil and tonumber(arg4) ~= nil ) then
					if( tonumber(arg0) >= 0 and tonumber(arg0) <= 5
						and tonumber(arg3) >= 1 and tonumber(arg3) <= 8
						and tonumber(arg4) >= 1 and tonumber(arg4) <= 8 )
					then
						LAST_FENYE = tonumber(arg0)
						LAST_TAG = tonumber(arg3)
						LAST_SHOP = tonumber(arg4)
						lastA = 0
						lastB = 0
						lastA_Bind = 0
						lastB_Bind = 0
						lastA_VIP = 0
						lastB_VIP = 0
					end
				end
			end
			YuanbaoShop_Show()
		end
	elseif ( event == "UPDATE_BOOTH" ) then

		YuanbaoShop_UpdatePage(nPageNum);

	elseif (event == "CLOSE_BOOTH") then
		YuanbaoShop_Close()
	elseif (event == "UPDATE_YUANBAO" and this:IsVisible() ) then
		if g_tabIndex == ShopTabIdx.YuanBao then
			YuanbaoShop_Text2 : SetText( "Я��Ԫ��������"..tostring(Player:GetData("YUANBAO")))
		elseif g_tabIndex == ShopTabIdx.Bind then
			YuanbaoShop_Text2 : SetText( "Я����������"..tostring(Player:GetData("ZENGDIAN")))

		end
	elseif (event == "UPDATE_BIND_YUANBAO" and this:IsVisible()) then
		YuanbaoShop_Text2_Bind : SetText( "#{BDYB_XML_6}"..tostring( Player:GetData("BIND_YUANBAO")).."/"..tostring(Player:GetData("YUANBAO")) )
	elseif (event == "UPDATE_GIFTTOKEN" and this:IsVisible() and g_tabIndex == ShopTabIdx.GiftToken) then
		YuanbaoShop_Text2 : SetText( "#{YBFQ_XML_4}"..tostring(Player:GetData("GIFTTOKEN")))

	elseif (event == "UI_COMMAND" and tonumber( arg0 ) == 888902) then
		ObjCared = Get_XParam_INT( 0 )
		if Get_XParam_INT( 1 ) ~= 0 and Get_XParam_INT( 2 ) ~= 0 then
			lastA = Get_XParam_INT( 1 )
			lastB = Get_XParam_INT( 2 )
		end
		YuanbaoShop_Show()
	elseif( event == "ADJEST_UI_POS" ) then
		YuanbaoShop_ResetPos()

	elseif( event == "VIEW_RESOLUTION_CHANGED" ) then
		YuanbaoShop_ResetPos()
	elseif ( event == "OPEN_JIYUAN_BOOTH" ) then
		YuanbaoShop_UpdateJiYuanBooth()
	end
end
function YuanbaoShop_UpdateJiYuanBooth()
	local i = 1;
	while i <= GOODS_BUTTONS_JiYuan_NUM do
		local theAction = EnumAction(i - 1, "boothjiyuanitem");
		if theAction:GetID() ~= 0 then
			local IconKey = theAction:GetItemIconInShop_JiYuan()
			if IconKey ~= nil and IconKey ~= "" and IconTable[IconKey] ~= nil then
				GOODS_JiYuan_BUTTONS_ICON[i]:SetProperty("Image" , IconTable[IconKey])
			else
				GOODS_JiYuan_BUTTONS_ICON[i]:SetProperty("Image" , "")
			end
			GOODS_JiYuan_BUTTONS[i]:SetActionItem(theAction:GetID());
			if theAction:GetMaxNum() > 0 then
				GOODS_JiYuan_BUTTONS_Buy[i] : Show()
			else
				GOODS_JiYuan_BUTTONS_Buy[i] : Hide()
			end
			local	nPrice	= NpcShop:EnumItemPriceJiYuanBooth( i - 1 )
			GOODS_JiYuan_BAD[i]:SetText("#{YBSD_081225_101}" .. tostring(nPrice))

			if(theAction:GetItemColorInShop_JiYuan()~="") then
				GOODS_JiYuan_DESCS[i]:SetText( theAction:GetItemColorInShop_JiYuan()..theAction:GetName() );
			else
				GOODS_JiYuan_DESCS[i]:SetText( theAction:GetName() );
			end
			i = i+1;
		else
			GOODS_JiYuan_BUTTONS_ICON[i]:SetProperty("Image" , "")
			GOODS_JiYuan_BUTTONS[i]:SetActionItem(-1);
			GOODS_JiYuan_DESCS[i]:SetText("");
			GOODS_JiYuan_BAD[i]:SetText("");
			GOODS_JiYuan_BUTTONS_Buy[i] : Hide()
			i = i+1;
		end
	end
	NpcShop:CloseConfirm();
end
function YuanbaoShop_UpdateRecent()
	local i = 1;
	while i <= GOODS_BUTTONSRECENTLY_NUM do
		local theAction = EnumAction(i - 1, "yuanbaorecently");
		if theAction:GetID() ~= 0 then
			local nEquipPoint = theAction:GetEquipPoint();


			GOODSRECENTLY_BUTTONS[i]:SetActionItem(theAction:GetID());

			local	nPrice	= NpcShop:EnumItemPriceRecently( i - 1 )
			if (g_tabIndex == ShopTabIdx.YuanBao or g_tabIndex == ShopTabIdx.VipShop) then
				GOODSRECENTLY_DESCS[i]:SetText("#cfff263".."#{YBSD_081225_101}")
			elseif (g_tabIndex == ShopTabIdx.Bind) then
				GOODSRECENTLY_DESCS[i]:SetText("#cfff263".."#{BDYB_090714_01}")
			elseif (g_tabIndex == ShopTabIdx.GiftToken) then
				GOODSRECENTLY_DESCS[i]:SetText("#cfff263".."#{YBFQ_XML_1}")
			end
			GOODSRECENTLY_BAD[i]:SetText("#cfff263"..tostring(nPrice))
			i = i+1;
		else
			GOODSRECENTLY_BUTTONS[i]:SetActionItem(-1);
			GOODSRECENTLY_DESCS[i]:SetText("");
			GOODSRECENTLY_BAD[i]:SetText("");
			i = i+1;
		end
	end
	NpcShop:CloseConfirm();
end

function YuanbaoShop_GoodRecent_Clicked(nIndex)
	if(nIndex < 1 or nIndex > 5) then
		return;
	end

	GOODSRECENTLY_BUTTONS[nIndex]:DoAction();
end
--��Ե�ر�������Ʒ
function YuanbaoShop_JiYuanGood_Clicked(nIndex, nWhich)
	if(nIndex < 1 or nIndex > 6) then
		return;
	end

	-- ��ⰲȫʱ��
	if tonumber(DataPool:GetLeftProtectTime()) > 0 then
		PushDebugMessage("#{ZYXT_120528_16}")
		return
	end

	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OpenYuanbaoShop");
		Set_XSCRIPT_ScriptID(888902);
		Set_XSCRIPT_Parameter(0,1987);
		Set_XSCRIPT_Parameter(1,1987);
		Set_XSCRIPT_Parameter(2,1987);
		Set_XSCRIPT_Parameter(3,nIndex);
		Set_XSCRIPT_ParamCount(4);
	Send_XSCRIPT();
        SetTimer("YuanbaoShop","YuanbaoShop_Show()",800);
end
--==================
--���̵�
function YuanbaoShop_Show()

           local myjiyuanmibao1 = DataPool:GetPlayerMission_DataRound(486)
           local myjiyuanmibao2 = DataPool:GetPlayerMission_DataRound(487)
           local myjiyuanmibaobuy = DataPool:GetPlayerMission_DataRound(329)

           if myjiyuanmibao1 ~= 0 and myjiyuanmibao2 ~= 0 then

               ab[1] = math.mod(myjiyuanmibao1,100)
               ab[2] = math.mod(math.floor(myjiyuanmibao1/100),100)
               ab[3] = math.mod(math.floor(myjiyuanmibao1/10000),100)
               ab[4] = math.mod(math.floor(myjiyuanmibao1/1000000),100)
               ab[5] = math.mod(myjiyuanmibao2,100)
               ab[6] = math.mod(math.floor(myjiyuanmibao2/100),100)

               red[1] = math.mod(myjiyuanmibaobuy,10)
               red[2] = math.mod(math.floor(myjiyuanmibaobuy/10),10)
               red[3] = math.mod(math.floor(myjiyuanmibaobuy/100),10)
               red[4] = math.mod(math.floor(myjiyuanmibaobuy/1000),10)
               red[5] = math.mod(math.floor(myjiyuanmibaobuy/10000),10)
               red[6] = math.floor(myjiyuanmibaobuy/100000)

               for i = 1,6 do
               local myAction = GemMelting:UpdateProductAction(jiyuanmibao[ab[i]])
               GOODS_JiYuan_BUTTONS[i]:SetActionItem(myAction:GetID());
               GOODS_JiYuan_BUTTONS_RED[i]:Hide()
               GOODS_JiYuan_BUTTONS_Buy[i]:Enable()
               if red[i] ~= 0 then
                  GOODS_JiYuan_BUTTONS_RED[i]:Show()
                  GOODS_JiYuan_BUTTONS_Buy[i]:Disable()
               end
               GOODS_JiYuan_DESCS[i]:SetText(myAction:GetName());
               GOODS_JiYuan_BAD[i]:SetText("Ԫ����"..jiyuanmibaobuy[ab[i]].."");
               end
           end

           YuanbaoShop_UpdateShop_VIP(1)

	if lastA < 1 or lastA > maxChildShop then
		lastA = 1;
		lastB = 1;
	end

	if lastB < 1 or lastB > maxChildShop then
		lastB = 1;
	end


	lastSelect = 0;
	for i = 1 ,maxChildShop do
		SHOP_LIST_B[i]:Hide()
		if SHOP_LIST_A[lastA].shoplist[i] ~= nil then
			SHOP_LIST_B[i]:SetText(SHOP_LIST_A[lastA].shoplist[i])
			SHOP_LIST_B[i]:Show()
		end
	end
	SHOP_LIST_A[lastA].btn:SetCheck(1)
	SHOP_LIST_B[lastB]:SetCheck(1)


	lastA_Bind = 1;
	lastB_Bind = 1;

	lastSelect_Bind = 0;
	for i = 1 ,maxChildShop do
		SHOP_LIST_B_BIND[i]:Hide()
		if SHOP_LIST_A_BIND[lastA_Bind].shoplist[i] ~= nil then
			SHOP_LIST_B_BIND[i]:SetText(SHOP_LIST_A_BIND[lastA_Bind].shoplist[i])
			SHOP_LIST_B_BIND[i]:Show()
		end
	end
	SHOP_LIST_A_BIND[lastA_Bind].btn:SetCheck(1)
	SHOP_LIST_B_BIND[lastB_Bind]:SetCheck(1)

	SHOP_LIST_A_BIND[1].btn : SetCheck(1)
	if (g_jumpToShopTabIndex == 1) then
		YuanbaoShop_Yuanbao : SetCheck(0)
		--       YuanbaoShop_Gongzi : SetCheck(1)
		--�л�����Ԫ����
		YuanbaoShop_ChangeTabIndex( 1 )
		g_jumpToShopTabIndex = 0;
	elseif (g_jumpToShopTabIndex == 2 and g_IsEnableFanQuanShop == 1) then
		YuanbaoShop_Yuanbao : SetCheck(0)
		--       YuanbaoShop_Gongzi : SetCheck(0)
		--�л�����ȯ�̵�
		YuanbaoShop_ChangeTabIndex( 2 )
		g_jumpToShopTabIndex = 0;
	elseif ( 0 == g_tabIndex ) then
		UpdateShopItem( lastA , lastB )
	else
		YuanbaoShop_Yuanbao : SetCheck(1)
		--       YuanbaoShop_Gongzi : SetCheck(0)
		--��ʱĬ���л�����ͨԪ����
		YuanbaoShop_ChangeTabIndex( 0 )
	end
	if g_Last_tabIndex==1 then
		YuanbaoShop_Yuanbao : SetCheck(0)
		--       YuanbaoShop_Gongzi : SetCheck(1)
	end
	--�����Ե�ر��̵�
		YuanbaoShop_PlayCardChangePage(1)
        KillTimer("YuanbaoShop_Show()");
end
--===============================
--ˢ��һҳ
function YuanbaoShop_UpdatePage(thePage)

	if (g_tabIndex == ShopTabIdx.YuanBao) then
		YuanbaoShop_Text2 : SetText( "Я��Ԫ��������"..tostring(Player:GetData("YUANBAO")))
		g_Last_tabIndex=0
	elseif (g_tabIndex == 4) then
		YuanbaoShop_Text2 : SetText( "Я��Ԫ��������"..tostring(Player:GetData("YUANBAO")))
		g_Last_tabIndex=1
	end

	for i=1, GOODS_BUTTONS_NUM  do
		GOOD_BAD[i]:Show()
	end

	local	i = 1;

	if g_nTotalNum == 0 or g_nTotalNum ~= GetActionNum("boothitem") then
		g_nTotalNum	= GetActionNum("boothitem");
	   YuanbaoShop_Order();
	end

	-- ������ҳ��
	local	nTotalPage;
	if( g_nTotalNum < 1 ) then
		nTotalPage	= 1;
	else
		nTotalPage	= math.floor((g_nTotalNum-1)/GOODS_BUTTONS_NUM)+1;
	end
	

	maxPage = nTotalPage;

	if(thePage < 1 or thePage > nTotalPage) then
		return;
	end
	--HEQUIP_DRESS		=16,	//ʱװ
	--HEQUIP_RIDER		=8,	//���
	local bHaveRide=0;

	nPageNum = thePage;

	local nStartIndex = (thePage-1)*GOODS_BUTTONS_NUM;

	local nActIndex = nStartIndex;
	i = 1;
	while i <= GOODS_BUTTONS_NUM do
		local	idx	= g_tOrderPool[nActIndex+1];
		if idx == nil then
			idx	= -1;
		end

		local theAction = EnumAction(idx, "boothitem");
		if theAction:GetID() ~= 0 then
			local nEquipPoint = theAction:GetEquipPoint();

			if nEquipPoint == 16 or nEquipPoint == 8 then
				bHaveRide = 1;
			end


			GOODS_BUTTONS[i]:SetActionItem(theAction:GetID());
			if(theAction:GetItemColorInShop()~="") then
				GOODS_DESCS[i]:SetText( theAction:GetItemColorInShop()..theAction:GetName() );
			else
				GOODS_DESCS[i]:SetText( theAction:GetName() );
			end

			local	nPrice	= NpcShop:EnumItemPrice( idx )
			if (g_tabIndex == ShopTabIdx.YuanBao) then
				GOOD_BAD[i]:SetText("Ԫ����" .. tostring(nPrice))
			elseif (g_tabIndex == 4) then
				--GOOD_BAD[i]:SetText("#{BDYB_090714_01}" .. tostring(nPrice))
				--GOOD_BAD[i]:SetText("���㣺" .. tostring(nPrice))
				GOOD_BAD[i]:SetText("Ԫ����" .. tostring(nPrice))
			elseif (g_tabIndex == ShopTabIdx.IMDress) then
				GOOD_BAD[i]:SetText("#{_EXCHG"..tostring(nPrice).."}")
			elseif (g_tabIndex == ShopTabIdx.Bind) then
				GOOD_BAD[i]:SetText("������" .. tostring(nPrice))
			end

			i = i+1;
		else
			GOODS_BUTTONS[i]:SetActionItem(-1);
			GOODS_DESCS[i]:SetText("");
			GOOD_BAD[i]:SetText("");
			i = i+1;
		end
		nActIndex = nActIndex+1;
	end


	if bHaveRide >= 1 then
		YuanbaoShop_Try:Show();		
	else
		YuanbaoShop_Try:Hide();	
	end

	if g_tabIndex == ShopTabIdx.GiftToken then
		if( nTotalPage == 1 ) then
			YuanbaoShop_UpPage_Fanquan:Hide();
			YuanbaoShop_DownPage_Fanquan:Hide();
			YuanbaoShop_CurrentlyPage_Fanquan:Hide();
		else
			YuanbaoShop_UpPage_Fanquan:Show();
			YuanbaoShop_DownPage_Fanquan:Show();
			YuanbaoShop_CurrentlyPage_Fanquan:Show();
	
			YuanbaoShop_UpPage_Fanquan:Enable();
			YuanbaoShop_DownPage_Fanquan:Enable();
	
			if ( nPageNum == nTotalPage ) then
				YuanbaoShop_DownPage_Fanquan:Disable();
			end
	
			if ( nPageNum == 1 ) then
				YuanbaoShop_UpPage_Fanquan:Disable()
			end
	
			YuanbaoShop_CurrentlyPage_Fanquan:SetText(tostring(nPageNum) .. "/" .. tostring(nTotalPage) );
		end
	else
		if( nTotalPage == 1 ) then
			YuanbaoShop_UpPage:Hide();
			YuanbaoShop_DownPage:Hide();
			YuanbaoShop_CurrentlyPage:Hide();
		else
			YuanbaoShop_UpPage:Show();
			YuanbaoShop_DownPage:Show();
			YuanbaoShop_CurrentlyPage:Show();
	
			YuanbaoShop_UpPage:Enable();
			YuanbaoShop_DownPage:Enable();
	
			if ( nPageNum == nTotalPage ) then
				YuanbaoShop_DownPage:Disable();
			end
	
			if ( nPageNum == 1 ) then
				YuanbaoShop_UpPage:Disable()
			end
	
			YuanbaoShop_CurrentlyPage:SetText(tostring(nPageNum) .. "/" .. tostring(nTotalPage) );
		end
	end
end
--���һ����ǩ
function YuanbaoShop_UpdateList(nIndex)

	if g_tabIndex == ShopTabIdx.GiftToken then
		YuanbaoShop_UpdateList_GiftToken(nIndex)
		return
	end

	--PushDebugMessage("YuanbaoShop_UpdateList:"..nIndex);
	if nIndex <1 or nIndex > 8 or ( nIndex == lastA and g_changeTabFlag == 0 ) then
		return
	end

	for i = 1 ,maxChildShop do
		SHOP_LIST_B[i]:Hide()
		if SHOP_LIST_A[nIndex].shoplist[i] ~= nil then
			SHOP_LIST_B[i]:SetText(SHOP_LIST_A[nIndex].shoplist[i])
			SHOP_LIST_B[i]:Show()
		end
	end
	SHOP_LIST_B[1]:SetCheck(1)
	lastB = 1
	lastA = nIndex
	lastSelect = 0

	UpdateShopItem( lastA ,lastB )
end
--�������
function YuanbaoShop_UpdateShop(nIndex)

	if g_tabIndex == ShopTabIdx.GiftToken then
		YuanbaoShop_UpdateShop_GiftToken(nIndex)
		return
	end

	--PushDebugMessage("YuanbaoShop_UpdateShop:"..nIndex.."lastB:"..lastB.."g_changeTabFlag:"..lastSelect);
	if nIndex <1 or nIndex > maxChildShop or ( nIndex == lastB and g_changeTabFlag == 0 ) then
		return
	end

	lastB = nIndex

	if lastSelect > 0 and lastSelect <= table.getn(SHOP_SEARCH_LIST) then
		UpdateShopItem( lastSelect+8 , lastB )
	elseif lastA > 0 and lastA < 9 then
		UpdateShopItem( lastA , lastB )
	else
		UpdateShopItem( 1 , 1)
	end
end
--����
function YuanbaoShop_BeginSearch()

	if ( YuanbaoShop_SearchMode_Bind : IsVisible( ) ) then
		YuanbaoShop_BeginSearch_Bind();
		return;
	end

	local str , nIndex = YuanbaoShop_SearchMode:GetCurrentSelect()

	if nIndex <1 or nIndex > table.getn(SHOP_SEARCH_LIST) then
		return
	end

	for i = 1 ,maxChildShop do
		SHOP_LIST_B[i]:Hide()
		if SHOP_SEARCH_LIST[nIndex][i] ~= nil then
			SHOP_LIST_B[i]:SetText(SHOP_SEARCH_LIST[nIndex][i])
			SHOP_LIST_B[i]:Show()
		end
	end

	SHOP_LIST_B[1]:SetCheck(1)
	lastB = 1
	lastA = 0
	lastSelect = nIndex

	for i = 1 ,8 do
		SHOP_LIST_A[i].btn:SetCheck(0)
	end

	UpdateShopItem( nIndex+8 , 1 )
end

-- ��Ԫ�� begin

--���һ����ǩ
function YuanbaoShop_UpdateList_Bind(nIndex)

	--PushDebugMessage("YuanbaoShop_UpdateList_Bind:"..nIndex);
	if nIndex < 1 or nIndex > 8 or ( nIndex == lastA_Bind and g_changeTabFlag == 0 ) then
		return
	end

	for i = 1 , maxChildShop do
		SHOP_LIST_B_BIND[i]:Hide()
		if SHOP_LIST_A_BIND[nIndex].shoplist[i] ~= nil then
			SHOP_LIST_B_BIND[i]:SetText(SHOP_LIST_A_BIND[nIndex].shoplist[i])
			SHOP_LIST_B_BIND[i]:Show()
		end
	end

	SHOP_LIST_B_BIND[1]:SetCheck(1)
	lastB_Bind = 1
	lastA_Bind = nIndex
	lastSelect_Bind = 0

	UpdateShopItem( lastA_Bind + 100 ,lastB_Bind )
end

--�������
function YuanbaoShop_UpdateShop_Bind(nIndex)
	if nIndex <1 or nIndex > maxChildShop or ( nIndex == lastB_Bind and g_changeTabFlag == 0 ) then
		return
	end

	lastB_Bind = nIndex
	UpdateShopItem( lastA_Bind + 100, nIndex )
end

--����
function YuanbaoShop_BeginSearch_Bind()

	local str , nIndex = YuanbaoShop_SearchMode_Bind:GetCurrentSelect()

	if nIndex <1 or nIndex > 8 then
		return
	end

	for i = 1 ,maxChildShop do
		SHOP_LIST_B_BIND[i]:Hide()
		if SHOP_SEARCH_LIST_BIND[nIndex][i] ~= nil then
			SHOP_LIST_B_BIND[i]:SetText(SHOP_SEARCH_LIST_BIND[nIndex][i])
			SHOP_LIST_B_BIND[i]:Show()
		end
	end

	SHOP_LIST_B_BIND[1]:SetCheck(1)
	lastB_Bind = 1
	lastA_Bind = 0
	lastSelect_Bind = nIndex

	for i = 1 ,8 do
		SHOP_LIST_A_BIND[i].btn:SetCheck(0)
	end

	UpdateShopItem( nIndex + 108 , 1 )
end

---------------------------------------- ��ȯ�̵� -------------------------------------------
--���һ����ǩ
function YuanbaoShop_UpdateList_GiftToken(nIndex)

	--PushDebugMessage("YuanbaoShop_UpdateList:"..nIndex);
	if nIndex <1 or nIndex > 8 or ( nIndex == lastA_GiftToken and g_changeTabFlag == 0 ) then
		return
	end

	for i = 1 ,maxChildShop do
		SHOP_LIST_B_GIFTTOKEN[i]:Hide()
		if SHOP_LIST_A_GIFTTOKEN[nIndex].shoplist[i] ~= nil then
			SHOP_LIST_B_GIFTTOKEN[i]:SetText(SHOP_LIST_A_GIFTTOKEN[nIndex].shoplist[i])
			SHOP_LIST_B_GIFTTOKEN[i]:Show()
		end
	end

	SHOP_LIST_B_GIFTTOKEN[1]:SetCheck(1)
	lastB_GiftToken = 1
	lastA_GiftToken = nIndex
	lastSelec_GiftTokent = 0

	UpdateShopItem( lastA_GiftToken + 200, lastB_GiftToken )
end
--�������
function YuanbaoShop_UpdateShop_GiftToken(nIndex)

	--PushDebugMessage("YuanbaoShop_UpdateShop:"..nIndex);
	if nIndex <1 or nIndex > maxChildShop or ( nIndex == lastB_GiftToken and g_changeTabFlag == 0 ) then
		return
	end

	lastB_GiftToken = nIndex

	if lastSelect_GiftToken > 0 and lastSelect_GiftToken <= table.getn(SHOP_SEARCH_LIST_GIFTTOKEN) then
		UpdateShopItem( lastSelect_GiftToken+208 , lastB_GiftToken )
	elseif lastA_GiftToken > 0 and lastA_GiftToken < table.getn(SHOP_LIST_A_GIFTTOKEN) then
		UpdateShopItem( lastA_GiftToken + 200, lastB_GiftToken )
	else
		UpdateShopItem(201 , 1)
	end
end
--����
function YuanbaoShop_BeginSearch_GiftToken()

	lastB_GiftToken = 1
	lastA_GiftToken = 0
	lastSelect_GiftToken = 0
end
---------------------------------------- ��ȯ�̵� ���� -------------------------------------------

--vip �����ʾ 
function YuanbaoShop_UpdateShop_VIP(nIndex)


	  GOODS_BUTTONS_vip[1]:SetText("#{FFSDGZ_120615_06}")
	  GOODS_BUTTONS_vip[1]:Disable()	
	  GOODS_BUTTONS_vip[2]:SetText("#{FFSDGZ_120615_08}")
	  GOODS_BUTTONS_vip[2]:Disable()	
 for i = 3,6 do
 GOODS_BUTTONS_vip[i]:Hide()
 end
	
	local U={}
	U[1]={4000,100}
	U[2]={8000,100}
	U[3]={20000,100}
	U[4]={40000,100}
	U[5]={80000,100}
	U[6]={120000,100}
	U[7]={2000000,100}

	if  vipa <= 0 then
            YuanbaoShop_Bk1_VIP_test1:SetText("#cfff263��ǰVIP�ȼ���0��")
            YuanbaoShop_Bk1_VIP_test2:SetText("#cfff263����δ�ﵽ#G�������˲�VIP1��#cfff263���޷����������̵��ڵĵ��ߡ�")
	    YuanbaoShop_Bk1_VIPexp:SetToolTip("�˺������н�ɫֻ���ٳ�ֵ"..tonumber((U[vipa+1][1] - mypoint)).."Ԫ�������ɽ������������˲�VIP�ȼ�������1����")
            YuanbaoShop_Bk1_VIPexp:SetProgress(tonumber((mypoint/U[vipa+1][1])*100),100)
        end

	if  vipa > 0 and vipa <= 2 then 
        YuanbaoShop_Bk1_VIP_test1:SetText("#cfff263��ǰVIP�ȼ���"..vipa.."��")
        YuanbaoShop_Bk1_VIP_test2:SetText("#{FFSDGZ_120615_82}")
        local xiezipoint = tonumber((U[vipa+1][1] - mypoint)) 
	if  vipa >=1 and vipa < 2 then 
	    YuanbaoShop_Bk1_VIPexp:SetToolTip("����ǰ��ֵ�ȼ�ΪVIP"..vipa.."#r������һ����Ҫ��ֵ"..xiezipoint.."Ԫ��")
        local aaaa = mypoint - U[vipa][1]
		
	    YuanbaoShop_Bk1_VIPexp:SetProgress(tonumber((aaaa/U[vipa+1][1])*100),100)	
        elseif vipa >= 2 then
	    YuanbaoShop_Bk1_VIPexp:SetToolTip("����ǰ��ֵ�ȼ�ΪVIP"..vipa.."#r�Ѵﵽ��ߵȼ�VIP")
	    YuanbaoShop_Bk1_VIPexp:SetProgress(tonumber(100),100)	
        end
	for o = 1 ,vipa do 	
	GOODS_BUTTONS_vip[o]:Enable()
	end
        elseif vipa <= 0 then
            local xiezipoint = tonumber( U[1][1] - mypoint ) 
	    YuanbaoShop_Bk1_VIPexp:SetToolTip("����ǰ��ֵ�ȼ���δ�ﵽVIP#r������VIP1������Ҫ��ֵ"..xiezipoint.."Ԫ��")
	    YuanbaoShop_Bk1_VIPexp:SetProgress(0, 100)
	end	
	if nIndex <1 or nIndex > maxChildShop or ( nIndex == lastB_VIP and g_changeTabFlag == 0 ) then
		return
	end
	    lastB_VIP = nIndex
		UpdateShopItem( 101, nIndex )
end	


--���ò˵�����ʾ����
function YuanbaoShop_UpdateVisiableProperty(shopAList, shopBList, searchList, lastA, lastB, lastSelect)
	if (shopAList == nil or shopBList == nil or searchList == nil) then
		return
	end
	local findA = 0
	for i=1, table.getn(shopAList) do
		if (table.getn(shopAList[i].shoplist) > 0) then
			shopAList[i].btn : SetText(shopAList[i].shopname)
			shopAList[i].btn : SetToolTip(shopAList[i].tooltips)
			shopAList[i].btn : Show()
			if (i == lastA) then
				findA = i
			end
		else
			shopAList[i].btn : Hide()
		end
	end
	if (findA > 0) then
		shopAList[lastA].btn : SetCheck(1)
		for j = 1, table.getn(shopBList) do
			shopBList[j] : Hide()
			if shopAList[lastA].shoplist[j] ~= nil then
				shopBList[j] : SetText(shopAList[lastA].shoplist[j])
				shopBList[j] : Show()
				if j == lastB then
					shopBList[j] : SetCheck(1)
				end
			end
		end
	elseif lastSelect > 0 and lastSelect <= table.getn(searchList) then
		for i = 1 ,table.getn(shopAList) do
			shopAList[i].btn:SetCheck(0)
		end
		for i = 1 ,table.getn(shopBList) do
			shopBList[i]:Hide()
			if searchList[lastSelect][i] ~= nil then
				shopBList[i]:SetText(searchList[lastSelect][i])
				shopBList[i]:Show()
			end
		end
		shopBList[lastB]:SetCheck(1)
	end
end

function YuanbaoShop_ChangeTabIndex( nIndex ) --��ҳ
	if g_IsEnableFanQuanShop == 0 then
		if (nIndex == ShopTabIdx.GiftToken) then --�رշ�ȯ�̵�
			return
		end
	end
	
	if ( nIndex == g_tabIndex ) then
		return
	end

	g_changeTabFlag = 1
	g_tabIndex = nIndex

	YuanbaoShop_Bk1_Bind : Hide();
	YuanbaoShop_Bk2_Bind : Hide();
	YuanbaoShop_SearchMode_Bind : Hide();
	YuanbaoShop_Bk1 : Hide();
	YuanbaoShop_Bk2 : Hide();
	YuanbaoShop_SearchMode : Hide();
--	YuanbaoShop_Try : Disable()
--	YuanbaoShop_MBuy : Disable()
--	YuanbaoShop_Gift : Disable()
	YuanbaoShop_UpPage : Hide()
	YuanbaoShop_CurrentlyPage : Hide()
	YuanbaoShop_DownPage : Hide()

	YuanbaoShop_Text1 : Hide();
	YuanbaoShop_Begin : Hide();

	YuanbaoShop_Text2 : Hide();
	YuanbaoShop_Text2_Bind : Hide();

	YuanbaoShop_Bk3 : Hide();
	YuanbaoShop_Bk4 : Hide();
YuanbaoShop_Bk3_VIP: Hide()
--	YuanbaoShop_Bk1_VIP : Hide()
--	YuanbaoShop_Bk1_Fanquan : Hide()
--	YuanbaoShop_BK_PS_Text : Hide()
	YuanbaoShop_BK_PS : Hide()
	YuanbaoShop_Bk : Hide();

	YuanbaoShop_Lijin_Text2 : Hide();
--	YuanbaoShop_Lijin_Text1 : Hide();
	YuanbaoShop_Lijin_bK : Hide();
--	if SystemSetup:IsClassic() == 1 then	--	�����
		YuanbaoShop_Text:SetText("#{YBSD_081225_073}")
--	else
--		YuanbaoShop_titleimage:SetProperty("Image", "set:WM_YBShop2 image:YuanBaoTitle_YBShop")
--	end

	YuanbaoShop_Duihuan : Show()

	if( nIndex ==  ShopTabIdx.YuanBao ) then
		YuanbaoShop_Bk3_VIP: Hide()
		YuanbaoShop_Bk1_VIP : Hide()
		YuanbaoShop_Bk : Show();
		YuanbaoShop_Bk1 : Show();
		YuanbaoShop_Bk2 : Show();
		YuanbaoShop_SearchMode : Show();

		YuanbaoShop_Text1 : Show();
		YuanbaoShop_Begin : Show();

		YuanbaoShop_Text2 : Show();
--		YuanbaoShop_Gift  : Enable();
		--YuanbaoShop_Dis : Show();
		--YuanbaoShop_Dis2 : SetText("#{YBSD_081225_072}");
		--YuanbaoShop_Dis2 : SetToolTip("#{YBSD_081225_097}");
		--YuanbaoShop_Dis2 : Show();
		--YuanbaoShop_Dis3 : Show();
--		YuanbaoShop_Try : Enable()
--		YuanbaoShop_MBuy : Enable()
		YuanbaoShop_UpPage : Show()
		YuanbaoShop_CurrentlyPage : Show()
		YuanbaoShop_DownPage : Show()


		YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A, SHOP_LIST_B, SHOP_SEARCH_LIST, lastA, lastB, lastSelect)
		YuanbaoShop_Bk3 : Show();
		local check  = tonumber(NpcShop:GetBuyDirectly());
		if(check>=1)then
			YuanbaoShop_querengoumai:SetCheck(0);
		else
			YuanbaoShop_querengoumai:SetCheck(1);
		end

		YuanbaoShop_UpdateShop( lastB );

	elseif( nIndex ==  ShopTabIdx.Bind ) then
		YuanbaoShop_Bk : Show();
		YuanbaoShop_Bk1_Bind : Show();
		YuanbaoShop_Bk2_Bind : Show();

		YuanbaoShop_Text2_Bind : Show();

		YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A_BIND, SHOP_LIST_B_BIND, SHOP_SEARCH_LIST_BIND, lastA_Bind, lastB_Bind, lastSelect_Bind)
		YuanbaoShop_Bk4 : Show();
--		YuanbaoShop_MBuy : Enable()
		local check  = tonumber(NpcShop:GetBuyDirectly());
		if(check>=1)then
			YuanbaoShop_querengoumaiBind:SetCheck(0);
		else
			YuanbaoShop_querengoumaiBind:SetCheck(1);
		end

		YuanbaoShop_UpdateShop_Bind( lastB );
	elseif( nIndex ==  ShopTabIdx.GiftToken ) then
		YuanbaoShop_Bk_Fanquan : Show()
		YuanbaoShop_Bk1 : Show();
		YuanbaoShop_Bk2 : Show();
		YuanbaoShop_Text2 : Show();
		YuanbaoShop_Bk3 : Show();
		--�����̵����
		YuanbaoShop_Bk : Show();
		YuanbaoShop_Try : Enable()
		YuanbaoShop_MBuy : Enable()
		local check  = tonumber(NpcShop:GetBuyDirectly());
		if(check>=1)then
			YuanbaoShop_querengoumai:SetCheck(0);
		else
			YuanbaoShop_querengoumai:SetCheck(1);
		end

		if ( lastB_GiftToken == 0 ) then
			YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A_GIFTTOKEN, SHOP_LIST_B_GIFTTOKEN, SHOP_SEARCH_LIST_GIFTTOKEN, 1, 1, 0)
			YuanbaoShop_UpdateList_GiftToken( 1 );
		else
			YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A_GIFTTOKEN, SHOP_LIST_B_GIFTTOKEN, SHOP_SEARCH_LIST_GIFTTOKEN, lastA_GiftToken, lastB_GiftToken, lastSelect_GiftToken)
			YuanbaoShop_UpdateShop_GiftToken( lastB_GiftToken );
		end
		
	elseif (nIndex == ShopTabIdx.VipShop) then 	
	
	if  vipa < 1 then
	PushDebugMessage("������vip�û��޷������Ա��Ʒ")
	YuanbaoShop_ChangeTabIndex(ShopTabIdx.YuanBao)
	return
	end
	YuanbaoShop_Bk3_VIP: Show()
	YuanbaoShop_Bk1_VIP : Show()
	YuanbaoShop_Bk : Show();
    YuanbaoShop_UpdateShop_VIP( 1 );
	
	elseif (nIndex == ShopTabIdx.IMDress) then
		PushEvent("OPEN_IMDRESS_YUANBAOSHOP", tostring(nIndex), YuanbaoShop_Frame:GetProperty("UnifiedXPosition"), YuanbaoShop_Frame:GetProperty("UnifiedYPosition"))
	end

end

--�Դ�
function YuanbaoShop_OpenFitting()
	if IsIdleLogic() ~= 1 then
		SetNotifyTip("#{YBSD_081225_100}");
		return 0;
	end
	
	if(IsWindowShow("Shop_Fitting")) then
		CloseWindow("Shop_Fitting", true);
	end
	RestoreShopFitting();
	this:Show();	
	MouseCmd_ShopFittingSet();
	SetNotifyTip("#{YBSD_081225_099}");
end
--�����̵���Ϣ
function UpdateShopItem( shopA , shopB)

	--PushDebugMessage("shopA:"..shopA..",shopB:"..shopB );
	g_changeTabFlag = 0

	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OpenYuanbaoShop");
		Set_XSCRIPT_ScriptID(888902);
		Set_XSCRIPT_Parameter(0,ObjCared);
		Set_XSCRIPT_Parameter(1,shopA);
		Set_XSCRIPT_Parameter(2,shopB);
		Set_XSCRIPT_ParamCount(3);
	Send_XSCRIPT();
end
--===============================================
-- Button_Clicked
--===============================================
function YuanbaoShop_GoodButton_Clicked(nIndex)
	if(nIndex < 1 or nIndex > 18) then
		return;
	end
	GOODS_BUTTONS[nIndex]:DoAction();
end
--===============================================
-- PageUp
--===============================================
function YuanbaoShop_PageUp()
	curPage = nPageNum - 1;
	if ( curPage >= maxPage ) then
		curPage = maxPage;
	end
	NpcShop:CloseConfirm();
	YuanbaoShop_UpdatePage( curPage );
end

--===============================================
-- PageDown
--===============================================
function YuanbaoShop_PageDown()
	curPage = nPageNum + 1;
	if ( curPage < 0 )  then
		curPage = 0;
	end
	NpcShop:CloseConfirm();
	YuanbaoShop_UpdatePage( curPage );
end

--===============================================
-- Close
--===============================================
function YuanbaoShop_Close()
	ObjCared = -1
	this:CareObject(objCared, 0, "YuanbaoShop");
	if(IsWindowShow("Shop_Fitting")) then
		CloseWindow("Shop_Fitting", true);
	end
	if(IsWindowShow("YBShopReference")) then
		CloseWindow("YBShopReference",true)
	end
	SetDefaultMouse();
	CloseBooth();
	NpcShop:CloseConfirm();
	RestoreShopFitting();
	this:Hide();
end

--�������
function YuanbaoShop_Order()
	local	max		= g_nTotalNum;
	local oldt	= {};
	g_tOrderPool= {};

	for i = 1, tonumber(max) do
	  oldt[i] = i-1;
	end

	if tonumber(NpcShop:GetIsShopReorder()) == 0 then
		g_tOrderPool		= oldt;
	else
		for i = 1, table.getn(oldt) do
		 local idx	= math.random(1, table.getn(oldt));
		 local val	= oldt[idx];
		 g_tOrderPool[i]= val;
		 table.remove(oldt, idx);
		end
	end
end



--ȷ�ϰ�ť
function YuanbaoShop_querengoumai_Clicked()
	if(NpcShop:GetBuyDirectly() == 0)then
		YuanbaoShop_querengoumai:SetCheck(0);
		NpcShop:SetBuyDirectly(1);
	else
	YuanbaoShop_querengoumai:SetCheck(1);
		NpcShop:SetBuyDirectly(0);
	end
end

--ȷ�ϰ�ť
function YuanbaoShop_querenzhifu_Clicked()

end

--���ٳ�ֵ
function YuanbaoShop_web_Clicked()
	GameProduceLogin:OpenURL("https://shop140320700.taobao.com/")	
end

--Ŀ¼�Ͳ���˵��
function YuanbaoShop_Dis_Clicked()
	OpenYBShopReference("#{YBSD_081225_070}")
end
--Ԫ���̵�ʹ��˵��
function YuanbaoShop_Dis2_Clicked()
    if g_tabIndex == ShopTabIdx.GiftToken then
    	OpenYBShopReference("#{FQ_101210_08}")
    else
    	OpenYBShopReference("#{YBSD_081225_098}")
    end
	
end
--�����̵�ʹ��˵��
function YuanbaoShop_Dis3_Clicked()
	OpenYBShopReference("#{SMSD_100127_01}")
end

--������Ϣ˳���������
function YubanbaoShop_ADRandom()
	YuanbaoShop_ScrollInfo_Frame:ClearInfo()

	local ADInfo = {
				"#{YBSD_081225_093}",
				"#{YBSD_081225_094}",
				"#{YBSD_081225_095}",
				"#{FQ_101210_25}",
			}
	local nADInfoNum = table.getn(ADInfo)
	if (nil == nADInfoNum or nADInfoNum < 1 or nADInfoNum > 4) then
		nADInfoNum = 4
	end

	for i = 0 ,2 do
		local idx = math.random(1 ,nADInfoNum - i)
		local str = ADInfo[idx]
		ADInfo[idx] = ADInfo[nADInfoNum - i]
		ADInfo[nADInfoNum - i] = str
	end

	for i = 1 ,nADInfoNum do
		YuanbaoShop_ScrollInfo_Frame:SetScrollInfoFixed(ADInfo[i])
	end

end

function YuanbaoShop_ResetPos()
	YuanbaoShop_Frame:SetProperty("UnifiedXPosition", g_YuanbaoShop_Frame_UnifiedXPosition);
	YuanbaoShop_Frame:SetProperty("UnifiedYPosition", g_YuanbaoShop_Frame_UnifiedYPosition);
end



function YuanbaoShop_PlayCardChangePage(nPageNum)
	g_PlayCard_CurPage = nPageNum
	if nPageNum <= 0 or nPageNum > g_PlayCard_MaxPage then
		return
	end
	YuanbaoShop_Image:SetProperty("NormalImage", g_PlayCard_Image[nPageNum])
	YuanbaoShop_Image:SetProperty("HoverImage", g_PlayCard_Image[nPageNum])
	YuanbaoShop_Image:SetProperty("DisabledImage", g_PlayCard_Image[nPageNum])
	YuanbaoShop_Image:SetProperty("PushedImage", g_PlayCard_Image[nPageNum])
	g_PlayCard_CtlButton[nPageNum]:SetCheck(1)
	KillTimer("YuanbaoShop_PlayCardTimer()")
	SetTimer("YuanbaoShop", "YuanbaoShop_PlayCardTimer()", 5000)
end

function YuanbaoShop_PlayCardTimer()
	g_PlayCard_CurPage = g_PlayCard_CurPage + 1
	if g_PlayCard_CurPage > g_PlayCard_MaxPage then
		g_PlayCard_CurPage = 1
	end
	YuanbaoShop_PlayCardChangePage(g_PlayCard_CurPage)
end

function YuanbaoShop_ImageClicked()
      --  PushDebugMessage("��������")   --���Ⱑ ��
		PushEvent("UI_COMMAND",2001)
end
function YuanbaoShop_HelpBtn_Clicked()
	if (g_tabIndex == ShopTabIdx.YuanBao) then
		OpenYBShopReference("#{YBSD_081225_098}")
	elseif (g_tabIndex == ShopTabIdx.Bind) then
		OpenYBShopReference("yuanbao")
	elseif (g_tabIndex == ShopTabIdx.GiftToken) then
		OpenYBShopReference("#{FQ_101210_08}")
	elseif (g_tabIndex == ShopTabIdx.VipShop) then
		OpenYBShopReference("#{FFSDGZ_120615_85}")
	elseif (g_tabIndex == ShopTabIdx.Lijin) then
		OpenYBShopReference("#{TBSD_130816_6}")
	end

end

function YuanbaoShop_Lijin_Load()
	--��������
	SHOP_LIST_A_LIJIN[1] = {btn = YuanbaoShop_Button1, shopname="#{LJSD_120508_09}", tooltips="#{YBSD_081225_083}", shoplist={},shoplisttips = {}}
	SHOP_LIST_A_LIJIN[1].shoplist[1] = "#{LJSD_120508_10}"	--"��Ʒ�ϼ�"
	SHOP_LIST_A_LIJIN[1].shoplist[8] = "#{LJSD_120508_11}"	--"�������"

	--���ʯ��
	SHOP_LIST_A_LIJIN[2] = {btn = YuanbaoShop_Button2, shopname="#{LJSD_120508_12}", tooltips="#{YBSD_081225_084}", shoplist={},shoplisttips = {}}
	SHOP_LIST_A_LIJIN[2].shoplist[1] = "#{LJSD_120508_13}"	--"����ͨ��ի"
	SHOP_LIST_A_LIJIN[2].shoplist[2] = "#{TBSD_130816_1}"	--"�ļ�ͨ��ի"
	SHOP_LIST_A_LIJIN[2].shoplist[3] = "#{TBSD_130816_2}"	--"�弶ͨ��ի"
	SHOP_LIST_A_LIJIN[2].shoplist[4] = "#{TBSD_130816_3}"	--"����ͨ��ի"
	SHOP_LIST_A_LIJIN[2].shoplist[5] = "#{TBSD_130816_4}"	--"�߼�ͨ��ի"
	SHOP_LIST_A_LIJIN[2].shoplist[6] = "#{LJSD_120508_14}"	--"��ʯ�ӹ���"

	--������޵�
	SHOP_LIST_A_LIJIN[3] = {btn = YuanbaoShop_Button3, shopname="#{LJSD_120508_19}", tooltips="#{YBSD_081225_085}", shoplist={},shoplisttips = {}}
	SHOP_LIST_A_LIJIN[3].shoplist[1] = "#{LJSD_120508_20}"	--"���ްٱ���"

	--��������
	SHOP_LIST_A_LIJIN[4] = {btn = YuanbaoShop_Button4, shopname="#{LJSD_120508_15}", tooltips="#{YBSD_081225_086}", shoplist={},shoplisttips = {}}
	SHOP_LIST_A_LIJIN[4].shoplist[1] = "#{LJSD_120508_16}"	--"�ɵ���ҩ"
	SHOP_LIST_A_LIJIN[4].shoplist[2] = "#{LJSD_120508_17}"	--"�����챦"
	SHOP_LIST_A_LIJIN[4].shoplist[3] = "#{YBSD_XML_8}"	    --"���ߵ��Ƶ�"
	SHOP_LIST_A_LIJIN[4].shoplist[4] = "#{YBSD_XML_9}"	    --"��ߵ��Ƶ�"
	SHOP_LIST_A_LIJIN[4].shoplist[5] = "#{SSXDW_140819_75}"	    --"��ߵ��Ʒ�"
	SHOP_LIST_A_LIJIN[4].shoplist[6] = "#{YBSD_XML_10}"	    --"���Ƽӹ���"

	SHOP_LIST_A_LIJIN[5] = {btn = YuanbaoShop_Button5 , shoplist = {}, shoplisttips = {}}
	SHOP_LIST_A_LIJIN[6] = {btn = YuanbaoShop_Button6 , shoplist = {}, shoplisttips = {}}
	SHOP_LIST_A_LIJIN[7] = {btn = YuanbaoShop_Button7 , shoplist = {}, shoplisttips = {}}
	SHOP_LIST_A_LIJIN[8] = {btn = YuanbaoShop_Button8 , shoplist = {}, shoplisttips = {}}

	--�����̵�
	SHOP_LIST_B_LIJIN[1] = YuanbaoShop_Button01
	SHOP_LIST_B_LIJIN[2] = YuanbaoShop_Button02
	SHOP_LIST_B_LIJIN[3] = YuanbaoShop_Button03
	SHOP_LIST_B_LIJIN[4] = YuanbaoShop_Button04
	SHOP_LIST_B_LIJIN[5] = YuanbaoShop_Button05
	SHOP_LIST_B_LIJIN[6] = YuanbaoShop_Button06
	SHOP_LIST_B_LIJIN[7] = YuanbaoShop_Button07
	SHOP_LIST_B_LIJIN[8] = YuanbaoShop_Button08

	if lastA ~= nil and lastA > 0 and lastA < table.getn(SHOP_LIST_A_LIJIN)+1 then
		SHOP_LIST_A_LIJIN[lastA].btn:SetCheck(1)
	end

	if lastB ~= nil and lastB > 0 and lastB < table.getn(SHOP_LIST_B_LIJIN)+1 then
		SHOP_LIST_B_LIJIN[lastB]:SetCheck(1)
	end

	for i =1 ,table.getn(SHOP_LIST_B_LIJIN) do
		SHOP_LIST_B_LIJIN[i]:Hide()
	end

	SHOP_SEARCH_LIST_LIJIN[1] = {}
end

function YuanbaoShop_Lijin_Show()

		YuanbaoShop_Bk1 : Show();
		YuanbaoShop_Bk2 : Show();
		YuanbaoShop_Bk3 : Show();
		YuanbaoShop_Duihuan : Hide()


		local check  = tonumber(NpcShop:GetBuyDirectly());
		if(check>=1)then
			YuanbaoShop_querengoumai:SetCheck(0);
			NpcShop:SetLiJinBuyDirectly(1)
		else
			YuanbaoShop_querengoumai:SetCheck(1);
--		YuanbaoShop_Lijin_Text2:SetText("#{LJSD_120508_08}"..tostring(Player:GetData("LIJIN")))
--		if SystemSetup:IsClassic() == 1 then	--	�����
			YuanbaoShop_Text:SetText("#{TBSD_130816_7}")
	--	else	--	Ψ��
	--		YuanbaoShop_titleimage:SetProperty("Image", "set:WM_YBShop2 image:YuanBaoTitle_HongliShop")
	--	end

		if ( (lastB_Lijin == 0) or (SHOP_LIST_A_LIJIN[lastA_Lijin].shoplist[lastB_Lijin] == nil)) then
			YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A_LIJIN, SHOP_LIST_B_LIJIN, SHOP_SEARCH_LIST_LIJIN, 1, 1, 0)
			YuanbaoShop_UpdateList_Lijin( 1 );
		else
			NpcShop:SetLiJinBuyDirectly(0)
		end

--		YuanbaoShop_Lijin_Text2 : Show();
--		YuanbaoShop_Lijin_Text1 : Show();
--		YuanbaoShop_Lijin_bK : Show();
			YuanbaoShop_UpdateVisiableProperty(SHOP_LIST_A_LIJIN, SHOP_LIST_B_LIJIN, SHOP_SEARCH_LIST_LIJIN, lastA_Lijin, lastB_Lijin, 0)
		  YuanbaoShop_UpdateShop_Lijin( lastB_Lijin );
		end
end	
	
function YuanbaoShop_DuiHuanClicked()
        Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("DuiHuan_GN");

		Set_XSCRIPT_ScriptID(181000);

		Set_XSCRIPT_Parameter(0,1);
		Set_XSCRIPT_ParamCount( 1 );				-- ��������
	    Send_XSCRIPT()   
end
