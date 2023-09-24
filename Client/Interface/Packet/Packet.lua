local nTheTabIndex = 0;
local PACKAGE_BUTTONS_NUM = 30;
local PACKAGE_BUTTONS = {};
local PACKAGE_BUTTON_BACK={};
local PACKAGE_EXTBAG_NUM = 10;
local PACKAGE_EXTBAG = {};
local PACKAGE_TAB = {};
local PACKAGE_TAB_TEXT = {};
local PACKAGE_NUM_PER_LINE = 5;
local Lock_Flag = 0;
local g_MaxLine = 0;
local g_PackageHeight={};
g_PackageHeight["title"] = { 0, 25, };
g_PackageHeight["page"]  = { 25, 20, };
g_PackageHeight["bag"]	 = { 42, 36, };
g_PackageHeight["money"] = { 0, 50,};

-- 背包界面的默认位置
local g_Packet_Frame_UnifiedXPosition;
local g_Packet_Frame_UnifiedYPosition;

local g_NeedTipItem = -1
local g_NeedTipID = -1
local g_NeedTipText = -1
local g_NeedTipMission = -1

function Packet_PreLoad()
	this:RegisterEvent("TOGLE_CONTAINER");
	this:RegisterEvent("PACKAGE_ITEM_CHANGED");
	this:RegisterEvent("UNIT_MONEY");
	this:RegisterEvent("OPEN_EXCHANGE_FRAME");
	this:RegisterEvent("TOGLE_BANK");
	this:RegisterEvent("OPEN_BOOTH");
	this:RegisterEvent("LOCK_WORK_Item");
	this:RegisterEvent("REPLY_MISSION");
	this:RegisterEvent("CLOSE_MISSION_REPLY");
	this:RegisterEvent("OPEN_STALL_SALE");
	this:RegisterEvent("OPEN_ITEM_COFFER");
	this:RegisterEvent("PS_OPEN_MY_SHOP");
	this:RegisterEvent("RESET_EXT_BAG");
	this:RegisterEvent("UPDATE_YUANBAO");
	this:RegisterEvent("UPDATE_BIND_YUANBAO");
	this:RegisterEvent("UPDATE_GIFTTOKEN");
	this:RegisterEvent("UPDATE_ZENGDIAN");
	this:RegisterEvent("CITY_SHOW_SHOP");

	-- 开始整理和结束整理
	this:RegisterEvent("BEGIN_PACKUP_PACKET");
	this:RegisterEvent("END_PACKUP_PACKET");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");

	this:RegisterEvent("OPEN_RECYCLESHOP_BUYER");
	this:RegisterEvent("MONEYJZ_CHANGE");
	this:RegisterEvent("OPEN_WINDOW")

	-- 注册等级
	this:RegisterEvent("UNIT_LEVEL")

	-- 激活界面事件
	this:RegisterEvent("UI_COMMAND")

	this:RegisterEvent("OPEN_UP_ITEM")

	-- 游戏窗口尺寸发生了变化
	this:RegisterEvent("ADJEST_UI_POS")

	-- 游戏分辨率发生了变化
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")

	this:RegisterEvent("YIGUI_OPEN")
	--更新装备
	this:RegisterEvent("REFRESH_EQUIP1");
	this:RegisterEvent("NOTIFY_POP_UITIP");
end

function Packet_OnLoad()
	PACKAGE_BUTTONS =	{	Packet_Space_Line1_Row1_button,
							Packet_Space_Line1_Row2_button,
							Packet_Space_Line1_Row3_button,
							Packet_Space_Line1_Row4_button,
							Packet_Space_Line1_Row5_button,
							Packet_Space_Line2_Row1_button,
							Packet_Space_Line2_Row2_button,
							Packet_Space_Line2_Row3_button,
							Packet_Space_Line2_Row4_button,
							Packet_Space_Line2_Row5_button,
							Packet_Space_Line3_Row1_button,
							Packet_Space_Line3_Row2_button,
							Packet_Space_Line3_Row3_button,
							Packet_Space_Line3_Row4_button,
							Packet_Space_Line3_Row5_button,
							Packet_Space_Line4_Row1_button,
							Packet_Space_Line4_Row2_button,
							Packet_Space_Line4_Row3_button,
							Packet_Space_Line4_Row4_button,
							Packet_Space_Line4_Row5_button,
							Packet_Space_Line5_Row1_button,
							Packet_Space_Line5_Row2_button,
							Packet_Space_Line5_Row3_button,
							Packet_Space_Line5_Row4_button,
							Packet_Space_Line5_Row5_button,
							Packet_Space_Line6_Row1_button,
							Packet_Space_Line6_Row2_button,
							Packet_Space_Line6_Row3_button,
							Packet_Space_Line6_Row4_button,
							Packet_Space_Line6_Row5_button,
							Packet_Space_Line7_Row1_button,
							Packet_Space_Line7_Row2_button,
							Packet_Space_Line7_Row3_button,
							Packet_Space_Line7_Row4_button,
							Packet_Space_Line7_Row5_button,
							Packet_Space_Line8_Row1_button,
							Packet_Space_Line8_Row2_button,
							Packet_Space_Line8_Row3_button,
							Packet_Space_Line8_Row4_button,
							Packet_Space_Line8_Row5_button,
							Packet_Space_Line9_Row1_button,
							Packet_Space_Line9_Row2_button,
							Packet_Space_Line9_Row3_button,
							Packet_Space_Line9_Row4_button,
							Packet_Space_Line9_Row5_button,
							Packet_Space_Line10_Row1_button,
							Packet_Space_Line10_Row2_button,
							Packet_Space_Line10_Row3_button,
							Packet_Space_Line10_Row4_button,
							Packet_Space_Line10_Row5_button,
							Packet_Space_Line11_Row1_button,
							Packet_Space_Line11_Row2_button,
							Packet_Space_Line11_Row3_button,
							Packet_Space_Line11_Row4_button,
							Packet_Space_Line11_Row5_button,
							Packet_Space_Line12_Row1_button,
							Packet_Space_Line12_Row2_button,
							Packet_Space_Line12_Row3_button,
							Packet_Space_Line12_Row4_button,
							Packet_Space_Line12_Row5_button,
							};

	PACKAGE_EXTBAG  = {
						Packet_Space_Line1;
						Packet_Space_Line2;
						Packet_Space_Line3;
						Packet_Space_Line4;
						Packet_Space_Line5;
						Packet_Space_Line6;
						Packet_Space_Line7;
						Packet_Space_Line8;
						Packet_Space_Line9;
						Packet_Space_Line10;
						Packet_Space_Line11;
						Packet_Space_Line12;
						}

	PACKAGE_TAB_TEXT = {
		[0] = "道具",
		"材料",
		"任务",
	};

	PACKAGE_TAB = {
		[0] = Packet_Material,
		[1] = Packet_Stall,
		[2] = Packet_Mission,
		};

	Packet_Pet:Enable();

	--Packet_Lock:Disable();

	-- 保存背包界面的默认相对位置
	g_Packet_Frame_UnifiedXPosition	= Packet_Frame:GetProperty("UnifiedXPosition");
	g_Packet_Frame_UnifiedYPosition	= Packet_Frame:GetProperty("UnifiedYPosition");

end

function Packet_Open()
	Packet_ResetExtBag();
	this:Show();
	--NotifyPacketStatus(1)
end

function Packet_Close()
	nTheTabIndex = 0;
	PACKAGE_TAB[nTheTabIndex]:SetCheck(1);

	--关闭界面时，向Server请求背包同步
	--AskMyBagList函数本身有计时控制
	DataPool:AskMyBagList();
	--NotifyPacketStatus(0)

end

function Packet_OnMoved()
	
end

function Packet_OnEvent( event )
	if ( event == "TOGLE_CONTAINER" ) then
		if( this:IsVisible() ) then
	        this:Hide()
		else
			Packet_Open();
		end
	elseif ( event == "PS_OPEN_MY_SHOP" )  then
		Packet_Open();
	elseif (event == "UNIT_MONEY" and this:IsVisible()) then
		Packet_Money:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
	elseif ( event == "PACKAGE_ITEM_CHANGED" and this:IsVisible()) then
		Packet_ChangeTabIndex(nTheTabIndex);
	elseif ( event == "OPEN_EXCHANGE_FRAME" ) then
		Packet_Open();
	elseif ( event == "TOGLE_BANK" ) then
		Packet_Open();
	elseif ( event == "OPEN_BOOTH" ) then
		Packet_Open();
	elseif ( event == "OPEN_WINDOW" ) then
		if( arg0 == "Packet") then
			Packet_Open();
		end
	--锁定正在操作的背包中的物品
	elseif ( event == "LOCK_PACKET_ITEM" ) then

	elseif ( event == "REPLY_MISSION" ) then
		Packet_Open();
	elseif ( event == "CLOSE_MISSION_REPLY" ) then
			this:Hide()
	elseif ( event == "OPEN_ITEM_COFFER" ) then

	elseif ( event == "OPEN_STALL_SALE" )  then
		Packet_Open();
	elseif ( event == "CITY_SHOW_SHOP" and arg0 == "open") then
		Packet_Open();
	elseif ( event == "RESET_EXT_BAG" ) then
		Packet_ResetExtBag();
	elseif (event == "UPDATE_YUANBAO" and this:IsVisible()) then
		Packet_YuanBao2:SetText("元宝:"..tostring(Player:GetData("YUANBAO")));
	elseif (event == "UPDATE_ZENGDIAN" and this:IsVisible()) then
		--Packet_BangdingYuanbao:SetText("#{BDYB_090714_01}".."-1");
		Packet_Tongbao:SetText("#G红利:"..Player:GetData("ZENGDIAN"));
	elseif (event == "UPDATE_MENPAIPOINT" and this:IsVisible()) then
		Packet_Fanquan:SetText("#G返卷:"..tostring(Player:GetData("MENPAIPOINT")));
		
	elseif (event == "MONEYJZ_CHANGE" and this:IsVisible()) then
		Packet_Jiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		
	elseif (event == "UPDATE_BIND_YUANBAO" and this:IsVisible()) then
		Packet_YuanBao:SetText("赠点:".."0");
		Packet_Fanquan:SetText("#G返卷:"..tostring(Player:GetData("MENPAIPOINT")));

	--锁定“整理按钮”
	elseif ( event == "BEGIN_PACKUP_PACKET" )   then
		Packet_Classify:Disable()

	--打开“整理按钮”
	elseif ( event == "END_PACKUP_PACKET" )	    then
		Packet_Classify:Enable()

	elseif(event == "PLAYER_LEAVE_WORLD" and this:IsVisible()) then
			this:Hide()

	elseif(event == "OPEN_RECYCLESHOP_BUYER") then
		Packet_Open();

  -- 宝石镶嵌
  elseif ( event == "UI_COMMAND" and tonumber(arg0)== 19830424 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()
  	-- 宝石乾坤移
  elseif ( event == "UI_COMMAND" and tonumber(arg0)== 20110509 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 装备极限镶嵌
  elseif ( event == "UI_COMMAND" and tonumber(arg0)== 751107 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 装备打孔
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 25 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 装备极限打孔
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 75117 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 宝石摘除
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 27 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 宝石极限摘除
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 25702 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 宝石雕琢
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 112236 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 宝石熔炼
  elseif ( event == "UI_COMMAND" and tonumber(arg0) == 112237 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 宝石合成
  elseif ( event == "UI_COMMAND" and tonumber( arg0 ) == 23 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 材料合成
  elseif ( event == "UI_COMMAND" and tonumber( arg0 ) == 19810424 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  -- 寒玉合成
  elseif ( event == "UI_COMMAND" and tonumber( arg0 ) == 86021935 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

	-- 时装打孔
	elseif ( event == "UI_COMMAND" and tonumber(arg0) == 20091027 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

  --时装镶嵌
	elseif ( event == "UI_COMMAND" and tonumber(arg0) == 20091029 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

	--配饰合成
	elseif ( event == "UI_COMMAND" and tonumber(arg0) == 19860143 ) then
  	nTheTabIndex = 1
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

	--配饰摘除
	elseif( event == "UI_COMMAND" and tonumber(arg0) == 19851274 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()


	elseif( event == "UI_COMMAND" and tonumber(arg0) == 8905178 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()
	
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 201210120) then
	nTheTabIndex = 0
	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
	Packet_Open()

	-- 上古神器器灵
        elseif ( event == "UI_COMMAND" and tonumber(arg0)== 89247100 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()

	--门派进阶只打开背包
	
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 111011) then
		nTheTabIndex = 0
		PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
		Packet_Open()

	elseif( event == "UI_COMMAND" and tonumber(arg0) == 5020231 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()
	elseif( event == "UI_COMMAND" and tonumber(arg0) == 5020232 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 20200428 ) then
  	nTheTabIndex = 0
  	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
  	Packet_Open()
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 20200431 ) then
	nTheTabIndex = 0
	PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
	Packet_Open()
 	elseif (event == "OPEN_UP_ITEM" ) then
		if this:IsVisible()  then
			return
		end
		nTheTabIndex = 0
		PACKAGE_TAB[nTheTabIndex]:SetCheck(1)
		Packet_Open()

	-- 游戏窗口尺寸发生了变化
	elseif (event == "ADJEST_UI_POS" ) then
		-- 更新背包界面位置
		Packet_Frame_On_ResetPos()

	-- 游戏分辨率发生了变化
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		-- 更新背包界面位置
		Packet_Frame_On_ResetPos()

	elseif ( event == "YIGUI_OPEN" ) then
		Packet_Open();

	elseif( event == "REFRESH_EQUIP1") then
		Packet_RefreshEquip();
    elseif event == "NOTIFY_POP_UITIP" then
        if "Packet" == arg0 then
            g_NeedTipText = tonumber(arg1)
            g_NeedTipItem = tonumber(arg2)
            g_NeedTipMission = tonumber(arg3)
        end
	end
end

function Packet_ResetExtBag()
	Packet_OnUpdateShow();
	Packet_UpdateDragAcceptName();
end

function Packet_OnShow()
	Packet_ChangeTabIndex(nTheTabIndex);
end

function Packet_ChangeTabIndex(nTabIndex)
	if( nTabIndex < 0 or nTabIndex >=3) then
		return;
	end
	nTheTabIndex = nTabIndex;
	Packet_OnUpdateShow();
	Packet_UpdateDragAcceptName();
end

function Packet_ChangeTabIndex1(nTabIndex)
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "XieziQuickly" ); 	-- 公测大礼包
		Set_XSCRIPT_ScriptID( 70051 );				-- 脚本编号
		Set_XSCRIPT_Parameter( 0, tonumber( 7514 ) );		-- 参数一
		Set_XSCRIPT_ParamCount( 1 );				-- 参数个数
	Send_XSCRIPT()
end

function Packet_UpdateBagLine( nMaxLine )

	g_MaxLine = nMaxLine;
	local i
	for i = 1, 10 do
		if( i <= g_MaxLine ) then
			PACKAGE_EXTBAG[ i ]:Show();
		else
			PACKAGE_EXTBAG[ i ]:Hide();
		end
	end
	local nWindowHeight;
	nWindowHeight = g_MaxLine * 35 + 278 + 24;
	Packet_Frame:SetProperty( "AbsoluteHeight",nWindowHeight );

end

function Packet_OnUpdateShow()
	local i=1;
	local szPacketName = "";
	local CurrNum = 20;
	local BaseNum = 20;
	local MaxNum = 30;
	Lock_Flag = 0;

	if(nTheTabIndex == 0) then
		szPacketName = "base";
		CurrNum = DataPool:GetBaseBag_Num();
		BaseNum = DataPool:GetBaseBag_BaseNum();
		MaxNum = DataPool:GetBaseBag_MaxNum();
	elseif(nTheTabIndex == 1) then
		szPacketName = "material";
		CurrNum = DataPool:GetMatBag_Num();
		BaseNum = DataPool:GetMatBag_BaseNum();
		MaxNum = DataPool:GetMatBag_MaxNum();
	elseif(nTheTabIndex == 2) then
		szPacketName = "quest";
		CurrNum = DataPool:GetTaskBag_Num();
		BaseNum = DataPool:GetTaskBag_BaseNum();
		MaxNum = DataPool:GetTaskBag_MaxNum();
	else
		return;
	end

	local nMaxLine = math.floor( CurrNum / PACKAGE_NUM_PER_LINE );
	--如果是整除了
	if( nMaxLine * PACKAGE_NUM_PER_LINE == CurrNum ) then
	else
		nMaxLine = nMaxLine + 1;
	end
	AxTrace( 8,0,"已经有的包格数"..tostring( CurrNum ).."  需要显示的行数"..tostring( nMaxLine ) );
	--如果超过当前显示的最大范围了，就更新包的行数
	Packet_UpdateBagLine( nMaxLine );
	local nMaxDisplayNumber = nMaxLine * PACKAGE_NUM_PER_LINE;
	for i=1, nMaxDisplayNumber do
		--如果是需要显示的
		if( i <= CurrNum ) then
			local theAction,bLocked = PlayerPackage:EnumItem(szPacketName, i-1);
			PACKAGE_BUTTONS[ i ]:Show();
			if theAction:GetID() ~= 0 then
				PACKAGE_BUTTONS[i]:SetActionItem(theAction:GetID());
			else
				PACKAGE_BUTTONS[i]:SetActionItem(-1);
			end
			if bLocked == 1 then
				PACKAGE_BUTTONS[i]:Disable();
				Lock_Flag = 1
			else
				PACKAGE_BUTTONS[i]:Enable();
			end

		else  --这些是需要隐藏的
			PACKAGE_BUTTONS[ i ]:SetActionItem( -1 );
			PACKAGE_BUTTONS[ i ]:Hide();
		end
	end

	if Lock_Flag == 0 then
		Packet_Classify : Enable();
	else
		Packet_Classify : Disable();
	end

	Packet_Money:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
	--YuanBao
	Packet_YuanBao2:SetText("元宝:"..tostring(Player:GetData("YUANBAO")));
	--BindYuanBao
	Packet_BangdingYuanbao:SetText("#{BDYB_090714_01}"..0);
	--返券
        local myfanquan = 0
        local FQCK = DataPool:GetPlayerMission_DataRound(18)
        if FQCK > 1000000000 then
           myfanquan = math.mod(FQCK,1000000000)
        end
	Packet_Fanquan:SetText("#G返卷:"..tostring(myfanquan));
	--ZengDian
	Packet_YuanBao:SetText("赠点:".."0");
        --礼金
	Packet_Tongbao:SetText("#G红利:"..tostring(Player:GetData("ZENGDIAN")));
	--Money_JZ
	Packet_Jiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));

    if g_NeedTipItem > 0 and g_NeedTipID > 0 then  --弹出新手引导ui
        g_NeedTipItem = -1 --确保只提示一次
        Packet_FreshManGuide(1, g_NeedTipText, 1)
        PACKAGE_BUTTONS[g_NeedTipID]:SetProperty("FlashAnimate", "BtnlightupAni")
        PACKAGE_BUTTONS[g_NeedTipID]:SetNewFlash()
    end
end

function Packet_UpdateDragAcceptName()

	local nStartAcceptIndex = 0;

	if(nTheTabIndex == 0) then
		nStartAcceptIndex = 1;
	elseif(nTheTabIndex == 1) then
		nStartAcceptIndex = DataPool:GetBaseBag_MaxNum()+1;
	elseif(nTheTabIndex == 2) then
		nStartAcceptIndex = DataPool:GetBaseBag_MaxNum()+DataPool:GetMatBag_MaxNum()+1;
	else
		return;
	end

	local i=1;
	while i<=PACKAGE_BUTTONS_NUM do
		PACKAGE_BUTTONS[i]:SetProperty("DragAcceptName", "P"..tostring(nStartAcceptIndex));

		nStartAcceptIndex = nStartAcceptIndex+1;
		i = i+1;
	end

end

function Packet_ItemBtnClicked( nLine, nRow )--右键
local nIndex = ( nLine - 1 ) * PACKAGE_NUM_PER_LINE + nRow;
	if(nIndex < 1 or nIndex > PACKAGE_BUTTONS_NUM) then
		return;
	end
	
	local nIndex2 = nIndex
	if(nTheTabIndex == 1) then
        nIndex2 = nIndex2 + 30
	elseif(nTheTabIndex == 2) then
	nIndex2 = nIndex2 + 60
	end
		
	if (IsWindowShow("LongwenLevelUp") or IsWindowShow("LongwenPropertyReset") or IsWindowShow("OnDressPaint") or IsWindowShow("LongwenExtraPropertyStudy2") or IsWindowShow("EquipBaoJian_Transfer")
           or IsWindowShow("LongwenExtraPropertyUp") or IsWindowShow("SuperWeaponChange") or IsWindowShow("SuperWeaponJJ") or IsWindowShow("SuperWeaponQH")
           or IsWindowShow("AnqiCuidu")or IsWindowShow("AnqiJinjie")or IsWindowShow("AnqiLianDu") or IsWindowShow("SuperWeaponTL")  or IsWindowShow("SuperWeaponUp")
           or IsWindowShow("SuperWeaponSoulless")   or IsWindowShow("PetHuanhua")   or IsWindowShow("WuhunExtraPropertyDel")   or IsWindowShow("WuhunExtraPropertyUp")
           or IsWindowShow("WuhunMagicUp")   or IsWindowShow("WuhunRH")   or IsWindowShow("WuhunSkillStudy")   or IsWindowShow("ZhenYuan") or IsWindowShow("WuhunMagicUp_p")
           or IsWindowShow("Dress_Stiletto") or IsWindowShow("Dress_Enchase") or IsWindowShow("Dress_SplitGem") or IsWindowShow("Dress_Materalcompose")
           or IsWindowShow("WuhunSkillUp")  or IsWindowShow("EquipEducation_Temper") or IsWindowShow("EquipEducation_Decompose") or IsWindowShow("EquipEducation_Transfer")
           or IsWindowShow("EquipEducation_Update")  or IsWindowShow("EquipNewStrengthen")or IsWindowShow("AnqiCuidu")or IsWindowShow("AnqiJinjie")or IsWindowShow("AnqiLianDu")
           or IsWindowShow("DressPaint")or IsWindowShow("EquipEducation_ShengLing")or IsWindowShow("EquipEducation_JinJie")or IsWindowShow("GemcomupDate")
           or IsWindowShow("Zhen_chonglou")or IsWindowShow("DecorateWeapon")or IsWindowShow("YbMarketUpItem")or IsWindowShow("PetEquipSuitUp")or IsWindowShow("PetEquipSuitDepart")
           or IsWindowShow("CardCompose")or IsWindowShow("CardStrengthen")or IsWindowShow("GemChange")or IsWindowShow("SelectCharHeadFrame")or IsWindowShow("SuperWeapon9_DIYSkill2")
           or IsWindowShow("SuperWeaponUp2")or IsWindowShow("Packet_Temporary")or IsWindowShow("maozirateWeapon")or IsWindowShow("SuperWeapon9_ShengJie")or IsWindowShow("Gemfenli")or IsWindowShow("Ronglu")or IsWindowShow("ZiNvDressPaint")or IsWindowShow("haizinvsheng")or IsWindowShow("Miyu_zhizuo")) then
		PushEvent("UI_COMMAND",201107281,tonumber(nIndex2-1))

       elseif ( IsWindowShow("Gemzhuoke")) then
	   PushEvent("UI_COMMAND",201107281,tonumber(nIndex+29))
       elseif IsWindowShow("Decoratemaozi") then
	   PushEvent("UI_COMMAND",201107281,tonumber(nIndex-1))
       elseif (IsWindowShow("EquipLingPai_ShengJie") or IsWindowShow("EquipLingPai_OperatingSJ")or IsWindowShow("EquipLingPai_OperatingXQ")
	          or IsWindowShow("EquipLingPai_Star") or IsWindowShow("EquipLingPai_Update") 
              or IsWindowShow("EquipLingPai_SkillQH")or IsWindowShow("EquipLingPai_OperatingJS")or IsWindowShow("EquipLingPai_OperatingZC")or IsWindowShow("DWRonghe")) then
                  PushEvent("UI_COMMAND",201401111,tonumber(nIndex2-1))

       elseif (IsWindowShow("DWHecheng") or IsWindowShow("DWQianghua") or IsWindowShow("DWShike") or IsWindowShow("DWChaichu") or IsWindowShow("StilettoEx") or IsWindowShow("EnchaseEx")or IsWindowShow("SplitGemEx")) then
		PushEvent("UI_COMMAND",201401111,tonumber(nIndex2-1))
		elseif (IsWindowShow("ItemExchange")) then
		PushEvent("UI_COMMAND",20200103,tonumber(nIndex2-1))
		elseif (IsWindowShow("FourSlot")) then
		PushEvent("UI_COMMAND",20200104,tonumber(nIndex2-1))
       else
		PACKAGE_BUTTONS[nIndex]:DoAction()
       end	


	--一旦点击,清除引导ui
	if nIndex == g_NeedTipID then
    	g_NeedTipID = -1
        if 210256 == g_NeedTipMission then --如是右击装备"第一件防具"的奖励装备
            NotifyPopUITip("MainMenuBar", 7, 2)  --通知主动作条：弹出ui引导
        end
    end
	
	
	if(nTheTabIndex == 0) then
	   local theAction = EnumAction(nIndex-1, "packageitem")
	   if theAction:GetID() ~= 0 then 
	   if  tonumber(theAction:GetDefineID())== 30008121 then 
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("Ce_DifuCs");
			Set_XSCRIPT_ScriptID(330060);
			Set_XSCRIPT_Parameter(0,nIndex)
			Set_XSCRIPT_Parameter(1, 2)
			Set_XSCRIPT_ParamCount(2)
		Send_XSCRIPT();
		
       return
	    end
       end
       else
       PACKAGE_BUTTONS[nIndex]:DoAction()	   
    end
end

function Packet_ItemBtnSubClicked( nLine,nRow )--左键
	local nIndex = ( nLine - 1 ) * PACKAGE_NUM_PER_LINE + nRow;
	if(nIndex < 1 or nIndex > PACKAGE_BUTTONS_NUM) then
		return;
	end
	PACKAGE_BUTTONS[nIndex]:DoSubAction()

		--一旦点击,清除引导ui
	if nIndex == g_NeedTipID then
	    	g_NeedTipID = -1
    	end
	if(nTheTabIndex == 0) then
		szPacketName = "base";
	elseif(nTheTabIndex == 1) then
		szPacketName = "material";
	elseif(nTheTabIndex == 2) then
		szPacketName = "quest";
	end
end

local g_slwowodosw = 10000000+141000+30
local g_isedkoid = 10100000 + 40 + 40000 + 1000
function Packet_RefreshEquip()
        local ProductAction2 = GemMelting:UpdateProductAction(tonumber(10141030))
        Packet_Equip_Bag:SetActionItem(ProductAction2:GetID()) 	
        local ProductAction6 = GemMelting:UpdateProductAction(tonumber(10141040))
        Packet_Equip_Box:SetActionItem(ProductAction6:GetID()) 		
end
--===============================================
-- 启动摆摊界面(在摆摊前会先确认摊位费)
--===============================================
function Packet_Sale_Clicked()
	PlayerPackage:OpenStallSaleFrame();
end

function Packet_PackUp_Clicked()
	PlayerPackage:PackUpPacket(nTheTabIndex);
end


--===============================================
-- 点击锁定
--===============================================
function Packet_Lock_Open()
	PlayerPackage:OpenLockFrame(nTheTabIndex);
end

function OpenDlgForSetProtectTime()
	OpenFangdao();
end

--================================================
-- 恢复背包界面的默认相对位置
--================================================
function Packet_Frame_On_ResetPos()

	Packet_Frame:SetProperty("UnifiedXPosition", g_Packet_Frame_UnifiedXPosition);
	Packet_Frame:SetProperty("UnifiedYPosition", g_Packet_Frame_UnifiedYPosition);

end

--!!!reloadscript =Packet
function Packet_FreshManGuide(nType, nTextID, nPosID)
    if nType ~= 1 and      --1 is reset and open
        nType ~= 2 then    --2 is modify
        return
    end
    if 0 ~= nTheTabIndex then
        return  --不是道具栏,不管
    end
    if g_NeedTipID < 1 then
        return
    end
    if Player:GetData("LEVEL") > 10 then
        return
    end
    local nTipPosX = 0
    local nTipPosY = 0
    if 1 == nPosID then
        local nLine = math.floor(g_NeedTipID / 5)
        if nLine == math.ceil(g_NeedTipID / 5) then
            nLine = nLine - 1
        end
        local nRow  = g_NeedTipID - nLine * 5
        nTipPosX = Packet_Frame:GetProperty("AbsoluteXPosition") + Packet_MainFrame:GetProperty("AbsoluteXPosition") +
            Packet_BackFrame:GetProperty("AbsoluteXPosition") + Packet_Space_Frame:GetProperty("AbsoluteXPosition") +
            PACKAGE_BUTTONS[1]:GetProperty("AbsoluteWidth") * (nRow - 0.5)
        nTipPosY = Packet_Frame:GetProperty("AbsoluteYPosition") + Packet_MainFrame:GetProperty("AbsoluteYPosition") +
            Packet_BackFrame:GetProperty("AbsoluteYPosition") + Packet_Space_Frame:GetProperty("AbsoluteYPosition") +
            PACKAGE_EXTBAG[1]:GetProperty("AbsoluteHeight") * (nLine + 1)
    else
        return               --unkown position
    end
    OpenFreshManGuide(nType, nTextID, nTipPosX, nTipPosY, "Packet", nPosID, "southwest")
end
function OpenSafeCenter()
	if(IsWindowShow("Packet_Temporary")) then
		CloseWindow("Packet_Temporary", true);
		-- Packet_SetPacketTempory_BtnState(0)
	else
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("OpenPacketTemp");
			Set_XSCRIPT_ScriptID(760574);
			Set_XSCRIPT_Parameter(0, 0)
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT();
		-- PushDebugMessage("调用")
		-- Packet_SetPacketTempory_BtnState(1)
	end
end
