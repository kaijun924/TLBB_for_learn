local CU_MONEY			= 1	-- Ǯ
local CU_GOODBAD		= 2	-- �ƶ�ֵ
local CU_MORALPOINT	= 3	-- ʦ�µ�
local CU_TICKET			= 4 -- ��ƱǮ
local CU_YUANBAO		= 5	-- Ԫ��
local CU_ZENGDIAN		= 6 -- ����
local CU_MENPAI_POINT	= 7 -- ʦ�Ź��׶�
local CU_MONEYJZ		= 8 -- ����
local CU_BIND_YUANBAO	= 9 -- ��Ԫ��
local CU_GIFTTOKEN	= 10 -- ��ȯ
local g_pos1;
local g_pos2;
local g_PurpleColor = "#c9107e1";
local g_BlueColor   = "#c00ccff";
local g_YellowColor = "#cfeff95";
local g_GreenColor	= "#c5bc257";
local g_Stars;
local szPropertys=nil
g_ExpTbl = {
[0] =0,[1] =0,[2] =0,[3] =0,[4] =0,
[5] =0,[6] =0,[7] =0,[8] =0,[9] =42,
[10] =50,[11] =58,[12] =66,[13] =74,[14] =82,
[15] =90,[16] =98,[17] =106,[18] =114,[19] =122,
[20] =130,[21] =140,[22] =150,[23] =160,[24] =170,
[25] =180,[26] =190,[27] =200,[28] =210,[29] =220,
[30] =230,[31] =242,[32] =254,[33] =266,[34] =278,
[35] =290,[36] =302,[37] =314,[38] =326,[39] =338,
[40] =350,[41] =365,[42] =380,[43] =395,[44] =410,
[45] =425,[46] =440,[47] =455,[48] =470,[49] =485,
[50] =500,[51] =518,[52] =536,[53] =554,[54] =572,
[55] =590,[56] =608,[57] =626,[58] =644,[59] =662,
[60] =680,[61] =700,[62] =720,[63] =740,[64] =760,
[65] =780,[66] =800,[67] =820,[68] =840,[69] =860,
[70] =880,[71] =902,[72] =924,[73] =946,[74] =968,
[75] =990,[76] =1012,[77] =1034,[78] =1056,[79] =1078,
[80] =1100,[81] =1125,[82] =1150,[83] =1175,[84] =1200,
[85] =1225,[86] =1250,[87] =1275,[88] =1300,[89] =1325,
[90] =1350,[91] =1380,[92] =1410,[93] =1440,[94] =1470,
[95] =1500,[96] =1530,[97] =1560,[98] =1590,[99] =1620,
}
Wuhunkey = {["0"]=0,["q"]=1,["w"]=2,["e"]=3,["r"]=4,["t"]=5,["y"]=6,["u"]=7,["i"]=8,["o"]=9,["p"]=10,["a"]=11,["s"]=12,["d"]=13,["f"]=14,["g"]=15,["h"]=16,["j"]=17,["k"]=18,["l"]=19,["z"]=20,["x"]=21,["c"]=22,["v"]=23,["b"]=24,["n"]=25,["m"]=26}
Kfs_Magic_tips = {[0]="" , "#{WH_xml_XX(56)}","#{WH_xml_XX(57)}","#{WH_xml_XX(58)}","#{WH_xml_XX(59)}"}
xSrtong = {
[0] = { Tooltip = "��������" },
[1] = { Tooltip = "����" },
[2] = { Tooltip = "������" },
[3] = { Tooltip = "˫����" },
[4] = { Tooltip = "������" },
[5] = { Tooltip = "ǹ����" },
[6] = { Tooltip = "����" },
[7] = { Tooltip = "����" },
[8] = { Tooltip = "������" },
[9] = { Tooltip = "�｣��" },
[10] = { Tooltip = "����" },
[11] = { Tooltip = "����" },
[12] = { Tooltip = "��ָ" },
[13] = { Tooltip = "����" },
[14] = { Tooltip = "����" },
[15] = { Tooltip = "����" },
[16] = { Tooltip = "���1" },
[17] = { Tooltip = "����" },
[18] = { Tooltip = "Ь" },
[19] = { Tooltip = "ñ��" },
[20] = { Tooltip = "����" },
[21] = { Tooltip = "�·�" },
[22] = { Tooltip = "����" },
}

xSrtong5 = {
[1] = { Tooltip = "����" },
[2] = { Tooltip = "������" },
[3] = { Tooltip = "˫����" },
[4] = { Tooltip = "������" },
[5] = { Tooltip = "ǹ����" },
[6] = { Tooltip = "����" },
[7] = { Tooltip = "����" },
[8] = { Tooltip = "������" },
[9] = { Tooltip = "�｣��" },
}

local sdl = 0;
local sldjbsx1={44,88,132,168,220,264,308,352,396,440,484,528,572,616,660,704,748,792,836,880}--���������⹦��
local sldjbsx2={20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400}--���ԣ���������������
local sldjbsx3={10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200}--���ԣ�������������
local sldjbsx4={599,1198,1797,2396,2995,3594,4193,4792,5391,5990,6589,7188,7787,8386,8985,9584,10183,10782,11381,11980}--Ѫ����
local sldjbsx5={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}--���ʣ������顢�塢������
local sldjbsx={10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200}--���ʣ������顢�塢������
local g_zhenfa = {"��Ԫ��","�츲��","������","������"}
local g_zhenyuantype = {"����","����","����","����","��","Ѫ����","������","�ڹ�����","�⹦����","�ڹ�����","�⹦����","����","����","����","���","������","�𹥻�","������","������"}
local g_zhenyuanpoint = {10,10,10,10,10,1000,1000,200,200,100,100,100,80,3,2,15,15,15,15}

local g_petequip = {"#cffcc99Ы39975111","#cffcc99Ы39975112","#cffcc99Ы39975113","#cffcc99Ы39975114","#cffcc99Ы39975115","#cffcc99Ы39975121","#cffcc99Ы39975122","#cffcc99Ы39975123","#cffcc99Ы39975124","#cffcc99Ы39975125","#cffcc99Ы39975131","#cffcc99Ы39975132","#cffcc99Ы39975133","#cffcc99Ы39975134","#cffcc99Ы39975135","#cffcc99Ы39975141","#cffcc99Ы39975142","#cffcc99Ы39975143","#cffcc99Ы39975144","#cffcc99Ы39975145","#cffcc99Ы39975151","#cffcc99Ы39975152","#cffcc99Ы39975153","#cffcc99Ы39975154","#cffcc99Ы39975155","#cffcc99Ы39975161","#cffcc99Ы39975162","#cffcc99Ы39975163","#cffcc99Ы39975164","#cffcc99Ы39975165","#cffcc99Ы39975211","#cffcc99Ы39975212","#cffcc99Ы39975213","#cffcc99Ы39975214","#cffcc99Ы39975215","#cffcc99Ы39975221","#cffcc99Ы39975222","#cffcc99Ы39975223","#cffcc99Ы39975224","#cffcc99Ы39975225","#cffcc99Ы39975231","#cffcc99Ы39975232","#cffcc99Ы39975233","#cffcc99Ы39975234","#cffcc99Ы39975235","#cffcc99Ы39975241","#cffcc99Ы39975242","#cffcc99Ы39975243","#cffcc99Ы39975244","#cffcc99Ы39975245","#cffcc99Ы39975251","#cffcc99Ы39975252","#cffcc99Ы39975253","#cffcc99Ы39975254","#cffcc99Ы39975255","#cffcc99Ы39975261","#cffcc99Ы39975262","#cffcc99Ы39975263","#cffcc99Ы39975264","#cffcc99Ы39975265","#cffcc99Ы39975311","#cffcc99Ы39975312","#cffcc99Ы39975313","#cffcc99Ы39975314","#cffcc99Ы39975315","#cffcc99Ы39975321","#cffcc99Ы39975322","#cffcc99Ы39975323","#cffcc99Ы39975324","#cffcc99Ы39975325","#cffcc99Ы39975331","#cffcc99Ы39975332","#cffcc99Ы39975333","#cffcc99Ы39975334","#cffcc99Ы39975335","#cffcc99Ы39975341","#cffcc99Ы39975342","#cffcc99Ы39975343","#cffcc99Ы39975344","#cffcc99Ы39975345","#cffcc99Ы39975351","#cffcc99Ы39975352","#cffcc99Ы39975353","#cffcc99Ы39975354","#cffcc99Ы39975355","#cffcc99Ы39975361","#cffcc99Ы39975362","#cffcc99Ы39975363","#cffcc99Ы39975364","#cffcc99Ы39975365","#cffcc99Ы39985111","#cffcc99Ы39985112","#cffcc99Ы39985113","#cffcc99Ы39985114","#cffcc99Ы39985115","#cffcc99Ы39985121","#cffcc99Ы39985122","#cffcc99Ы39985123","#cffcc99Ы39985124","#cffcc99Ы39985125","#cffcc99Ы39985131","#cffcc99Ы39985132","#cffcc99Ы39985133","#cffcc99Ы39985134","#cffcc99Ы39985135","#cffcc99Ы39985141","#cffcc99Ы39985142","#cffcc99Ы39985143","#cffcc99Ы39985144","#cffcc99Ы39985145","#cffcc99Ы39985151","#cffcc99Ы39985152","#cffcc99Ы39985153","#cffcc99Ы39985154","#cffcc99Ы39985155","#cffcc99Ы39985161","#cffcc99Ы39985162","#cffcc99Ы39985163","#cffcc99Ы39985164","#cffcc99Ы39985165","#cffcc99Ы39985211","#cffcc99Ы39985212","#cffcc99Ы39985213","#cffcc99Ы39985214","#cffcc99Ы39985215","#cffcc99Ы39985221","#cffcc99Ы39985222","#cffcc99Ы39985223","#cffcc99Ы39985224","#cffcc99Ы39985225","#cffcc99Ы39985231","#cffcc99Ы39985232","#cffcc99Ы39985233","#cffcc99Ы39985234","#cffcc99Ы39985235","#cffcc99Ы39985241","#cffcc99Ы39985242","#cffcc99Ы39985243","#cffcc99Ы39985244","#cffcc99Ы39985245","#cffcc99Ы39985251","#cffcc99Ы39985252","#cffcc99Ы39985253","#cffcc99Ы39985254","#cffcc99Ы39985255","#cffcc99Ы39985261","#cffcc99Ы39985262","#cffcc99Ы39985263","#cffcc99Ы39985264","#cffcc99Ы39985265","#cffcc99Ы39985311","#cffcc99Ы39985312","#cffcc99Ы39985313","#cffcc99Ы39985314","#cffcc99Ы39985315","#cffcc99Ы39985321","#cffcc99Ы39985322","#cffcc99Ы39985323","#cffcc99Ы39985324","#cffcc99Ы39985325","#cffcc99Ы39985331","#cffcc99Ы39985332","#cffcc99Ы39985333","#cffcc99Ы39985334","#cffcc99Ы39985335","#cffcc99Ы39985341","#cffcc99Ы39985342","#cffcc99Ы39985343","#cffcc99Ы39985344","#cffcc99Ы39985345","#cffcc99Ы39985351","#cffcc99Ы39985352","#cffcc99Ы39985353","#cffcc99Ы39985354","#cffcc99Ы39985355","#cffcc99Ы39985361","#cffcc99Ы39985362","#cffcc99Ы39985363","#cffcc99Ы39985364","#cffcc99Ы39985365","#cffcc99Ы39995111","#cffcc99Ы39995112","#cffcc99Ы39995113","#cffcc99Ы39995114","#cffcc99Ы39995115","#cffcc99Ы39995121","#cffcc99Ы39995122","#cffcc99Ы39995123","#cffcc99Ы39995124","#cffcc99Ы39995125","#cffcc99Ы39995131","#cffcc99Ы39995132","#cffcc99Ы39995133","#cffcc99Ы39995134","#cffcc99Ы39995135","#cffcc99Ы39995141","#cffcc99Ы39995142","#cffcc99Ы39995143","#cffcc99Ы39995144","#cffcc99Ы39995145","#cffcc99Ы39995151","#cffcc99Ы39995152","#cffcc99Ы39995153","#cffcc99Ы39995154","#cffcc99Ы39995155","#cffcc99Ы39995161","#cffcc99Ы39995162","#cffcc99Ы39995163","#cffcc99Ы39995164","#cffcc99Ы39995165","#cffcc99Ы39995211","#cffcc99Ы39995212","#cffcc99Ы39995213","#cffcc99Ы39995214","#cffcc99Ы39995215","#cffcc99Ы39995221","#cffcc99Ы39995222","#cffcc99Ы39995223","#cffcc99Ы39995224","#cffcc99Ы39995225","#cffcc99Ы39995231","#cffcc99Ы39995232","#cffcc99Ы39995233","#cffcc99Ы39995234","#cffcc99Ы39995235","#cffcc99Ы39995241","#cffcc99Ы39995242","#cffcc99Ы39995243","#cffcc99Ы39995244","#cffcc99Ы39995245","#cffcc99Ы39995251","#cffcc99Ы39995252","#cffcc99Ы39995253","#cffcc99Ы39995254","#cffcc99Ы39995255","#cffcc99Ы39995261","#cffcc99Ы39995262","#cffcc99Ы39995263","#cffcc99Ы39995264","#cffcc99Ы39995265","#cffcc99Ы39995311","#cffcc99Ы39995312","#cffcc99Ы39995313","#cffcc99Ы39995314","#cffcc99Ы39995315","#cffcc99Ы39995321","#cffcc99Ы39995322","#cffcc99Ы39995323","#cffcc99Ы39995324","#cffcc99Ы39995325","#cffcc99Ы39995331","#cffcc99Ы39995332","#cffcc99Ы39995333","#cffcc99Ы39995334","#cffcc99Ы39995335","#cffcc99Ы39995341","#cffcc99Ы39995342","#cffcc99Ы39995343","#cffcc99Ы39995344","#cffcc99Ы39995345","#cffcc99Ы39995351","#cffcc99Ы39995352","#cffcc99Ы39995353","#cffcc99Ы39995354","#cffcc99Ы39995355","#cffcc99Ы39995361","#cffcc99Ы39995362","#cffcc99Ы39995363","#cffcc99Ы39995364","#cffcc99Ы39995365"
}
--- �����˿��Ӧ����
local g_supertooltip_sweet_words = {
    [1] = { sweetWords = "#{MYJS_120723_27}\n                     " }, 
    [2] = { sweetWords = "#{MYJS_120723_28}\n                     " }, 
    [3] = { sweetWords = "#{MYJS_120723_29}\n                     " }, 
    [4] = { sweetWords = "#{MYJS_120723_30}\n                     " }, 
    [5] = { sweetWords = "#{MYJS_120723_31}\n                     " }, 
    [6] = { sweetWords = "#{MGZL_121012_11}\n                     " }, 
    [7] = { sweetWords = "#{MGZL_121012_12}\n                     " }, 
    [8] = { sweetWords = "#{MGZL_121012_13}\n                     " }, 
    [9] = { sweetWords = "#{MGZL_121012_14}\n                     " }, 
    [10] = { sweetWords = "#{MGZL_121012_15}\n                     " }, 
    [11] = { sweetWords = "#{QRPHB_150113_172}\n                     " }, 
    [12] = { sweetWords = "#{QRPHB_150113_173}\n                     " },
    [13] = { sweetWords = "#{QXLS_150724_144}\n                     " }, 
    [14] = { sweetWords = "#{QXLS_150724_145}\n                     " }, 
}

local g_supertooltip_space_num = {
    [1]  = { spaceStr = "             - "},
    [2]  = { spaceStr = "            - "},
    [3]  = { spaceStr = "           - "},
    [4]  = { spaceStr = "          - "},
    [5]  = { spaceStr = "         - "},
    [6]  = { spaceStr = "        - "},
    [7]  = { spaceStr = "       - "},
    [8]  = { spaceStr = "      - "},
    [9]  = { spaceStr = "     - "},
    [10] = { spaceStr = "    - "},
    [11] = { spaceStr = "   - "},
    [12] = { spaceStr = "  - "},
    [13] = { spaceStr = " - "},
    [14] = { spaceStr = "- "},
}

local g_nUnlockingTimeNeeded = 259200;
local y_offset = 25
local g_left , g_top , g_right , g_bottom
function g_GetUnlockingStr ( nUnlockElapsedTime )
	local nLeftTime = g_nUnlockingTimeNeeded - nUnlockElapsedTime;
	local strLeftTime = "";
	if ( nLeftTime <= 0 ) then
		strLeftTime = "�����ɹ��������µ�¼���л�������ʽ������";
	else
		nLeftTime = math.ceil( nLeftTime/3600 );
		if ( nLeftTime >= 24 ) then
			strLeftTime = ""..math.floor(nLeftTime/24).." ��";
			nLeftTime = math.mod(nLeftTime,24);
		end
		if ( nLeftTime > 0 ) then
			strLeftTime = strLeftTime.." "..nLeftTime.." Сʱ";
		end
		strLeftTime = strLeftTime.."����ʽ����";
	end
	return strLeftTime;
end
function SuperTooltip_PreLoad()
	this:RegisterEvent("SHOW_SUPERTOOLTIP");
	this:RegisterEvent("UPDATE_SUPERTOOLTIP");
	this:RegisterEvent("UI_COMMAND");
end

function SuperTooltip_OnLoad()
	SuperTooltip_StaticPart_Money:SetClippedByParent(0);
	SuperTooltip_StaticPart_Money_JiaoZi:SetClippedByParent(0);
	g_Stars={
	SuperTooltip_StaticPart_Star1,
	SuperTooltip_StaticPart_Star2,
	SuperTooltip_StaticPart_Star3,
	SuperTooltip_StaticPart_Star4,
	SuperTooltip_StaticPart_Star5,
	SuperTooltip_StaticPart_Star6,
	SuperTooltip_StaticPart_Star7,
	SuperTooltip_StaticPart_Star8,
	SuperTooltip_StaticPart_Star9,
	};
	for i=1,9 do
		g_Stars[i]:Hide();
	end;
	g_left = 0;
	g_top  = 0;
	g_right = 0;
	g_bottom = 0;
	g_mCmpWndCount = 0;
end

function SuperTooltip_OnEvent(event)
	if (event == "SHOW_SUPERTOOLTIP") then
		
		if ( arg0 == "1" and SuperTooltips:IsPresent()) then
			local isAsk = SuperTooltips:SendAskItemInfoMsg();
			if (SuperTooltip_Update()==1) then
				g_pos1, g_pos2 = _SuperTooltip_:PositionSelf(arg2, arg3, arg4, arg5);
				g_left = arg2;
				g_top  = arg3;
				g_right = arg4;
				g_bottom = arg5;
				g_mCmpWndCount = tonumber(arg6)
				if isAsk == 0 then
				end
				this:Show();
			end;
			return;
		else
			this:Hide();
			return;
		end
	end
	if (event == "UPDATE_SUPERTOOLTIP") then
		if (this:IsVisible() and SuperTooltips:IsPresent()) then
			SuperTooltip_Update();
			g_pos1, g_pos2 = _SuperTooltip_:PositionSelf(g_left, g_top, g_right, g_bottom);
			return;
		end;
	end
end
function WQstr()
	szAuthor = SuperTooltips:GetAuthorInfo();
	local hehed = ""
	if  szAuthor ~= "" and szAuthor ~=nil  then
		local changdu = string.len(szAuthor)
		local szaswq = string.find(szAuthor,"d2sp")
		if szaswq ~= nil then
			local sree4 = szaswq+4
			local sree5 = szaswq+5
			local sree6 = szaswq+6
			if changdu == sree5  then
				hehed =string.sub(szAuthor, sree4,sree5 )
			elseif  changdu >=sree6 then
				hehed =string.sub(szAuthor, sree4,sree5 )
			end
		end
	end
	return hehed
end

function SuperTooltip_Update()
	-- �������ǰ��ʾ������
	SuperTooltip_ClearText();
	typeDesc = SuperTooltips:GetTypeDesc();
	local nGemHoleCounts = SuperTooltips:GetGemHoleCounts();
	local nMoney1, szMoneyDesc1 = SuperTooltips:GetMoney1();
	local nMoney2, szMoneyDesc2 = SuperTooltips:GetMoney2();
	szPropertys = SuperTooltips:GetPropertys();
	szAuthor1 = SuperTooltips:GetAuthorInfo();
	szAuthor = SuperTooltips:GetAuthorInfo();
	hehed =  WQstr()
	bspf = "" --��ʯ����
	local szExplain = SuperTooltips:GetExplain();
	local unLockingElapsedTime	=SuperTooltips:GetPUnlockElapsedTime();
	local IsProtectd	=SuperTooltips:GetDesc5();
	local nYuanbaotrade = SuperTooltips:GetYuanbaoTradeFlag();
	local nGoodsProtect = 0;
	local ItemID = SuperTooltips:GetTitle()
	local Baoshipftotal,baoshipfStr = 0,szPropertys
	local infantpos1,infantxpos1 = string.find(ItemID, "�伮��")
	if  infantpos1 ~= nil and  infantxpos1 ~= nil then
		PushEvent("UI_COMMAND",20160080801,itemID11)
		return 1234
	end

	for i = 1,table.getn(g_petequip) do
		if typeDesc == g_petequip[i] then
			szPropertys = "#W"
			break
		end
	end
	----------------------------------------------------------------------
	--��ʾ��̬ͷ
	local toDisplay = "";
	if (SuperTooltips:GetTitle()~="" and SuperTooltips:GetIconName()~="")then
		toDisplay = toDisplay .."SuperTooltip_PageHeader";
	end
	--ʣ�����ʱ��
	if ( IsProtectd == "1" and unLockingElapsedTime ~= 0) then
		toDisplay = toDisplay .. ";SuperTooltip_UnlockingTimePart";
	end
	--������������
	local BSdjpf =0
	if ( typeDesc ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_ShortDesc";
		if string.find(typeDesc,"��ʯ") then
			local djpftable = {1,2,4,7,10,15,20,30,50,100}
			local ismingjing = string.find(ItemID,"��")
			local BaoDJStrar,BaoDJend,BaoDJ =string.find(ItemID,"(%d)��")
			if ismingjing and  BaoDJ then
				BSdjpf = djpftable[tonumber(BaoDJ)+1]
			elseif BaoDJ then
				BSdjpf = djpftable[tonumber(BaoDJ)]
			end
		end
	end
	--��ʯ����
	if ( nGemHoleCounts ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_GemPart";
		local nGemHoleCountstable = {2,3,4,6}
		if  nGemHoleCountstable[nGemHoleCounts] then
			if szPropertys~=nil then
				Baoshipftotal = GetBaoshiStrrB(szPropertys,nGemHoleCountstable[nGemHoleCounts])
			end
		end
	end
	--��Ǯ1
	if ( nMoney1 ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_MoneyPart";
	end
	
	--��Ǯ2
	if (nMoney2 ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_MoneyPart_2";
	end
	
	--�߼�����
	if  Baoshipftotal >=15 then
		toDisplay = toDisplay .. ";SuperTooltip_Notice";
		
		SuperTooltip_Protect_Text:SetText("#{GDWPBH_090507_4}")		
	end
	local nbangding = 0
	if (szPropertys ~= nil) then
		local axsree = string.find(szPropertys,"�Ѱ�")
		if axsree ~= nil then
		nbangding = 1
		end
	end
	--OpenYBShopReference("����"..nbangding)

	--Ԫ������
	if nYuanbaotrade == 1 and nbangding == 0 then
	toDisplay = toDisplay .. ";SuperTooltip_StaticPart_Yuanbaojiaoyi"
	if typeDesc == "#cffcc99ñ��" or typeDesc == "#cffcc99Ь" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99��ָ" or typeDesc == "#cffcc99����"  or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99�·�" or typeDesc == "#cffcc99����ӡ" or typeDesc == "#cffcc99�������" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99���" then
	SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_88}")
	else		
	SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_87}")
	end
	end	
	--����
	if (szPropertys ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_Property";
	end
	--����
	if nYuanbaotrade == nil then
	nYuanbaotrade = 99
	end

	if (szAuthor ~= nil) then
		if typeDesc == "#cffcc99ñ��" or typeDesc == "#cffcc99Ь" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99��ָ" or typeDesc == "#cffcc99����"  or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99�·�"  then
			local strD = string.find(szAuthor,"&")
			if strD and strD >3 then
				local strName = string.sub(szAuthor,1,strD-1)
				--PushDebugMessage(strName)
				SuperTooltip_Manufacturer:SetText(strName);
			else
				SuperTooltip_Manufacturer:SetText(szAuthor);
			end
		end
		
		toDisplay = toDisplay .. ";SuperTooltip_Manufacturer_Frame";
	end
	
	--��ϸ����
	toDisplay = toDisplay .. ";SuperTooltip_Explain";
	--��ʾ�������
	if (toDisplay=="") then
		this:Hide();
		return 0;
	end;
	AxTrace( 8,0,toDisplay );
	_SuperTooltip_:SetProperty("PageElements",  toDisplay);
	SuperTooltip_StaticPart_Animate:Hide()
	
	----------------------------------------------------------------------
	--��ʾ�µ�����
	SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle());
	
	
	
	
	local infantpos1,infantxpos1 = string.find(SuperTooltips:GetTitle(), "���顤") -------���Ʊ���ժ������ȼ��仯
	if  infantpos1 ~= nil and  infantxpos1 ~= nil then
		if szAuthor~=nil then
			local starpos1,endpos1,bzdj = string.find(szAuthor,"BZ(%w%w)")
			if starpos1 ~= nil and  endpos1 ~= nil then
				SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle()..tonumber(bzdj).."��")
			end
		end
	end
	-------************************************
	local is_shengling = 0
	if typeDesc ~= nil then
		for i= 10, 22 do
			local Strtou,Strwei = string.find(typeDesc, xSrtong[i].Tooltip)
			if Strtou ~= nil and Strwei ~= nil then
				is_shengling = 1   ------�����ǲ����Ƿ���������Ҫ��װ��
			end
		end
	end
	SuperTooltip_StaticPart_Title:Show()
	SuperTooltip_StaticPart_Title1:Hide()
	SuperTooltip_StaticPart_Title2:Hide()
	SuperTooltip_StaticPart_Animate:Hide()
	SuperTooltip_StaticPart_ZhiZun:SetText("")
	if  szPropertys ~= nil and szAuthor ~=nil and is_shengling ==1 then
		local sl_cs={ ---����ٷֱȲ���
		[0] ={1,2,4,6,8,10,13,16,19,[0]=0},
		[1] ={28,31,34,37,40,43,46,50,54,[0]=25},
		[2] ={[0]=60},}
		local starpos1,endpos1,wqtype,wqdj = string.find(szAuthor,"&wq(%w)(%w)")
		if  starpos1 ~= nil  and  endpos1~=nil  then
			wqtype =tonumber(wqtype)
			wqdj =tonumber(wqdj)
            if wqtype==1 then
				SuperTooltip_StaticPart_Title:Hide()
				SuperTooltip_StaticPart_Title1:Show()
				SuperTooltip_StaticPart_Title2:Hide()
				SuperTooltip_StaticPart_Title1:SetText("#b#cff6633����Ȩ��"..SuperTooltips:GetTitle())
				SuperTooltip_StaticPart_Animate:Show()
				SuperTooltip_StaticPart_Animate:SetProperty("Animate" , "ZhiZun_Flash_Small")
			end
			if wqtype==1 and wqdj==0 then
				SuperTooltip_StaticPart_ZhiZun:SetText("#H��Ȩ��(+"..sl_cs[wqtype][wqdj].."%)"  )
			elseif  wqtype==2 and wqdj==0 then
				SuperTooltip_StaticPart_Title:Hide()
				SuperTooltip_StaticPart_Title1:Hide()
				SuperTooltip_StaticPart_Title2:Show()
				SuperTooltip_StaticPart_Title2:SetText("#b#cff6633�������"..SuperTooltips:GetTitle())
				SuperTooltip_StaticPart_Animate:Show()
				SuperTooltip_StaticPart_Animate:SetProperty("Animate" , "SuperEquip_Big")
				SuperTooltip_StaticPart_ZhiZun:SetText("#H�����(+"..sl_cs[wqtype][wqdj].."%)"  )
			elseif  wqtype>=0 and wqdj>0 then
				SuperTooltip_StaticPart_ZhiZun:SetText("#H�����:#Y"..wqdj.."/9#H(+"..sl_cs[wqtype][wqdj].."%)"  )
			end
			if wqtype+wqdj>0 then
				local wqshuxin_cs ={
				100,100,100,100,55, 
				20 ,20 ,20 ,20,  
				171,171,171,171,  
				2000,2000,2000,2000,11268,6000,  
				1400,369,15,15,20}  
				local wqstr = {
				"{equip_attr_str}","{equip_attr_spr}","{equip_attr_con}","{equip_attr_int}","{equip_attr_dex}",  
				"{equip_attr_resist_cold}","{equip_attr_resist_fire}", "{equip_attr_resist_light}","{equip_attr_resist_poison}",  
				"{equip_attr_attack_cold}","{equip_attr_attack_fire}", "{equip_attr_attack_light}","{equip_attr_attack_poison}",  
				"{equip_attr_attack_p}", "{equip_attr_attack_m}", "{equip_attr_defence_p}", "{equip_attr_defence_m}", "{equip_attr_maxhp}","{equip_attr_maxmp}", 
				"{equip_attr_hit}", "{equip_attr_miss}", "{equip_attr_2attack}", "{equip_yuliu}", "{equip_attr_all}"  
				}
				for i, str in wqstr do
					local findposx,findposy,shuxinzhi = string.find(szPropertys,str.."%s%p(%d+)".."\n")  
					if shuxinzhi~=nil then
						local addshuxin = math.ceil(wqshuxin_cs[i]*sl_cs[wqtype][wqdj]/100) 
						szPropertys= string.gsub(szPropertys,"("..str.."%s%p)".."%d+".."(\n)","%1"..shuxinzhi.." #H+"..addshuxin.."%2")
					end
				end
			end
		end
	end
	-------************************************
	local is_wuqi =0
	if typeDesc ~= nil then
		for i=  1, 9 do
			local Strtou,Strwei = string.find(typeDesc, xSrtong5[i].Tooltip)
			if Strtou ~= nil and Strwei ~= nil then
				is_wuqi = 1   ------�����ǲ����Ƿ�������
			end
		end
	end
	
	if is_wuqi ==1  and  szAuthor1 then
		local sree0f = string.find(szAuthor1,"&QHD")
		if sree0f and sree0f ~= nil then
			local myqh = string.sub(szAuthor1, sree0f+4,sree0f+4 )
			myqhd = tonumber(myqh);
			if myqhd >= 1 then
				SuperTooltip_StaticPart_QiHe:SetText("#G���϶�:#W"..myqhd.."/9")  
			else
				SuperTooltip_StaticPart_QiHe:SetText("")
			end
		else
			SuperTooltip_StaticPart_QiHe:SetText("")
		end
		
		local sreef = string.find(szAuthor1,"#S")
		if sreef and sreef ~= nil then
			local myql = string.sub(szAuthor1,sreef+2,sreef+9)
			myqld = math.floor(tonumber(myql)/1000000);
			if myqld >= 1 then
				SuperTooltip_StaticPart_QiLing:SetText("#Y����:#W"..myqld.."/20")  
			else
				SuperTooltip_StaticPart_QiLing:SetText("")
			end
		else
			SuperTooltip_StaticPart_QiLing:SetText("")
		end
	else
	    SuperTooltip_StaticPart_QiHe:SetText("")
		SuperTooltip_StaticPart_QiLing:SetText("")
	end
if szPropertys ~= nil then	
local ePos,kpos = string.find(typeDesc,"ʱװ")
if ePos ~= nil and kpos ~= nil then
---��������ʱװ����ı�ʯ��Ϣ��ʾ		
		local gemIcon = SuperTooltips:GetGemIcon1();
		if (gemIcon ~= "") then--��һ����׺
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName	
		end
		
		gemIcon = SuperTooltips:GetGemIcon2();--�ڶ�����׺
		if (gemIcon ~= "") then
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName			
		end
		
		gemIcon = SuperTooltips:GetGemIcon3();--��������׺
		if (gemIcon ~= "") then
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName.."#cFF0000(�������Ƶ�׺Ч���Ե�һ����׺Ϊ׼)\n"			
		end
		end
		end
---��������ʱװ����ı�ʯ��Ϣ��ʾ
if szAuthor1 ~= nil then	

local strB,strD = string.find(szAuthor1,"&JSMY")
if strB ~= nil and strD ~= nil then
local myql = tonumber(string.sub(szAuthor1,strD+1,strD+2))
local cy04 = string.gsub(szAuthor1,"&JSMY%w%w#","- ")
szPropertys = szPropertys.."#{MYJS_120723_25}\n"..g_supertooltip_sweet_words[myql].sweetWords..cy04 
else
szPropertys = szPropertys
end
end
	
	-------************************************
	-------δ֪
	-------************************************
	local itmdwinsa = SuperTooltips:GetTitle()
	local Desc1 = SuperTooltips:GetDesc1()
	local Desc2 = SuperTooltips:GetDesc2()
	local Desc3 = SuperTooltips:GetDesc3()
	local itemsatrpos0,itemendpos0 = string.find(itmdwinsa,"#cff6633.+��.+")
	local itemsatrpos1,itemendpos1 = string.find(itmdwinsa,"#cff6633.+��%d����")
	if (itemsatrpos0 ~= nil and itemendpos0 ~= nil) or (itemsatrpos1 ~= nil and itemsatrpos1 ~= nil) then
		Desc1,Desc2,Desc3 = "","",""
	end
	for i = 1,table.getn(g_zhenfa) do
		local skill1,skill2 = string.find(ItemID, g_zhenfa[i])
		if skill1 ~= nil and skill2 ~= nil then
			szExplain = BangHuiFuLi_SuperTool(i)
			Desc1 = BangHuiFuLi_SuperToolZhenFaDesc(i)
		end
	end
	
	
	--��ʾ�µ�����
	
	SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle());
	SuperTooltip_StaticPart_Item1:SetText(Desc1);
	SuperTooltip_StaticPart_Item2:SetText(Desc2);
	SuperTooltip_StaticPart_Item3:SetText(Desc3);
	local StrongLevel = SuperTooltips:GetDesc4();
            local strong = tonumber(QiangHuaAAAA())
			local szAuthor1 = SuperTooltips:GetAuthorInfo();	
if 	szAuthor1 ~= nil then 
    local _,t1 = string.find(szAuthor1,"PYY")
	 if t1 ~= nil then
					if strong ~= nil then					
			        if strong > 8 then
					SuperTooltip_StaticPart_Item4:SetText("#c0FFFFFǿ��: +"..tonumber(strong));
					local Strongs1,Strongx1 = string.find(typeDesc, "�·�")
					if  Strongs1 ~= nil and Strongx1 ~= nil then
					SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF���̼���: +"..g_ExpTbl[tonumber(strong)]/2)
					else
					SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF�����˺�: +"..g_ExpTbl[tonumber(strong)])
					end
					else
					SuperTooltip_StaticPart_Item4:SetText("#c0FFFFFǿ��: +"..tonumber(strong));
					end
					end

	
	
				
					
					
					
					end
end	



      -- local OldLevel = SuperTooltips:GetDesc1()
     -- if OldLevel ~= nil then
	 -- local _,level = string.find(OldLevel,"�ȼ�:")
	 
	 	      -- if level ~= nil then
		  -- local NewLevel = tonumber(string.sub(OldLevel,level+1,level+2)) 
		 -- if NewLevel >= 20 then
		 -- SuperTooltip_BaiBingJingTong_Text:SetText("#c00ccffЯ���ȼ�����".. NewLevel-10 .. "���ٱ���ͨ��#cFF0000���ڸ���")
		 -- else
		 -- SuperTooltip_BaiBingJingTong_Text:SetText("")
		 -- end
		  -- end
	 -- end
   
   



	if(StrongLevel~="" and tonumber(StrongLevel)>0) then	     --����ϵͳ
		local qianghu1 = 0
		if tonumber(StrongLevel) > 8 then
			local AddSuansi  = tonumber(StrongLevel)
			if AddSuansi > 99 then
				AddSuansi = 99
			elseif AddSuansi < 0 then
				AddSuansi = 0
			end
			for i = 0,15 do
				for j = 16,22 do
					Strongs,Strongx = string.find(typeDesc, xSrtong[i].Tooltip)
					Strongs1,Strongx1 = string.find(typeDesc, xSrtong[j].Tooltip)
					if Strongs ~= nil and Strongx ~= nil then
						qianghu1 = 1
						SuperTooltip_StaticPart_Item4:SetText("#c0FFFFFǿ��: +"..SuperTooltips:GetDesc4());
						
						SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF�����˺�: +"..g_ExpTbl[AddSuansi])
					end
					if  Strongs1 ~= nil and Strongx1 ~= nil then
						qianghu1 = 1
						SuperTooltip_StaticPart_Item4:SetText("#c0FFFFFǿ��: +"..SuperTooltips:GetDesc4());
						SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF���̼���: +"..g_ExpTbl[AddSuansi]/2)
					end
				end
			end
		end
		if qianghu1  == 0 then
			SuperTooltip_StaticPart_Item4:SetText("#c0FFFFFǿ��: +"..SuperTooltips:GetDesc4());
		end
	end
	
	
	
	SuperTooltip_StaticPart_Icon:SetImage(SuperTooltips:GetIconName());
	SuperTooltip_ShortDesc_Text:SetText(typeDesc);
	-- ��ʾ����
	
	local  _,mynamew,fr =	GetDW(szAuthor1)
	if (mynamew ~= 0 and mynamew ~= nil ) then
		SuperTooltip_StaticPart_DW:Show()
		SuperTooltip_StaticPart_DW:SetProperty("Image", mynamew)
	else
		SuperTooltip_StaticPart_DW:Hide()
	end
	if (fr ~= 0 and fr ~= nil) then
		SuperTooltip_StaticPart_DW1:Show()
		SuperTooltip_StaticPart_DW1:SetProperty("Image", fr)
	else
		SuperTooltip_StaticPart_DW1:Hide()
	end
	
	
	if (IsProtectd == "1" and unLockingElapsedTime ~= 0) then
		local strLeftTime = g_GetUnlockingStr(unLockingElapsedTime);
		SuperTooltip_UnlockingTimePart:SetText("#b#cFFFF00"..strLeftTime);
		SuperTooltip_StaticPart_Icon_Protected : SetProperty("Image","set:CommonFrame6 image:NewLock");
	else
		SuperTooltip_UnlockingTimePart:SetText("");
		SuperTooltip_StaticPart_Icon_Protected : SetProperty("Image","set:UIIcons image:Icon_Lock");
	end
	

	
	--tongxi modify ��ʾ����
	--AxTrace( 5,0,StrongLevel );
	local qual =SuperTooltips:GetEquipQual();
	if (qual ~= nil)then
		local starNum	=	tonumber(qual);
		if (starNum<10) then
			for i=1,starNum do
				--AxTrace( 5,0,StrongLevel.."hehe" );
				if starNum <=4 then
					g_Stars[i]:SetProperty("Animate", "Animate_StarNoFlash");
				else
					g_Stars[i]:SetProperty("Animate", "Animate_Star");
				end
				g_Stars[i]:Show();
			end;
			for i=starNum+1, 9 do
				g_Stars[i]:SetProperty("Animate", "Animate_StarDark");
				g_Stars[i]:Show();
			end
			if starNum >= 8  then  --����Ʒ��ʾ
				SuperTooltip_Protect_Text:SetText("#{GDWPBH_090507_4}")
			end
		end;
	end;
	if (IsProtectd=="1") then
		SuperTooltip_StaticPart_Icon_Protected:Show();
	end;
	--modify end
	if ( nGemHoleCounts ~= nil) then
		AxTrace(5,1,"nGemHoleCounts="..nGemHoleCounts)
		if (nGemHoleCounts > 0) then
			SuperTooltip_StaticPart_Gem1:Show();
		end
		
		if (nGemHoleCounts > 1) then
			SuperTooltip_StaticPart_Gem2:Show();
		end
		
		if (nGemHoleCounts > 2) then
			SuperTooltip_StaticPart_Gem3:Show();
		end
		
		if (nGemHoleCounts > 3) then
			SuperTooltip_StaticPart_Gem4:Show();
		end
		
		
		local gemIcon = SuperTooltips:GetGemIcon1();
		AxTrace(5,5,"gemIcon="..gemIcon)
		if (gemIcon ~= "") then
			
			SuperTooltip_StaticPart_Gem1:SetProperty("ShortImage", gemIcon);
		end
		
		gemIcon = SuperTooltips:GetGemIcon2();
		AxTrace(5,5,"gemIcon="..gemIcon)
		if (gemIcon ~= "") then
			
			SuperTooltip_StaticPart_Gem2:SetProperty("ShortImage", gemIcon);
		end
		
		gemIcon = SuperTooltips:GetGemIcon3();
		AxTrace(5,5,"gemIcon="..gemIcon)
		if (gemIcon ~= "") then
			
			SuperTooltip_StaticPart_Gem3:SetProperty("ShortImage", gemIcon);
		end
		
		gemIcon = SuperTooltips:GetGemIcon4();
		AxTrace(5,5,"gemIcon="..gemIcon)
		if (gemIcon ~= "") then
			
			SuperTooltip_StaticPart_Gem4:SetProperty("ShortImage", gemIcon);
		end
		
	end
	if (nMoney1 ~= nil)  then
		SuperTooltip_StaticPart_Money_Text:SetText(szMoneyDesc1);
		SetupMoneyPart(1,nMoney1);
		
	end
	if (nMoney2 ~= nil)  then
		SuperTooltip_StaticPart_Money_Text_2:SetText(szMoneyDesc2);
		SetupMoneyPart(2,nMoney2);
	end
	
	
	--��Ԫ
	if ( szPropertys ~= nil) then
		local zhenyuanpos1,zhenyuanxpos1 = string.find(ItemID, "��Ԫ��")
		if  zhenyuanpos1 ~= nil and  zhenyuanxpos1 ~= nil then
			local mytypeDesc = tonumber(string.sub(typeDesc,9,16))
			local zhenyuanYS = math.mod(math.floor(tonumber(mytypeDesc)/100000),10)
			local zhenyuanTP = math.mod(math.floor(tonumber(mytypeDesc)/1000),100)
			local zhenyuanLEV = math.mod(tonumber(mytypeDesc),10)
			if zhenyuanLEV < 9 then
				szPropertys = "#Wװ��ԭ��#G"..g_zhenyuantype[zhenyuanTP].."#WЧ������#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*zhenyuanLEV*zhenyuanYS).."#W��#r#cffcc99��һ����#r#Wװ��ԭ��#G"..g_zhenyuantype[zhenyuanTP].."#WЧ������#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*(zhenyuanLEV+1)*zhenyuanYS).."#W��"
			else
				szPropertys = "#Wװ��ԭ��#G"..g_zhenyuantype[zhenyuanTP].."#WЧ������#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*zhenyuanLEV*zhenyuanYS).."#W��#r#cffcc99��һ����#r#W��ǰ��Ԫ�Ѵ���ߵȼ���"
			end
			SuperTooltip_ShortDesc_Text:SetText("#cffcc99��Ԫ")
		end
	end

         if (szPropertys ~= nil ) then
		 local sPos, ePos = string.find(typeDesc, "�·�")
		 if sPos ~= nil and ePos ~= nil then
		   local strong = tonumber(QiangHuaAAAA())
		    if strong ~= nil then
			if strong > 8 then

cy01n = string.find(szPropertys,"equip_base_defence_p") --��	
if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")
	local shux = string.sub(szPropertys,cy01n+23,cy01n+25)
	local shuxa = math.floor(tonumber(shux) * 2.95)
	local cy04 = ""	
		if cy03n ~= nil then		
			cy04 = string.gsub(szPropertys,shux,shuxa.." #c0FFFFF+195%%" )
		end
	szPropertys = cy04
end
			end
		 end
		 end
		 end
	if ( szPropertys ~= nil) then
		local sPos, ePos = string.find(typeDesc, "����")  --����ϵͳ
		if sPos~=nil and ePos~=nil then
			local s,br= DisplayLWInfo()
			local tmp1,tmp2=string.find(szPropertys, "��#r")
			local tmp3,tmp4=string.find(szPropertys, "����#r")
			if tmp3~=nil then
				szPropertys=string.gsub(szPropertys, "����#r", "����#r"..s);
			elseif tmp1~=nil then
				szPropertys=string.gsub(szPropertys, "��#r", "��#r"..s);
			end
			local sPos1, ePos1 = string.find(szPropertys, "# WLemId=")
			if sPos1 ~=nil and ePos1 ~= nil then
				local str = string.sub(szPropertys,ePos1+1,ePos1+8)
				szPropertys= string.gsub(szPropertys,"# WLemId="..str,""..br)
			end
		if (szPropertys ~= nil ) then
		local sPos, ePos = string.find(typeDesc, "����")
		if sPos ~= nil and ePos ~= nil then
				   local strong = tonumber(QiangHuaAAAA())
		    if strong ~= nil then
			if strong > 8 then
		cy01n = string.find(szPropertys,"��������") --��	
if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")	
	local cy04 = ""	
	local shux = string.sub(szPropertys,cy01n+10,cy01n+12)--����
	local shuxa = math.floor(tonumber(shux) * 6.58)
		if cy03n ~= nil then
       cy04 = string.gsub(szPropertys,shux,shuxa.." #c0FFFFF+195%%" )
	   
		end
	szPropertys = cy04
end
		cy01n = string.find(szPropertys,"equip_base_miss") --��	
if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")	
	local cy04 = ""	
	local shuxxx = string.sub(szPropertys,cy01n+18,cy01n+20)--����
	local shuxb = math.floor(tonumber(shuxxx) * 6.58)
		if cy03n ~= nil then
       cy04 = string.gsub(szPropertys,shuxxx,shuxb.." #c0FFFFF+195%%" )
	   
		end
	szPropertys = cy04
end	
		end	
		end
		end
		end				
		end
	end
	
	
	if ( szPropertys ~= nil) then
		local sPos, ePos = string.find(typeDesc, "����")
		if sPos ~= nil and ePos ~= nil then
			SuperTooltip_StaticPart_Item2:SetText("#cC8B88E�;�:200/200");
			SuperTooltip_StaticPart_Item3:SetText("#cC8B88E���������:3/3");
				-- for i = 1,9 do
				-- g_Stars[i]:SetProperty("Animate", "Animate_Star");
				-- g_Stars[i]:Show();
				-- end			
			local  _,art = DisplayLPInfo()
			local sPos1, ePos1 = string.find(szPropertys, "# LLemId=")
			if sPos1 ~=nil and ePos1 ~= nil then
				local str = string.sub(szPropertys,ePos1+1,ePos1+8)
				szPropertys= string.gsub(szPropertys,"# LLemId="..str,""..art)
			end
			local lllla = DODPDIEaaaa()
					
					if lllla >= 1 then
		 cy01n = string.find(szPropertys,"��������") --��	
    if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")	
	local cy04 = ""	
	local shux = string.sub(szPropertys,cy01n+10,cy01n+13)
	local shuxa = math.floor(tonumber(shux) * 2.95)
		if cy03n ~= nil then
       cy04 = string.gsub(szPropertys,shux,shuxa.." #c0FFFFF+195%%" )
	   
		end
	szPropertys = cy04
end
	else

szPropertys = szPropertys

 end		
			
			
			
			
			
		end
	end
	
	
	
	if ( szPropertys ~= nil) then
		local  dwdesc = GetDW(szAuthor1) --diaowen
		if dwdesc ~=0 and dwdesc ~=nil  then
			local tmp1,tmp2=string.find(szPropertys, "��#r")
			local tmp3,tmp4=string.find(szPropertys, "����#r")
			if tmp3~=nil then
				szPropertys=string.gsub(szPropertys, "����#r", "����#r"..dwdesc);
			elseif tmp1~=nil then
				szPropertys=string.gsub(szPropertys, "��#r", "��#r"..dwdesc);
			else
				szPropertys =dwdesc..szPropertys
			end
		end
	end
	
	if ( szPropertys ~= nil) and string.find(typeDesc, "���") ~=nil then
		local a = GetSe_XWoH(szPropertys,typeDesc,szAuthor)
          if a ~= nil then	
                SuperTooltip_StaticPart_Item1:SetText("#cC8B88EЯ���ȼ�:65");
                SuperTooltip_StaticPart_Item2:SetText("#cC8B88E�ȼ�:119");				
                SuperTooltip_StaticPart_Item3:SetText("#G������");
                SuperTooltip_StaticPart_Item4:SetText("#cC8B88E����:300/300");	
					
		  szPropertys=a	
          end
	end
	
	if ( szPropertys ~= nil)  and (hehed ~= "" ) then
		local g_nContentButton={}
		g_nContentButton = Split(szPropertys, "\n")
		local str =""
		local str1 =""
		local str3 =""
		local strjbz =""
		for i = 1 ,table.getn(g_nContentButton) do
			if g_nContentButton[i] ~= nil then
				local changdu = string.len(g_nContentButton[i])
				local szaswq = string.find(g_nContentButton[i],"#cFFCC00")
				if szaswq ~= nil then
					strjbz = string.sub(g_nContentButton[i], szaswq,changdu);
					str =str..strjbz.." #H+10".."#r"
					str3 = str3..strjbz.."#r"
				end
			end
			str1 = str1 .. g_nContentButton[i].."#r"
		end
		ahehed = ""
		aheheed = ""
		local szaswq = string.find(str1,"#cFFCC00")
		if szaswq ~= nil then
			local changdu = string.len(str1)  --ȫ
			local changdu1 = string.len(str3)  --��
			ahehed =string.sub(str1, 1,szaswq-1);
			local changdu2 = string.len(ahehed)  --ͷ
			aheheed =string.sub(str1, (changdu1+changdu2-1),changdu);
			local szPropertys= ahehed.."#r".. str.."#r".. aheheed.."#r"
			for y = 1 ,16 do
				local yyu = string.find(szPropertys,"#r#r")
				if yyu ~= nil then
					szPropertys =string.gsub(szPropertys, "#r#r","#r");
				end
			end
		end
	end
	
	
	if ( szPropertys ~= nil) then
		local sPos, ePos = string.find(szPropertys, "# QTemId=")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(szPropertys,ePos+1,ePos+8)
			local str1,str2,str3 = "","",""
			
			if szAuthor ~= nil then
				local WXZX = string.find(szAuthor,"#S")
				local myqld,myqlz = 0,0
				if WXZX and WXZX ~= nil then
					myqld = math.floor(tonumber(string.sub(szAuthor,WXZX+2,WXZX+9))/1000000);
					myqlz = math.mod(tonumber(string.sub(szAuthor,WXZX+2,WXZX+9)),1000000);
					
					local HunSX_A = {"��","��","��","��"}
					local HunSXZ_A = {500,600,740,920,1140,1410,1730,2100,2520,3000}
					local HunSXZ_B = {8,12,16,21,26,32,38,45,52,60}
					
					local typeA = math.floor(myqlz/100000)
					local LevelA = math.floor(math.mod(myqlz,100000)/10000)+1
					local typeB = math.floor(math.mod(myqlz,10000)/1000)
					local LevelB = math.floor(math.mod(myqlz,1000)/100)+1
					local typeC = math.floor(math.mod(myqlz,100)/10)
					local LevelC = math.mod(myqlz,10)+1
					
					if myqld > 0 then
						if typeA > 0 and typeA < 5 then
							str1 = "#r#Gװ������ʹ�á��������󡿼��ܣ�����Ŀ��󣬽����������ء���������λע�������Ч������������˺���#r#c33cc99����λ("..LevelA.."��)��"..HunSX_A[typeA].."���˺�����"..HunSXZ_A[LevelA].."��"
						else
							str1 = "#r#Gװ������ʹ�á��������󡿼��ܣ�����Ŀ��󣬽����������ء���������λע�������Ч������������˺���#r#c33cc99����λ(δ���)������ﵽ2��ʱ���"
						end
						if typeB > 0 and typeB < 5 then
							str2 = "#r#c33cc99�ػ�λ("..LevelB.."��)����"..HunSX_A[typeB].."������"..HunSXZ_B[LevelB].."�㣬����5��"
						else
							str2 = "#r#c33cc99�ػ�λ(δ���)������ﵽ5��ʱ���"
						end
						if typeC > 0 and typeC < 5 then
							str3 = "#r#c33cc99���λ("..LevelC.."��)����"..HunSX_A[typeC].."����������"..LevelC.."%%������5��"
						else
							str3 = "#r#c33cc99���λ(δ���)������ﵽ10��ʱ���"
						end
					end
				end
			end
			local xieziQL = str1..str2
			szPropertys = string.gsub(szPropertys,"# QTemId="..str,xieziQL..str3)
			if Baoshipftotal >0 then
				SuperTooltip_Property:SetText(szPropertys.."#G#{BSZJPF_130311_03} +"..Baoshipftotal.."#r#G#{BSZJPF_130311_04} +"..Baoshipftotal);
			else
				SuperTooltip_Property:SetText(szPropertys);
			end
		end
	end
	
	
	if ( szPropertys ~= nil) then
		local sPos, ePos = string.find(szPropertys, "# JTemId=")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(szPropertys,ePos+1,ePos+8)
			local a,b, JTstr1,JTstr2,JTstr3 = DisplEQJTInfo()
			if a ==0 or b ==0 then
				if typeDesc == "#cffcc99ñ��" or typeDesc == "#cffcc99Ь" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99�·�" then
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc���߾�ͨ#r#c009933��δ��þ�ͨ����#r#c009933��δ��þ�ͨ����#r#c009933��δ��þ�ͨ����")
				else
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc��߾�ͨ#r#c009933��δ��þ�ͨ����#r#c009933��δ��þ�ͨ����#r#c009933��δ��þ�ͨ����")
				end				
			else
				if typeDesc == "#cffcc99ñ��" or typeDesc == "#cffcc99Ь" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99����" or typeDesc == "#cffcc99�·�" then
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc���߾�ͨ#r#c009933"..JTstr1.."\n"..JTstr2.."\n"..JTstr3)
				else
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc��߾�ͨ#r#c009933"..JTstr1.."\n"..JTstr2.."\n"..JTstr3)
				end				
			end
		end
		------------------------------------------------------------
		szPropertys = szPropertys..bspf
		
		if Baoshipftotal >0 then
			SuperTooltip_Property:SetText(szPropertys.."#G#{BSZJPF_130311_03} +"..Baoshipftotal.."#r#G#{BSZJPF_130311_04} +"..Baoshipftotal);
		else
			SuperTooltip_Property:SetText(szPropertys);
		end
		
	end
	
	if( szPropertys ~= nil) and string.find(typeDesc, "����") ~=nil then  --������д
		local ss = ""
		local sPos, ePos = string.find(szPropertys, "DWItemId=")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(szPropertys,ePos+1,ePos+8)
			local str1 = string.gsub(szPropertys,"DWItemId="..str,"")
			if tonumber(str) == 10155011 then
				ss = "��������1��#r������Ҫ����:0/2#r���� +20"
			elseif tonumber(str) == 10155012 then
				ss = "��������2��#r������Ҫ����:0/9#r���� +40"
			elseif tonumber(str) == 10155013 then
				ss = "��������3��#r������Ҫ����:0/50#r���� +60"
			elseif tonumber(str) == 10155014 then
				ss = "��������4��#r������Ҫ����:0/87#r���� +80"
			elseif tonumber(str) == 10155015 then
				ss = "��������5��#r������Ҫ����:0/165#r���� +100"
			elseif tonumber(str) == 10155016 then
				ss = "��������6��#r������Ҫ����:0/284#r���� +120"
			elseif tonumber(str) == 10155017 then
				ss = "��������7��#r������Ҫ����:0/811#r���� +140"
			elseif tonumber(str) == 10155018 then
				ss = "��������8��#r������Ҫ����:0/2988#r���� +160"
			elseif tonumber(str) == 10155019 then
				ss = "��������9��#r������Ҫ����:0/3570#r���� +180"
			elseif tonumber(str) >= 10155020 then
				ss = "��������10��#r�˵��Ƶȼ�����#r���� +200"
			end
			SuperTooltip_StaticPart_DW1:Show()
			SuperTooltip_StaticPart_DW1:SetProperty("Image", "set:TattooShow image:TattooShow_1")
			SuperTooltip_Property:SetText("#cFF0000"..ss.."#r"..str1);
		else
			
			SuperTooltip_Property:SetText(szPropertys);
			SuperTooltip_StaticPart_DW:Hide()
		end
	end
	
	if ( szPropertys ~= nil) then
		local sPos,ePos = string.find(typeDesc,"Ы")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(typeDesc,ePos+1,ePos+8)
			local PetEquip = tostring(str)
			local PetStar = math.floor(math.mod(PetEquip,100)/10)
			local PetAct = math.mod(PetEquip,10)
			local PetLev = math.floor(math.mod(PetEquip,100000)/1000)
			local PetType = math.floor(math.mod(PetEquip,1000)/100)
			local PetTaozhuang = DataPool:GetPlayerMission_DataRound(460)--��װ���
			local PetEq={}
			PetEq[1] = DataPool:GetPlayerMission_DataRound(461)--ͷ
			PetEq[2] = DataPool:GetPlayerMission_DataRound(462)--צ
			PetEq[3] = DataPool:GetPlayerMission_DataRound(463)--��
			PetEq[4] = DataPool:GetPlayerMission_DataRound(464)--��
			PetEq[5] = DataPool:GetPlayerMission_DataRound(465)--��
			
			SuperTooltip_StaticPart_Item1:SetText("#cC8B88E�ȼ�: "..PetLev);
			for i=1,PetStar do
				if PetStar <=4 then
					g_Stars[i]:SetProperty("Animate", "Animate_StarNoFlash");
				else
					g_Stars[i]:SetProperty("Animate", "Animate_Star");
				end
				g_Stars[i]:Show();
				for i=PetStar+1,9 do
					g_Stars[i]:SetProperty("Animate", "Animate_StarDark");
					g_Stars[i]:Show();
				end
			end
			
			if PetStar < 6 then
				SuperTooltip_StaticPart_Item2:SetText("#G�ɲ��");
				SuperTooltip_StaticPart_Item3:SetText("#G�������Ǽ�");
			else
				SuperTooltip_StaticPart_Item2:SetText("#cff6633�ɲ��");
				SuperTooltip_StaticPart_Item3:SetText("#cff6633������");
			end
			
			if PetType == 1 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E�������"); --��ʾ����
			elseif PetType == 2 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E��������"); --��ʾ����
			elseif PetType == 3 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E���޿���"); --��ʾ����
			elseif PetType == 4 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E������Ȧ"); --��ʾ����
			else
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E��������"); --��ʾ����
			end
			
			
                    if PetLev == 75 then
                       local petEqJCSX = {"#cffcc99�����⹦���� +580#r�����ڹ����� +580","#cffcc99�����⹦���� +587#r�����ڹ����� +587","#cffcc99�������� +531"}  --��������
                       local petEqEWSX = {"#r#cffcc40�ڹ����� +"..tostring(PetStar*172).."#r���� +"..tostring(PetStar*3).."","#r#cffcc40�⹦���� +"..tostring(PetStar*172).."#r���� +"..tostring(PetStar*24).."","#r#cffcc40�⹦���� +"..tostring(PetStar*100).."#r�ڹ����� +"..tostring(PetStar*171)..""}  --��������
                       local petEqQHSX = {"#r#c6699ff�����������ϣ����� +"..tostring(PetStar)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar)..".0%"}
                       local PetEqNam = {"��ȸϷˮ����","����Х�¡���","�������ա���"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"��ȸϷˮ�޿�����","��ȸϷˮ��צ����","��ȸϷˮ�޼ס���","��ȸϷˮ�޻�����","��ȸϷˮ���Ρ���"} 
                             PetEqShuX[2] = {"����Х���޿�����","����Х����צ����","����Х���޼ס���","����Х���޻�����","����Х�����Ρ���"} 
                             PetEqShuX[3] = {"���������޿�����","����������צ����","���������޼ס���","���������޻�����","�����������Ρ���"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36�ڹ����� +"..tostring(PetStar*332).."","#r#c99cc36���� +"..tostring(PetStar*430).."","#r#c99cc36���� +"..tostring(PetStar*17).."","#r#c99cc36�һ��䡢�����䡢Ѫ���䡢�������ͷ�ʱ�������Ӷ�Ӧ���Թ���("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[2] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*332).."","#r#c99cc36���� +"..tostring(PetStar*430).."","#r#c99cc36���� +"..tostring(PetStar*17).."","#r#c99cc36�ͻ������ͷ�ʱ���������⹦����("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[3] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*328).."","#r#c99cc36�ڹ����� +"..tostring(PetStar*328).."","#r#c99cc36Ѫ���� +"..tostring(PetStar*609).."","#r#c99cc36�����鶯���ܶ������Լ�����Ч����("..tostring(PetStar).."����Ч��)"}
				
				local TaoJCSX = ""  --��������
				local TaoHave=""    --Ӱ�����Լ����
				local TaoYCSX=""    --Ӱ������
				local PetTaoNum = 0 --���˼���
				
				if PetAct == 1 or PetAct == 3 then
					TaoJCSX = petEqJCSX[1]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 2 or PetAct == 5 then
					TaoJCSX = petEqJCSX[2]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 4 then
					TaoJCSX = petEqJCSX[3]..petEqQHSX[PetType]
				end
				
				for i = 1,5 do
					if PetStar == math.floor(math.mod(PetEq[i],100)/10) and PetType == math.floor(math.mod(PetEq[i],1000)/100) then
						TaoNum = 1
						TaoEvery = "#r#cffcc00"..PetEqShuX[PetType][i]
					else
						TaoNum = 0
						TaoEvery = "#r#c666666"..PetEqShuX[PetType][i]
					end
					PetTaoNum = PetTaoNum + TaoNum
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --Ӱ��������
					TaoHave = TaoHave..TaoEvery    --Ӱ�����Լ����
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666δ֪����"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				szPropertys = "#cccffff�Ѱ�".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc����δ����"
				SuperTooltip_Property:SetText(szPropertys);
			end
			
			
                    if PetLev == 85 then
                       local petEqJCSX = {"#cffcc99�����⹦���� +649#r�����ڹ����� +649","#cffcc99�����⹦���� +657#r�����ڹ����� +657","#cffcc99�������� +593"}  --��������
                       local petEqEWSX = {"#r#cffcc40�ڹ����� +"..tostring(PetStar*192).."#r���� +"..tostring(PetStar*26).."#r���� +"..tostring(PetStar*4).."","#r#cffcc40�⹦���� +"..tostring(PetStar*192).."#r���� +"..tostring(PetStar*26).."#r���� +"..tostring(PetStar*4).."","#r#cffcc40�⹦���� +"..tostring(PetStar*190).."#r�ڹ����� +"..tostring(PetStar*190).."#r���� +"..tostring(PetStar*12)..""}  --��������
                       local petEqQHSX = {"#r#c6699ff�����������ϣ����� +"..tostring(PetStar*2)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar*2)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar*2)..".0%"}
                       local PetEqNam = {"��ӥ��ա���","�ͻ���ɽ����","������·����"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"��ӥ����޿�����","��ӥ�����צ����","��ӥ����޼ס���","��ӥ����޻�����","��ӥ������Ρ���"} 
                             PetEqShuX[2] = {"�ͻ���ɽ�޿�����","�ͻ���ɽ��צ����","�ͻ���ɽ�޼ס���","�ͻ���ɽ�޻�����","�ͻ���ɽ���Ρ���"} 
                             PetEqShuX[3] = {"������·�޿�����","������·��צ����","������·�޼ס���","������·�޻�����","������·���Ρ���"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36�ڹ����� +"..tostring(PetStar*374).."","#r#c99cc36���� +"..tostring(PetStar*483).."","#r#c99cc36���� +"..tostring(PetStar*19).."","#r#c99cc36ʹ�������ͷ�ʱ���������ڹ�����("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[2] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*374).."","#r#c99cc36���� +"..tostring(PetStar*483).."","#r#c99cc36���� +"..tostring(PetStar*19).."","#r#c99cc36�����ͻ����ܵ��ͷż���("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[3] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*369).."","#r#c99cc36�ڹ����� +"..tostring(PetStar*369).."","#r#c99cc36Ѫ���� +"..tostring(PetStar*667).."","#r#c99cc36�������ļ��ܶ���ҵ���Ч����("..tostring(PetStar).."����Ч��)"}
				
				local TaoJCSX = ""  --��������
				local TaoHave=""    --Ӱ�����Լ����
				local TaoYCSX=""    --Ӱ������
				local PetTaoNum = 0 --���˼���
				
				if PetAct == 1 or PetAct == 3 then
					TaoJCSX = petEqJCSX[1]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 2 or PetAct == 5 then
					TaoJCSX = petEqJCSX[2]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 4 then
					TaoJCSX = petEqJCSX[3]..petEqQHSX[PetType]
				end
				
				for i = 1,5 do
					if PetStar == math.floor(math.mod(PetEq[i],100)/10) and PetType == math.floor(math.mod(PetEq[i],1000)/100) then
						TaoNum = 1
						TaoEvery = "#r#cffcc00"..PetEqShuX[PetType][i]
					else
						TaoNum = 0
						TaoEvery = "#r#c666666"..PetEqShuX[PetType][i]
					end
					PetTaoNum = PetTaoNum + TaoNum
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --Ӱ��������
					TaoHave = TaoHave..TaoEvery    --Ӱ�����Լ����
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666δ֪����"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				szPropertys = "#cccffff�Ѱ�".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc����δ����"
				SuperTooltip_Property:SetText(szPropertys);
			end
			
			
                    if PetLev == 95 then
                       local petEqJCSX = {"#cffcc99�����⹦���� +718#r�����ڹ����� +718","#cffcc99�����⹦���� +727#r�����ڹ����� +727","#cffcc99�������� +655"}  --��������
                       local petEqEWSX = {"#r#cffcc40�ڹ����� +"..tostring(PetStar*211).."#r���� +"..tostring(PetStar*29).."#r���� +"..tostring(PetStar*5).."#r���� +"..tostring(PetStar*10).."","#r#cffcc40�⹦���� +"..tostring(PetStar*211).."#r���� +"..tostring(PetStar*29).."#r���� +"..tostring(PetStar*5).."#r���� +"..tostring(PetStar*10).."","#r#cffcc40�⹦���� +"..tostring(PetStar*209).."#r�ڹ����� +"..tostring(PetStar*209).."#r���� +"..tostring(PetStar*15).."#r���� +"..tostring(PetStar*10)..""}  --��������
                       local petEqQHSX = {"#r#c6699ff�����������ϣ����� +"..tostring(PetStar*3)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar*3)..".0%","#r#c6699ff�����������ϣ����� +"..tostring(PetStar*3)..".0%"}
                       local PetEqNam = {"����������","��ʨ���ۡ���","������Ѫ����"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"���������޿�����","����������צ����","���������޼ס���","���������޻�����","�����������Ρ���"} 
                             PetEqShuX[2] = {"��ʨ�����޿�����","��ʨ������צ����","��ʨ�����޼ס���","��ʨ�����޻�����","��ʨ�������Ρ���"} 
                             PetEqShuX[3] = {"������Ѫ�޿�����","������Ѫ��צ����","������Ѫ�޼ס���","������Ѫ�޻�����","������Ѫ���Ρ���"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36�ڹ����� +"..tostring(PetStar*416).."","#r#c99cc36���� +"..tostring(PetStar*536).."","#r#c99cc36���� +"..tostring(PetStar*21).."","#r#c99cc36�����һ��䡢�����䡢Ѫ���䡢�������ͷż���("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[2] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*416).."","#r#c99cc36���� +"..tostring(PetStar*536).."","#r#c99cc36���� +"..tostring(PetStar*21).."","#r#c99cc36�������������ͷż���("..tostring(PetStar).."����Ч��)"}
                             PetEqYCSX[3] = {"#r#c99cc36�⹦���� +"..tostring(PetStar*411).."","#r#c99cc36�ڹ����� +"..tostring(PetStar*411).."","#r#c99cc36Ѫ���� +"..tostring(PetStar*764).."","#r#c99cc36�����������ܶ���ҵ���Ч����("..tostring(PetStar).."����Ч��)"}
				
				local TaoJCSX = ""  --��������
				local TaoHave=""    --Ӱ�����Լ����
				local TaoYCSX=""    --Ӱ������
				local PetTaoNum = 0 --���˼���
				
				if PetAct == 1 or PetAct == 3 then
					TaoJCSX = petEqJCSX[1]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 2 or PetAct == 5 then
					TaoJCSX = petEqJCSX[2]..petEqEWSX[PetType]..petEqQHSX[PetType]
				elseif PetAct == 4 then
					TaoJCSX = petEqJCSX[3]..petEqQHSX[PetType]
				end
				
				for i = 1,5 do
					if PetStar == math.floor(math.mod(PetEq[i],100)/10) and PetType == math.floor(math.mod(PetEq[i],1000)/100) then
						TaoNum = 1
						TaoEvery = "#r#cffcc00"..PetEqShuX[PetType][i]
					else
						TaoNum = 0
						TaoEvery = "#r#c666666"..PetEqShuX[PetType][i]
					end
					PetTaoNum = PetTaoNum + TaoNum
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --Ӱ��������
					TaoHave = TaoHave..TaoEvery    --Ӱ�����Լ����
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666δ֪����"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				
				szPropertys =  "#cccffff�Ѱ�".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc����δ����"
				SuperTooltip_Property:SetText(szPropertys);
			end
		end
	end


	
if typeDesc~= nil then
local ePos = string.find(typeDesc,"��ʯ")
if ePos ~= nil then
SuperTooltip_Explain:SetText(szExplain.."#G��ʯ�������� +"..BSdjpf.."\n#G��ʯ�������� +"..BSdjpf);
else
SuperTooltip_Explain:SetText(szExplain);
end
else
SuperTooltip_Explain:SetText(szExplain);
end
	AxTrace( 8,0,"Show tooltip  "..szExplain);
	return 1;
end



function GetSe_XWH() --���
	local     	typeDesc = SuperTooltips:GetTypeDesc();
	local   	szPropertys = SuperTooltips:GetPropertys();
	wunhPos1,wunhsxPos1 = string.find(typeDesc, "���")
	if  wunhPos1 ~= nil and  wunhsxPos1 ~= nil then
		local u1,u2,u3 =GetWuHunStr()
		local tmp1,tmp2=string.find(szPropertys, "��#r")
		local tmp3,tmp4=string.find(szPropertys, "����#r")
		if tmp3~=nil then
			szPropertys=string.gsub(szPropertys, "����#r", "����#r"..u1);
		elseif tmp1~=nil then
			szPropertys=string.gsub(szPropertys, "��#r", "��#r"..u1);
		else
			szPropertys=u1..szPropertys
		end
		local xianwunbPos = {}
		local xianwunbsxPos = {}
		local wunh = {}
		local wunhid = {}
		local srwuhu = {"#{equip_attr_str}(%s+)+(%d+)","#{equip_attr_spr}(%s+)+(%d+)","#{equip_attr_con}(%s+)+(%d+)","#{equip_attr_int}(%s+)+(%d+)","#{equip_attr_dex}(%s+)+(%d+)"}
		local lisiwuhunsuxing = {0,0,0,0,0}
		for i = 1,5 do
			xianwunbPos[i],xianwunbsxPos[i] = string.find(szPropertys, srwuhu[i])
			if xianwunbPos[i] ~= nil and xianwunbsxPos[i] ~= nil  then
				wunh[i] = string.sub(szPropertys,xianwunbPos[i],xianwunbPos[i]+17)
				wunhid[i] = string.sub(szPropertys,xianwunbPos[i]+17,xianwunbsxPos[i])
				wunh[i] = string.gsub(wunh[i],"(%s+)","")
				wunhid[i] = string.gsub(wunhid[i],"(%s+)","")
				wunhid[i]  = string.gsub(wunhid[i],"+","")
				lisiwuhunsuxing[i] = (wunhid[i])*2
				if lisiwuhunsuxing[i] == nil then
					lisiwuhunsuxing[i] = 0
				end
				if i <=4 then
					szPropertys=string.gsub(szPropertys, srwuhu[i],""..wunh[i]..":+"..lisiwuhunsuxing[i].." (ԭʼ"..wunh[i]..":"..wunhid[i]..")")
				else
					szPropertys=string.gsub(szPropertys, srwuhu[i],""..wunh[i]..":+"..lisiwuhunsuxing[i].." (ԭʼ"..wunh[i]..":"..wunhid[i]..")\n"..u2..u3)
				end
			end
		end
		return 	szPropertys,lisiwuhunsuxing
	else
		return 	nil	,nil
	end
end

function GetWuHunStr() --���
	local skilllistaec = {}
	skilllistaec["00"] = ""
	skilllistaec["q1"] = "#r#c009933����֮�꣨1����#r#ccccccc�Ȼ��������Ļ������⹦��������70%%"
	skilllistaec["q2"] = "#r#c009933����֮�꣨2����#r#ccccccc�Ȼ��������Ļ������⹦��������80%%"
	skilllistaec["q3"] = "#r#c009933����֮�꣨3����#r#ccccccc�Ȼ��������Ļ������⹦��������90%%"
	skilllistaec["q4"] = "#r#c009933����֮�꣨4����#r#ccccccc�Ȼ��������Ļ������⹦��������100%%"
	skilllistaec["q5"] = "#r#c009933����֮�꣨5����#r#ccccccc�Ȼ��������Ļ������⹦��������110%%"
	skilllistaec["q6"] = "#r#c009933����֮�꣨6����#r#ccccccc�Ȼ��������Ļ������⹦��������120%%"
	skilllistaec["q7"] = "#r#c009933����֮�꣨7����#r#ccccccc�Ȼ��������Ļ������⹦��������180%%"
	skilllistaec["q8"] = "#r#c009933����֮�꣨8����#r#ccccccc�Ȼ��������Ļ������⹦��������200%%"
	skilllistaec["w1"] = "#r#c009933����֮�꣨1����#r#ccccccc����˫���������Ļ������⹦��������70%%"
	skilllistaec["w2"] = "#r#c009933����֮�꣨2����#r#ccccccc����˫���������Ļ������⹦��������80%%"
	skilllistaec["w3"] = "#r#c009933����֮�꣨3����#r#ccccccc����˫���������Ļ������⹦��������90%%"
	skilllistaec["w4"] = "#r#c009933����֮�꣨4����#r#ccccccc����˫���������Ļ������⹦��������100%%"
	skilllistaec["w5"] = "#r#c009933����֮�꣨5����#r#ccccccc����˫���������Ļ������⹦��������110%%"
	skilllistaec["w6"] = "#r#c009933����֮�꣨6����#r#ccccccc����˫���������Ļ������⹦��������120%%"
	skilllistaec["w7"] = "#r#c009933����֮�꣨7����#r#ccccccc����˫���������Ļ������⹦��������180%%"
	skilllistaec["w8"] = "#r#c009933����֮�꣨8����#r#ccccccc����˫���������Ļ������⹦��������200%%"
	skilllistaec["e1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ǹ���������Ļ������⹦��������70%%"
	skilllistaec["e2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ǹ���������Ļ������⹦��������80%%"
	skilllistaec["e3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ǹ���������Ļ������⹦��������90%%"
	skilllistaec["e4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ǹ���������Ļ������⹦��������100%%"
	skilllistaec["e5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ǹ���������Ļ������⹦��������110%%"
	skilllistaec["e6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ǹ���������Ļ������⹦��������120%%"
	skilllistaec["e7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ǹ���������Ļ������⹦��������180%%"
	skilllistaec["e8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ǹ���������Ļ������⹦��������200%%"
	skilllistaec["r1"] = "#r#c009933����֮�꣨1����#r#ccccccc���ߵĻ������⹦��������70%%"
	skilllistaec["r2"] = "#r#c009933����֮�꣨2����#r#ccccccc���ߵĻ������⹦��������80%%"
	skilllistaec["r3"] = "#r#c009933����֮�꣨3����#r#ccccccc���ߵĻ������⹦��������90%%"
	skilllistaec["r4"] = "#r#c009933����֮�꣨4����#r#ccccccc���ߵĻ������⹦��������100%%"
	skilllistaec["r5"] = "#r#c009933����֮�꣨5����#r#ccccccc���ߵĻ������⹦��������110%%"
	skilllistaec["r6"] = "#r#c009933����֮�꣨6����#r#ccccccc���ߵĻ������⹦��������120%%"
	skilllistaec["r7"] = "#r#c009933����֮�꣨7����#r#ccccccc���ߵĻ������⹦��������180%%"
	skilllistaec["r8"] = "#r#c009933����֮�꣨8����#r#ccccccc���ߵĻ������⹦��������200%%"	
	skilllistaec["t1"] = "#r#c009933ӥ��֮�꣨1����#r#ccccccc���������Ļ������⹦��������70%%"
	skilllistaec["t2"] = "#r#c009933ӥ��֮�꣨2����#r#ccccccc���������Ļ������⹦��������80%%"
	skilllistaec["t3"] = "#r#c009933ӥ��֮�꣨3����#r#ccccccc���������Ļ������⹦��������90%%"
	skilllistaec["t4"] = "#r#c009933ӥ��֮�꣨4����#r#ccccccc���������Ļ������⹦��������100%%"
	skilllistaec["t5"] = "#r#c009933ӥ��֮�꣨5����#r#ccccccc���������Ļ������⹦��������110%%"
	skilllistaec["t6"] = "#r#c009933ӥ��֮�꣨6����#r#ccccccc���������Ļ������⹦��������120%%"
	skilllistaec["t7"] = "#r#c009933ӥ��֮�꣨7����#r#ccccccc���������Ļ������⹦��������180%%"
	skilllistaec["t8"] = "#r#c009933ӥ��֮�꣨8����#r#ccccccc���������Ļ������⹦��������200%%"
	skilllistaec["y1"] = "#r#c009933����֮�꣨1����#r#ccccccc�����������Ļ������⹦��������70%%"
	skilllistaec["y2"] = "#r#c009933����֮�꣨2����#r#ccccccc�����������Ļ������⹦��������80%%"
	skilllistaec["y3"] = "#r#c009933����֮�꣨3����#r#ccccccc�����������Ļ������⹦��������90%%"
	skilllistaec["y4"] = "#r#c009933����֮�꣨4����#r#ccccccc�����������Ļ������⹦��������100%%"
	skilllistaec["y5"] = "#r#c009933����֮�꣨5����#r#ccccccc�����������Ļ������⹦��������110%%"
	skilllistaec["y6"] = "#r#c009933����֮�꣨6����#r#ccccccc�����������Ļ������⹦��������120%%"
	skilllistaec["y7"] = "#r#c009933����֮�꣨7����#r#ccccccc�����������Ļ������⹦��������180%%"
	skilllistaec["y8"] = "#r#c009933����֮�꣨8����#r#ccccccc�����������Ļ������⹦��������200%%"
	skilllistaec["u1"] = "#r#c009933����֮�꣨1����#r#ccccccc�｣�������Ļ������⹦��������70%%"
	skilllistaec["u2"] = "#r#c009933����֮�꣨2����#r#ccccccc�｣�������Ļ������⹦��������80%%"
	skilllistaec["u3"] = "#r#c009933����֮�꣨3����#r#ccccccc�｣�������Ļ������⹦��������90%%"
	skilllistaec["u4"] = "#r#c009933����֮�꣨4����#r#ccccccc�｣�������Ļ������⹦��������100%%"
	skilllistaec["u5"] = "#r#c009933����֮�꣨5����#r#ccccccc�｣�������Ļ������⹦��������110%%"
	skilllistaec["u6"] = "#r#c009933����֮�꣨6����#r#ccccccc�｣�������Ļ������⹦��������120%%"
	skilllistaec["u7"] = "#r#c009933����֮�꣨7����#r#ccccccc�｣�������Ļ������⹦��������180%%"
	skilllistaec["u8"] = "#r#c009933����֮�꣨8����#r#ccccccc�｣�������Ļ������⹦��������200%%"
	skilllistaec["i1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������23�㣬����10��"
	skilllistaec["i2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������56�㣬����10��"
	skilllistaec["i3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������79�㣬����10��"
	skilllistaec["i4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������102�㣬����10��"
	skilllistaec["i5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������165�㣬����10��"
	skilllistaec["i6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������178�㣬����10��"
	skilllistaec["i7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������215�㣬����10��"
	skilllistaec["i8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������275�㣬����10��"
	skilllistaec["o1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������23�㣬����10��"
	skilllistaec["o2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������56�㣬����10��"
	skilllistaec["o3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������79�㣬����10��"
	skilllistaec["o4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������102�㣬����10��"
	skilllistaec["o5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������165�㣬����10��"
	skilllistaec["o6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������178�㣬����10��"
	skilllistaec["o7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������215�㣬����10��"
	skilllistaec["o8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������275�㣬����10��"
	skilllistaec["p1"] = "#r#c009933�Ҷ�֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��23�㣬����10��"
	skilllistaec["p2"] = "#r#c009933�Ҷ�֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��56�㣬����10��"
	skilllistaec["p3"] = "#r#c009933�Ҷ�֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��79�㣬����10��"
	skilllistaec["p4"] = "#r#c009933�Ҷ�֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��102�㣬����10��"
	skilllistaec["p5"] = "#r#c009933�Ҷ�֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��165�㣬����10��"
	skilllistaec["p6"] = "#r#c009933�Ҷ�֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��178�㣬����10��"
	skilllistaec["p7"] = "#r#c009933�Ҷ�֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��215�㣬����10��"
	skilllistaec["p8"] = "#r#c009933�Ҷ�֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ�궨��275�㣬����10��"
	skilllistaec["a1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����16�㣬����10��"
	skilllistaec["a2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����23�㣬����10��"
	skilllistaec["a3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����39�㣬����10��"
	skilllistaec["a4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����56�㣬����10��"
	skilllistaec["a5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����82�㣬����10��"
	skilllistaec["a6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����89�㣬����10��"
	skilllistaec["a7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����120�㣬����10��"
	skilllistaec["a8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����160�㣬����10��"
	skilllistaec["s1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������14�㣬����10��"
	skilllistaec["s2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������39�㣬����10��"
	skilllistaec["s3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������54�㣬����10��"
	skilllistaec["s4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������89�㣬����10��"
	skilllistaec["s5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������154�㣬����10��"
	skilllistaec["s6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������209�㣬����10��"
	skilllistaec["s7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������270�㣬����10��"
	skilllistaec["s8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ����������300�㣬����10��"
	skilllistaec["d1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ���������������⹦����1256�㣬����10��"
	skilllistaec["d2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ���������������⹦����2396�㣬����10��"
	skilllistaec["d3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ���������������⹦����5552�㣬����10��"
	skilllistaec["d4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ���������������⹦����10724�㣬����10��"
	skilllistaec["d5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ���������������⹦����19160�㣬����10��"
	skilllistaec["d6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ���������������⹦����22131�㣬����10��"
	skilllistaec["d7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ���������������⹦����22416�㣬����10��"
	skilllistaec["d8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ���������������⹦����22931�㣬����10��"
	skilllistaec["f1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ���������������ڹ�����1256�㣬����10��"
	skilllistaec["f2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ���������������ڹ�����2396�㣬����10��"
	skilllistaec["f3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ���������������ڹ�����5552�㣬����10��"
	skilllistaec["f4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ���������������ڹ�����10724�㣬����10��"
	skilllistaec["f5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ���������������ڹ�����19160�㣬����10��"
	skilllistaec["f6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ���������������ڹ�����22131�㣬����10��"
	skilllistaec["f7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ���������������ڹ�����22416�㣬����10��"
	skilllistaec["f8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ���������������ڹ�����22931�㣬����10��"
	skilllistaec["g1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ���������������⹦����1249�㣬����10��"
	skilllistaec["g2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ���������������⹦����2388�㣬����10��"
	skilllistaec["g3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ���������������⹦����5544�㣬����10��"
	skilllistaec["g4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ���������������⹦����10716�㣬����10��"
	skilllistaec["g5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ���������������⹦����19080�㣬����10��"
	skilllistaec["g6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ���������������⹦����22121�㣬����10��"
	skilllistaec["g7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ���������������⹦����22416�㣬����10��"
	skilllistaec["g8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ���������������⹦����22931�㣬����10��"
	skilllistaec["h1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ���������������ڹ�����1249�㣬����10��"
	skilllistaec["h2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ���������������ڹ�����2388�㣬����10��"
	skilllistaec["h3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ���������������ڹ�����5544�㣬����10��"
	skilllistaec["h4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ���������������ڹ�����10716�㣬����10��"
	skilllistaec["h5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ���������������ڹ�����19080�㣬����10��"
	skilllistaec["h6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ���������������ڹ�����22121�㣬����10��"
	skilllistaec["h7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ���������������ڹ�����22416�㣬����10��"
	skilllistaec["h8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ���������������ڹ�����22931�㣬����10��"
	skilllistaec["j1"] = "#r#c009933��׼֮�꣨1����#r#ccccccc����ʱ��һ������������������1398�㣬����10��"
	skilllistaec["j2"] = "#r#c009933��׼֮�꣨2����#r#ccccccc����ʱ��һ������������������1555�㣬����10��"
	skilllistaec["j3"] = "#r#c009933��׼֮�꣨3����#r#ccccccc����ʱ��һ������������������2028�㣬����10��"
	skilllistaec["j4"] = "#r#c009933��׼֮�꣨4����#r#ccccccc����ʱ��һ������������������2920�㣬����10��"
	skilllistaec["j5"] = "#r#c009933��׼֮�꣨5����#r#ccccccc����ʱ��һ������������������4134�㣬����10��"
	skilllistaec["j6"] = "#r#c009933��׼֮�꣨6����#r#ccccccc����ʱ��һ������������������5372�㣬����10��"
	skilllistaec["j7"] = "#r#c009933��׼֮�꣨7����#r#ccccccc����ʱ��һ������������������6634�㣬����10��"
	skilllistaec["j8"] = "#r#c009933��׼֮�꣨8����#r#ccccccc����ʱ��һ������������������7334�㣬����10��"
	skilllistaec["k1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ������������������464�㣬����10��"
	skilllistaec["k2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ������������������516�㣬����10��"
	skilllistaec["k3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ������������������774�㣬����10��"
	skilllistaec["k4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ������������������1038�㣬����10��"
	skilllistaec["k5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ������������������1710�㣬����10��"
	skilllistaec["k6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ������������������2790�㣬����10��"
	skilllistaec["k7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ������������������2910�㣬����10��"
	skilllistaec["k8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ������������������3210�㣬����10��"
	skilllistaec["l1"] = "#r#c009933�ϸ�֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����1256�㣬����10��"
	skilllistaec["l2"] = "#r#c009933�ϸ�֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����2396�㣬����10��"
	skilllistaec["l3"] = "#r#c009933�ϸ�֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����5552�㣬����10��"
	skilllistaec["l4"] = "#r#c009933�ϸ�֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����10724�㣬����10��"
	skilllistaec["l5"] = "#r#c009933�ϸ�֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����19160�㣬����10��"
	skilllistaec["l6"] = "#r#c009933�ϸ�֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22131�㣬����10��"
	skilllistaec["l7"] = "#r#c009933�ϸ�֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22416�㣬����10��"
	skilllistaec["l8"] = "#r#c009933�ϸ�֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22931�㣬����10��"
	skilllistaec["z1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����1256�㣬����10��"
	skilllistaec["z2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����2396�㣬����10��"
	skilllistaec["z3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����5552�㣬����10��"
	skilllistaec["z4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����10724�㣬����10��"
	skilllistaec["z5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����19160�㣬����10��"
	skilllistaec["z6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22131�㣬����10��"
	skilllistaec["z7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22416�㣬����10��"
	skilllistaec["z8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22931�㣬����10��"
	skilllistaec["x1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����1249�㣬����10��"
	skilllistaec["x2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����2388�㣬����10��"
	skilllistaec["x3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����5544�㣬����10��"
	skilllistaec["x4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����10716�㣬����10��"
	skilllistaec["x5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����19080�㣬����10��"
	skilllistaec["x6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22121�㣬����10��"
	skilllistaec["x7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22416�㣬����10��"
	skilllistaec["x8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���⹦����22931�㣬����10��"
	skilllistaec["c1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����1249�㣬����10��"
	skilllistaec["c2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����2388�㣬����10��"
	skilllistaec["c3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����5544�㣬����10��"
	skilllistaec["c4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����10716�㣬����10��"
	skilllistaec["c5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����19080�㣬����10��"
	skilllistaec["c6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22121�㣬����10��"
	skilllistaec["c7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22416�㣬����10��"
	skilllistaec["c8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ���ڹ�����22931�㣬����10��"
	skilllistaec["v1"] = "#r#c009933��׼֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������1398�㣬����10��"
	skilllistaec["v2"] = "#r#c009933��׼֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������1555�㣬����10��"
	skilllistaec["v3"] = "#r#c009933��׼֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������2028�㣬����10��"
	skilllistaec["v4"] = "#r#c009933��׼֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������2920�㣬����10��"
	skilllistaec["v5"] = "#r#c009933��׼֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������4134�㣬����10��"
	skilllistaec["v6"] = "#r#c009933��׼֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������5372�㣬����10��"
	skilllistaec["v7"] = "#r#c009933��׼֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������5634�㣬����10��"
	skilllistaec["v8"] = "#r#c009933��׼֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������5334�㣬����10��"
	skilllistaec["b1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������464�㣬����10��"
	skilllistaec["b2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������516�㣬����10��"
	skilllistaec["b3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������774�㣬����10��"
	skilllistaec["b4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������1038�㣬����10��"
	skilllistaec["b5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������1710�㣬����10��"
	skilllistaec["b6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������2790�㣬����10��"
	skilllistaec["b7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������2910�㣬����10��"
	skilllistaec["b8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʽ���Ŀ������3210�㣬����10��"
	skilllistaec["n1"] = "#r#c009933ǿ��֮�꣨1����#r#ccccccc����ʱ��һ�����������˺�3870��"
	skilllistaec["n2"] = "#r#c009933ǿ��֮�꣨2����#r#ccccccc����ʱ��һ�����������˺�5208��"
	skilllistaec["n3"] = "#r#c009933ǿ��֮�꣨3����#r#ccccccc����ʱ��һ�����������˺�7232��"
	skilllistaec["n4"] = "#r#c009933ǿ��֮�꣨4����#r#ccccccc����ʱ��һ�����������˺�9259��"
	skilllistaec["n5"] = "#r#c009933ǿ��֮�꣨5����#r#ccccccc����ʱ��һ�����������˺�10288��"
	skilllistaec["n6"] = "#r#c009933ǿ��֮�꣨6����#r#ccccccc����ʱ��һ�����������˺�20320��"
	skilllistaec["n7"] = "#r#c009933ǿ��֮�꣨7����#r#ccccccc����ʱ��һ�����������˺�20358��"
	skilllistaec["n8"] = "#r#c009933ǿ��֮�꣨8����#r#ccccccc����ʱ��һ�����������˺�20438��"
	skilllistaec["m1"] = "#r#c009933����֮�꣨1����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��720����"
	skilllistaec["m2"] = "#r#c009933����֮�꣨2����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��810����"
	skilllistaec["m3"] = "#r#c009933����֮�꣨3����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��910����"
	skilllistaec["m4"] = "#r#c009933����֮�꣨4����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��1020����"
	skilllistaec["m5"] = "#r#c009933����֮�꣨5����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��1500����"
	skilllistaec["m6"] = "#r#c009933����֮�꣨6����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��2128����"
	skilllistaec["m7"] = "#r#c009933����֮�꣨7����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��2145����"
	skilllistaec["m8"] = "#r#c009933����֮�꣨8����#r#ccccccc����ʱ��һ�����ʿ۳�Ŀ��2195����"
	skilllistaec["Q1"] = "#r#c009933�����˷���1����#r#ccccccc�⹦��������21858�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q2"] = "#r#c009933�����˷���2����#r#ccccccc�⹦��������24820�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q3"] = "#r#c009933�����˷���3����#r#ccccccc�⹦��������27778�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q4"] = "#r#c009933�����˷���4����#r#ccccccc�⹦��������30739�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q5"] = "#r#c009933�����˷���5����#r#ccccccc�⹦��������33702�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q6"] = "#r#c009933�����˷���6����#r#ccccccc�⹦��������36664�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q7"] = "#r#c009933�����˷���7����#r#ccccccc�⹦��������38264�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Q8"] = "#r#c009933�����˷���8����#r#ccccccc�⹦��������42000�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W1"] = "#r#c009933����ɢɱ��1����#r#ccccccc�ڹ���������21858�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W2"] = "#r#c009933����ɢɱ��2����#r#ccccccc�ڹ���������24820�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W3"] = "#r#c009933����ɢɱ��3����#r#ccccccc�ڹ���������27778�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W4"] = "#r#c009933����ɢɱ��4����#r#ccccccc�ڹ���������30739�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W5"] = "#r#c009933����ɢɱ��5����#r#ccccccc�ڹ���������33702�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W6"] = "#r#c009933����ɢɱ��6����#r#ccccccc�ڹ���������36664�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W7"] = "#r#c009933����ɢɱ��7����#r#ccccccc�ڹ���������38264�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["W8"] = "#r#c009933����ɢɱ��8����#r#ccccccc�ڹ���������42000�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E1"] = "#r#c009933�������1����#r#ccccccc����������528�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E2"] = "#r#c009933�������2����#r#ccccccc����������715�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E3"] = "#r#c009933�������3����#r#ccccccc����������1003�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E4"] = "#r#c009933�������4����#r#ccccccc����������2092�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E5"] = "#r#c009933�������5����#r#ccccccc����������3280�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E6"] = "#r#c009933�������6����#r#ccccccc����������3567�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E7"] = "#r#c009933�������7����#r#ccccccc����������3980�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["E8"] = "#r#c009933�������8����#r#ccccccc����������4780�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R1"] = "#r#c009933�����ԭ��1����#r#ccccccc�𹥻�����528�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R2"] = "#r#c009933�����ԭ��2����#r#ccccccc�𹥻�����715�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R3"] = "#r#c009933�����ԭ��3����#r#ccccccc�𹥻�����1003�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R4"] = "#r#c009933�����ԭ��4����#r#ccccccc�𹥻�����2092�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R5"] = "#r#c009933�����ԭ��5����#r#ccccccc�𹥻�����3280�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R6"] = "#r#c009933�����ԭ��6����#r#ccccccc�𹥻�����3567�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R7"] = "#r#c009933�����ԭ��7����#r#ccccccc�𹥻�����3980�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["R8"] = "#r#c009933�����ԭ��8����#r#ccccccc�𹥻�����4780�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T1"] = "#r#c009933�����콵��1����#r#ccccccc����������528�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T2"] = "#r#c009933�����콵��2����#r#ccccccc����������715�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T3"] = "#r#c009933�����콵��3����#r#ccccccc����������1003�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T4"] = "#r#c009933�����콵��4����#r#ccccccc����������2092�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T5"] = "#r#c009933�����콵��5����#r#ccccccc����������3280�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T6"] = "#r#c009933�����콵��6����#r#ccccccc����������3567�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T7"] = "#r#c009933�����콵��7����#r#ccccccc����������3980�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["T8"] = "#r#c009933�����콵��8����#r#ccccccc����������4780�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y1"] = "#r#c009933�綾���ߣ�1����#r#ccccccc����������528�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y2"] = "#r#c009933�綾���ߣ�2����#r#ccccccc����������715�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y3"] = "#r#c009933�綾���ߣ�3����#r#ccccccc����������1003�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y4"] = "#r#c009933�綾���ߣ�4����#r#ccccccc����������2092�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y5"] = "#r#c009933�綾���ߣ�5����#r#ccccccc����������3280�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y6"] = "#r#c009933�綾���ߣ�6����#r#ccccccc����������3567�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y7"] = "#r#c009933�綾���ߣ�7����#r#ccccccc����������3980�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["Y8"] = "#r#c009933�綾���ߣ�8����#r#ccccccc����������4780�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U1"] = "#r#c009933ŭ��������1����#r#ccccccc�����˺�1746�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U2"] = "#r#c009933ŭ��������2����#r#ccccccc�����˺�2118�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U3"] = "#r#c009933ŭ��������3����#r#ccccccc�����˺�3490�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U4"] = "#r#c009933ŭ��������4����#r#ccccccc�����˺�5862�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U5"] = "#r#c009933ŭ��������5����#r#ccccccc�����˺�8931�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U6"] = "#r#c009933ŭ��������6����#r#ccccccc�����˺�12510�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U7"] = "#r#c009933ŭ��������7����#r#ccccccc�����˺�14700�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["U8"] = "#r#c009933ŭ��������8����#r#ccccccc�����˺�15500�㣬��Ŀ�꼰Ŀ����Χ���3��Ŀ������˺�"
	skilllistaec["I1"] = "#r#c009933�����ػ���1����#r#ccccccc�⹦��������21858��"
	skilllistaec["I2"] = "#r#c009933�����ػ���2����#r#ccccccc�⹦��������24820��"
	skilllistaec["I3"] = "#r#c009933�����ػ���3����#r#ccccccc�⹦��������27778��"
	skilllistaec["I4"] = "#r#c009933�����ػ���4����#r#ccccccc�⹦��������30739��"
	skilllistaec["I5"] = "#r#c009933�����ػ���5����#r#ccccccc�⹦��������33702��"
	skilllistaec["I6"] = "#r#c009933�����ػ���6����#r#ccccccc�⹦��������36664��"
	skilllistaec["I7"] = "#r#c009933�����ػ���7����#r#ccccccc�⹦��������42774��"
	skilllistaec["I8"] = "#r#c009933�����ػ���8����#r#ccccccc�⹦��������50000��"
	skilllistaec["O1"] = "#r#c009933����ͻϮ��1����#r#ccccccc�ڹ���������21858��"
	skilllistaec["O2"] = "#r#c009933����ͻϮ��2����#r#ccccccc�ڹ���������24820��"
	skilllistaec["O3"] = "#r#c009933����ͻϮ��3����#r#ccccccc�ڹ���������27778��"
	skilllistaec["O4"] = "#r#c009933����ͻϮ��4����#r#ccccccc�ڹ���������30739��"
	skilllistaec["O5"] = "#r#c009933����ͻϮ��5����#r#ccccccc�ڹ���������33702��"
	skilllistaec["O6"] = "#r#c009933����ͻϮ��6����#r#ccccccc�ڹ���������36664 ��"
	skilllistaec["O7"] = "#r#c009933����ͻϮ��7����#r#ccccccc�ڹ���������42774��"
	skilllistaec["O8"] = "#r#c009933����ͻϮ��8����#r#ccccccc�ڹ���������50000��"
	skilllistaec["P1"] = "#r#c009933�������̣�1����#r#ccccccc����������528��"
	skilllistaec["P2"] = "#r#c009933�������̣�2����#r#ccccccc����������715��"
	skilllistaec["P3"] = "#r#c009933�������̣�3����#r#ccccccc����������1003��"
	skilllistaec["P4"] = "#r#c009933�������̣�4����#r#ccccccc����������2092��"
	skilllistaec["P5"] = "#r#c009933�������̣�5����#r#ccccccc����������3280��"
	skilllistaec["P6"] = "#r#c009933�������̣�6����#r#ccccccc����������3567��"
	skilllistaec["P7"] = "#r#c009933�������̣�7����#r#ccccccc����������4161��"
	skilllistaec["P8"] = "#r#c009933�������̣�8����#r#ccccccc����������4755��"
	skilllistaec["A1"] = "#r#c009933��������1����#r#ccccccc�𹥻�����528��"
	skilllistaec["A2"] = "#r#c009933��������2����#r#ccccccc�𹥻�����715��"
	skilllistaec["A3"] = "#r#c009933��������3����#r#ccccccc�𹥻�����1003��"
	skilllistaec["A4"] = "#r#c009933��������4����#r#ccccccc�𹥻�����2092��"
	skilllistaec["A5"] = "#r#c009933��������5����#r#ccccccc�𹥻�����3280��"
	skilllistaec["A6"] = "#r#c009933��������6����#r#ccccccc�𹥻�����3567��"
	skilllistaec["A7"] = "#r#c009933��������7����#r#ccccccc�𹥻�����4161��"
	skilllistaec["A8"] = "#r#c009933��������8����#r#ccccccc�𹥻�����4755��"
	skilllistaec["S1"] = "#r#c009933���׺䶥��1����#r#ccccccc����������528��"
	skilllistaec["S2"] = "#r#c009933���׺䶥��2����#r#ccccccc����������715��"
	skilllistaec["S3"] = "#r#c009933���׺䶥��3����#r#ccccccc����������1003��"
	skilllistaec["S4"] = "#r#c009933���׺䶥��4����#r#ccccccc����������2092��"
	skilllistaec["S5"] = "#r#c009933���׺䶥��5����#r#ccccccc����������3280��"
	skilllistaec["S6"] = "#r#c009933���׺䶥��6����#r#ccccccc����������3567��"
	skilllistaec["S7"] = "#r#c009933���׺䶥��7����#r#ccccccc����������4161��"
	skilllistaec["S8"] = "#r#c009933���׺䶥��8����#r#ccccccc����������4755��"
	skilllistaec["D1"] = "#r#c009933��ʴ����1����#r#ccccccc����������528��"
	skilllistaec["D2"] = "#r#c009933��ʴ����2����#r#ccccccc����������715��"
	skilllistaec["D3"] = "#r#c009933��ʴ����3����#r#ccccccc����������1003��"
	skilllistaec["D4"] = "#r#c009933��ʴ����4����#r#ccccccc����������2092��"
	skilllistaec["D5"] = "#r#c009933��ʴ����5����#r#ccccccc����������3280��"
	skilllistaec["D6"] = "#r#c009933��ʴ����6����#r#ccccccc����������3567��"
	skilllistaec["D7"] = "#r#c009933��ʴ����7����#r#ccccccc����������4161��"
	skilllistaec["D8"] = "#r#c009933��ʴ����8����#r#ccccccc����������4755��"
	skilllistaec["F1"] = "#r#c009933�����ͻ���1����#r#ccccccc�����˺�1746��"
	skilllistaec["F2"] = "#r#c009933�����ͻ���2����#r#ccccccc�����˺�2118��"
	skilllistaec["F3"] = "#r#c009933�����ͻ���3����#r#ccccccc�����˺�3490��"
	skilllistaec["F4"] = "#r#c009933�����ͻ���4����#r#ccccccc�����˺�5862��"
	skilllistaec["F5"] = "#r#c009933�����ͻ���5����#r#ccccccc�����˺�8931��"
	skilllistaec["F6"] = "#r#c009933�����ͻ���6����#r#ccccccc�����˺�12510��"
	skilllistaec["F7"] = "#r#c009933�����ͻ���7����#r#ccccccc�����˺�11666��"
	skilllistaec["F8"] = "#r#c009933�����ͻ���8����#r#ccccccc�����˺�15332��"
	
	Str = SuperTooltips:GetAuthorInfo();
	local hc,kz,sx,jn,sx1,sxtable ,sxtable1 = GetWH_er(Str)
	if Str==nil or 	Str=="" then
		return "#c993333�ɳ���:(100)\n","#ccc33cc�ϳɵȼ�:"..hc.."\n","#cff99ff��չ��������:"..kz.."\n"
	end
	local T1,t1 = string.find(Str,"&WH")
	if T1 == nil or t1 ==nil then
		return "#c993333�ɳ���:(100)\n","#ccc33cc�ϳɵȼ�:"..hc.."\n","#cff99ff��չ��������:"..kz.."\n"
	end
	
	local sxsx= ""
	if tonumber(sx1) >0 and tonumber(sx1) <5 then
		sxsx="#c00ffff"..Kfs_Magic_tips[tonumber(sx1)+1]
	end
	local sxtablestr,sxa ="" ,""
	if table.getn(sxtable) >0 then
		for i=1,table.getn(sxtable) do
			sxa =x892101_iText[sxtable[i]][1]..x892101_iText[sxtable[i]][2]..x892101_iText[sxtable[i]][3] .."\n"
			sxtablestr =sxtablestr..sxa
		end
	end
	
	local sxtablestr1,sxa1 ="" ,""
	if table.getn(sxtable1) >0 then
		for i=1,table.getn(sxtable1) do
			sxa1 =skilllistaec[sxtable1[i]].."\n"
			sxtablestr1 =sxtablestr1..sxa1
		end
	end
	return "#c993333�ɳ���:897(����)\n","#ccc33cc�ϳɵȼ�:"..hc.."\n","#cff99ff��չ��������:"..kz.."\n#cffcc00"..sxtablestr..sxtablestr1..sxsx.."\n",sxtable
end





function GetXXun()
	local qual =0
	qual =SuperTooltips:GetEquipQual();
	if tonumber( qual) ==nil then
		qual = 0
	end
	return 	tonumber( qual)
end

---
-------------����Ʒ�ɾ���ԭ�����ң�����Ϊ���˽���ʹ�ã����𿪷��⴫�����˲��е��κη������Ρ���������ͨ

---
function DisplEQJTInfo(strszAuthor)
	local JTtable={}
	JTtable["xs"]={"Ѫ����",100}
	JTtable["ll"]={"����"	,2}
	JTtable["lq"]={"����"	,2}
	JTtable["tl"]={"����"	,2}
	JTtable["dl"]={"����"	,2}
	JTtable["sf"]={"��"	,2}
	JTtable["wf"]={"�⹦����",20}
	JTtable["nf"]={"�ڹ�����",20}
	JTtable["sb"]={"����"	,5}
	--------------------------------
	JTtable["mz"]={"����"	,15}
	JTtable["bg"]={"����"	,3}
	JTtable["hg"]={"��"	,3}
	JTtable["xg"]={"����"	,3}
	JTtable["dg"]={"����"	,3}
	JTtable["wg"]={"�⹦����",20}
	JTtable["ng"]={"�ڹ�����",20}
	local szAuthor
	if strszAuthor==nil then
		szAuthor = SuperTooltips:GetAuthorInfo();
	else
		szAuthor = strszAuthor
	end
	
	local JTstr1,JTstr2,JTstr3 = "","",""
	if 	szAuthor ==nil or szAuthor =="" then
		return 0,0,0,0,0,0,0,0
	end
	-- PushDebugMessage(szAuthor)
	local x,y,JTstr1,JTun1,JTstr2,JTun2,JTstr3,JTun3= string.find(szAuthor,"&JT(%l%l)(%d%d%d)(%l%l)(%d%d%d)(%l%l)(%d%d%d)")
	if x==nil or y==nil then
		return 0,0,0,0,0,0,0,0
	end
	JTstr1 =JTtable[JTstr1][1].."("..tonumber(JTun1).."��) +"..(tonumber(JTun1)*JTtable[JTstr1][2]).."(��"..(100*JTtable[JTstr1][2])..",".."�ѽ��"..tonumber(JTun1).."%%)"
	JTstr2 =JTtable[JTstr2][1].."("..tonumber(JTun2).."��) +"..(tonumber(JTun2)*JTtable[JTstr2][2]).."(��"..(100*JTtable[JTstr2][2])..",".."�ѽ��"..tonumber(JTun2).."%%)"
	JTstr3 =JTtable[JTstr3][1].."("..tonumber(JTun3).."��) +"..(tonumber(JTun3)*JTtable[JTstr3][2]).."(��"..(100*JTtable[JTstr3][2])..",".."�ѽ��"..tonumber(JTun3).."%%)"
	return 1,1, JTstr1,JTstr2,JTstr3,tonumber(JTun1),tonumber(JTun2),tonumber(JTun3)
end

---**********
----------����Ʒ�ɾ���ԭ�����ң�����Ϊ���˽���ʹ�ã����𿪷��⴫�����˲��е��κη������Ρ�����������
---**********
function DisplayLPInfo(strszAuthor)
	local Operating = {}
	Operating["a"]={"#cFF0000#895��ȸ���顤Ѫ����" ,   38001000,"Ѫ���� +",12359,2000,800} --Ѫ  1Ϊstr ,2Ϊ��ƷID��3Ϊstr ,4Ϊ�ٷ�������5Ϊ��������6Ϊ������
	Operating["b"]={"#cFF0000#895��ȸ���顤����",      38001001,"���� +",118,30,5}  --��
	Operating["c"]={"#cFF0000#895��ȸ���顤����" ,     38001002,"���� +",118,30,5} --��
	Operating["d"]={"#cFF0000#895��ȸ���顤����" ,     38001003,"���� +",118,30,5}--��
	Operating["e"]={"#cFF0000#895��ȸ���顤����" ,     38001004,"���� +",118,30,5} --��
	Operating["f"]={"#cFF0000#895��ȸ���顤��" ,     38001005,"�� +",118,30,5}--��
	Operating["g"]={"#G#897�������顤������" ,         38001006,"���� +",172,20,5} --��
	Operating["h"]={"#G#897�������顤�𹥻�" ,         38001007,"�� +",172,20,5}--��
	Operating["i"]={"#G#897�������顤������",          38001008,"���� +",172,20,5} --��
	Operating["j"]={"#G#897�������顤������" ,         38001009,"���� +",172,20,5} --��
	Operating["k"]={"#c0066ff#896���䱦�顤������" ,   38001010,"���� +",53,4,2}--��k
	Operating["l"]={"#c0066ff#896���䱦�顤����" ,   38001011,"�� +",53,4,2} --��k
	Operating["m"]={"#c0066ff#896���䱦�顤������" ,   38001012,"���� +",53,4,2} --��k
	Operating["n"]={"#c0066ff#896���䱦�顤������" ,   38001013,"���� +",53,4,2} --��k
	Operating["o"]={"#Y#898�׻����顤�ڹ�����" ,       38001014,"�ڹ� +",2534,1534,200} --�ڹ�
	Operating["p"]={"#Y#898�׻����顤�⹦����" ,       38001015,"�⹦ +",2534,1534,200} --�⹦
	Operating["q"]={"#Y#898�׻����顤�ڹ�����" ,       38001016,"�ڷ� +",2534,1534,200}--�ڷ�
	Operating["r"]={"#Y#898�׻����顤�⹦����",        38001017,"��� +",2534,1534,200}  --��� --- (Operating[m][5]+Operating[m][6]*Operat_dj)*star_jc[star_dj]
	Operating["s"]={"#Y#898�׻����顤����"  ,          38001018,"���� +",1429,179,50}--����
	Operating["t"]={"#Y#898�׻����顤����" ,           38001019,"���� +",500,50,20} --����
	
	local skill_str = {
	["a"]={"��������������ʱ��һ�����ʴ�����ϵ������ʹ��������",  "�������������4�룬��Ч��45����ֻ�ܴ���1��" },
	["b"]={"��������������ʱ��һ�����ʴ�����ϵ������ʹ��������",  "��𹥻�������4�룬��Ч��45����ֻ�ܴ���1��" },
	["c"]={"��������������ʱ��һ�����ʴ�����ϵ������ʹ��������",  "��������������4�룬��Ч��45����ֻ�ܴ���1��" },
	["d"]={"�ٶ�����������ʱ��һ�����ʴ�����ϵ������ʹ��������",  "�㶾����������4�룬��Ч��45����ֻ�ܴ���1��" },
	["u"]={"�����һ����������ʱ��һ�����ʴ�����������������������������Թ���100%%ȫ��ת��Ϊ�����Թ���������","�룬��Ч��45����ֻ�ܴ���1��" },
	["v"]={"�����һ���𣺹���ʱ��һ�����ʴ�������������������������������Թ���100%%ȫ��ת��Ϊ�����Թ���������","�룬��Ч��45����ֻ�ܴ���1��" },
	["w"]={"�����һ����������ʱ��һ�����ʴ�������������������𡢶��������Թ���100%%ȫ��ת��Ϊ�����Թ���������","�룬��Ч��45����ֻ�ܴ���1��" },
	["x"]={"�����һ����������ʱ��һ�����ʴ�����������������������������Թ���100%%ȫ��ת��Ϊ�����Թ���������","�룬��Ч��45����ֻ�ܴ���1��" },
	["y"]={"ƾ�����磺����ʱ��һ�����ʴ���������У�ʹ��������50%%�ƶ��ٶȣ�����","�룬��Ч��45����ֻ�ܴ���1��" },
	}
	local star_jc = {0.1,0.14,0.2,0.28,0.4,0.55,0.75,1,1.3} ---�Ǽ���Ӧ������ϵ���ӳ�
	local star_skilljc = {200,280,400,560,800,1100,1500,2000,2600} ---�Ǽ���Ӧ���ܵ�����ϵ���ӳ�
	local star_kuozhan = { ---��չ��Ӧ
	["a"] ={ "Ѫ���� +",        10190}  , ---- star_kuozhan[n][2]*star_jc[star_dj]
	["b"] ={ "������ +",        80}  ,
	["c"] ={ "���� +",        80}  ,
	["d"] ={ "������ +",        80}  ,
	["e"] ={ "������ +",        80}  ,
	["f"] ={ "����Ŀ����� +",  80}  ,
	["g"] ={ "����Ŀ��� +",  80}  ,
	["h"] ={ "����Ŀ������ +",  80}  ,
	["i"] ={ "����Ŀ�궾�� +",  80}  ,
	["j"] ={ "���Ĺ��� +",      24}  ,
	["k"] ={ "���ķ��� +",      20}  ,
	["l"] ={ "�������� +",      80}  }
	local strlog = {
	[1]={ "#c009933δ��Ƕ����#r" ,"#c605C4Fδ�������ﵽ���׺���#r","#c605C4Fδ�������ﵽ���׺���#r","#c605C4Fδ�������ﵽ�Ľ׺���#r" },
	[2]={ "#c605C4F��δ�������ﵽ���׺���#r" ,"#c605C4F��δ�������ﵽ���׺���#r","#c605C4F��δ�������ﵽ�Ľ׺���#r" },
	[3]={ "#c605C4F��δ�������ﵽ��׺���#r" },
	}
	local Operat_zhu = {}
	local Okuozhan_zhu = {}
	local str = strlog[1][1]..strlog[1][2]..strlog[1][3]..strlog[1][4].."#ccc33cc��չ���� ��0/3��#r"..strlog[2][1]..strlog[2][2]..strlog[2][3].."#ccc33cc��������#r"..strlog[3][1]
	local DWszAuthor
	if strszAuthor==nil then
		DWszAuthor = SuperTooltips:GetAuthorInfo();
	else
		DWszAuthor = strszAuthor
	end
	if DWszAuthor == nil then
		return 0,str,0,Operat_zhu,Okuozhan_zhu,"0"
	end
	local posx ,posy ,lp_str0,lp_str1,lp_str2,lp_str3 = nil,nil,nil,nil,nil,nil
	posx ,posy ,lp_str0,lp_str1,lp_str2,lp_str3= string.find(DWszAuthor,"LP(%w%w)(%w%w%w%w%w%w%w%w%w%w%w%w)(%w%w%w)(%w)")
	if  posx == nil and  posy==nil  then
		return 0,str,0,Operat_zhu,Okuozhan_zhu,"0"
	end
	jinjie_dj =tonumber( string.sub(lp_str0, 1,1))      ; ---������
	star_dj =tonumber (string.sub(lp_str0, 2,2)); ---������
	if  jinjie_dj == nil or jinjie_dj==0  then
		return 0,str,0,Operat_zhu,Okuozhan_zhu,"0"
	end
	if star_dj==0 then
		star_dj =1
	end
	local lp_str = {}
	lp_str[1] =string.sub(lp_str1, 1,1); ---�г���������
	lp_str[2] =string.sub(lp_str1, 4,4);
	lp_str[3] =string.sub(lp_str1, 7,7);
	lp_str[4] =string.sub(lp_str1, 10,10);
	lp_str[5] =string.sub(lp_str1, 2,3);---�г����ĵȼ�
	lp_str[6] =string.sub(lp_str1, 5,6);
	lp_str[7] =string.sub(lp_str1, 8,9);
	lp_str[8] =string.sub(lp_str1, 11,12);
	
	lp_str[9]  =string.sub(lp_str2, 1,1);
	lp_str[10] =string.sub(lp_str2, 2,2);
	lp_str[11] =string.sub(lp_str2, 3,3);
	local kueizhan_num = 0
	for i=1, tonumber(jinjie_dj)  do
		if i<5 then
			local Operat_type = lp_str[i]
			local Operat_dj = tonumber(lp_str[i+4])
			if Operating[Operat_type]~=nil and  Operat_dj ~=0 then
				local shuxingzhi =math.floor(Operating[Operat_type][6]*Operat_dj*star_jc[star_dj])+ Operating[Operat_type][5]
				---shuxingzhi = math.floor(shuxingzhi)
				Operat_zhu[i] = {Operating[Operat_type][2],Operat_dj}
				strlog[1][i] = "#c009933"..Operating[Operat_type][1].."��"..Operat_dj.."����"..Operating[Operat_type][3]..shuxingzhi.."#r"
			else
				strlog[1][i] = "#c009933δ��Ƕ����#r"
			end
		end
		if i>=2  and  i<=4 then
			local kuozhan_type = lp_str[i+7]  --��չ����
			if star_kuozhan[kuozhan_type]~=nil  then
				local kuozhan_zhi = star_kuozhan[kuozhan_type][2]*star_jc[star_dj]
				kuozhan_zhi = math.floor(kuozhan_zhi)
				strlog[2][i-1] = "#c009933"..star_kuozhan[kuozhan_type][1]..kuozhan_zhi.."#r"
				kueizhan_num = kueizhan_num+1
				Okuozhan_zhu[i-1] = {star_kuozhan[kuozhan_type][1],kuozhan_zhi}
			else
				strlog[2][i-1] = "#c009933��δ�����Ƕ"..i.."�ű���󼤻�#r"
			end
		end
	end
	---------������-----------
	if jinjie_dj ==5  then
		if skill_str[lp_str3] ~= nil  then
			if lp_str3 == "u" or lp_str3 == "v" or lp_str3 == "w" or lp_str3 == "x" or lp_str3 == "y"   then
				strlog[3][1] = "#c009933"..skill_str[lp_str3][1]..(star_dj+1)..skill_str[lp_str3][2].."#r"
			else
				strlog[3][1] = "#c009933"..skill_str[lp_str3][1]..star_skilljc[star_dj]..skill_str[lp_str3][2].."#r"
			end
		else
			strlog[3][1] =  "#c009933��δѧϰ#r"
		end
	end
	str = strlog[1][1]..strlog[1][2]..strlog[1][3]..strlog[1][4].."#ccc33cc��չ���� ��"..kueizhan_num.."/3��#r"..strlog[2][1]..strlog[2][2]..strlog[2][3].."#ccc33cc��������#r"..strlog[3][1]
	return 1,str,star_dj,Operat_zhu,Okuozhan_zhu,lp_str3
end



---***************
-------����-------
---***************
function DisplayLWInfo(strszAuthor)
	local LWszAuthor
	if strszAuthor==nil then
		LWszAuthor = SuperTooltips:GetAuthorInfo();
	else
		LWszAuthor = strszAuthor
	end
	local lvshux = {40,60,80,120,160,220,280,340,420,500} ------����
	local lvshux1 = {2,3,5,7,10,13,17,21,25,30} ---------����Ѫ���ޣ�������������
	local xuestr = {"+2%%","+3%%","+4%%","+5%%","+7%%","+9%%","+11%%","+14%%","+17%%","+20%%"}
	local cz_index = {1,1,2,2,3,5,8,13,21,34} ---------�ɳ�����
	local x,y,changzhang,shuxin_xue,shuxin_gj,shuxin_xx = nil,nil,0,"00","000","000"
	if LWszAuthor ~= nil then
		x,y,changzhang,shuxin_xue, shuxin_gj,shuxin_xx= string.find(LWszAuthor,"lwps(%d%d%d)(%d%d)(%d%d%d)(%d%d%d)")
		if x~=nil and y~=nil then
			changzhang = tonumber(changzhang)
			shuxin_xue = tonumber(shuxin_xue)
			shuxin_gj = tonumber(shuxin_gj)
			shuxin_xx = tonumber(shuxin_xx)
		else
			changzhang = 0
			shuxin_xue =0
			shuxin_gj =0
			shuxin_xx =0
		end
	end
	local cz_dj,chengzhangyu,chengbiaoji = 0,0,1
	if changzhang >0 then
		local leijia = 0
		local leijia1 = 0
		for i=1, 10 do
			for j=1,10 do
				leijia = leijia+cz_index[i]
				if changzhang >leijia1 and changzhang <=leijia and cz_dj==0 then
					cz_dj = (i-1)*10+j
					chengzhangyu = leijia-changzhang
					chengbiaoji = i
					---break
				end
				leijia1 = leijia1+cz_index[i]
			end
		end
	end
	local strlv
	if changzhang==900 then
		strlv = "#G�ɳ��ȼ���100#r�ɳ�ֵ���ɳ��ȼ��Ѵﵽ����#r"
	else
		strlv = "#G�ɳ��ȼ���"..cz_dj.."#r�ɳ�ֵ��"..chengzhangyu.."/"..cz_index[chengbiaoji].."#r"
	end
	-----------------------Ѫ����----------------------
	local strxlv = ""
	local kuazhanshu = 0
	if tonumber(shuxin_xue) >0 then
		strxlv = "#c009933Ѫ����("..shuxin_xue.."��) "..xuestr[shuxin_xue].."#r"
		kuazhanshu = kuazhanshu+1
	else
		strxlv = "#c009933Ѫ���ޣ�δѧϰ#r"
	end
	------------------���Թ���----------------------
	local shuxinstr = {"#c009933������","#c009933�𹥻�","#c009933������","#c009933������"}
	local strtype = ""
	if tonumber(shuxin_gj) >0 then
		local sxtype = math.floor( tonumber(shuxin_gj)/100)
		local sxdj = math.mod( tonumber(shuxin_gj),100)
		if shuxinstr[sxtype]~=nil and lvshux[sxdj]~=nil  then
			strtype =shuxinstr[sxtype].."("..sxdj.."��) +"..lvshux[sxdj].."#r"
			kuazhanshu = kuazhanshu+1
		else
			strtype = "#c009933���Թ�����δѧϰ#r"
		end
	else
		strtype = "#c009933���Թ�����δѧϰ#r"
	end
	------------------���Լ�����----------------------
	local shuxinxxstr = {"#c009933����Ŀ���������","#c009933����Ŀ�������","#c009933����Ŀ����������","#c009933����Ŀ�궾������"}
	local strjk = ""
	if tonumber(shuxin_xx) >0 then
		local sxtype = math.floor( tonumber(shuxin_xx)/100)
		local sxdj = math.mod( tonumber(shuxin_xx),100)
		if shuxinxxstr[sxtype]~=nil and lvshux1[sxdj]~=nil  then
			strjk =shuxinxxstr[sxtype].."("..sxdj.."��) +"..lvshux1[sxdj].."#r"
			kuazhanshu = kuazhanshu+1
		else
			strjk = "#c009933����Ŀ�꿹�����ޣ�δѧϰ#r"
		end
	else
		strjk = "#c009933����Ŀ�꿹�����ޣ�δѧϰ#r"
	end
	local lv ="#cff66cc��չ����("..kuazhanshu.."/3)#r"..strxlv..strtype..strjk
	return strlv,lv
end








-------------------------------------------------------------------------------------------------------------------------------
--
-- �����ʾ�ı�
--
function SuperTooltip_ClearTextAAA()
	
	
	--SuperTooltip_StaticPart_Title:SetText("");
	
	--SuperTooltip_Protect_Text:SetText("");
	
	SuperTooltip_Explain:SetText("");
	--SuperTooltip_Property:SetText("");
	--SuperTooltip_Manufacturer:SetText("");
	--SuperTooltip_StaticPart_Icon_Protected:Hide();
end

function SuperTooltip_ClearText()
	
	SuperTooltip_StaticPart_QH1:SetText("");
	SuperTooltip_StaticPart_QH2:SetText("");
	SuperTooltip_StaticPart_Item6:SetText("")
	
	SuperTooltip_StaticPart_Title:SetText("");
	SuperTooltip_StaticPart_Item1:SetText("");
	SuperTooltip_StaticPart_Item2:SetText("");
	SuperTooltip_StaticPart_Item3:SetText("");
	SuperTooltip_StaticPart_Item4:SetText("");
	SuperTooltip_Protect_Text:SetText("");
	SuperTooltip_StaticPart_DW:SetImage("")
	SuperTooltip_StaticPart_DW:Hide()
	local starNum=9
	for i=1,starNum do
		g_Stars[i]:Hide();
	end;
	SuperTooltip_StaticPart_Gem1:SetImage("");
	SuperTooltip_StaticPart_Gem2:SetImage("");
	SuperTooltip_StaticPart_Gem3:SetImage("");
	SuperTooltip_StaticPart_Gem4:SetImage("");
	SuperTooltip_StaticPart_Gem1:Hide();
	SuperTooltip_StaticPart_Gem2:Hide()
	SuperTooltip_StaticPart_Gem3:Hide()
	SuperTooltip_StaticPart_Gem4:Hide()
	SuperTooltip_Explain:SetText("");
	SuperTooltip_Property:SetText("");
	SuperTooltip_Manufacturer:SetText("");
	SuperTooltip_StaticPart_Icon_Protected:Hide();
end

function SetupMoneyPart(type,nPrice)
	local StaticPart_GB_Ctl;
	local StaticPart_Money_Ctl;
	--ʹ��ʲô��Ϊ����
	local nUnit =  SuperTooltips:GetMoney1Type();
	if (type==1)then
		StaticPart_GB_Ctl = SuperTooltip_StaticPart_GB;
		local isShowJiaoZi = SuperTooltips:GetIsShowJiaoZi();
		if ( CU_MONEYJZ == nUnit ) then
			isShowJiaoZi = 1;
		end
		if (isShowJiaoZi == 1) then
			SuperTooltip_StaticPart_Money:Hide();
			StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money_JiaoZi;
		else
			SuperTooltip_StaticPart_Money_JiaoZi:Hide()
			StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money;
		end
	else
		StaticPart_GB_Ctl = SuperTooltip_StaticPart_GB_2;
		StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money_2;
	end
	
	if (nUnit==nil)then
		nUnit = CU_MONEY;
	end;
	if(CU_MONEY	== nUnit or CU_TICKET == nUnit or CU_MONEYJZ == nUnit)       then      --Ǯ����ƱǮ, ����
		StaticPart_GB_Ctl:Hide()
		StaticPart_Money_Ctl:Show();
		StaticPart_Money_Ctl:SetProperty("MoneyNumber", tostring(nPrice));
		
	elseif(CU_GOODBAD == nUnit) then			--�ƶ�ֵ
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("�ƶ�ֵ:" .. tostring(nPrice) .. " ��")
		
		
	elseif(CU_MORALPOINT == nUnit)  then	--ʦ�µ�
		
		StaticPart_GB_Ctl:Show()
		SuperTooltip_StaticPart_Money:Hide();
		StaticPart_GB_Ctl:SetText("ʦ�µ�:" .. tostring(nPrice) .. " ��")
		
	elseif(CU_BIND_YUANBAO == nUnit) then	--��Ԫ��
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("#ccc33cc���㷵��:" .. tostring(nPrice))
		
		--StaticPart_GB_Ctl:SetText("#{BDYB_090714_01}" .. tostring(nPrice))
		
	elseif(CU_GIFTTOKEN == nUnit) then	--��ȯ
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("��ȯ��" .. tostring(nPrice))
		
	elseif(CU_YUANBAO == nUnit) then	--Ԫ��
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("Ԫ����" .. tostring(nPrice))
		
	elseif(CU_ZENGDIAN == nUnit) then	--����
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("����:" .. tostring(nPrice))
		
	elseif(CU_MENPAI_POINT == nUnit) then	--ʦ�Ź��׶�
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("#ccc33cc���㷵��:" .. tostring(nPrice))
		
	end
	
end;

function SuperTooltip_OnHide()
	g_left = 0;
	g_top  = 0;
	g_right = 0;
	g_bottom = 0;
	g_mCmpWndCount = 0;
	--SuperTooltips:CloseCmpWindowMain()
	--SuperTooltips:CloseCmpWindowSub()
end

function GetBaoshiStrrB(baoshipfStr,nGemCounts)
	local baoshiStr = {"ڤ��ʯ.(%d)��","ʯ.(%d)��","��ĸ��.(%d)��","����.(%d)��","����.(%d)��","����.(%d)��"}
	local baoshidata
	local posIndex =1
	local djpftable = {1,2,4,7,10,15,20,30,50,100}
	local mjdjpftable = {1,2,3.5,5,7.5,10,15,25,50}
	local Baoshipftotal = 0  ---��
	local ismingjing = 0
	for k=1 ,nGemCounts do
		local bjStr = "0"
		local bjposIndex =10000
		for i,baoshidata in baoshiStr do
			local tempposs, tempposend,tempposstr= string.find( baoshipfStr,baoshidata,posIndex );
			if tempposstr ~= nil then
				if tempposend <bjposIndex then
					bjposIndex = tempposend
					bjStr = tempposstr
					ismingjing = i
				end
			end
		end
		if bjStr~="0" then
			if ismingjing==1 then
				Baoshipftotal = Baoshipftotal+mjdjpftable[tonumber(bjStr)]
			else
				Baoshipftotal = Baoshipftotal+djpftable[tonumber(bjStr)]
			end
			if bjposIndex <10000 then
				posIndex = bjposIndex
			end
		end
	end
	return Baoshipftotal
end

function QiangHuaAAAA()
local szAuthor1 = SuperTooltips:GetAuthorInfo();
local a,b,levelaaaaa = nil,nil,"00"
if szAuthor1~= nil then
a,b,levelaaaaa = string.find(szAuthor1,"PYY(%d%d)")			
end
return levelaaaaa
end
function DODPDIEaaaa()--����ǿ������
local Strongcccc,Strongdddd = string.find(typeDesc, "����")
local strong = tonumber(QiangHuaAAAA())
local adddd = 0
if strong ~= nil then
  qiangnumber = 1	
	else 
qiangnumber = 0	
end	
return qiangnumber
end
function ISOKjINGTong(szPropertys)
  
    if szPropertys then
		local sPos, ePos = string.find(szPropertys, "# JTemId=")
		if sPos ~=nil and ePos ~= nil then
			return 1 
		end
	end
	return -1
end

	