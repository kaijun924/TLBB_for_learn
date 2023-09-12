local CU_MONEY			= 1	-- 钱
local CU_GOODBAD		= 2	-- 善恶值
local CU_MORALPOINT	= 3	-- 师德点
local CU_TICKET			= 4 -- 官票钱
local CU_YUANBAO		= 5	-- 元宝
local CU_ZENGDIAN		= 6 -- 赠点
local CU_MENPAI_POINT	= 7 -- 师门贡献度
local CU_MONEYJZ		= 8 -- 交子
local CU_BIND_YUANBAO	= 9 -- 绑定元宝
local CU_GIFTTOKEN	= 10 -- 返券
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
[0] = { Tooltip = "幻饰武器" },
[1] = { Tooltip = "扇类" },
[2] = { Tooltip = "单短类" },
[3] = { Tooltip = "双短类" },
[4] = { Tooltip = "刀斧类" },
[5] = { Tooltip = "枪棒类" },
[6] = { Tooltip = "环类" },
[7] = { Tooltip = "弩类" },
[8] = { Tooltip = "长杖类" },
[9] = { Tooltip = "箫剑类" },
[10] = { Tooltip = "龙纹" },
[11] = { Tooltip = "暗器" },
[12] = { Tooltip = "戒指" },
[13] = { Tooltip = "护符" },
[14] = { Tooltip = "护腕" },
[15] = { Tooltip = "项链" },
[16] = { Tooltip = "武魂1" },
[17] = { Tooltip = "护肩" },
[18] = { Tooltip = "鞋" },
[19] = { Tooltip = "帽子" },
[20] = { Tooltip = "手套" },
[21] = { Tooltip = "衣服" },
[22] = { Tooltip = "腰带" },
}

xSrtong5 = {
[1] = { Tooltip = "扇类" },
[2] = { Tooltip = "单短类" },
[3] = { Tooltip = "双短类" },
[4] = { Tooltip = "刀斧类" },
[5] = { Tooltip = "枪棒类" },
[6] = { Tooltip = "环类" },
[7] = { Tooltip = "弩类" },
[8] = { Tooltip = "长杖类" },
[9] = { Tooltip = "箫剑类" },
}

local sdl = 0;
local sldjbsx1={44,88,132,168,220,264,308,352,396,440,484,528,572,616,660,704,748,792,836,880}--攻击（内外功）
local sldjbsx2={20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400}--属性（冰火玄毒攻击）
local sldjbsx3={10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200}--抗性（冰火玄毒抗）
local sldjbsx4={599,1198,1797,2396,2995,3594,4193,4792,5391,5990,6589,7188,7787,8386,8985,9584,10183,10782,11381,11980}--血上限
local sldjbsx5={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}--资质（力、灵、体、定、身）
local sldjbsx={10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200}--资质（力、灵、体、定、身）
local g_zhenfa = {"归元阵","天覆阵","地载阵","风扬阵"}
local g_zhenyuantype = {"力量","灵气","体力","定力","身法","血上限","气上限","内功攻击","外功攻击","内功防御","外功防御","命中","闪避","会心","会防","冰攻击","火攻击","玄攻击","毒攻击"}
local g_zhenyuanpoint = {10,10,10,10,10,1000,1000,200,200,100,100,100,80,3,2,15,15,15,15}

local g_petequip = {"#cffcc99蝎39975111","#cffcc99蝎39975112","#cffcc99蝎39975113","#cffcc99蝎39975114","#cffcc99蝎39975115","#cffcc99蝎39975121","#cffcc99蝎39975122","#cffcc99蝎39975123","#cffcc99蝎39975124","#cffcc99蝎39975125","#cffcc99蝎39975131","#cffcc99蝎39975132","#cffcc99蝎39975133","#cffcc99蝎39975134","#cffcc99蝎39975135","#cffcc99蝎39975141","#cffcc99蝎39975142","#cffcc99蝎39975143","#cffcc99蝎39975144","#cffcc99蝎39975145","#cffcc99蝎39975151","#cffcc99蝎39975152","#cffcc99蝎39975153","#cffcc99蝎39975154","#cffcc99蝎39975155","#cffcc99蝎39975161","#cffcc99蝎39975162","#cffcc99蝎39975163","#cffcc99蝎39975164","#cffcc99蝎39975165","#cffcc99蝎39975211","#cffcc99蝎39975212","#cffcc99蝎39975213","#cffcc99蝎39975214","#cffcc99蝎39975215","#cffcc99蝎39975221","#cffcc99蝎39975222","#cffcc99蝎39975223","#cffcc99蝎39975224","#cffcc99蝎39975225","#cffcc99蝎39975231","#cffcc99蝎39975232","#cffcc99蝎39975233","#cffcc99蝎39975234","#cffcc99蝎39975235","#cffcc99蝎39975241","#cffcc99蝎39975242","#cffcc99蝎39975243","#cffcc99蝎39975244","#cffcc99蝎39975245","#cffcc99蝎39975251","#cffcc99蝎39975252","#cffcc99蝎39975253","#cffcc99蝎39975254","#cffcc99蝎39975255","#cffcc99蝎39975261","#cffcc99蝎39975262","#cffcc99蝎39975263","#cffcc99蝎39975264","#cffcc99蝎39975265","#cffcc99蝎39975311","#cffcc99蝎39975312","#cffcc99蝎39975313","#cffcc99蝎39975314","#cffcc99蝎39975315","#cffcc99蝎39975321","#cffcc99蝎39975322","#cffcc99蝎39975323","#cffcc99蝎39975324","#cffcc99蝎39975325","#cffcc99蝎39975331","#cffcc99蝎39975332","#cffcc99蝎39975333","#cffcc99蝎39975334","#cffcc99蝎39975335","#cffcc99蝎39975341","#cffcc99蝎39975342","#cffcc99蝎39975343","#cffcc99蝎39975344","#cffcc99蝎39975345","#cffcc99蝎39975351","#cffcc99蝎39975352","#cffcc99蝎39975353","#cffcc99蝎39975354","#cffcc99蝎39975355","#cffcc99蝎39975361","#cffcc99蝎39975362","#cffcc99蝎39975363","#cffcc99蝎39975364","#cffcc99蝎39975365","#cffcc99蝎39985111","#cffcc99蝎39985112","#cffcc99蝎39985113","#cffcc99蝎39985114","#cffcc99蝎39985115","#cffcc99蝎39985121","#cffcc99蝎39985122","#cffcc99蝎39985123","#cffcc99蝎39985124","#cffcc99蝎39985125","#cffcc99蝎39985131","#cffcc99蝎39985132","#cffcc99蝎39985133","#cffcc99蝎39985134","#cffcc99蝎39985135","#cffcc99蝎39985141","#cffcc99蝎39985142","#cffcc99蝎39985143","#cffcc99蝎39985144","#cffcc99蝎39985145","#cffcc99蝎39985151","#cffcc99蝎39985152","#cffcc99蝎39985153","#cffcc99蝎39985154","#cffcc99蝎39985155","#cffcc99蝎39985161","#cffcc99蝎39985162","#cffcc99蝎39985163","#cffcc99蝎39985164","#cffcc99蝎39985165","#cffcc99蝎39985211","#cffcc99蝎39985212","#cffcc99蝎39985213","#cffcc99蝎39985214","#cffcc99蝎39985215","#cffcc99蝎39985221","#cffcc99蝎39985222","#cffcc99蝎39985223","#cffcc99蝎39985224","#cffcc99蝎39985225","#cffcc99蝎39985231","#cffcc99蝎39985232","#cffcc99蝎39985233","#cffcc99蝎39985234","#cffcc99蝎39985235","#cffcc99蝎39985241","#cffcc99蝎39985242","#cffcc99蝎39985243","#cffcc99蝎39985244","#cffcc99蝎39985245","#cffcc99蝎39985251","#cffcc99蝎39985252","#cffcc99蝎39985253","#cffcc99蝎39985254","#cffcc99蝎39985255","#cffcc99蝎39985261","#cffcc99蝎39985262","#cffcc99蝎39985263","#cffcc99蝎39985264","#cffcc99蝎39985265","#cffcc99蝎39985311","#cffcc99蝎39985312","#cffcc99蝎39985313","#cffcc99蝎39985314","#cffcc99蝎39985315","#cffcc99蝎39985321","#cffcc99蝎39985322","#cffcc99蝎39985323","#cffcc99蝎39985324","#cffcc99蝎39985325","#cffcc99蝎39985331","#cffcc99蝎39985332","#cffcc99蝎39985333","#cffcc99蝎39985334","#cffcc99蝎39985335","#cffcc99蝎39985341","#cffcc99蝎39985342","#cffcc99蝎39985343","#cffcc99蝎39985344","#cffcc99蝎39985345","#cffcc99蝎39985351","#cffcc99蝎39985352","#cffcc99蝎39985353","#cffcc99蝎39985354","#cffcc99蝎39985355","#cffcc99蝎39985361","#cffcc99蝎39985362","#cffcc99蝎39985363","#cffcc99蝎39985364","#cffcc99蝎39985365","#cffcc99蝎39995111","#cffcc99蝎39995112","#cffcc99蝎39995113","#cffcc99蝎39995114","#cffcc99蝎39995115","#cffcc99蝎39995121","#cffcc99蝎39995122","#cffcc99蝎39995123","#cffcc99蝎39995124","#cffcc99蝎39995125","#cffcc99蝎39995131","#cffcc99蝎39995132","#cffcc99蝎39995133","#cffcc99蝎39995134","#cffcc99蝎39995135","#cffcc99蝎39995141","#cffcc99蝎39995142","#cffcc99蝎39995143","#cffcc99蝎39995144","#cffcc99蝎39995145","#cffcc99蝎39995151","#cffcc99蝎39995152","#cffcc99蝎39995153","#cffcc99蝎39995154","#cffcc99蝎39995155","#cffcc99蝎39995161","#cffcc99蝎39995162","#cffcc99蝎39995163","#cffcc99蝎39995164","#cffcc99蝎39995165","#cffcc99蝎39995211","#cffcc99蝎39995212","#cffcc99蝎39995213","#cffcc99蝎39995214","#cffcc99蝎39995215","#cffcc99蝎39995221","#cffcc99蝎39995222","#cffcc99蝎39995223","#cffcc99蝎39995224","#cffcc99蝎39995225","#cffcc99蝎39995231","#cffcc99蝎39995232","#cffcc99蝎39995233","#cffcc99蝎39995234","#cffcc99蝎39995235","#cffcc99蝎39995241","#cffcc99蝎39995242","#cffcc99蝎39995243","#cffcc99蝎39995244","#cffcc99蝎39995245","#cffcc99蝎39995251","#cffcc99蝎39995252","#cffcc99蝎39995253","#cffcc99蝎39995254","#cffcc99蝎39995255","#cffcc99蝎39995261","#cffcc99蝎39995262","#cffcc99蝎39995263","#cffcc99蝎39995264","#cffcc99蝎39995265","#cffcc99蝎39995311","#cffcc99蝎39995312","#cffcc99蝎39995313","#cffcc99蝎39995314","#cffcc99蝎39995315","#cffcc99蝎39995321","#cffcc99蝎39995322","#cffcc99蝎39995323","#cffcc99蝎39995324","#cffcc99蝎39995325","#cffcc99蝎39995331","#cffcc99蝎39995332","#cffcc99蝎39995333","#cffcc99蝎39995334","#cffcc99蝎39995335","#cffcc99蝎39995341","#cffcc99蝎39995342","#cffcc99蝎39995343","#cffcc99蝎39995344","#cffcc99蝎39995345","#cffcc99蝎39995351","#cffcc99蝎39995352","#cffcc99蝎39995353","#cffcc99蝎39995354","#cffcc99蝎39995355","#cffcc99蝎39995361","#cffcc99蝎39995362","#cffcc99蝎39995363","#cffcc99蝎39995364","#cffcc99蝎39995365"
}
--- 蜜语金丝对应蜜语
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
		strLeftTime = "解锁成功！请重新登录或切换场景正式解锁。";
	else
		nLeftTime = math.ceil( nLeftTime/3600 );
		if ( nLeftTime >= 24 ) then
			strLeftTime = ""..math.floor(nLeftTime/24).." 天";
			nLeftTime = math.mod(nLeftTime,24);
		end
		if ( nLeftTime > 0 ) then
			strLeftTime = strLeftTime.." "..nLeftTime.." 小时";
		end
		strLeftTime = strLeftTime.."后正式解锁";
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
	-- 先清空以前显示的文字
	SuperTooltip_ClearText();
	typeDesc = SuperTooltips:GetTypeDesc();
	local nGemHoleCounts = SuperTooltips:GetGemHoleCounts();
	local nMoney1, szMoneyDesc1 = SuperTooltips:GetMoney1();
	local nMoney2, szMoneyDesc2 = SuperTooltips:GetMoney2();
	szPropertys = SuperTooltips:GetPropertys();
	szAuthor1 = SuperTooltips:GetAuthorInfo();
	szAuthor = SuperTooltips:GetAuthorInfo();
	hehed =  WQstr()
	bspf = "" --宝石评分
	local szExplain = SuperTooltips:GetExplain();
	local unLockingElapsedTime	=SuperTooltips:GetPUnlockElapsedTime();
	local IsProtectd	=SuperTooltips:GetDesc5();
	local nYuanbaotrade = SuperTooltips:GetYuanbaoTradeFlag();
	local nGoodsProtect = 0;
	local ItemID = SuperTooltips:GetTitle()
	local Baoshipftotal,baoshipfStr = 0,szPropertys
	local infantpos1,infantxpos1 = string.find(ItemID, "典籍·")
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
	--显示静态头
	local toDisplay = "";
	if (SuperTooltips:GetTitle()~="" and SuperTooltips:GetIconName()~="")then
		toDisplay = toDisplay .."SuperTooltip_PageHeader";
	end
	--剩余解锁时间
	if ( IsProtectd == "1" and unLockingElapsedTime ~= 0) then
		toDisplay = toDisplay .. ";SuperTooltip_UnlockingTimePart";
	end
	--加上类型描述
	local BSdjpf =0
	if ( typeDesc ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_ShortDesc";
		if string.find(typeDesc,"宝石") then
			local djpftable = {1,2,4,7,10,15,20,30,50,100}
			local ismingjing = string.find(ItemID,"·")
			local BaoDJStrar,BaoDJend,BaoDJ =string.find(ItemID,"(%d)级")
			if ismingjing and  BaoDJ then
				BSdjpf = djpftable[tonumber(BaoDJ)+1]
			elseif BaoDJ then
				BSdjpf = djpftable[tonumber(BaoDJ)]
			end
		end
	end
	--宝石部分
	if ( nGemHoleCounts ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_GemPart";
		local nGemHoleCountstable = {2,3,4,6}
		if  nGemHoleCountstable[nGemHoleCounts] then
			if szPropertys~=nil then
				Baoshipftotal = GetBaoshiStrrB(szPropertys,nGemHoleCountstable[nGemHoleCounts])
			end
		end
	end
	--金钱1
	if ( nMoney1 ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_MoneyPart";
	end
	
	--金钱2
	if (nMoney2 ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_MoneyPart_2";
	end
	
	--高级保护
	if  Baoshipftotal >=15 then
		toDisplay = toDisplay .. ";SuperTooltip_Notice";
		
		SuperTooltip_Protect_Text:SetText("#{GDWPBH_090507_4}")		
	end
	local nbangding = 0
	if (szPropertys ~= nil) then
		local axsree = string.find(szPropertys,"已绑定")
		if axsree ~= nil then
		nbangding = 1
		end
	end
	--OpenYBShopReference("是吗"..nbangding)

	--元宝交易
	if nYuanbaotrade == 1 and nbangding == 0 then
	toDisplay = toDisplay .. ";SuperTooltip_StaticPart_Yuanbaojiaoyi"
	if typeDesc == "#cffcc99帽子" or typeDesc == "#cffcc99鞋" or typeDesc == "#cffcc99护肩" or typeDesc == "#cffcc99腰带" or typeDesc == "#cffcc99手套" or typeDesc == "#cffcc99护符" or typeDesc == "#cffcc99戒指" or typeDesc == "#cffcc99项链"  or typeDesc == "#cffcc99护腕" or typeDesc == "#cffcc99衣服" or typeDesc == "#cffcc99豪侠印" or typeDesc == "#cffcc99帮会令牌" or typeDesc == "#cffcc99龙纹" or typeDesc == "#cffcc99武魂" then
	SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_88}")
	else		
	SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_87}")
	end
	end	
	--属性
	if (szPropertys ~= nil) then
		toDisplay = toDisplay .. ";SuperTooltip_Property";
	end
	--作者
	if nYuanbaotrade == nil then
	nYuanbaotrade = 99
	end

	if (szAuthor ~= nil) then
		if typeDesc == "#cffcc99帽子" or typeDesc == "#cffcc99鞋" or typeDesc == "#cffcc99护肩" or typeDesc == "#cffcc99腰带" or typeDesc == "#cffcc99手套" or typeDesc == "#cffcc99护符" or typeDesc == "#cffcc99戒指" or typeDesc == "#cffcc99项链"  or typeDesc == "#cffcc99护腕" or typeDesc == "#cffcc99衣服"  then
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
	
	--详细解释
	toDisplay = toDisplay .. ";SuperTooltip_Explain";
	--显示组件内容
	if (toDisplay=="") then
		this:Hide();
		return 0;
	end;
	AxTrace( 8,0,toDisplay );
	_SuperTooltip_:SetProperty("PageElements",  toDisplay);
	SuperTooltip_StaticPart_Animate:Hide()
	
	----------------------------------------------------------------------
	--显示新的内容
	SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle());
	
	
	
	
	local infantpos1,infantxpos1 = string.find(SuperTooltips:GetTitle(), "宝珠·") -------令牌宝珠摘除处理等级变化
	if  infantpos1 ~= nil and  infantxpos1 ~= nil then
		if szAuthor~=nil then
			local starpos1,endpos1,bzdj = string.find(szAuthor,"BZ(%w%w)")
			if starpos1 ~= nil and  endpos1 ~= nil then
				SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle()..tonumber(bzdj).."级")
			end
		end
	end
	-------************************************
	local is_shengling = 0
	if typeDesc ~= nil then
		for i= 10, 22 do
			local Strtou,Strwei = string.find(typeDesc, xSrtong[i].Tooltip)
			if Strtou ~= nil and Strwei ~= nil then
				is_shengling = 1   ------这里是查找是否是升灵需要的装备
			end
		end
	end
	SuperTooltip_StaticPart_Title:Show()
	SuperTooltip_StaticPart_Title1:Hide()
	SuperTooltip_StaticPart_Title2:Hide()
	SuperTooltip_StaticPart_Animate:Hide()
	SuperTooltip_StaticPart_ZhiZun:SetText("")
	if  szPropertys ~= nil and szAuthor ~=nil and is_shengling ==1 then
		local sl_cs={ ---升灵百分比参数
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
				SuperTooltip_StaticPart_Title1:SetText("#b#cff6633【王权】"..SuperTooltips:GetTitle())
				SuperTooltip_StaticPart_Animate:Show()
				SuperTooltip_StaticPart_Animate:SetProperty("Animate" , "ZhiZun_Flash_Small")
			end
			if wqtype==1 and wqdj==0 then
				SuperTooltip_StaticPart_ZhiZun:SetText("#H王权：(+"..sl_cs[wqtype][wqdj].."%)"  )
			elseif  wqtype==2 and wqdj==0 then
				SuperTooltip_StaticPart_Title:Hide()
				SuperTooltip_StaticPart_Title1:Hide()
				SuperTooltip_StaticPart_Title2:Show()
				SuperTooltip_StaticPart_Title2:SetText("#b#cff6633【天道】"..SuperTooltips:GetTitle())
				SuperTooltip_StaticPart_Animate:Show()
				SuperTooltip_StaticPart_Animate:SetProperty("Animate" , "SuperEquip_Big")
				SuperTooltip_StaticPart_ZhiZun:SetText("#H天道：(+"..sl_cs[wqtype][wqdj].."%)"  )
			elseif  wqtype>=0 and wqdj>0 then
				SuperTooltip_StaticPart_ZhiZun:SetText("#H升灵度:#Y"..wqdj.."/9#H(+"..sl_cs[wqtype][wqdj].."%)"  )
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
				is_wuqi = 1   ------这里是查找是否是武器
			end
		end
	end
	
	if is_wuqi ==1  and  szAuthor1 then
		local sree0f = string.find(szAuthor1,"&QHD")
		if sree0f and sree0f ~= nil then
			local myqh = string.sub(szAuthor1, sree0f+4,sree0f+4 )
			myqhd = tonumber(myqh);
			if myqhd >= 1 then
				SuperTooltip_StaticPart_QiHe:SetText("#G契合度:#W"..myqhd.."/9")  
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
				SuperTooltip_StaticPart_QiLing:SetText("#Y器灵:#W"..myqld.."/20")  
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
local ePos,kpos = string.find(typeDesc,"时装")
if ePos ~= nil and kpos ~= nil then
---这里完善时装上面的宝石信息显示		
		local gemIcon = SuperTooltips:GetGemIcon1();
		if (gemIcon ~= "") then--第一个点缀
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName	
		end
		
		gemIcon = SuperTooltips:GetGemIcon2();--第二个点缀
		if (gemIcon ~= "") then
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName			
		end
		
		gemIcon = SuperTooltips:GetGemIcon3();--第三个点缀
		if (gemIcon ~= "") then
		BaoShiName = JsMiYu(gemIcon)
		szPropertys = szPropertys..BaoShiName.."#cFF0000(引擎限制点缀效果以第一个点缀为准)\n"			
		end
		end
		end
---这里完善时装上面的宝石信息显示
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
	-------未知
	-------************************************
	local itmdwinsa = SuperTooltips:GetTitle()
	local Desc1 = SuperTooltips:GetDesc1()
	local Desc2 = SuperTooltips:GetDesc2()
	local Desc3 = SuperTooltips:GetDesc3()
	local itemsatrpos0,itemendpos0 = string.find(itmdwinsa,"#cff6633.+·.+")
	local itemsatrpos1,itemendpos1 = string.find(itmdwinsa,"#cff6633.+（%d级）")
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
	
	
	--显示新的内容
	
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
					SuperTooltip_StaticPart_Item4:SetText("#c0FFFFF强化: +"..tonumber(strong));
					local Strongs1,Strongx1 = string.find(typeDesc, "衣服")
					if  Strongs1 ~= nil and Strongx1 ~= nil then
					SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF穿刺减免: +"..g_ExpTbl[tonumber(strong)]/2)
					else
					SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF穿刺伤害: +"..g_ExpTbl[tonumber(strong)])
					end
					else
					SuperTooltip_StaticPart_Item4:SetText("#c0FFFFF强化: +"..tonumber(strong));
					end
					end

	
	
				
					
					
					
					end
end	



      -- local OldLevel = SuperTooltips:GetDesc1()
     -- if OldLevel ~= nil then
	 -- local _,level = string.find(OldLevel,"等级:")
	 
	 	      -- if level ~= nil then
		  -- local NewLevel = tonumber(string.sub(OldLevel,level+1,level+2)) 
		 -- if NewLevel >= 20 then
		 -- SuperTooltip_BaiBingJingTong_Text:SetText("#c00ccff携带等级降至".. NewLevel-10 .. "（百兵精通）#cFF0000后期更新")
		 -- else
		 -- SuperTooltip_BaiBingJingTong_Text:SetText("")
		 -- end
		  -- end
	 -- end
   
   



	if(StrongLevel~="" and tonumber(StrongLevel)>0) then	     --穿刺系统
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
						SuperTooltip_StaticPart_Item4:SetText("#c0FFFFF强化: +"..SuperTooltips:GetDesc4());
						
						SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF穿刺伤害: +"..g_ExpTbl[AddSuansi])
					end
					if  Strongs1 ~= nil and Strongx1 ~= nil then
						qianghu1 = 1
						SuperTooltip_StaticPart_Item4:SetText("#c0FFFFF强化: +"..SuperTooltips:GetDesc4());
						SuperTooltip_StaticPart_Item6:SetText("#c0FFFFF穿刺减免: +"..g_ExpTbl[AddSuansi]/2)
					end
				end
			end
		end
		if qianghu1  == 0 then
			SuperTooltip_StaticPart_Item4:SetText("#c0FFFFF强化: +"..SuperTooltips:GetDesc4());
		end
	end
	
	
	
	SuperTooltip_StaticPart_Icon:SetImage(SuperTooltips:GetIconName());
	SuperTooltip_ShortDesc_Text:SetText(typeDesc);
	-- 显示雕纹
	
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
	

	
	--tongxi modify 显示星星
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
			if starNum >= 8  then  --贵重品显示
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
	
	
	--真元
	if ( szPropertys ~= nil) then
		local zhenyuanpos1,zhenyuanxpos1 = string.find(ItemID, "真元·")
		if  zhenyuanpos1 ~= nil and  zhenyuanxpos1 ~= nil then
			local mytypeDesc = tonumber(string.sub(typeDesc,9,16))
			local zhenyuanYS = math.mod(math.floor(tonumber(mytypeDesc)/100000),10)
			local zhenyuanTP = math.mod(math.floor(tonumber(mytypeDesc)/1000),100)
			local zhenyuanLEV = math.mod(tonumber(mytypeDesc),10)
			if zhenyuanLEV < 9 then
				szPropertys = "#W装备原有#G"..g_zhenyuantype[zhenyuanTP].."#W效果提升#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*zhenyuanLEV*zhenyuanYS).."#W点#r#cffcc99下一级：#r#W装备原有#G"..g_zhenyuantype[zhenyuanTP].."#W效果提升#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*(zhenyuanLEV+1)*zhenyuanYS).."#W点"
			else
				szPropertys = "#W装备原有#G"..g_zhenyuantype[zhenyuanTP].."#W效果提升#G"..tonumber(g_zhenyuanpoint[zhenyuanTP]*zhenyuanLEV*zhenyuanYS).."#W点#r#cffcc99下一级：#r#W当前真元已达最高等级。"
			end
			SuperTooltip_ShortDesc_Text:SetText("#cffcc99真元")
		end
	end

         if (szPropertys ~= nil ) then
		 local sPos, ePos = string.find(typeDesc, "衣服")
		 if sPos ~= nil and ePos ~= nil then
		   local strong = tonumber(QiangHuaAAAA())
		    if strong ~= nil then
			if strong > 8 then

cy01n = string.find(szPropertys,"equip_base_defence_p") --身法	
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
		local sPos, ePos = string.find(typeDesc, "龙纹")  --龙纹系统
		if sPos~=nil and ePos~=nil then
			local s,br= DisplayLWInfo()
			local tmp1,tmp2=string.find(szPropertys, "绑定#r")
			local tmp3,tmp4=string.find(szPropertys, "刻铭#r")
			if tmp3~=nil then
				szPropertys=string.gsub(szPropertys, "刻铭#r", "刻铭#r"..s);
			elseif tmp1~=nil then
				szPropertys=string.gsub(szPropertys, "绑定#r", "绑定#r"..s);
			end
			local sPos1, ePos1 = string.find(szPropertys, "# WLemId=")
			if sPos1 ~=nil and ePos1 ~= nil then
				local str = string.sub(szPropertys,ePos1+1,ePos1+8)
				szPropertys= string.gsub(szPropertys,"# WLemId="..str,""..br)
			end
		if (szPropertys ~= nil ) then
		local sPos, ePos = string.find(typeDesc, "龙纹")
		if sPos ~= nil and ePos ~= nil then
				   local strong = tonumber(QiangHuaAAAA())
		    if strong ~= nil then
			if strong > 8 then
		cy01n = string.find(szPropertys,"基础命中") --身法	
if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")	
	local cy04 = ""	
	local shux = string.sub(szPropertys,cy01n+10,cy01n+12)--命中
	local shuxa = math.floor(tonumber(shux) * 6.58)
		if cy03n ~= nil then
       cy04 = string.gsub(szPropertys,shux,shuxa.." #c0FFFFF+195%%" )
	   
		end
	szPropertys = cy04
end
		cy01n = string.find(szPropertys,"equip_base_miss") --身法	
if cy01n ~= nil then
	local cy01cdn = string.len(szPropertys)
	local cy02 = string.sub(szPropertys, cy01n,cy01cdn )
	local cy03n = string.find(cy02,"\n")	
	local cy04 = ""	
	local shuxxx = string.sub(szPropertys,cy01n+18,cy01n+20)--闪避
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
		local sPos, ePos = string.find(typeDesc, "令牌")
		if sPos ~= nil and ePos ~= nil then
			SuperTooltip_StaticPart_Item2:SetText("#cC8B88E耐久:200/200");
			SuperTooltip_StaticPart_Item3:SetText("#cC8B88E可修理次数:3/3");
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
		 cy01n = string.find(szPropertys,"基础命中") --身法	
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
			local tmp1,tmp2=string.find(szPropertys, "绑定#r")
			local tmp3,tmp4=string.find(szPropertys, "刻铭#r")
			if tmp3~=nil then
				szPropertys=string.gsub(szPropertys, "刻铭#r", "刻铭#r"..dwdesc);
			elseif tmp1~=nil then
				szPropertys=string.gsub(szPropertys, "绑定#r", "绑定#r"..dwdesc);
			else
				szPropertys =dwdesc..szPropertys
			end
		end
	end
	
	if ( szPropertys ~= nil) and string.find(typeDesc, "武魂") ~=nil then
		local a = GetSe_XWoH(szPropertys,typeDesc,szAuthor)
          if a ~= nil then	
                SuperTooltip_StaticPart_Item1:SetText("#cC8B88E携带等级:65");
                SuperTooltip_StaticPart_Item2:SetText("#cC8B88E等级:119");				
                SuperTooltip_StaticPart_Item3:SetText("#G体力型");
                SuperTooltip_StaticPart_Item4:SetText("#cC8B88E寿命:300/300");	
					
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
			local changdu = string.len(str1)  --全
			local changdu1 = string.len(str3)  --中
			ahehed =string.sub(str1, 1,szaswq-1);
			local changdu2 = string.len(ahehed)  --头
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
					
					local HunSX_A = {"冰","火","玄","毒"}
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
							str1 = "#r#G装备：可使用【诛仙万象】技能，命中目标后，将集合命、地、天三个魂位注入的器魂效果，对其造成伤害。#r#c33cc99命魂位("..LevelA.."级)："..HunSX_A[typeA].."攻伤害增加"..HunSXZ_A[LevelA].."点"
						else
							str1 = "#r#G装备：可使用【诛仙万象】技能，命中目标后，将集合命、地、天三个魂位注入的器魂效果，对其造成伤害。#r#c33cc99命魂位(未解封)：器灵达到2阶时解封"
						end
						if typeB > 0 and typeB < 5 then
							str2 = "#r#c33cc99地魂位("..LevelB.."级)：减"..HunSX_A[typeB].."抗增加"..HunSXZ_B[LevelB].."点，持续5秒"
						else
							str2 = "#r#c33cc99地魂位(未解封)：器灵达到5阶时解封"
						end
						if typeC > 0 and typeC < 5 then
							str3 = "#r#c33cc99天魂位("..LevelC.."级)：减"..HunSX_A[typeC].."抗下限增加"..LevelC.."%%，持续5秒"
						else
							str3 = "#r#c33cc99天魂位(未解封)：器灵达到10阶时解封"
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
				if typeDesc == "#cffcc99帽子" or typeDesc == "#cffcc99鞋" or typeDesc == "#cffcc99护肩" or typeDesc == "#cffcc99腰带" or typeDesc == "#cffcc99手套" or typeDesc == "#cffcc99衣服" then
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc防具精通#r#c009933尚未获得精通属性#r#c009933尚未获得精通属性#r#c009933尚未获得精通属性")
				else
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc武具精通#r#c009933尚未获得精通属性#r#c009933尚未获得精通属性#r#c009933尚未获得精通属性")
				end				
			else
				if typeDesc == "#cffcc99帽子" or typeDesc == "#cffcc99鞋" or typeDesc == "#cffcc99护肩" or typeDesc == "#cffcc99腰带" or typeDesc == "#cffcc99手套" or typeDesc == "#cffcc99衣服" then
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc防具精通#r#c009933"..JTstr1.."\n"..JTstr2.."\n"..JTstr3)
				else
					szPropertys= string.gsub(szPropertys,"# JTemId="..str,"#r#cff66cc武具精通#r#c009933"..JTstr1.."\n"..JTstr2.."\n"..JTstr3)
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
	
	if( szPropertys ~= nil) and string.find(typeDesc, "暗器") ~=nil then  --暗器特写
		local ss = ""
		local sPos, ePos = string.find(szPropertys, "DWItemId=")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(szPropertys,ePos+1,ePos+8)
			local str1 = string.gsub(szPropertys,"DWItemId="..str,"")
			if tonumber(str) == 10155011 then
				ss = "体力雕纹1级#r升级需要材料:0/2#r体力 +20"
			elseif tonumber(str) == 10155012 then
				ss = "体力雕纹2级#r升级需要材料:0/9#r体力 +40"
			elseif tonumber(str) == 10155013 then
				ss = "体力雕纹3级#r升级需要材料:0/50#r体力 +60"
			elseif tonumber(str) == 10155014 then
				ss = "体力雕纹4级#r升级需要材料:0/87#r体力 +80"
			elseif tonumber(str) == 10155015 then
				ss = "体力雕纹5级#r升级需要材料:0/165#r体力 +100"
			elseif tonumber(str) == 10155016 then
				ss = "体力雕纹6级#r升级需要材料:0/284#r体力 +120"
			elseif tonumber(str) == 10155017 then
				ss = "体力雕纹7级#r升级需要材料:0/811#r体力 +140"
			elseif tonumber(str) == 10155018 then
				ss = "体力雕纹8级#r升级需要材料:0/2988#r体力 +160"
			elseif tonumber(str) == 10155019 then
				ss = "体力雕纹9级#r升级需要材料:0/3570#r体力 +180"
			elseif tonumber(str) >= 10155020 then
				ss = "体力雕纹10级#r此雕纹等级已满#r体力 +200"
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
		local sPos,ePos = string.find(typeDesc,"蝎")
		if sPos ~=nil and ePos ~= nil then
			local str = string.sub(typeDesc,ePos+1,ePos+8)
			local PetEquip = tostring(str)
			local PetStar = math.floor(math.mod(PetEquip,100)/10)
			local PetAct = math.mod(PetEquip,10)
			local PetLev = math.floor(math.mod(PetEquip,100000)/1000)
			local PetType = math.floor(math.mod(PetEquip,1000)/100)
			local PetTaozhuang = DataPool:GetPlayerMission_DataRound(460)--套装编号
			local PetEq={}
			PetEq[1] = DataPool:GetPlayerMission_DataRound(461)--头
			PetEq[2] = DataPool:GetPlayerMission_DataRound(462)--爪
			PetEq[3] = DataPool:GetPlayerMission_DataRound(463)--甲
			PetEq[4] = DataPool:GetPlayerMission_DataRound(464)--环
			PetEq[5] = DataPool:GetPlayerMission_DataRound(465)--饰
			
			SuperTooltip_StaticPart_Item1:SetText("#cC8B88E等级: "..PetLev);
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
				SuperTooltip_StaticPart_Item2:SetText("#G可拆解");
				SuperTooltip_StaticPart_Item3:SetText("#G可提升星级");
			else
				SuperTooltip_StaticPart_Item2:SetText("#cff6633可拆解");
				SuperTooltip_StaticPart_Item3:SetText("#cff6633已满级");
			end
			
			if PetType == 1 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E珍兽面甲"); --显示类型
			elseif PetType == 2 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E珍兽武器"); --显示类型
			elseif PetType == 3 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E珍兽盔甲"); --显示类型
			elseif PetType == 4 then
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E珍兽项圈"); --显示类型
			else
				SuperTooltip_ShortDesc_Text:SetText("#cC8B88E珍兽配饰"); --显示类型
			end
			
			
                    if PetLev == 75 then
                       local petEqJCSX = {"#cffcc99基础外功防御 +580#r基础内功防御 +580","#cffcc99基础外功攻击 +587#r基础内功攻击 +587","#cffcc99基础闪避 +531"}  --基础属性
                       local petEqEWSX = {"#r#cffcc40内功攻击 +"..tostring(PetStar*172).."#r会心 +"..tostring(PetStar*3).."","#r#cffcc40外功攻击 +"..tostring(PetStar*172).."#r命中 +"..tostring(PetStar*24).."","#r#cffcc40外功防御 +"..tostring(PetStar*100).."#r内功防御 +"..tostring(PetStar*171)..""}  --额外属性
                       local petEqQHSX = {"#r#c6699ff灵气资质契合：灵气 +"..tostring(PetStar)..".0%","#r#c6699ff力量资质契合：力量 +"..tostring(PetStar)..".0%","#r#c6699ff体力资质契合：体力 +"..tostring(PetStar)..".0%"}
                       local PetEqNam = {"黄雀戏水·怯","苍狼啸月·勇","乌豚望日·忠"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"黄雀戏水兽盔·怯","黄雀戏水兽爪·怯","黄雀戏水兽甲·怯","黄雀戏水兽环·怯","黄雀戏水兽饰·怯"} 
                             PetEqShuX[2] = {"苍狼啸月兽盔·勇","苍狼啸月兽爪·勇","苍狼啸月兽甲·勇","苍狼啸月兽环·勇","苍狼啸月兽饰·勇"} 
                             PetEqShuX[3] = {"乌豚望日兽盔·忠","乌豚望日兽爪·忠","乌豚望日兽甲·忠","乌豚望日兽环·忠","乌豚望日兽饰·忠"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36内功攻击 +"..tostring(PetStar*332).."","#r#c99cc36命中 +"..tostring(PetStar*430).."","#r#c99cc36灵气 +"..tostring(PetStar*17).."","#r#c99cc36烈火咒、玄雷咒、血毒咒、寒冰咒释放时额外增加对应属性攻击("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[2] = {"#r#c99cc36外功攻击 +"..tostring(PetStar*332).."","#r#c99cc36命中 +"..tostring(PetStar*430).."","#r#c99cc36力量 +"..tostring(PetStar*17).."","#r#c99cc36猛击技能释放时额外增加外功攻击("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[3] = {"#r#c99cc36外功防御 +"..tostring(PetStar*328).."","#r#c99cc36内功防御 +"..tostring(PetStar*328).."","#r#c99cc36血上限 +"..tostring(PetStar*609).."","#r#c99cc36增加灵动技能对珍兽自己的生效几率("..tostring(PetStar).."星套效果)"}
				
				local TaoJCSX = ""  --基础属性
				local TaoHave=""    --影藏属性激活否
				local TaoYCSX=""    --影藏属性
				local PetTaoNum = 0 --穿了几件
				
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
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --影藏属性名
					TaoHave = TaoHave..TaoEvery    --影藏属性激活否
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666未知属性"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				szPropertys = "#cccffff已绑定".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc资质未鉴定"
				SuperTooltip_Property:SetText(szPropertys);
			end
			
			
                    if PetLev == 85 then
                       local petEqJCSX = {"#cffcc99基础外功防御 +649#r基础内功防御 +649","#cffcc99基础外功攻击 +657#r基础内功攻击 +657","#cffcc99基础闪避 +593"}  --基础属性
                       local petEqEWSX = {"#r#cffcc40内功攻击 +"..tostring(PetStar*192).."#r命中 +"..tostring(PetStar*26).."#r会心 +"..tostring(PetStar*4).."","#r#cffcc40外功攻击 +"..tostring(PetStar*192).."#r命中 +"..tostring(PetStar*26).."#r会心 +"..tostring(PetStar*4).."","#r#cffcc40外功防御 +"..tostring(PetStar*190).."#r内功防御 +"..tostring(PetStar*190).."#r闪避 +"..tostring(PetStar*12)..""}  --额外属性
                       local petEqQHSX = {"#r#c6699ff灵气资质契合：灵气 +"..tostring(PetStar*2)..".0%","#r#c6699ff力量资质契合：力量 +"..tostring(PetStar*2)..".0%","#r#c6699ff体力资质契合：体力 +"..tostring(PetStar*2)..".0%"}
                       local PetEqNam = {"飞鹰翔空·怯","猛虎撼山·勇","巨熊哮路·忠"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"飞鹰翔空兽盔·怯","飞鹰翔空兽爪·怯","飞鹰翔空兽甲·怯","飞鹰翔空兽环·怯","飞鹰翔空兽饰·怯"} 
                             PetEqShuX[2] = {"猛虎撼山兽盔·勇","猛虎撼山兽爪·勇","猛虎撼山兽甲·勇","猛虎撼山兽环·勇","猛虎撼山兽饰·勇"} 
                             PetEqShuX[3] = {"巨熊哮路兽盔·忠","巨熊哮路兽爪·忠","巨熊哮路兽甲·忠","巨熊哮路兽环·忠","巨熊哮路兽饰·忠"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36内功攻击 +"..tostring(PetStar*374).."","#r#c99cc36命中 +"..tostring(PetStar*483).."","#r#c99cc36灵气 +"..tostring(PetStar*19).."","#r#c99cc36痛击技能释放时额外增加内功攻击("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[2] = {"#r#c99cc36外功攻击 +"..tostring(PetStar*374).."","#r#c99cc36命中 +"..tostring(PetStar*483).."","#r#c99cc36力量 +"..tostring(PetStar*19).."","#r#c99cc36增加猛击技能的释放几率("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[3] = {"#r#c99cc36外功防御 +"..tostring(PetStar*369).."","#r#c99cc36内功防御 +"..tostring(PetStar*369).."","#r#c99cc36血上限 +"..tostring(PetStar*667).."","#r#c99cc36增加忠心技能对玩家的生效几率("..tostring(PetStar).."星套效果)"}
				
				local TaoJCSX = ""  --基础属性
				local TaoHave=""    --影藏属性激活否
				local TaoYCSX=""    --影藏属性
				local PetTaoNum = 0 --穿了几件
				
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
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --影藏属性名
					TaoHave = TaoHave..TaoEvery    --影藏属性激活否
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666未知属性"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				szPropertys = "#cccffff已绑定".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc资质未鉴定"
				SuperTooltip_Property:SetText(szPropertys);
			end
			
			
                    if PetLev == 95 then
                       local petEqJCSX = {"#cffcc99基础外功防御 +718#r基础内功防御 +718","#cffcc99基础外功攻击 +727#r基础内功攻击 +727","#cffcc99基础闪避 +655"}  --基础属性
                       local petEqEWSX = {"#r#cffcc40内功攻击 +"..tostring(PetStar*211).."#r命中 +"..tostring(PetStar*29).."#r会心 +"..tostring(PetStar*5).."#r灵气 +"..tostring(PetStar*10).."","#r#cffcc40外功攻击 +"..tostring(PetStar*211).."#r命中 +"..tostring(PetStar*29).."#r会心 +"..tostring(PetStar*5).."#r力量 +"..tostring(PetStar*10).."","#r#cffcc40外功防御 +"..tostring(PetStar*209).."#r内功防御 +"..tostring(PetStar*209).."#r闪避 +"..tostring(PetStar*15).."#r体力 +"..tostring(PetStar*10)..""}  --额外属性
                       local petEqQHSX = {"#r#c6699ff灵气资质契合：灵气 +"..tostring(PetStar*3)..".0%","#r#c6699ff力量资质契合：力量 +"..tostring(PetStar*3)..".0%","#r#c6699ff体力资质契合：体力 +"..tostring(PetStar*3)..".0%"}
                       local PetEqNam = {"昆鹏异羽·怯","雄狮逆鳞·勇","玄龟奇血·忠"}
                       local PetEqShuX = {}
                             PetEqShuX[1] = {"昆鹏异羽兽盔·怯","昆鹏异羽兽爪·怯","昆鹏异羽兽甲·怯","昆鹏异羽兽环·怯","昆鹏异羽兽饰·怯"} 
                             PetEqShuX[2] = {"雄狮逆鳞兽盔·勇","雄狮逆鳞兽爪·勇","雄狮逆鳞兽甲·勇","雄狮逆鳞兽环·勇","雄狮逆鳞兽饰·勇"} 
                             PetEqShuX[3] = {"玄龟奇血兽盔·忠","玄龟奇血兽爪·忠","玄龟奇血兽甲·忠","玄龟奇血兽环·忠","玄龟奇血兽饰·忠"} 
                       local PetEqYCSX = {}
                             PetEqYCSX[1] = {"#r#c99cc36内功攻击 +"..tostring(PetStar*416).."","#r#c99cc36命中 +"..tostring(PetStar*536).."","#r#c99cc36灵气 +"..tostring(PetStar*21).."","#r#c99cc36增加烈火咒、玄雷咒、血毒咒、寒冰咒释放几率("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[2] = {"#r#c99cc36外功攻击 +"..tostring(PetStar*416).."","#r#c99cc36命中 +"..tostring(PetStar*536).."","#r#c99cc36力量 +"..tostring(PetStar*21).."","#r#c99cc36增加连击技能释放几率("..tostring(PetStar).."星套效果)"}
                             PetEqYCSX[3] = {"#r#c99cc36外功防御 +"..tostring(PetStar*411).."","#r#c99cc36内功防御 +"..tostring(PetStar*411).."","#r#c99cc36血上限 +"..tostring(PetStar*764).."","#r#c99cc36增加灵气技能对玩家的生效几率("..tostring(PetStar).."星套效果)"}
				
				local TaoJCSX = ""  --基础属性
				local TaoHave=""    --影藏属性激活否
				local TaoYCSX=""    --影藏属性
				local PetTaoNum = 0 --穿了几件
				
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
					PetTaoNam = "#r#cffcc00"..PetEqNam[PetType].."("..PetTaoNum.."/5)"   --影藏属性名
					TaoHave = TaoHave..TaoEvery    --影藏属性激活否
				end
				
				for i = 1,4 do
					if i < PetTaoNum then
						TaoYC = PetEqYCSX[PetType][i]
					else
						TaoYC = "#r#c666666未知属性"
					end
					TaoYCSX = TaoYCSX..TaoYC
				end
				
				szPropertys =  "#cccffff已绑定".."#r"..TaoJCSX..PetTaoNam..TaoHave..TaoYCSX.."#r#cff99cc资质未鉴定"
				SuperTooltip_Property:SetText(szPropertys);
			end
		end
	end


	
if typeDesc~= nil then
local ePos = string.find(typeDesc,"宝石")
if ePos ~= nil then
SuperTooltip_Explain:SetText(szExplain.."#G宝石修炼评分 +"..BSdjpf.."\n#G宝石进阶评分 +"..BSdjpf);
else
SuperTooltip_Explain:SetText(szExplain);
end
else
SuperTooltip_Explain:SetText(szExplain);
end
	AxTrace( 8,0,"Show tooltip  "..szExplain);
	return 1;
end



function GetSe_XWH() --武魂
	local     	typeDesc = SuperTooltips:GetTypeDesc();
	local   	szPropertys = SuperTooltips:GetPropertys();
	wunhPos1,wunhsxPos1 = string.find(typeDesc, "武魂")
	if  wunhPos1 ~= nil and  wunhsxPos1 ~= nil then
		local u1,u2,u3 =GetWuHunStr()
		local tmp1,tmp2=string.find(szPropertys, "绑定#r")
		local tmp3,tmp4=string.find(szPropertys, "刻铭#r")
		if tmp3~=nil then
			szPropertys=string.gsub(szPropertys, "刻铭#r", "刻铭#r"..u1);
		elseif tmp1~=nil then
			szPropertys=string.gsub(szPropertys, "绑定#r", "绑定#r"..u1);
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
					szPropertys=string.gsub(szPropertys, srwuhu[i],""..wunh[i]..":+"..lisiwuhunsuxing[i].." (原始"..wunh[i]..":"..wunhid[i]..")")
				else
					szPropertys=string.gsub(szPropertys, srwuhu[i],""..wunh[i]..":+"..lisiwuhunsuxing[i].." (原始"..wunh[i]..":"..wunhid[i]..")\n"..u2..u3)
				end
			end
		end
		return 	szPropertys,lisiwuhunsuxing
	else
		return 	nil	,nil
	end
end

function GetWuHunStr() --武魂
	local skilllistaec = {}
	skilllistaec["00"] = ""
	skilllistaec["q1"] = "#r#c009933清逸之魂（1级）#r#ccccccc扇环类武器的基础内外功攻击增加70%%"
	skilllistaec["q2"] = "#r#c009933清逸之魂（2级）#r#ccccccc扇环类武器的基础内外功攻击增加80%%"
	skilllistaec["q3"] = "#r#c009933清逸之魂（3级）#r#ccccccc扇环类武器的基础内外功攻击增加90%%"
	skilllistaec["q4"] = "#r#c009933清逸之魂（4级）#r#ccccccc扇环类武器的基础内外功攻击增加100%%"
	skilllistaec["q5"] = "#r#c009933清逸之魂（5级）#r#ccccccc扇环类武器的基础内外功攻击增加110%%"
	skilllistaec["q6"] = "#r#c009933清逸之魂（6级）#r#ccccccc扇环类武器的基础内外功攻击增加120%%"
	skilllistaec["q7"] = "#r#c009933清逸之魂（7级）#r#ccccccc扇环类武器的基础内外功攻击增加180%%"
	skilllistaec["q8"] = "#r#c009933清逸之魂（8级）#r#ccccccc扇环类武器的基础内外功攻击增加200%%"
	skilllistaec["w1"] = "#r#c009933寒锋之魂（1级）#r#ccccccc单短双短类武器的基础内外功攻击增加70%%"
	skilllistaec["w2"] = "#r#c009933寒锋之魂（2级）#r#ccccccc单短双短类武器的基础内外功攻击增加80%%"
	skilllistaec["w3"] = "#r#c009933寒锋之魂（3级）#r#ccccccc单短双短类武器的基础内外功攻击增加90%%"
	skilllistaec["w4"] = "#r#c009933寒锋之魂（4级）#r#ccccccc单短双短类武器的基础内外功攻击增加100%%"
	skilllistaec["w5"] = "#r#c009933寒锋之魂（5级）#r#ccccccc单短双短类武器的基础内外功攻击增加110%%"
	skilllistaec["w6"] = "#r#c009933寒锋之魂（6级）#r#ccccccc单短双短类武器的基础内外功攻击增加120%%"
	skilllistaec["w7"] = "#r#c009933寒锋之魂（7级）#r#ccccccc单短双短类武器的基础内外功攻击增加180%%"
	skilllistaec["w8"] = "#r#c009933寒锋之魂（8级）#r#ccccccc单短双短类武器的基础内外功攻击增加200%%"
	skilllistaec["e1"] = "#r#c009933武勇之魂（1级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加70%%"
	skilllistaec["e2"] = "#r#c009933武勇之魂（2级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加80%%"
	skilllistaec["e3"] = "#r#c009933武勇之魂（3级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加90%%"
	skilllistaec["e4"] = "#r#c009933武勇之魂（4级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加100%%"
	skilllistaec["e5"] = "#r#c009933武勇之魂（5级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加110%%"
	skilllistaec["e6"] = "#r#c009933武勇之魂（6级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加120%%"
	skilllistaec["e7"] = "#r#c009933武勇之魂（7级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加180%%"
	skilllistaec["e8"] = "#r#c009933武勇之魂（8级）#r#ccccccc刀斧枪棒类武器的基础内外功攻击增加200%%"
	skilllistaec["r1"] = "#r#c009933御体之魂（1级）#r#ccccccc防具的基础内外功防御增加70%%"
	skilllistaec["r2"] = "#r#c009933御体之魂（2级）#r#ccccccc防具的基础内外功防御增加80%%"
	skilllistaec["r3"] = "#r#c009933御体之魂（3级）#r#ccccccc防具的基础内外功防御增加90%%"
	skilllistaec["r4"] = "#r#c009933御体之魂（4级）#r#ccccccc防具的基础内外功防御增加100%%"
	skilllistaec["r5"] = "#r#c009933御体之魂（5级）#r#ccccccc防具的基础内外功防御增加110%%"
	skilllistaec["r6"] = "#r#c009933御体之魂（6级）#r#ccccccc防具的基础内外功防御增加120%%"
	skilllistaec["r7"] = "#r#c009933御体之魂（7级）#r#ccccccc防具的基础内外功防御增加180%%"
	skilllistaec["r8"] = "#r#c009933御体之魂（8级）#r#ccccccc防具的基础内外功防御增加200%%"	
	skilllistaec["t1"] = "#r#c009933鹰凖之魂（1级）#r#ccccccc弩类武器的基础内外功攻击增加70%%"
	skilllistaec["t2"] = "#r#c009933鹰凖之魂（2级）#r#ccccccc弩类武器的基础内外功攻击增加80%%"
	skilllistaec["t3"] = "#r#c009933鹰凖之魂（3级）#r#ccccccc弩类武器的基础内外功攻击增加90%%"
	skilllistaec["t4"] = "#r#c009933鹰凖之魂（4级）#r#ccccccc弩类武器的基础内外功攻击增加100%%"
	skilllistaec["t5"] = "#r#c009933鹰凖之魂（5级）#r#ccccccc弩类武器的基础内外功攻击增加110%%"
	skilllistaec["t6"] = "#r#c009933鹰凖之魂（6级）#r#ccccccc弩类武器的基础内外功攻击增加120%%"
	skilllistaec["t7"] = "#r#c009933鹰凖之魂（7级）#r#ccccccc弩类武器的基础内外功攻击增加180%%"
	skilllistaec["t8"] = "#r#c009933鹰凖之魂（8级）#r#ccccccc弩类武器的基础内外功攻击增加200%%"
	skilllistaec["y1"] = "#r#c009933隐逸之魂（1级）#r#ccccccc长杖类武器的基础内外功攻击增加70%%"
	skilllistaec["y2"] = "#r#c009933隐逸之魂（2级）#r#ccccccc长杖类武器的基础内外功攻击增加80%%"
	skilllistaec["y3"] = "#r#c009933隐逸之魂（3级）#r#ccccccc长杖类武器的基础内外功攻击增加90%%"
	skilllistaec["y4"] = "#r#c009933隐逸之魂（4级）#r#ccccccc长杖类武器的基础内外功攻击增加100%%"
	skilllistaec["y5"] = "#r#c009933隐逸之魂（5级）#r#ccccccc长杖类武器的基础内外功攻击增加110%%"
	skilllistaec["y6"] = "#r#c009933隐逸之魂（6级）#r#ccccccc长杖类武器的基础内外功攻击增加120%%"
	skilllistaec["y7"] = "#r#c009933隐逸之魂（7级）#r#ccccccc长杖类武器的基础内外功攻击增加180%%"
	skilllistaec["y8"] = "#r#c009933隐逸之魂（8级）#r#ccccccc长杖类武器的基础内外功攻击增加200%%"
	skilllistaec["u1"] = "#r#c009933清雅之魂（1级）#r#ccccccc箫剑类武器的基础内外功攻击增加70%%"
	skilllistaec["u2"] = "#r#c009933清雅之魂（2级）#r#ccccccc箫剑类武器的基础内外功攻击增加80%%"
	skilllistaec["u3"] = "#r#c009933清雅之魂（3级）#r#ccccccc箫剑类武器的基础内外功攻击增加90%%"
	skilllistaec["u4"] = "#r#c009933清雅之魂（4级）#r#ccccccc箫剑类武器的基础内外功攻击增加100%%"
	skilllistaec["u5"] = "#r#c009933清雅之魂（5级）#r#ccccccc箫剑类武器的基础内外功攻击增加110%%"
	skilllistaec["u6"] = "#r#c009933清雅之魂（6级）#r#ccccccc箫剑类武器的基础内外功攻击增加120%%"
	skilllistaec["u7"] = "#r#c009933清雅之魂（7级）#r#ccccccc箫剑类武器的基础内外功攻击增加180%%"
	skilllistaec["u8"] = "#r#c009933清雅之魂（8级）#r#ccccccc箫剑类武器的基础内外功攻击增加200%%"
	skilllistaec["i1"] = "#r#c009933灭灵之魂（1级）#r#ccccccc攻击时，一定几率降低目标灵力23点，持续10秒"
	skilllistaec["i2"] = "#r#c009933灭灵之魂（2级）#r#ccccccc攻击时，一定几率降低目标灵力56点，持续10秒"
	skilllistaec["i3"] = "#r#c009933灭灵之魂（3级）#r#ccccccc攻击时，一定几率降低目标灵力79点，持续10秒"
	skilllistaec["i4"] = "#r#c009933灭灵之魂（4级）#r#ccccccc攻击时，一定几率降低目标灵力102点，持续10秒"
	skilllistaec["i5"] = "#r#c009933灭灵之魂（5级）#r#ccccccc攻击时，一定几率降低目标灵力165点，持续10秒"
	skilllistaec["i6"] = "#r#c009933灭灵之魂（6级）#r#ccccccc攻击时，一定几率降低目标灵力178点，持续10秒"
	skilllistaec["i7"] = "#r#c009933灭灵之魂（7级）#r#ccccccc攻击时，一定几率降低目标灵力215点，持续10秒"
	skilllistaec["i8"] = "#r#c009933灭灵之魂（8级）#r#ccccccc攻击时，一定几率降低目标灵力275点，持续10秒"
	skilllistaec["o1"] = "#r#c009933破体之魂（1级）#r#ccccccc攻击时，一定几率降低目标体力23点，持续10秒"
	skilllistaec["o2"] = "#r#c009933破体之魂（2级）#r#ccccccc攻击时，一定几率降低目标体力56点，持续10秒"
	skilllistaec["o3"] = "#r#c009933破体之魂（3级）#r#ccccccc攻击时，一定几率降低目标体力79点，持续10秒"
	skilllistaec["o4"] = "#r#c009933破体之魂（4级）#r#ccccccc攻击时，一定几率降低目标体力102点，持续10秒"
	skilllistaec["o5"] = "#r#c009933破体之魂（5级）#r#ccccccc攻击时，一定几率降低目标体力165点，持续10秒"
	skilllistaec["o6"] = "#r#c009933破体之魂（6级）#r#ccccccc攻击时，一定几率降低目标体力178点，持续10秒"
	skilllistaec["o7"] = "#r#c009933破体之魂（7级）#r#ccccccc攻击时，一定几率降低目标体力215点，持续10秒"
	skilllistaec["o8"] = "#r#c009933破体之魂（8级）#r#ccccccc攻击时，一定几率降低目标体力275点，持续10秒"
	skilllistaec["p1"] = "#r#c009933乱定之魂（1级）#r#ccccccc攻击时，一定几率降低目标定力23点，持续10秒"
	skilllistaec["p2"] = "#r#c009933乱定之魂（2级）#r#ccccccc攻击时，一定几率降低目标定力56点，持续10秒"
	skilllistaec["p3"] = "#r#c009933乱定之魂（3级）#r#ccccccc攻击时，一定几率降低目标定力79点，持续10秒"
	skilllistaec["p4"] = "#r#c009933乱定之魂（4级）#r#ccccccc攻击时，一定几率降低目标定力102点，持续10秒"
	skilllistaec["p5"] = "#r#c009933乱定之魂（5级）#r#ccccccc攻击时，一定几率降低目标定力165点，持续10秒"
	skilllistaec["p6"] = "#r#c009933乱定之魂（6级）#r#ccccccc攻击时，一定几率降低目标定力178点，持续10秒"
	skilllistaec["p7"] = "#r#c009933乱定之魂（7级）#r#ccccccc攻击时，一定几率降低目标定力215点，持续10秒"
	skilllistaec["p8"] = "#r#c009933乱定之魂（8级）#r#ccccccc攻击时，一定几率降低目标定力275点，持续10秒"
	skilllistaec["a1"] = "#r#c009933重身之魂（1级）#r#ccccccc攻击时，一定几率降低目标身法16点，持续10秒"
	skilllistaec["a2"] = "#r#c009933重身之魂（2级）#r#ccccccc攻击时，一定几率降低目标身法23点，持续10秒"
	skilllistaec["a3"] = "#r#c009933重身之魂（3级）#r#ccccccc攻击时，一定几率降低目标身法39点，持续10秒"
	skilllistaec["a4"] = "#r#c009933重身之魂（4级）#r#ccccccc攻击时，一定几率降低目标身法56点，持续10秒"
	skilllistaec["a5"] = "#r#c009933重身之魂（5级）#r#ccccccc攻击时，一定几率降低目标身法82点，持续10秒"
	skilllistaec["a6"] = "#r#c009933重身之魂（6级）#r#ccccccc攻击时，一定几率降低目标身法89点，持续10秒"
	skilllistaec["a7"] = "#r#c009933重身之魂（7级）#r#ccccccc攻击时，一定几率降低目标身法120点，持续10秒"
	skilllistaec["a8"] = "#r#c009933重身之魂（8级）#r#ccccccc攻击时，一定几率降低目标身法160点，持续10秒"
	skilllistaec["s1"] = "#r#c009933绝情之魂（1级）#r#ccccccc攻击时，一定几率降低目标所有属性14点，持续10秒"
	skilllistaec["s2"] = "#r#c009933绝情之魂（2级）#r#ccccccc攻击时，一定几率降低目标所有属性39点，持续10秒"
	skilllistaec["s3"] = "#r#c009933绝情之魂（3级）#r#ccccccc攻击时，一定几率降低目标所有属性54点，持续10秒"
	skilllistaec["s4"] = "#r#c009933绝情之魂（4级）#r#ccccccc攻击时，一定几率降低目标所有属性89点，持续10秒"
	skilllistaec["s5"] = "#r#c009933绝情之魂（5级）#r#ccccccc攻击时，一定几率降低目标所有属性154点，持续10秒"
	skilllistaec["s6"] = "#r#c009933绝情之魂（6级）#r#ccccccc攻击时，一定几率降低目标所有属性209点，持续10秒"
	skilllistaec["s7"] = "#r#c009933绝情之魂（7级）#r#ccccccc攻击时，一定几率降低目标所有属性270点，持续10秒"
	skilllistaec["s8"] = "#r#c009933绝情之魂（8级）#r#ccccccc攻击时，一定几率降低目标所有属性300点，持续10秒"
	skilllistaec["d1"] = "#r#c009933厉刚之魂（1级）#r#ccccccc攻击时，一定几率增加自身外功攻击1256点，持续10秒"
	skilllistaec["d2"] = "#r#c009933厉刚之魂（2级）#r#ccccccc攻击时，一定几率增加自身外功攻击2396点，持续10秒"
	skilllistaec["d3"] = "#r#c009933厉刚之魂（3级）#r#ccccccc攻击时，一定几率增加自身外功攻击5552点，持续10秒"
	skilllistaec["d4"] = "#r#c009933厉刚之魂（4级）#r#ccccccc攻击时，一定几率增加自身外功攻击10724点，持续10秒"
	skilllistaec["d5"] = "#r#c009933厉刚之魂（5级）#r#ccccccc攻击时，一定几率增加自身外功攻击19160点，持续10秒"
	skilllistaec["d6"] = "#r#c009933厉刚之魂（6级）#r#ccccccc攻击时，一定几率增加自身外功攻击22131点，持续10秒"
	skilllistaec["d7"] = "#r#c009933厉刚之魂（7级）#r#ccccccc攻击时，一定几率增加自身外功攻击22416点，持续10秒"
	skilllistaec["d8"] = "#r#c009933厉刚之魂（8级）#r#ccccccc攻击时，一定几率增加自身外功攻击22931点，持续10秒"
	skilllistaec["f1"] = "#r#c009933旋柔之魂（1级）#r#ccccccc攻击时，一定几率增加自身内功攻击1256点，持续10秒"
	skilllistaec["f2"] = "#r#c009933旋柔之魂（2级）#r#ccccccc攻击时，一定几率增加自身内功攻击2396点，持续10秒"
	skilllistaec["f3"] = "#r#c009933旋柔之魂（3级）#r#ccccccc攻击时，一定几率增加自身内功攻击5552点，持续10秒"
	skilllistaec["f4"] = "#r#c009933旋柔之魂（4级）#r#ccccccc攻击时，一定几率增加自身内功攻击10724点，持续10秒"
	skilllistaec["f5"] = "#r#c009933旋柔之魂（5级）#r#ccccccc攻击时，一定几率增加自身内功攻击19160点，持续10秒"
	skilllistaec["f6"] = "#r#c009933旋柔之魂（6级）#r#ccccccc攻击时，一定几率增加自身内功攻击22131点，持续10秒"
	skilllistaec["f7"] = "#r#c009933旋柔之魂（7级）#r#ccccccc攻击时，一定几率增加自身内功攻击22416点，持续10秒"
	skilllistaec["f8"] = "#r#c009933旋柔之魂（8级）#r#ccccccc攻击时，一定几率增加自身内功攻击22931点，持续10秒"
	skilllistaec["g1"] = "#r#c009933武韧之魂（1级）#r#ccccccc攻击时，一定几率增加自身外功防御1249点，持续10秒"
	skilllistaec["g2"] = "#r#c009933武韧之魂（2级）#r#ccccccc攻击时，一定几率增加自身外功防御2388点，持续10秒"
	skilllistaec["g3"] = "#r#c009933武韧之魂（3级）#r#ccccccc攻击时，一定几率增加自身外功防御5544点，持续10秒"
	skilllistaec["g4"] = "#r#c009933武韧之魂（4级）#r#ccccccc攻击时，一定几率增加自身外功防御10716点，持续10秒"
	skilllistaec["g5"] = "#r#c009933武韧之魂（5级）#r#ccccccc攻击时，一定几率增加自身外功防御19080点，持续10秒"
	skilllistaec["g6"] = "#r#c009933武韧之魂（6级）#r#ccccccc攻击时，一定几率增加自身外功防御22121点，持续10秒"
	skilllistaec["g7"] = "#r#c009933武韧之魂（7级）#r#ccccccc攻击时，一定几率增加自身外功防御22416点，持续10秒"
	skilllistaec["g8"] = "#r#c009933武韧之魂（8级）#r#ccccccc攻击时，一定几率增加自身外功防御22931点，持续10秒"
	skilllistaec["h1"] = "#r#c009933阴绵之魂（1级）#r#ccccccc攻击时，一定几率增加自身内功防御1249点，持续10秒"
	skilllistaec["h2"] = "#r#c009933阴绵之魂（2级）#r#ccccccc攻击时，一定几率增加自身内功防御2388点，持续10秒"
	skilllistaec["h3"] = "#r#c009933阴绵之魂（3级）#r#ccccccc攻击时，一定几率增加自身内功防御5544点，持续10秒"
	skilllistaec["h4"] = "#r#c009933阴绵之魂（4级）#r#ccccccc攻击时，一定几率增加自身内功防御10716点，持续10秒"
	skilllistaec["h5"] = "#r#c009933阴绵之魂（5级）#r#ccccccc攻击时，一定几率增加自身内功防御19080点，持续10秒"
	skilllistaec["h6"] = "#r#c009933阴绵之魂（6级）#r#ccccccc攻击时，一定几率增加自身内功防御22121点，持续10秒"
	skilllistaec["h7"] = "#r#c009933阴绵之魂（7级）#r#ccccccc攻击时，一定几率增加自身内功防御22416点，持续10秒"
	skilllistaec["h8"] = "#r#c009933阴绵之魂（8级）#r#ccccccc攻击时，一定几率增加自身内功防御22931点，持续10秒"
	skilllistaec["j1"] = "#r#c009933星准之魂（1级）#r#ccccccc攻击时，一定几率增加自身命中1398点，持续10秒"
	skilllistaec["j2"] = "#r#c009933星准之魂（2级）#r#ccccccc攻击时，一定几率增加自身命中1555点，持续10秒"
	skilllistaec["j3"] = "#r#c009933星准之魂（3级）#r#ccccccc攻击时，一定几率增加自身命中2028点，持续10秒"
	skilllistaec["j4"] = "#r#c009933星准之魂（4级）#r#ccccccc攻击时，一定几率增加自身命中2920点，持续10秒"
	skilllistaec["j5"] = "#r#c009933星准之魂（5级）#r#ccccccc攻击时，一定几率增加自身命中4134点，持续10秒"
	skilllistaec["j6"] = "#r#c009933星准之魂（6级）#r#ccccccc攻击时，一定几率增加自身命中5372点，持续10秒"
	skilllistaec["j7"] = "#r#c009933星准之魂（7级）#r#ccccccc攻击时，一定几率增加自身命中6634点，持续10秒"
	skilllistaec["j8"] = "#r#c009933星准之魂（8级）#r#ccccccc攻击时，一定几率增加自身命中7334点，持续10秒"
	skilllistaec["k1"] = "#r#c009933灵洒之魂（1级）#r#ccccccc攻击时，一定几率增加自身闪避464点，持续10秒"
	skilllistaec["k2"] = "#r#c009933灵洒之魂（2级）#r#ccccccc攻击时，一定几率增加自身闪避516点，持续10秒"
	skilllistaec["k3"] = "#r#c009933灵洒之魂（3级）#r#ccccccc攻击时，一定几率增加自身闪避774点，持续10秒"
	skilllistaec["k4"] = "#r#c009933灵洒之魂（4级）#r#ccccccc攻击时，一定几率增加自身闪避1038点，持续10秒"
	skilllistaec["k5"] = "#r#c009933灵洒之魂（5级）#r#ccccccc攻击时，一定几率增加自身闪避1710点，持续10秒"
	skilllistaec["k6"] = "#r#c009933灵洒之魂（6级）#r#ccccccc攻击时，一定几率增加自身闪避2790点，持续10秒"
	skilllistaec["k7"] = "#r#c009933灵洒之魂（7级）#r#ccccccc攻击时，一定几率增加自身闪避2910点，持续10秒"
	skilllistaec["k8"] = "#r#c009933灵洒之魂（8级）#r#ccccccc攻击时，一定几率增加自身闪避3210点，持续10秒"
	skilllistaec["l1"] = "#r#c009933断刚之魂（1级）#r#ccccccc攻击时，一定几率降低目标外功攻击1256点，持续10秒"
	skilllistaec["l2"] = "#r#c009933断刚之魂（2级）#r#ccccccc攻击时，一定几率降低目标外功攻击2396点，持续10秒"
	skilllistaec["l3"] = "#r#c009933断刚之魂（3级）#r#ccccccc攻击时，一定几率降低目标外功攻击5552点，持续10秒"
	skilllistaec["l4"] = "#r#c009933断刚之魂（4级）#r#ccccccc攻击时，一定几率降低目标外功攻击10724点，持续10秒"
	skilllistaec["l5"] = "#r#c009933断刚之魂（5级）#r#ccccccc攻击时，一定几率降低目标外功攻击19160点，持续10秒"
	skilllistaec["l6"] = "#r#c009933断刚之魂（6级）#r#ccccccc攻击时，一定几率降低目标外功攻击22131点，持续10秒"
	skilllistaec["l7"] = "#r#c009933断刚之魂（7级）#r#ccccccc攻击时，一定几率降低目标外功攻击22416点，持续10秒"
	skilllistaec["l8"] = "#r#c009933断刚之魂（8级）#r#ccccccc攻击时，一定几率降低目标外功攻击22931点，持续10秒"
	skilllistaec["z1"] = "#r#c009933裂柔之魂（1级）#r#ccccccc攻击时，一定几率降低目标内功攻击1256点，持续10秒"
	skilllistaec["z2"] = "#r#c009933裂柔之魂（2级）#r#ccccccc攻击时，一定几率降低目标内功攻击2396点，持续10秒"
	skilllistaec["z3"] = "#r#c009933裂柔之魂（3级）#r#ccccccc攻击时，一定几率降低目标内功攻击5552点，持续10秒"
	skilllistaec["z4"] = "#r#c009933裂柔之魂（4级）#r#ccccccc攻击时，一定几率降低目标内功攻击10724点，持续10秒"
	skilllistaec["z5"] = "#r#c009933裂柔之魂（5级）#r#ccccccc攻击时，一定几率降低目标内功攻击19160点，持续10秒"
	skilllistaec["z6"] = "#r#c009933裂柔之魂（6级）#r#ccccccc攻击时，一定几率降低目标内功攻击22131点，持续10秒"
	skilllistaec["z7"] = "#r#c009933裂柔之魂（7级）#r#ccccccc攻击时，一定几率降低目标内功攻击22416点，持续10秒"
	skilllistaec["z8"] = "#r#c009933裂柔之魂（8级）#r#ccccccc攻击时，一定几率降低目标内功攻击22931点，持续10秒"
	skilllistaec["x1"] = "#r#c009933黯韧之魂（1级）#r#ccccccc攻击时，一定几率降低目标外功防御1249点，持续10秒"
	skilllistaec["x2"] = "#r#c009933黯韧之魂（2级）#r#ccccccc攻击时，一定几率降低目标外功防御2388点，持续10秒"
	skilllistaec["x3"] = "#r#c009933黯韧之魂（3级）#r#ccccccc攻击时，一定几率降低目标外功防御5544点，持续10秒"
	skilllistaec["x4"] = "#r#c009933黯韧之魂（4级）#r#ccccccc攻击时，一定几率降低目标外功防御10716点，持续10秒"
	skilllistaec["x5"] = "#r#c009933黯韧之魂（5级）#r#ccccccc攻击时，一定几率降低目标外功防御19080点，持续10秒"
	skilllistaec["x6"] = "#r#c009933黯韧之魂（6级）#r#ccccccc攻击时，一定几率降低目标外功防御22121点，持续10秒"
	skilllistaec["x7"] = "#r#c009933黯韧之魂（7级）#r#ccccccc攻击时，一定几率降低目标外功防御22416点，持续10秒"
	skilllistaec["x8"] = "#r#c009933黯韧之魂（8级）#r#ccccccc攻击时，一定几率降低目标外功防御22931点，持续10秒"
	skilllistaec["c1"] = "#r#c009933刺绵之魂（1级）#r#ccccccc攻击时，一定几率降低目标内功防御1249点，持续10秒"
	skilllistaec["c2"] = "#r#c009933刺绵之魂（2级）#r#ccccccc攻击时，一定几率降低目标内功防御2388点，持续10秒"
	skilllistaec["c3"] = "#r#c009933刺绵之魂（3级）#r#ccccccc攻击时，一定几率降低目标内功防御5544点，持续10秒"
	skilllistaec["c4"] = "#r#c009933刺绵之魂（4级）#r#ccccccc攻击时，一定几率降低目标内功防御10716点，持续10秒"
	skilllistaec["c5"] = "#r#c009933刺绵之魂（5级）#r#ccccccc攻击时，一定几率降低目标内功防御19080点，持续10秒"
	skilllistaec["c6"] = "#r#c009933刺绵之魂（6级）#r#ccccccc攻击时，一定几率降低目标内功防御22121点，持续10秒"
	skilllistaec["c7"] = "#r#c009933刺绵之魂（7级）#r#ccccccc攻击时，一定几率降低目标内功防御22416点，持续10秒"
	skilllistaec["c8"] = "#r#c009933刺绵之魂（8级）#r#ccccccc攻击时，一定几率降低目标内功防御22931点，持续10秒"
	skilllistaec["v1"] = "#r#c009933扰准之魂（1级）#r#ccccccc攻击时，一定几率降低目标命中1398点，持续10秒"
	skilllistaec["v2"] = "#r#c009933扰准之魂（2级）#r#ccccccc攻击时，一定几率降低目标命中1555点，持续10秒"
	skilllistaec["v3"] = "#r#c009933扰准之魂（3级）#r#ccccccc攻击时，一定几率降低目标命中2028点，持续10秒"
	skilllistaec["v4"] = "#r#c009933扰准之魂（4级）#r#ccccccc攻击时，一定几率降低目标命中2920点，持续10秒"
	skilllistaec["v5"] = "#r#c009933扰准之魂（5级）#r#ccccccc攻击时，一定几率降低目标命中4134点，持续10秒"
	skilllistaec["v6"] = "#r#c009933扰准之魂（6级）#r#ccccccc攻击时，一定几率降低目标命中5372点，持续10秒"
	skilllistaec["v7"] = "#r#c009933扰准之魂（7级）#r#ccccccc攻击时，一定几率降低目标命中5634点，持续10秒"
	skilllistaec["v8"] = "#r#c009933扰准之魂（8级）#r#ccccccc攻击时，一定几率降低目标命中5334点，持续10秒"
	skilllistaec["b1"] = "#r#c009933绝洒之魂（1级）#r#ccccccc攻击时，一定几率降低目标闪避464点，持续10秒"
	skilllistaec["b2"] = "#r#c009933绝洒之魂（2级）#r#ccccccc攻击时，一定几率降低目标闪避516点，持续10秒"
	skilllistaec["b3"] = "#r#c009933绝洒之魂（3级）#r#ccccccc攻击时，一定几率降低目标闪避774点，持续10秒"
	skilllistaec["b4"] = "#r#c009933绝洒之魂（4级）#r#ccccccc攻击时，一定几率降低目标闪避1038点，持续10秒"
	skilllistaec["b5"] = "#r#c009933绝洒之魂（5级）#r#ccccccc攻击时，一定几率降低目标闪避1710点，持续10秒"
	skilllistaec["b6"] = "#r#c009933绝洒之魂（6级）#r#ccccccc攻击时，一定几率降低目标闪避2790点，持续10秒"
	skilllistaec["b7"] = "#r#c009933绝洒之魂（7级）#r#ccccccc攻击时，一定几率降低目标闪避2910点，持续10秒"
	skilllistaec["b8"] = "#r#c009933绝洒之魂（8级）#r#ccccccc攻击时，一定几率降低目标闪避3210点，持续10秒"
	skilllistaec["n1"] = "#r#c009933强击之魂（1级）#r#ccccccc攻击时，一定几率增加伤害3870点"
	skilllistaec["n2"] = "#r#c009933强击之魂（2级）#r#ccccccc攻击时，一定几率增加伤害5208点"
	skilllistaec["n3"] = "#r#c009933强击之魂（3级）#r#ccccccc攻击时，一定几率增加伤害7232点"
	skilllistaec["n4"] = "#r#c009933强击之魂（4级）#r#ccccccc攻击时，一定几率增加伤害9259点"
	skilllistaec["n5"] = "#r#c009933强击之魂（5级）#r#ccccccc攻击时，一定几率增加伤害10288点"
	skilllistaec["n6"] = "#r#c009933强击之魂（6级）#r#ccccccc攻击时，一定几率增加伤害20320点"
	skilllistaec["n7"] = "#r#c009933强击之魂（7级）#r#ccccccc攻击时，一定几率增加伤害20358点"
	skilllistaec["n8"] = "#r#c009933强击之魂（8级）#r#ccccccc攻击时，一定几率增加伤害20438点"
	skilllistaec["m1"] = "#r#c009933绝气之魂（1级）#r#ccccccc攻击时，一定几率扣除目标720点气"
	skilllistaec["m2"] = "#r#c009933绝气之魂（2级）#r#ccccccc攻击时，一定几率扣除目标810点气"
	skilllistaec["m3"] = "#r#c009933绝气之魂（3级）#r#ccccccc攻击时，一定几率扣除目标910点气"
	skilllistaec["m4"] = "#r#c009933绝气之魂（4级）#r#ccccccc攻击时，一定几率扣除目标1020点气"
	skilllistaec["m5"] = "#r#c009933绝气之魂（5级）#r#ccccccc攻击时，一定几率扣除目标1500点气"
	skilllistaec["m6"] = "#r#c009933绝气之魂（6级）#r#ccccccc攻击时，一定几率扣除目标2128点气"
	skilllistaec["m7"] = "#r#c009933绝气之魂（7级）#r#ccccccc攻击时，一定几率扣除目标2145点气"
	skilllistaec["m8"] = "#r#c009933绝气之魂（8级）#r#ccccccc攻击时，一定几率扣除目标2195点气"
	skilllistaec["Q1"] = "#r#c009933灭世八方（1级）#r#ccccccc外功攻击增加21858点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q2"] = "#r#c009933灭世八方（2级）#r#ccccccc外功攻击增加24820点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q3"] = "#r#c009933灭世八方（3级）#r#ccccccc外功攻击增加27778点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q4"] = "#r#c009933灭世八方（4级）#r#ccccccc外功攻击增加30739点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q5"] = "#r#c009933灭世八方（5级）#r#ccccccc外功攻击增加33702点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q6"] = "#r#c009933灭世八方（6级）#r#ccccccc外功攻击增加36664点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q7"] = "#r#c009933灭世八方（7级）#r#ccccccc外功攻击增加38264点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Q8"] = "#r#c009933灭世八方（8级）#r#ccccccc外功攻击增加42000点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W1"] = "#r#c009933绝境散杀（1级）#r#ccccccc内功攻击增加21858点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W2"] = "#r#c009933绝境散杀（2级）#r#ccccccc内功攻击增加24820点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W3"] = "#r#c009933绝境散杀（3级）#r#ccccccc内功攻击增加27778点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W4"] = "#r#c009933绝境散杀（4级）#r#ccccccc内功攻击增加30739点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W5"] = "#r#c009933绝境散杀（5级）#r#ccccccc内功攻击增加33702点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W6"] = "#r#c009933绝境散杀（6级）#r#ccccccc内功攻击增加36664点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W7"] = "#r#c009933绝境散杀（7级）#r#ccccccc内功攻击增加38264点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["W8"] = "#r#c009933绝境散杀（8级）#r#ccccccc内功攻击增加42000点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E1"] = "#r#c009933冰封万里（1级）#r#ccccccc冰攻击增加528点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E2"] = "#r#c009933冰封万里（2级）#r#ccccccc冰攻击增加715点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E3"] = "#r#c009933冰封万里（3级）#r#ccccccc冰攻击增加1003点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E4"] = "#r#c009933冰封万里（4级）#r#ccccccc冰攻击增加2092点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E5"] = "#r#c009933冰封万里（5级）#r#ccccccc冰攻击增加3280点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E6"] = "#r#c009933冰封万里（6级）#r#ccccccc冰攻击增加3567点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E7"] = "#r#c009933冰封万里（7级）#r#ccccccc冰攻击增加3980点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["E8"] = "#r#c009933冰封万里（8级）#r#ccccccc冰攻击增加4780点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R1"] = "#r#c009933天火燎原（1级）#r#ccccccc火攻击增加528点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R2"] = "#r#c009933天火燎原（2级）#r#ccccccc火攻击增加715点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R3"] = "#r#c009933天火燎原（3级）#r#ccccccc火攻击增加1003点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R4"] = "#r#c009933天火燎原（4级）#r#ccccccc火攻击增加2092点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R5"] = "#r#c009933天火燎原（5级）#r#ccccccc火攻击增加3280点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R6"] = "#r#c009933天火燎原（6级）#r#ccccccc火攻击增加3567点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R7"] = "#r#c009933天火燎原（7级）#r#ccccccc火攻击增加3980点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["R8"] = "#r#c009933天火燎原（8级）#r#ccccccc火攻击增加4780点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T1"] = "#r#c009933狂雷天降（1级）#r#ccccccc玄攻击增加528点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T2"] = "#r#c009933狂雷天降（2级）#r#ccccccc玄攻击增加715点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T3"] = "#r#c009933狂雷天降（3级）#r#ccccccc玄攻击增加1003点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T4"] = "#r#c009933狂雷天降（4级）#r#ccccccc玄攻击增加2092点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T5"] = "#r#c009933狂雷天降（5级）#r#ccccccc玄攻击增加3280点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T6"] = "#r#c009933狂雷天降（6级）#r#ccccccc玄攻击增加3567点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T7"] = "#r#c009933狂雷天降（7级）#r#ccccccc玄攻击增加3980点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["T8"] = "#r#c009933狂雷天降（8级）#r#ccccccc玄攻击增加4780点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y1"] = "#r#c009933剧毒瘟疫（1级）#r#ccccccc毒攻击增加528点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y2"] = "#r#c009933剧毒瘟疫（2级）#r#ccccccc毒攻击增加715点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y3"] = "#r#c009933剧毒瘟疫（3级）#r#ccccccc毒攻击增加1003点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y4"] = "#r#c009933剧毒瘟疫（4级）#r#ccccccc毒攻击增加2092点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y5"] = "#r#c009933剧毒瘟疫（5级）#r#ccccccc毒攻击增加3280点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y6"] = "#r#c009933剧毒瘟疫（6级）#r#ccccccc毒攻击增加3567点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y7"] = "#r#c009933剧毒瘟疫（7级）#r#ccccccc毒攻击增加3980点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["Y8"] = "#r#c009933剧毒瘟疫（8级）#r#ccccccc毒攻击增加4780点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U1"] = "#r#c009933怒涛连击（1级）#r#ccccccc附加伤害1746点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U2"] = "#r#c009933怒涛连击（2级）#r#ccccccc附加伤害2118点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U3"] = "#r#c009933怒涛连击（3级）#r#ccccccc附加伤害3490点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U4"] = "#r#c009933怒涛连击（4级）#r#ccccccc附加伤害5862点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U5"] = "#r#c009933怒涛连击（5级）#r#ccccccc附加伤害8931点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U6"] = "#r#c009933怒涛连击（6级）#r#ccccccc附加伤害12510点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U7"] = "#r#c009933怒涛连击（7级）#r#ccccccc附加伤害14700点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["U8"] = "#r#c009933怒涛连击（8级）#r#ccccccc附加伤害15500点，对目标及目标周围最多3个目标造成伤害"
	skilllistaec["I1"] = "#r#c009933刚猛重击（1级）#r#ccccccc外功攻击增加21858点"
	skilllistaec["I2"] = "#r#c009933刚猛重击（2级）#r#ccccccc外功攻击增加24820点"
	skilllistaec["I3"] = "#r#c009933刚猛重击（3级）#r#ccccccc外功攻击增加27778点"
	skilllistaec["I4"] = "#r#c009933刚猛重击（4级）#r#ccccccc外功攻击增加30739点"
	skilllistaec["I5"] = "#r#c009933刚猛重击（5级）#r#ccccccc外功攻击增加33702点"
	skilllistaec["I6"] = "#r#c009933刚猛重击（6级）#r#ccccccc外功攻击增加36664点"
	skilllistaec["I7"] = "#r#c009933刚猛重击（7级）#r#ccccccc外功攻击增加42774点"
	skilllistaec["I8"] = "#r#c009933刚猛重击（8级）#r#ccccccc外功攻击增加50000点"
	skilllistaec["O1"] = "#r#c009933柔蛇突袭（1级）#r#ccccccc内功攻击增加21858点"
	skilllistaec["O2"] = "#r#c009933柔蛇突袭（2级）#r#ccccccc内功攻击增加24820点"
	skilllistaec["O3"] = "#r#c009933柔蛇突袭（3级）#r#ccccccc内功攻击增加27778点"
	skilllistaec["O4"] = "#r#c009933柔蛇突袭（4级）#r#ccccccc内功攻击增加30739点"
	skilllistaec["O5"] = "#r#c009933柔蛇突袭（5级）#r#ccccccc内功攻击增加33702点"
	skilllistaec["O6"] = "#r#c009933柔蛇突袭（6级）#r#ccccccc内功攻击增加36664 点"
	skilllistaec["O7"] = "#r#c009933柔蛇突袭（7级）#r#ccccccc内功攻击增加42774点"
	skilllistaec["O8"] = "#r#c009933柔蛇突袭（8级）#r#ccccccc内功攻击增加50000点"
	skilllistaec["P1"] = "#r#c009933寒冰穿刺（1级）#r#ccccccc冰攻击增加528点"
	skilllistaec["P2"] = "#r#c009933寒冰穿刺（2级）#r#ccccccc冰攻击增加715点"
	skilllistaec["P3"] = "#r#c009933寒冰穿刺（3级）#r#ccccccc冰攻击增加1003点"
	skilllistaec["P4"] = "#r#c009933寒冰穿刺（4级）#r#ccccccc冰攻击增加2092点"
	skilllistaec["P5"] = "#r#c009933寒冰穿刺（5级）#r#ccccccc冰攻击增加3280点"
	skilllistaec["P6"] = "#r#c009933寒冰穿刺（6级）#r#ccccccc冰攻击增加3567点"
	skilllistaec["P7"] = "#r#c009933寒冰穿刺（7级）#r#ccccccc冰攻击增加4161点"
	skilllistaec["P8"] = "#r#c009933寒冰穿刺（8级）#r#ccccccc冰攻击增加4755点"
	skilllistaec["A1"] = "#r#c009933烈焰灼身（1级）#r#ccccccc火攻击增加528点"
	skilllistaec["A2"] = "#r#c009933烈焰灼身（2级）#r#ccccccc火攻击增加715点"
	skilllistaec["A3"] = "#r#c009933烈焰灼身（3级）#r#ccccccc火攻击增加1003点"
	skilllistaec["A4"] = "#r#c009933烈焰灼身（4级）#r#ccccccc火攻击增加2092点"
	skilllistaec["A5"] = "#r#c009933烈焰灼身（5级）#r#ccccccc火攻击增加3280点"
	skilllistaec["A6"] = "#r#c009933烈焰灼身（6级）#r#ccccccc火攻击增加3567点"
	skilllistaec["A7"] = "#r#c009933烈焰灼身（7级）#r#ccccccc火攻击增加4161点"
	skilllistaec["A8"] = "#r#c009933烈焰灼身（8级）#r#ccccccc火攻击增加4755点"
	skilllistaec["S1"] = "#r#c009933天雷轰顶（1级）#r#ccccccc玄攻击增加528点"
	skilllistaec["S2"] = "#r#c009933天雷轰顶（2级）#r#ccccccc玄攻击增加715点"
	skilllistaec["S3"] = "#r#c009933天雷轰顶（3级）#r#ccccccc玄攻击增加1003点"
	skilllistaec["S4"] = "#r#c009933天雷轰顶（4级）#r#ccccccc玄攻击增加2092点"
	skilllistaec["S5"] = "#r#c009933天雷轰顶（5级）#r#ccccccc玄攻击增加3280点"
	skilllistaec["S6"] = "#r#c009933天雷轰顶（6级）#r#ccccccc玄攻击增加3567点"
	skilllistaec["S7"] = "#r#c009933天雷轰顶（7级）#r#ccccccc玄攻击增加4161点"
	skilllistaec["S8"] = "#r#c009933天雷轰顶（8级）#r#ccccccc玄攻击增加4755点"
	skilllistaec["D1"] = "#r#c009933雾腐蚀毒（1级）#r#ccccccc毒攻击增加528点"
	skilllistaec["D2"] = "#r#c009933雾腐蚀毒（2级）#r#ccccccc毒攻击增加715点"
	skilllistaec["D3"] = "#r#c009933雾腐蚀毒（3级）#r#ccccccc毒攻击增加1003点"
	skilllistaec["D4"] = "#r#c009933雾腐蚀毒（4级）#r#ccccccc毒攻击增加2092点"
	skilllistaec["D5"] = "#r#c009933雾腐蚀毒（5级）#r#ccccccc毒攻击增加3280点"
	skilllistaec["D6"] = "#r#c009933雾腐蚀毒（6级）#r#ccccccc毒攻击增加3567点"
	skilllistaec["D7"] = "#r#c009933雾腐蚀毒（7级）#r#ccccccc毒攻击增加4161点"
	skilllistaec["D8"] = "#r#c009933雾腐蚀毒（8级）#r#ccccccc毒攻击增加4755点"
	skilllistaec["F1"] = "#r#c009933雷霆猛击（1级）#r#ccccccc附加伤害1746点"
	skilllistaec["F2"] = "#r#c009933雷霆猛击（2级）#r#ccccccc附加伤害2118点"
	skilllistaec["F3"] = "#r#c009933雷霆猛击（3级）#r#ccccccc附加伤害3490点"
	skilllistaec["F4"] = "#r#c009933雷霆猛击（4级）#r#ccccccc附加伤害5862点"
	skilllistaec["F5"] = "#r#c009933雷霆猛击（5级）#r#ccccccc附加伤害8931点"
	skilllistaec["F6"] = "#r#c009933雷霆猛击（6级）#r#ccccccc附加伤害12510点"
	skilllistaec["F7"] = "#r#c009933雷霆猛击（7级）#r#ccccccc附加伤害11666点"
	skilllistaec["F8"] = "#r#c009933雷霆猛击（8级）#r#ccccccc附加伤害15332点"
	
	Str = SuperTooltips:GetAuthorInfo();
	local hc,kz,sx,jn,sx1,sxtable ,sxtable1 = GetWH_er(Str)
	if Str==nil or 	Str=="" then
		return "#c993333成长率:(100)\n","#ccc33cc合成等级:"..hc.."\n","#cff99ff扩展属性栏数:"..kz.."\n"
	end
	local T1,t1 = string.find(Str,"&WH")
	if T1 == nil or t1 ==nil then
		return "#c993333成长率:(100)\n","#ccc33cc合成等级:"..hc.."\n","#cff99ff扩展属性栏数:"..kz.."\n"
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
	return "#c993333成长率:897(完美)\n","#ccc33cc合成等级:"..hc.."\n","#cff99ff扩展属性栏数:"..kz.."\n#cffcc00"..sxtablestr..sxtablestr1..sxsx.."\n",sxtable
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
-------------本作品由君奉原创独家，仅作为个人交流使用，请勿开服外传，本人不承担任何法律责任。，——精通

---
function DisplEQJTInfo(strszAuthor)
	local JTtable={}
	JTtable["xs"]={"血上限",100}
	JTtable["ll"]={"力量"	,2}
	JTtable["lq"]={"灵气"	,2}
	JTtable["tl"]={"体力"	,2}
	JTtable["dl"]={"定力"	,2}
	JTtable["sf"]={"身法"	,2}
	JTtable["wf"]={"外功防御",20}
	JTtable["nf"]={"内功防御",20}
	JTtable["sb"]={"闪避"	,5}
	--------------------------------
	JTtable["mz"]={"命中"	,15}
	JTtable["bg"]={"冰攻"	,3}
	JTtable["hg"]={"火攻"	,3}
	JTtable["xg"]={"玄攻"	,3}
	JTtable["dg"]={"毒攻"	,3}
	JTtable["wg"]={"外功攻击",20}
	JTtable["ng"]={"内功攻击",20}
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
	JTstr1 =JTtable[JTstr1][1].."("..tonumber(JTun1).."级) +"..(tonumber(JTun1)*JTtable[JTstr1][2]).."(共"..(100*JTtable[JTstr1][2])..",".."已解封"..tonumber(JTun1).."%%)"
	JTstr2 =JTtable[JTstr2][1].."("..tonumber(JTun2).."级) +"..(tonumber(JTun2)*JTtable[JTstr2][2]).."(共"..(100*JTtable[JTstr2][2])..",".."已解封"..tonumber(JTun2).."%%)"
	JTstr3 =JTtable[JTstr3][1].."("..tonumber(JTun3).."级) +"..(tonumber(JTun3)*JTtable[JTstr3][2]).."(共"..(100*JTtable[JTstr3][2])..",".."已解封"..tonumber(JTun3).."%%)"
	return 1,1, JTstr1,JTstr2,JTstr3,tonumber(JTun1),tonumber(JTun2),tonumber(JTun3)
end

---**********
----------本作品由君奉原创独家，仅作为个人交流使用，请勿开服外传，本人不承担任何法律责任。，——令牌
---**********
function DisplayLPInfo(strszAuthor)
	local Operating = {}
	Operating["a"]={"#cFF0000#895朱雀宝珠·血上限" ,   38001000,"血上限 +",12359,2000,800} --血  1为str ,2为物品ID，3为str ,4为官方参数，5为基本数，6为进阶数
	Operating["b"]={"#cFF0000#895朱雀宝珠·力量",      38001001,"力量 +",118,30,5}  --力
	Operating["c"]={"#cFF0000#895朱雀宝珠·灵气" ,     38001002,"灵气 +",118,30,5} --灵
	Operating["d"]={"#cFF0000#895朱雀宝珠·体力" ,     38001003,"体力 +",118,30,5}--体
	Operating["e"]={"#cFF0000#895朱雀宝珠·定力" ,     38001004,"定力 +",118,30,5} --定
	Operating["f"]={"#cFF0000#895朱雀宝珠·身法" ,     38001005,"身法 +",118,30,5}--身
	Operating["g"]={"#G#897青龙宝珠·冰攻击" ,         38001006,"冰攻 +",172,20,5} --冰
	Operating["h"]={"#G#897青龙宝珠·火攻击" ,         38001007,"火攻 +",172,20,5}--火
	Operating["i"]={"#G#897青龙宝珠·玄攻击",          38001008,"玄攻 +",172,20,5} --玄
	Operating["j"]={"#G#897青龙宝珠·毒攻击" ,         38001009,"毒攻 +",172,20,5} --毒
	Operating["k"]={"#c0066ff#896玄武宝珠·冰抗性" ,   38001010,"冰抗 +",53,4,2}--冰k
	Operating["l"]={"#c0066ff#896玄武宝珠·火抗性" ,   38001011,"火抗 +",53,4,2} --火k
	Operating["m"]={"#c0066ff#896玄武宝珠·玄抗性" ,   38001012,"玄抗 +",53,4,2} --玄k
	Operating["n"]={"#c0066ff#896玄武宝珠·毒抗性" ,   38001013,"毒抗 +",53,4,2} --毒k
	Operating["o"]={"#Y#898白虎宝珠·内功攻击" ,       38001014,"内功 +",2534,1534,200} --内功
	Operating["p"]={"#Y#898白虎宝珠·外功攻击" ,       38001015,"外功 +",2534,1534,200} --外功
	Operating["q"]={"#Y#898白虎宝珠·内功防御" ,       38001016,"内防 +",2534,1534,200}--内防
	Operating["r"]={"#Y#898白虎宝珠·外功防御",        38001017,"外防 +",2534,1534,200}  --外防 --- (Operating[m][5]+Operating[m][6]*Operat_dj)*star_jc[star_dj]
	Operating["s"]={"#Y#898白虎宝珠·命中"  ,          38001018,"命中 +",1429,179,50}--命中
	Operating["t"]={"#Y#898白虎宝珠·闪避" ,           38001019,"闪避 +",500,50,20} --闪避
	
	local skill_str = {
	["a"]={"寒冰化劲：攻击时有一定几率触发冰系化劲，使自身增加",  "点冰攻击，持续4秒，此效果45秒内只能触发1次" },
	["b"]={"炎气化劲：攻击时有一定几率触发火系化劲，使自身增加",  "点火攻击，持续4秒，此效果45秒内只能触发1次" },
	["c"]={"玄法化劲：攻击时有一定几率触发玄系化劲，使自身增加",  "点玄攻击，持续4秒，此效果45秒内只能触发1次" },
	["d"]={"百毒化劲：攻击时有一定几率触发毒系化劲，使自身增加",  "点毒攻击，持续4秒，此效果45秒内只能触发1次" },
	["u"]={"四象归一·冰：攻击时有一定几率触发，触发后将自身火、玄、毒三种属性攻击100%%全部转化为冰属性攻击，持续","秒，此效果45秒内只能触发1次" },
	["v"]={"四象归一·火：攻击时有一定几率触发，触发后将自身冰、玄、毒三种属性攻击100%%全部转化为火属性攻击，持续","秒，此效果45秒内只能触发1次" },
	["w"]={"四象归一·玄：攻击时有一定几率触发，触发后将自身冰、火、毒三种属性攻击100%%全部转化为玄属性攻击，持续","秒，此效果45秒内只能触发1次" },
	["x"]={"四象归一·毒：攻击时有一定几率触发，触发后将自身冰、火、玄三种属性攻击100%%全部转化为毒属性攻击，持续","秒，此效果45秒内只能触发1次" },
	["y"]={"凭虚御风：攻击时有一定几率触发御风飞行，使自身增加50%%移动速度，持续","秒，此效果45秒内只能触发1次" },
	}
	local star_jc = {0.1,0.14,0.2,0.28,0.4,0.55,0.75,1,1.3} ---星级对应的属性系数加成
	local star_skilljc = {200,280,400,560,800,1100,1500,2000,2600} ---星级对应技能的属性系数加成
	local star_kuozhan = { ---扩展对应
	["a"] ={ "血上限 +",        10190}  , ---- star_kuozhan[n][2]*star_jc[star_dj]
	["b"] ={ "冰抗性 +",        80}  ,
	["c"] ={ "火抗性 +",        80}  ,
	["d"] ={ "玄抗性 +",        80}  ,
	["e"] ={ "毒抗性 +",        80}  ,
	["f"] ={ "忽略目标冰抗 +",  80}  ,
	["g"] ={ "忽略目标火抗 +",  80}  ,
	["h"] ={ "忽略目标玄抗 +",  80}  ,
	["i"] ={ "忽略目标毒抗 +",  80}  ,
	["j"] ={ "会心攻击 +",      24}  ,
	["k"] ={ "会心防御 +",      20}  ,
	["l"] ={ "所有属性 +",      80}  }
	local strlog = {
	[1]={ "#c009933未镶嵌宝珠#r" ,"#c605C4F未开启，达到二阶后开启#r","#c605C4F未开启，达到三阶后开启#r","#c605C4F未开启，达到四阶后开启#r" },
	[2]={ "#c605C4F（未开启）达到二阶后开启#r" ,"#c605C4F（未开启）达到三阶后开启#r","#c605C4F（未开启）达到四阶后开启#r" },
	[3]={ "#c605C4F（未开启）达到五阶后开启#r" },
	}
	local Operat_zhu = {}
	local Okuozhan_zhu = {}
	local str = strlog[1][1]..strlog[1][2]..strlog[1][3]..strlog[1][4].."#ccc33cc扩展属性 （0/3）#r"..strlog[2][1]..strlog[2][2]..strlog[2][3].."#ccc33cc被动技能#r"..strlog[3][1]
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
	jinjie_dj =tonumber( string.sub(lp_str0, 1,1))      ; ---进阶数
	star_dj =tonumber (string.sub(lp_str0, 2,2)); ---星星数
	if  jinjie_dj == nil or jinjie_dj==0  then
		return 0,str,0,Operat_zhu,Okuozhan_zhu,"0"
	end
	if star_dj==0 then
		star_dj =1
	end
	local lp_str = {}
	lp_str[1] =string.sub(lp_str1, 1,1); ---切出来的类型
	lp_str[2] =string.sub(lp_str1, 4,4);
	lp_str[3] =string.sub(lp_str1, 7,7);
	lp_str[4] =string.sub(lp_str1, 10,10);
	lp_str[5] =string.sub(lp_str1, 2,3);---切出来的等级
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
				strlog[1][i] = "#c009933"..Operating[Operat_type][1].."（"..Operat_dj.."级）"..Operating[Operat_type][3]..shuxingzhi.."#r"
			else
				strlog[1][i] = "#c009933未镶嵌宝珠#r"
			end
		end
		if i>=2  and  i<=4 then
			local kuozhan_type = lp_str[i+7]  --扩展类型
			if star_kuozhan[kuozhan_type]~=nil  then
				local kuozhan_zhi = star_kuozhan[kuozhan_type][2]*star_jc[star_dj]
				kuozhan_zhi = math.floor(kuozhan_zhi)
				strlog[2][i-1] = "#c009933"..star_kuozhan[kuozhan_type][1]..kuozhan_zhi.."#r"
				kueizhan_num = kueizhan_num+1
				Okuozhan_zhu[i-1] = {star_kuozhan[kuozhan_type][1],kuozhan_zhi}
			else
				strlog[2][i-1] = "#c009933（未激活）镶嵌"..i.."颗宝珠后激活#r"
			end
		end
	end
	---------第三段-----------
	if jinjie_dj ==5  then
		if skill_str[lp_str3] ~= nil  then
			if lp_str3 == "u" or lp_str3 == "v" or lp_str3 == "w" or lp_str3 == "x" or lp_str3 == "y"   then
				strlog[3][1] = "#c009933"..skill_str[lp_str3][1]..(star_dj+1)..skill_str[lp_str3][2].."#r"
			else
				strlog[3][1] = "#c009933"..skill_str[lp_str3][1]..star_skilljc[star_dj]..skill_str[lp_str3][2].."#r"
			end
		else
			strlog[3][1] =  "#c009933尚未学习#r"
		end
	end
	str = strlog[1][1]..strlog[1][2]..strlog[1][3]..strlog[1][4].."#ccc33cc扩展属性 （"..kueizhan_num.."/3）#r"..strlog[2][1]..strlog[2][2]..strlog[2][3].."#ccc33cc被动技能#r"..strlog[3][1]
	return 1,str,star_dj,Operat_zhu,Okuozhan_zhu,lp_str3
end



---***************
-------龙纹-------
---***************
function DisplayLWInfo(strszAuthor)
	local LWszAuthor
	if strszAuthor==nil then
		LWszAuthor = SuperTooltips:GetAuthorInfo();
	else
		LWszAuthor = strszAuthor
	end
	local lvshux = {40,60,80,120,160,220,280,340,420,500} ------属性
	local lvshux1 = {2,3,5,7,10,13,17,21,25,30} ---------——血上限，——减抗下限
	local xuestr = {"+2%%","+3%%","+4%%","+5%%","+7%%","+9%%","+11%%","+14%%","+17%%","+20%%"}
	local cz_index = {1,1,2,2,3,5,8,13,21,34} ---------成长参数
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
		strlv = "#G成长等级：100#r成长值：成长等级已达到满级#r"
	else
		strlv = "#G成长等级："..cz_dj.."#r成长值："..chengzhangyu.."/"..cz_index[chengbiaoji].."#r"
	end
	-----------------------血上限----------------------
	local strxlv = ""
	local kuazhanshu = 0
	if tonumber(shuxin_xue) >0 then
		strxlv = "#c009933血上限("..shuxin_xue.."级) "..xuestr[shuxin_xue].."#r"
		kuazhanshu = kuazhanshu+1
	else
		strxlv = "#c009933血上限：未学习#r"
	end
	------------------属性攻击----------------------
	local shuxinstr = {"#c009933冰攻击","#c009933火攻击","#c009933玄攻击","#c009933毒攻击"}
	local strtype = ""
	if tonumber(shuxin_gj) >0 then
		local sxtype = math.floor( tonumber(shuxin_gj)/100)
		local sxdj = math.mod( tonumber(shuxin_gj),100)
		if shuxinstr[sxtype]~=nil and lvshux[sxdj]~=nil  then
			strtype =shuxinstr[sxtype].."("..sxdj.."级) +"..lvshux[sxdj].."#r"
			kuazhanshu = kuazhanshu+1
		else
			strtype = "#c009933属性攻击：未学习#r"
		end
	else
		strtype = "#c009933属性攻击：未学习#r"
	end
	------------------属性减下限----------------------
	local shuxinxxstr = {"#c009933降低目标冰抗下限","#c009933降低目标火抗下限","#c009933降低目标玄抗下限","#c009933降低目标毒抗下限"}
	local strjk = ""
	if tonumber(shuxin_xx) >0 then
		local sxtype = math.floor( tonumber(shuxin_xx)/100)
		local sxdj = math.mod( tonumber(shuxin_xx),100)
		if shuxinxxstr[sxtype]~=nil and lvshux1[sxdj]~=nil  then
			strjk =shuxinxxstr[sxtype].."("..sxdj.."级) +"..lvshux1[sxdj].."#r"
			kuazhanshu = kuazhanshu+1
		else
			strjk = "#c009933降低目标抗性下限：未学习#r"
		end
	else
		strjk = "#c009933降低目标抗性下限：未学习#r"
	end
	local lv ="#cff66cc扩展属性("..kuazhanshu.."/3)#r"..strxlv..strtype..strjk
	return strlv,lv
end








-------------------------------------------------------------------------------------------------------------------------------
--
-- 清空显示文本
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
	--使用什么作为货币
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
	if(CU_MONEY	== nUnit or CU_TICKET == nUnit or CU_MONEYJZ == nUnit)       then      --钱，官票钱, 交子
		StaticPart_GB_Ctl:Hide()
		StaticPart_Money_Ctl:Show();
		StaticPart_Money_Ctl:SetProperty("MoneyNumber", tostring(nPrice));
		
	elseif(CU_GOODBAD == nUnit) then			--善恶值
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("善恶值:" .. tostring(nPrice) .. " 点")
		
		
	elseif(CU_MORALPOINT == nUnit)  then	--师德点
		
		StaticPart_GB_Ctl:Show()
		SuperTooltip_StaticPart_Money:Hide();
		StaticPart_GB_Ctl:SetText("师德点:" .. tostring(nPrice) .. " 点")
		
	elseif(CU_BIND_YUANBAO == nUnit) then	--绑定元宝
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("#ccc33cc增点返卷:" .. tostring(nPrice))
		
		--StaticPart_GB_Ctl:SetText("#{BDYB_090714_01}" .. tostring(nPrice))
		
	elseif(CU_GIFTTOKEN == nUnit) then	--返券
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("返券：" .. tostring(nPrice))
		
	elseif(CU_YUANBAO == nUnit) then	--元宝
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("元宝：" .. tostring(nPrice))
		
	elseif(CU_ZENGDIAN == nUnit) then	--赠点
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("红利:" .. tostring(nPrice))
		
	elseif(CU_MENPAI_POINT == nUnit) then	--师门贡献度
		
		StaticPart_GB_Ctl:Show()
		StaticPart_Money_Ctl:Hide();
		StaticPart_GB_Ctl:SetText("#ccc33cc增点返卷:" .. tostring(nPrice))
		
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
	local baoshiStr = {"冥晶石.(%d)级","石.(%d)级","祖母绿.(%d)级","紫玉.(%d)级","黄玉.(%d)级","碧玺.(%d)级"}
	local baoshidata
	local posIndex =1
	local djpftable = {1,2,4,7,10,15,20,30,50,100}
	local mjdjpftable = {1,2,3.5,5,7.5,10,15,25,50}
	local Baoshipftotal = 0  ---分
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
function DODPDIEaaaa()--令牌强化数据
local Strongcccc,Strongdddd = string.find(typeDesc, "令牌")
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

	