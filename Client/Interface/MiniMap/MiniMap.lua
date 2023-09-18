local g_CurMap = "Minimap";
local TimeDot = {}
local strNetDelayMessage = nil
local g_bNewMailTip=0
local bIsMailHaveAppend=0
local g_myAsk = 0;
local g_diaochaAsk = 0;
--OnLoad
--  0 Animy
--  1 ExpNPC
--  2 Teamate
--  3 OtherPlayer
--  4 ExpObj
function MiniMap_PreLoad()

	this:RegisterEvent("SCENE_TRANSED");
	this:RegisterEvent("UPDATE_MAP");
	this:RegisterEvent("OPEN_MINIMAP" );
	this:RegisterEvent("ACCELERATE_KEYSEND");
	this:RegisterEvent("UPDATE_NETSTATUS");
	this:RegisterEvent("PKMODE_CHANGE");
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("SHOW_NEEDREPAIR")
	this:RegisterEvent("LEFTPROTECTTIME_CHANGE")

	this:RegisterEvent("OPEN_MINIMAPEXP");

	this:RegisterEvent("FLAH_MINIMAP");

	this:RegisterEvent("STOP_FLAH_MINIMAP");

	--add by fangyuan
		this:RegisterEvent("SHOW_ACCOUNT_SAFE_ICON");

	this:RegisterEvent("SHOW_SHIMINGRENZHENG_ANIMATA");

	this:RegisterEvent("MINIMAP_SHOW_SHIMINGRENZHENG_BTN");

	this:RegisterEvent("PLAYERASK_INGAME");

	this:RegisterEvent("MINMAP_PLAYERLIST_SHOW");

	this:RegisterEvent("UPDATE_SKY_TIME");

	this:RegisterEvent("SHOW_BUGFBBTN");
		
	this:RegisterEvent("TODAY_ACTIVE_POINT");

	this:RegisterEvent("MAILNEW_TIPS")
	
	this:RegisterEvent("HIDE_TLBB_MAIN")
	this:RegisterEvent("OPEN_MINMAP")
end

function MiniMap_PK_Mode_Show_Menu_Func()

	 Player:PVP_ShowMenu();
end;

function MiniMap_OnLoad()
	TimeDot[1] = MiniMap_TimeDot1
	TimeDot[2] = MiniMap_TimeDot2
	TimeDot[3] = MiniMap_TimeDot3
	TimeDot[4] = MiniMap_TimeDot4
	TimeDot[5] = MiniMap_TimeDot5
	TimeDot[6] = MiniMap_TimeDot6
	TimeDot[7] = MiniMap_TimeDot7
	TimeDot[8] = MiniMap_TimeDot8
	TimeDot[9] = MiniMap_TimeDot9
	TimeDot[10] = MiniMap_TimeDot10
	TimeDot[11] = MiniMap_TimeDot11
	TimeDot[12] = MiniMap_TimeDot12
	MiniMap_EquipEndurance:Hide();
	AxTrace(12,12,"MiniMap_OnLoad is called begin");
	MiniMap_AccountSafeBack:Hide();
        --MiniMap_Xinfu:Hide();
        MiniMap_Shouchong:Hide();
	Minimap_Max();
	MiniMap_Yuanbao:SetToolTip("元宝商店");
	MiniMap_AutoSearch:SetToolTip("#{INTERFACE_XML_983}");
	MiniMap_NetStatus_Flash:Play( false );
	
	MiniMap_Fangchengmi_Btn	: Hide()
	MiniMap_Fangchengmi_Flash : Hide();
		
	-- 邮件提示
	MiniMap_Mail:Hide()
	MiniMap_MailAnimate:Play( false )
end

function MiniMap_UpdateSceneName()
	local scenename;
	scenename = GetCurrentSceneName();
	local len = string.len(scenename);
	if( len < 10 ) then
		MiniMap_Placename:SetProperty( "Font", "YouYuan9.75" );
	else
		MiniMap_Placename:SetProperty( "Font", "SongTiBmp12" );
	end
	MiniMap_Placename:SetText("#gFF0FA0".. scenename );
end

function MiniMap_OnEvent(event)
	if ( event == "UI_COMMAND" and tonumber(arg0) == 1238 ) then
			local sceneId = Get_XParam_INT(0)
			return
	end
	if ( event == "UI_COMMAND" and tonumber(arg0) == 20110524 ) then
			MiniMap_OnShown()
			return
	end
	if ( event == "SCENE_TRANSED" ) then
		MiniMap_Update( arg0 );
		MiniMap_UpdateSceneName();
		UpdateMinimapState();

	elseif ( event == "UPDATE_MAP" ) then
		if( tonumber( arg0 ) == 1 ) then
			MiniMap_UpdateSceneName();
		end
		MiniMap_PosModify();
		Minimap_CoordinateUpdate();
	elseif( event == "OPEN_MINIMAP" ) then
		Variable:SetVariable( "MinimapState","mini", 1 );
		UpdateMinimapState();
	elseif( event == "ACCELERATE_KEYSEND" ) then
		MiniMap_HandleAccKey(arg0);
	elseif( event =="UPDATE_NETSTATUS") then
	  local strNetState = ""
	  local strOnlineTime = ""
		if tonumber(arg0) < 500 then
			MiniMap_MiniMap_NetStatus : SetProperty("SetCurrentImage","NetState1")
			strNetState = "点击可查看今日活动列表#r网络状况:空闲".."("..tostring(arg0).."ms)"
		elseif tonumber(arg0) < 1000 then
			MiniMap_MiniMap_NetStatus : SetProperty("SetCurrentImage","NetState2")
			strNetState = "点击可查看今日活动列表#r网络状况:正常".."("..tostring(arg0).."ms)"
		elseif tonumber(arg0) < 2000 then
			MiniMap_MiniMap_NetStatus : SetProperty("SetCurrentImage","NetState3")
			strNetState = "点击可查看今日活动列表#r网络状况:拥挤".."("..tostring(arg0).."ms)"
		elseif tonumber(arg0) < 3000 then
		    MiniMap_MiniMap_NetStatus : SetProperty("SetCurrentImage","NetState4")
			strNetState = "点击可查看今日活动列表#r网络状况:堵塞".."("..tostring(arg0).."ms)"
		else
			MiniMap_MiniMap_NetStatus : SetProperty("SetCurrentImage","NetState4")
			strNetState = "点击可查看今日活动列表#r网络状况:堵塞(超过3000ms)"
		end

		local nFatigueState = tonumber( arg1 )
		local IsNeedFatigue = tonumber( arg2 );
		local OnlineTime = tonumber( arg3 )
		local strOnlineState = "(健康)"

		if( IsNeedFatigue == 1 ) then --如果需要计算防沉迷
			if( nFatigueState == 1 ) then
				strOnlineState = "(疲劳)"
			elseif( nFatigueState == 2 ) then
				strOnlineState = "(不健康)"
			end
			strOnlineTime = "#r累计在线时间:"..tostring( OnlineTime ).."小时"..strOnlineState
		else
			strOnlineState = "";
		end

		strNetDelayMessage = strNetState .. strOnlineTime
		MiniMap_MiniMap_NetStatus : SetToolTip( strNetDelayMessage )
	elseif( event =="SHOW_NEEDREPAIR") then
		if tonumber(arg0) == 1 then
			MiniMap_EquipEndurance:Show();
			MiniMap_EquipEndurance:SetToolTip("#{ZBXL_081009_01}");
		else
			MiniMap_EquipEndurance:Hide();
		end;

	elseif( event == "PKMODE_CHANGE" ) then
		Minimap_UpdatePKMode();
	elseif(event == "LEFTPROTECTTIME_CHANGE")then
		--被盗判定和永久安全时间
		local DT = math.floor( tonumber(arg0)/1000);
		MiniMap_SafeTime_Frame:SetText("#{INTERFACE_XML_MINI_02}");
		if(DT>0)then
			MiniMap_SafeTime_Frame:Show();
			MiniMap_SafeTimeAnimate:Show();
			MiniMap_SafeTime_StopWatch:SetProperty("Timer",tostring(DT));
		else
			MiniMap_SafeTime_Frame:Hide();
			MiniMap_SafeTimeAnimate:Hide();
			CloseFangDaohao();--关闭疑似被盗提示窗口
		end
	elseif( event == "OPEN_MINIMAPEXP" ) then
		MiniMap_UpdateLockFlag();
	elseif( event == "FLAH_MINIMAP" ) then
		MiniMap_FlashHuodong();
	elseif( event == "STOP_FLAH_MINIMAP" ) then
		MiniMap_StopFlashHuodong();
	elseif( event == "SHOW_ACCOUNT_SAFE_ICON") then
		MiniMap_AccountSafeBack:Show();
		--MiniMap_AccountSafe:SetProperty( "SetCurrentImage","red" );
		--MiniMap_AccountSafeState:SetProperty( "SetCurrentImage","SafeIcon" );
		SetTimer("MiniMap","MiniMap_TimerProc()",60000);		--设置定时器一分钟后关闭窗口
		--MiniMap_AccountSafeFlash : Show();		--确保会闪烁
	elseif event == "UPDATE_SKY_TIME" then
		local skyTime = tonumber(arg0)
		local skyHour = math.floor(skyTime / 3600)
		local skyMinute = math.floor(math.mod(skyTime, 3600) / 60)
		local skySecond = math.mod(skyTime, 60)
		local skyTimeString = "当前时间: "
		if skyHour < 10 then
			skyTimeString = skyTimeString .. "0"
		end
		skyTimeString = skyTimeString .. tostring(skyHour) .. ":"
		if skyMinute < 10 then
			skyTimeString = skyTimeString .. "0"
		end
		skyTimeString = skyTimeString .. tostring(skyMinute) .. ":"
		if skySecond < 10 then
			skyTimeString = skyTimeString .. "0"
		end
		skyTimeString = skyTimeString .. tostring(skySecond)
		if strNetDelayMessage ~= nil then
			MiniMap_MiniMap_NetStatus:SetToolTip(strNetDelayMessage .. "#r" .. skyTimeString)
		else
			MiniMap_MiniMap_NetStatus:SetToolTip(skyTimeString)
		end
	end

	if( event == "SHOW_SHIMINGRENZHENG_ANIMATA" ) then
		if((not this:IsVisible())) then
			return;
		end

		if(tonumber(arg0) == 1)then
		  if(Variable:GetVariable("System_CodePage") ~= "1258") then
				MiniMap_Fangchengmi_Flash : Show();
				MiniMap_Fangchengmi_Btn :SetToolTip("#{FCMX_90609_2}");
			end
			MiniMap_Fangchengmi_Flash1 : Hide()
			MiniMap_Fangchengmi_Flash1 :SetProperty( "AlwaysOnTop","False" );
			MiniMap_Fangchengmi_Flash : SetProperty( "AlwaysOnTop","True" );
		elseif(tonumber(arg0) == 2)then
		  if(Variable:GetVariable("System_CodePage") ~= "1258") then
				MiniMap_Fangchengmi_Flash1 : Show();
				MiniMap_Fangchengmi_Btn :SetToolTip("#{FCMX_90609_3}");
			end
			MiniMap_Fangchengmi_Flash : Hide();
			MiniMap_Fangchengmi_Flash :SetProperty( "AlwaysOnTop","False" );
			MiniMap_Fangchengmi_Flash1 : SetProperty( "AlwaysOnTop","True" );
		else
			MiniMap_Fangchengmi_Btn :SetToolTip("#{FCMX_90609_1}");
			MiniMap_Fangchengmi_Flash1 : Hide();
			MiniMap_Fangchengmi_Flash : Hide();
		end
	end
	if( event == "MINIMAP_SHOW_SHIMINGRENZHENG_BTN" ) then
		if(not this:IsVisible() ) then
			return;
		end
		if(tonumber(arg0) == 1)then
		  if(Variable:GetVariable("System_CodePage") ~= "1258") then
				MiniMap_Fangchengmi_Btn : Show();
			end
		else
			MiniMap_Fangchengmi_Btn : Hide();
		end
	end

	if (event == "PLAYERASK_INGAME" )  then
		--MiniMap_SuperHelp2:Hide();
		MiniMap_PlayerAsk_Bn:Show();
		MiniMap_PlayerAsk:Show();
		g_myAsk = tonumber(arg0)
	end

	if (event == "MINMAP_PLAYERLIST_SHOW") then
		MiniMap_LiebiaoFunc();
	end

	if (event == "SHOW_BUGFBBTN") then
		if(tonumber(arg0) == 1) then
			MiniMap_BugUpdate:Show();
		elseif(tonumber(arg0) == 0) then
			MiniMap_BugUpdate:Hide();
		end
	end
	
	if (event == "TODAY_ACTIVE_POINT") then
		--MiniMap_Huoyuehaoli_Ani:Play( true )
	end
	
	if (event == "MAILNEW_TIPS" and tonumber(arg0) == 0) then --附件邮箱提示
		g_bNewMailTip = tonumber(arg1)
		if g_bNewMailTip == 0 then
			MiniMap_Mail:Hide()
			MiniMap_MailAnimate:Play( false )
		else
			MiniMap_Mail:Show()
			MiniMap_MailAnimate:Play( true )
		end
	end
	if(event == "MAILNEW_TIPS" and tonumber(arg0) == 1) then
		MiniMap_MailAnimate:Play( false )
	end
	
	if ( event == "HIDE_TLBB_MAIN" ) then
		this:Hide()
	end
	if ( event == "OPEN_MINMAP" ) then
		this:Show()
	end

end
function MiniMap_OnShown()
	local UI_ID = Get_XParam_INT(0);
	if UI_ID == 1 then
		local  iscansee = Get_XParam_INT(1);
		if iscansee == 1 then
			--MiniMap_JiangHu:Hide();
			MiniMap_PlayerAsk2_Bn:Show();
			MiniMap_PlayerAsk2:Show();
			MiniMap_PlayerAsk2:SetToolTip("#{TLDC_110512_02}")
			g_diaochaAsk = tonumber(arg0)
		else
			MiniMap_PlayerAsk2_Bn:Hide();
			MiniMap_PlayerAsk2:Hide();
			MiniMap_JiangHu:Show();
		end
	end
end
function MiniMap_TimerProc()
	KillTimer("MiniMap_TimerProc()");		--关闭定时器
	--MiniMap_AccountSafeBack:Hide();
	--MiniMap_AccountSafeFlash :Hide();

end

function MiniMap_FlashHuodong()
	--AxTrace( 8,3,"init minimap" );
	MiniMap_NetStatus_Flash:Play( true );
end

function MiniMap_StopFlashHuodong()
	MiniMap_NetStatus_Flash:Play( false );
end

function MiniMap_UpdateLockFlag()
        local HuiKui=DataPool:GetPlayerMission_DataRound(397)
        local JubaoNum=DataPool:GetPlayerMission_DataRound(289)
        local JubaoTim=-1
        if math.mod(JubaoNum,100) >= 20 then
           JubaoTim=DataPool:GetPlayerMission_DataRound(290)
        else
           JubaoTim=DataPool:GetPlayerMission_DataRound(291)
        end

	local level = Player:GetData( "LEVEL" );
	if( Player:IsHavePassword() == nil ) then
		return
	elseif( Player:IsHavePassword() == 0 ) then --如果有没有密码呢，就闪烁
		--MiniMap_SafeLock:SetProperty( "SetCurrentImage","red" );
		--MiniMap_SafeLockState:SetProperty( "SetCurrentImage","Unlock" );
		--MiniMap_SafeLockFlash:Show();
	else
		--MiniMap_SafeLock:SetProperty( "SetCurrentImage","green" );
		--MiniMap_SafeLockFlash:Hide();

		--没有锁定就显示开开的锁的图片
		if ( Player:IsLocked() == nil ) then
			return
		elseif ( Player:IsLocked() == 0 ) then
			--MiniMap_SafeLockState:SetProperty( "SetCurrentImage","Lock" );
		else
			--MiniMap_SafeLockState:SetProperty( "SetCurrentImage","Unlock" );
		end
	end
	--蒙子控制
	if( tonumber( level ) <= 15 ) then
		--MiniMap_SafeLock:SetProperty( "SetCurrentImage","gray" );
		--MiniMap_SafeLockState:SetProperty( "SetCurrentImage","Unlock" );
		--MiniMap_SafeLockFlash:Hide();
	end

	if( tonumber( IsInStall() ) == 1 ) then
		--MiniMap_SafeLock:SetProperty( "SetCurrentImage","gray" );
		--MiniMap_SafeLockFlash:Hide();
	end

        --if HuiKui <= 5 then
        --   MiniMap_Shouchong:Show();
        --else
        --   MiniMap_Shouchong:Hide();
        --end
        --MiniMap_Xinfu:Show();
end


function Minimap_UpdatePKMode()
	local nPKMode = Player:GetPKMode();
	if( tonumber( nPKMode ) == 0 ) then
		MiniMap_PK_Mode:SetProperty( "SetCurrentImage", "Peace" );
	else
		MiniMap_PK_Mode:SetProperty( "SetCurrentImage", "War" );
	end

	local strPKMode = ""
	if( tonumber( nPKMode ) == 0 ) then
		--MiniMap_PK_Mode:SetToolTip( "和平" );
		strPKMode = "和平\n此模式下只能反击攻击自己的玩家，不能主动攻击其他玩家。"
	elseif( tonumber( nPKMode ) == 1 ) then
		--MiniMap_PK_Mode:SetToolTip( "PK_FREE_FOR_ALL" );
		strPKMode = "个人混战"

	elseif( tonumber( nPKMode ) == 2 ) then
		--MiniMap_PK_Mode:SetToolTip( "PK_FREE_FOR_MORAL" );
		strPKMode = "善恶模式\n此模式下可以攻击杀气大于0的玩家。"

	elseif( tonumber( nPKMode ) == 3 ) then
		--MiniMap_PK_Mode:SetToolTip( "PK_FREE_FOR_TEAM" );
		strPKMode = "组队混战"

	elseif( tonumber( nPKMode ) == 4 ) then
		--MiniMap_PK_Mode:SetToolTip( "PK_FREE_FOR_GUILD" );
		strPKMode = "帮派同盟混战"

	elseif( tonumber( nPKMode ) == 5 ) then
		strPKMode = "#{TDGZ_XML_19}"
    elseif( tonumber( nPKMode ) == 6 ) then
		strPKMode = "#{KVKSL_110628_214}" 
	end

	local strTime = ""
	local iTime = Player:GetTimeToPeace()

	if( -1 ~= iTime ) then
	    iTime = math.floor( iTime / 1000 )
	    local iSec = math.mod( iTime, 60 )
	    local iMin = math.floor( iTime / 60 )

	    --strTime = "#r("..( tonumber(iTime) ).."秒后切换到和平或善恶模式)"
	    if( iMin > 0 ) then
	        strTime = "#r"..(iMin).."分"..( tonumber(iSec) ).."秒后切换到和平或善恶模式"
	    else
	        strTime = "#r"..( tonumber(iSec) ).."秒后切换到和平或善恶模式"
	    end

	end

	MiniMap_PK_Mode:SetToolTip( strPKMode..strTime )


end
			--IMAGE_TYPE_Animy	= 0, // 敌人
			--IMAGE_TYPE_ExpNpc	= 1, // 特殊npc
			--IMAGE_TYPE_Team		= 2, // 队友
			--IMAGE_TYPE_Player	= 3, // 别的玩家
			--IMAGE_TYPE_ExpObj	= 4, // 生长点
			--IMAGE_TYPE_Active	= 5, // 激活方向点
			--IMAGE_TYPE_ScenePos = 6, // 场景跳转点
			--IMAGE_TYPE_Flash	= 7, // 闪光点
			--IMAGE_TYPE_Pet		= 8, // 宠物
			--IMAGE_TYPE_Direction = 9,// 方向箭头
function UpdateMinimapState()

		this:Show();
		MiniMap_PosModify();
		Minimap_CoordinateUpdate();
		Minimap_UpdatePKMode();
end

function MiniMap_Update( filename )
	--AxTrace( 0,0,"init minimap" );
	local sceneX, sceneY;
	sceneX,sceneY = GetSceneSize();
	MiniMap_MapArea:SetSceneFileName( sceneX,sceneY,filename );
	MiniMap_Frame:SetForce();
end

function MiniMap_PosModify()
	if( this:IsVisible() ) then
		MiniMap_MapArea:UpdateFlag();
	end
end

function  MiniMap_OpenMinimapExp()

	OpenMinimap( "MinimapExp" );
	this:Hide();


end

function Minimap_Max()
	MiniMap_CloseButtons:Show()
	MiniMap_OpenButtons:Hide()
	MiniMap_Background_Frame:Show();
end

function Minimap_Min()
	MiniMap_CloseButtons:Hide()
	MiniMap_OpenButtons:Show()
	MiniMap_Background_Frame:Hide();
end

function Minimap_CoordinateUpdate()

	local coordinatex,coordinatey,direct;
	coordinatex, coordinatey = MiniMap_MapArea:GetMouseScenePos();
	MiniMap_Coordinate:SetText( "#cFDFF73"..tostring( coordinatex ).."  "..tostring( coordinatey ) );

	for i=1,12 do
		TimeDot[i]:Hide()
	end
	local hour = GetCurrentTime() + 1;
	MiniMap_ChineseTime:SetProperty("SetCurrentImage", "Time"..tostring( hour ) );
	--AxTrace( 8,0,"当前时间"..tostring( hour ) );
	TimeDot[ hour ]:Show();

end

function MiniMap_HandleAccKey( op )
	if(op == "acc_zoommap" and this:IsVisible()) then
		MiniMap_OpenMinimapExp();
	elseif(op == "acc_resetcamera") then
		ResetCamera();
	elseif(op == "acc_worldmap") then
		ToggleLargeMap();
	end
end

function Do_OpenAutoSearch()
	OpenAutoSearch();
end

function MiniMap_YuanBaoFunc()
	if (IsWindowShow("XuanShop")) then
		CloseWindow("XuanShop", true);
	else
		ToggleYuanbaoShop()
	end
end

-- 活跃玩家送好礼 by cys
function MiniMap_HuoyuehaoliFunc()
	OpenHuoYueHaoLi()
	--MiniMap_Huoyuehaoli_Ani:Play( false );
end

function MiniMap_OpenSafeTimeDlg()
	OpenDlg4ProtectTime();
end

function MiniMap_LockFunc()
	local leader = Player:IsLeader();
  if(leader == 1) then
  else
		if(Player:InTeamFollowMode()) then
			PushDebugMessage("#{GMAI_Base_Info_Team_Follow_Staus}")
			PushDebugMessage("#{GMAI_Base_Info_Not_Allow_Operate}")
			return
		end
	end

	--AxTrace( 9,0,"IsIdleLogic = "..tostring( IsIdleLogic() ) );
	if( tonumber( IsInStall() ) == 0 ) then
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("OnDefaultEvent");
			Set_XSCRIPT_ScriptID(808007);
			Set_XSCRIPT_Parameter(0,808007);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
	end
end

function MiniMap_GotoDirectly()
	local coordinatex,coordinatey;
	coordinatex, coordinatey = MiniMap_MapArea:GetMouseScenePos();
	AutoRunToTarget(coordinatex, coordinatey);
end

function MiniMap_NetStatus_MouseEnter()
end

function MiniMap_NetStatus_MouseLeave()

end

function MiniMap_NetStatus_MouseLButtonDown()
	--OpenTodayCampaignList();
	MiniMap_NetStatus_Flash:Play( false );
end

function MiniMap_AccountSafeFunc()
	--MiniMap_AccountSafeBack:Hide();
	--MiniMap_AccountSafeFlash : Hide();
	OpenWordrefence("AccountSafe");
end

function MiniMap_Fangchengmi_Click()
	OpenFangChenMiInfoDlg();
end

function MiniMap_PlayerAsk_Bn_Clicked()
	local menpai = Player:GetData("MEMPAI");
	local strName = "无门派";

	-- 得到门派名称.
	if(0 == menpai) then
		strName = "少林";

	elseif(1 == menpai) then
		strName = "明教";

	elseif(2 == menpai) then
		strName = "丐帮";

	elseif(3 == menpai) then
		strName = "武当";

	elseif(4 == menpai) then
		strName = "峨嵋";

	elseif(5 == menpai) then
		strName = "星宿";

	elseif(6 == menpai) then
		strName = "天龙";

	elseif(7 == menpai) then
		strName = "天山";

	elseif(8 == menpai) then
		strName = "逍遥";

	elseif(9 == menpai) then
	     strName = "无门派";

	elseif(10== menpai) then
		strName = "慕容";

	elseif(11== menpai) then
		strName = "唐门";
		
	elseif(12== menpai) then
		strName = "鬼谷";
		
	elseif(13== menpai) then
		strName = "桃花岛";		
		
	end

	local urlStr = "cn="..Player:GetData("ACCOUNTNAME")
	urlStr = urlStr.."&v="..Player:GetAccMD5String()

	local idWorld = Variable:GetVariable("Login_World")
	if idWorld == nil then
		urlStr = urlStr.."&serverid="
	else
		urlStr = urlStr.."&serverid="..idWorld
	end

	urlStr = urlStr.."&level="..Player:GetData("LEVEL")
	urlStr = urlStr.."&roleName="..Player:GetName()
	urlStr = urlStr.."&clan="..strName
	urlStr = ConvertStringToURLCoding(urlStr)
	GameProduceLogin:OpenURL( GetWeblink("WEB_ACTIVITY_SEARCH")..tostring(g_myAsk)..".jsp?"..urlStr );
	MiniMap_PlayerAsk_Bn:Hide();
	MiniMap_PlayerAsk:Hide();
	--MiniMap_SuperHelp2:Show();
end

function Split(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = {}
  while true do
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
   if not nFindLastIndex then
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
    break
   end
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
   nSplitIndex = nSplitIndex + 1
  end
  return nSplitArray
 end


function MiniMap_LiebiaoFunc()
	Guild:AskGuildNameList();
end

function MiniMap_KeFu()	
	PushEvent("UI_COMMAND",20200427)
	
end

function Minimap_OpenSuperHelp()
	PushEvent("UI_COMMAND",20200428)
	SetNotifyTip("这是帮助");
end
--bug反馈
function MiniMap_BugFeedBack()
   Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("DuiHuan_GN");
	Set_XSCRIPT_ScriptID(181000);
	Set_XSCRIPT_Parameter(0,3);
	Set_XSCRIPT_ParamCount( 1 );				-- 参数个数
   Send_XSCRIPT() 
end
function MiniMap_PlayerAsk2_Bn_Clicked()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("AskQuestion");
		Set_XSCRIPT_ScriptID(889396);
		Set_XSCRIPT_ParamCount(0);
	Send_XSCRIPT();
	MiniMap_PlayerAsk2_Bn:Hide();
	MiniMap_PlayerAsk2:Hide();
--	MiniMap_JiangHu:Show();
end

--邮件提示
function MinMap_Mail_ClickFlash()
	PushEvent("UPDATE_MESSAGEMAIL",g_bNewMailTip)
	--MiniMap_MailAnimate:Play( false )
end

function MiniMap_ShouKaiKa()
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "GetGiftsForUI" ); 
		Set_XSCRIPT_ScriptID( 890096 );			
		Set_XSCRIPT_Parameter( 0, tonumber( 11 ) );	
		Set_XSCRIPT_ParamCount( 1 );
	Send_XSCRIPT()	
end
function MiniMap_OpenForum()
   Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("DuiHuan_GN");
	Set_XSCRIPT_ScriptID(181000);
	Set_XSCRIPT_Parameter(0,5);
	Set_XSCRIPT_ParamCount( 1 );
   Send_XSCRIPT() 
end

-- function MiniMap_XinfuOpen()
	-- Clear_XSCRIPT()
		-- Set_XSCRIPT_Function_Name( "XieziQuickly" ); 
		-- Set_XSCRIPT_ScriptID(70051);			
		-- Set_XSCRIPT_Parameter(0,7501);	
		-- Set_XSCRIPT_ParamCount(1);
	-- Send_XSCRIPT()	
-- end