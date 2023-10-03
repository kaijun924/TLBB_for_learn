local strMenPaiName =
{
	"少林",
	"明教",
	"丐帮",
	"武当",
	"峨嵋",
	"星宿",
	"天龙",
	"天山",
	"逍遥",
	"新手",
	"慕容",
	"唐门",
	"大宋",
	"大宋",
	"大宋",
	"大辽",
	"大辽",
	"大理",
	"西夏",
	"番邦",
	"莽盖",
	"遗民",
	"狼人",
	"白苗",
	"黑苗",
	"修罗",
	"越女",
	"越男",
	"鳄神",
	"野兽",
	"绿林",
	"妖魔",
	"箱子",
	"宝箱",
	"",
	"",
	"",
	"",
};

local nID_TaoHuaDao = 13 --桃花岛 2019-11-26 17:29:10 逍遥子
function TargetFrame_PreLoad()
	this:RegisterEvent("MAINTARGET_CHANGED")
	this:RegisterEvent("UNIT_HP");
	this:RegisterEvent("UNIT_MP");
	this:RegisterEvent("UNIT_RAGE");
	this:RegisterEvent("UNIT_LEVEL");
	this:RegisterEvent("UNIT_RELATIVE");
	this:RegisterEvent("MAINTARGET_OPEN")
	this:RegisterEvent("CHANGE_DIYFRAME")
	this:RegisterEvent("TARGETFRAME_GETTUJIAN");
	this:RegisterEvent("UI_SHOW_2DHEAD")	--显示2D头像
end

local g_TargetID = -1

function TargetFrame_OnLoad()

end

function TargetFrame_OnEvent(event)

	local nMenpai = Target:GetData( "MEMPAI" );
	if nID_TaoHuaDao == nMenpai then
		TargetFrame_SP:Hide()
		TargetFrame_GQ:Show()
	else
		TargetFrame_SP:Show()
		TargetFrame_GQ:Hide()
	end

	if ( event =="MAINTARGET_OPEN" ) then
	
		Shoujitujian_Icon:Hide()
		
		--AxTrace(0,0,"打开main target");
		--if 1 == Target:IsTargetRaidMember() then
		--	TargetFrame_DataBack:Show()
		--	TargetFrame_DataBack2:Hide()
		--	TargetFrame_Update_Name_Raid()
		--	TargetFrame_Update_HP_Raid()
		--	TargetFrame_Update_MP_Raid()
		--	TargetFrame_Update_Rage_Raid()
		--	TargetFrame_Update_Level_Raid()
		--else
			TargetFrame_DataBack:Show();
			TargetFrame_DataBack2:Hide();
			TargetFrame_Update_Name_Team();
			TargetFrame_Update_HP_Team();
			TargetFrame_Update_MP_Team();
			TargetFrame_Update_Rage_Team();
			TargetFrame_Update_Level_Team();
		--end

		this:Show();
		return;
	end;

	if ( event =="MAINTARGET_CHANGED" ) then

		AxTrace(0,0,"id ==="..tostring(arg0));
	  if(-1 == tonumber(arg0)) then
	  	g_TargetID = -1
	  	this:Hide();
	  	return;
	  end;
	 
	  Shoujitujian_Icon:Hide()

		if( Target:IsPresent()) then
			this:Show();
			TargetFrame_Update_Name();
			TargetFrame_Update_HP();
			TargetFrame_Update_MP();
			TargetFrame_Update_Rage();
			TargetFrame_Update_Level();
			TargetFrame_Update_Head();
			
		else

			if(Target:IsTargetTeamMember() ~= 0) then

				this:Show();
				TargetFrame_DataBack:Show();
				TargetFrame_DataBack2:Hide();
			else
				g_TargetID = -1
				this:Hide();
			end;

		end
		return;
	end

	if( (event =="TARGETFRAME_GETTUJIAN") and Target:IsPresent()) then
		TargetFrame_Update_ShoujiTuJian();
		return;
	end

	if( (event =="UNIT_MP") and Target:IsPresent()) then
		TargetFrame_Update_MP();
		return;
	end

	if( (event =="UNIT_HP") and Target:IsPresent()) then
		TargetFrame_Update_HP();
		return;
	end

	if( (event =="UNIT_RAGE") and Target:IsPresent()) then
		TargetFrame_Update_Rage();
		return;
	end

	if( (event =="UNIT_LEVEL") and Target:IsPresent()) then
		TargetFrame_Update_Level();
		return;
	end

	if( (event =="UNIT_RELATIVE") and Target:IsPresent()) then
		TargetFrame_Update_Name();
		return;
	end
	
	if ( event =="UI_SHOW_2DHEAD" ) then
		TargetFrame_UpdateShow2DHead()
		return
	end




	-------------------------------------------------------------------------------------------------
	--
	-- 当target是自己的时候无法刷新。
	--

	--if( (event =="UNIT_MP") and (arg0 =="target") and Target:IsPresent()) then
	--	TargetFrame_Update_MP();
	--	return;
	--end

	--if( (event =="UNIT_HP") and (arg0 =="target") and Target:IsPresent()) then
	--	TargetFrame_Update_HP();
	--	return;
	--end

	--if( (event =="UNIT_RAGE") and (arg0 =="target") and Target:IsPresent()) then
	--	TargetFrame_Update_Rage();
	--	return;
	--end

	--if( (event =="UNIT_LEVEL") and (arg0 =="target") and Target:IsPresent()) then
	--	TargetFrame_Update_Level();
	--	return;
	--end

	--if( (event =="UNIT_RELATIVE") and (arg0 =="target") and Target:IsPresent()) then
	--	TargetFrame_Update_Name();
	--	return;
	--end
end

function TargetFrame_Update_ShoujiTuJian()
	
end

function TargetFrame_Update_Name()
	local txtColor="#cFFFFFF";
--or Target:GetData("ISNPC") == 0
--以前玩家统一显示为白色，根据阮枚5月27日文档更改，玩家和NPC走同一规则。
	if Target:GetData("RELATIVE" ) == 2  then
		txtColor ="#W"
	else
		txtColor ="#R"
	end
	TargetFrame_NameBar : Show();
	local occupation = Target:GetData("OCCUPATION")

	AxTrace(0,1,"OCCUPATION="..occupation)
	if(occupation == -1) then
		TargetFrame_NameBar : SetImageColor("FF00FF00")
	elseif(occupation == 0) then
		TargetFrame_NameBar : SetImageColor("FFFFFFFF")
	elseif(occupation == 1) then
		TargetFrame_NameBar : SetImageColor("FFFF0000")
	end

	TargetFrame_Name:SetText( txtColor..Target:GetName());
	TargetFrame_Name:Show();
	AxTrace( 8,0,txtColor..Target:GetName() );
	local szIcon = Target : GetData("PORTRAIT");
	TargetFrame_Head_2D:SetProperty("Image", szIcon);
--添加判断目标属性的设计
	--“宠”“人”“傀”“兽”“莽”“修”“妖”
	local nNpcType = Target:GetData("TYPE" );
	TargetFrame_TypeIcon:SetProperty("SetCurrentImage","TypeName"..tostring( nNpcType ) );

	--1.友好
	--2.中立
	--3.珍兽
	--4.普通敌人
	--5.精英敌人
	--6.敌方boss
	local nNpcRelation = Target:GetData("RELATION" );
	TargetFrame_TypeFrame:SetProperty("SetCurrentImage","TypeFrame"..tostring( nNpcRelation ) );
	TargetFrame_TypeFrame_2D:SetProperty("SetCurrentImage","TypeFrame"..tostring( nNpcRelation ) );

	--跟新门派
	local nNpcReputation = Target:GetData("MEMPAI" );
	if( nNpcReputation == -1 ) then
		TargetFrame_CampFrame1:Hide();
	else
		TargetFrame_CampFrame1:Show();
		--注意：这里是很无奈的特写，具体数值请参考客户端代码中
		--Client\Game\Interface\GMGameInterface_Script_Character.cpp
		--INT Character::GetData(LuaPlus::LuaState* state) 函数
		local npcReputationImageIndex = nNpcReputation
		if npcReputationImageIndex == 10 then
			npcReputationImageIndex = 32
		elseif npcReputationImageIndex == 11 then
			npcReputationImageIndex = 33
					elseif npcReputationImageIndex == 12 then
			npcReputationImageIndex = 40
					elseif npcReputationImageIndex == 13 then
			npcReputationImageIndex = 41	
					elseif npcReputationImageIndex == 55 then
			npcReputationImageIndex = 10	
					elseif npcReputationImageIndex == 56 then
			npcReputationImageIndex = 11			
					elseif npcReputationImageIndex == 57 then
			npcReputationImageIndex = 12	
					elseif npcReputationImageIndex == 58 then
			npcReputationImageIndex = 13
			
		end
		TargetFrame_CampFrame:SetProperty("SetCurrentImage","Reputation"..tostring( npcReputationImageIndex ) );
		TargetFrame_CampFrame:SetToolTip( strMenPaiName[ nNpcReputation + 1 ] );
	end

--	local TargetGuid = GetTargetPlayerGUID();
	--if TargetGuid ~=nil  and TargetGuid ~= -1 then
--	   Clear_XSCRIPT();
--		 Set_XSCRIPT_Function_Name("XieziQuickly")
--		 Set_XSCRIPT_ScriptID(70051)
--		 Set_XSCRIPT_Parameter(0,8889)
--		 Set_XSCRIPT_Parameter(1,tonumber(TargetGuid))
--		 Set_XSCRIPT_ParamCount(2)
--	   Send_XSCRIPT();
 --       end
end

function TargetFrame_Update_HP()
	local nNpcRelation = Target:GetData("RELATION" );
	if( tonumber( nNpcRelation ) == 6 ) then
		TargetFrame_DataBack:Hide();
		TargetFrame_DataBack2:Show();
		local hp = Target:GetHPPercent();
		TargetFrame_HP_Boss1:SetProgress( hp * 3, 1 );
		TargetFrame_HP_Boss2:SetProgress( ( hp - 0.33333 ) * 3, 1 );
		TargetFrame_HP_Boss3:SetProgress( ( hp - 0.66666 ) * 3, 1 );
	else
		TargetFrame_DataBack:Show();
		TargetFrame_DataBack2:Hide();
		TargetFrame_HP:SetProgress(Target:GetHPPercent(), 1);
		TargetFrame_Update_Name();
	end

	--图鉴收藏显示
	TargetFrame_Update_ShoujiTuJian()	
end

function TargetFrame_Update_MP()
	TargetFrame_MP:SetProgress(Target:GetMPPercent(), 1);
end

function TargetFrame_Update_Rage()
	if Target:GetData( "MEMPAI" ) == nID_TaoHuaDao then
		TargetFrame_GQ:SetProgress(Target:GetRagePercent(), 1);
	else
		TargetFrame_SP:SetProgress(Target:GetRagePercent(), 1);
	end
end

function TargetFrame_Update_Level()

	local txtColor="#cFFFFFF";
	local level =  Target:GetData("LEVEL" ) - Player:GetData("LEVEL" );

	AxTrace( 0,0,"等级差为"..tostring( level ) );
--根据阮枚5月27日策划文档修改
--	if( level > 12 ) then
--		txtColor ="#R";
--	elseif( level > 4 ) then
--		txtColor ="#cff9000";
--		--以前是c9ccf00，根据杨耀提供的.jpg修改
--	elseif( level > -4 ) then
--		txtColor="#Y";
--	elseif( level > -12 ) then
--		txtColor="#G"
--	else
--		txtColor="#c4b4b4b";
--根据杨耀口述修改
--		txtColor="#c240c0c";
--	end

--根据阮枚5月27日策划文档修改如下
	if( level > 5 ) then
		txtColor ="#R";
	elseif( level > 2 ) then
		txtColor ="#cff9000";
		--以前是c9ccf00，根据杨耀提供的.jpg修改
	elseif( level >= -2 ) then
		txtColor="#Y";
	elseif( level >= -5 ) then
		txtColor="#W"
	else
--		txtColor="#c4b4b4b";
--根据杨耀口述修改
		txtColor="#W";
	end



	TargetFrame_LevelText:SetText(txtColor .. tostring(Target:GetData("LEVEL" )));

end

function TargetFrame_ArtLayout_Click()
	ShowContexMenu("other_player");
end

-- 显示右键菜单
function TargetFrame_Show_Menu_Func()

	--AxTrace( 0,0,"Target 右键菜单!");
	OpenTargetMenu();
end


function TargetFrame_Update_Name_Team()

	local strName = Target:TargetFrame_Update_Name_Team();
	local nMenpai = Target:TargetFrame_Update_Menpai_Team();
	TargetFrame_Name:SetText(strName);
	if( tonumber(nMenpai) == -1 ) then
		TargetFrame_CampFrame1:Hide();
	else
		TargetFrame_CampFrame1:Show();
		TargetFrame_CampFrame:SetProperty("SetCurrentImage","Reputation"..tostring( nMenpai ) );
		TargetFrame_CampFrame:SetToolTip( strMenPaiName[ nMenpai + 1 ] );
	end
	if nID_TaoHuaDao == nMenpai then
		TargetFrame_SP:Hide()
		TargetFrame_GQ:Show()
	else
		TargetFrame_SP:Show()
		TargetFrame_GQ:Hide()
	end		
	local strIcon = Target:TargetFrame_Update_Icon_Team();
	TargetFrame_Head_2D:SetProperty("Image", strIcon);
	TargetFrame_TypeFrame:SetProperty("SetCurrentImage","TypeFrame1" );
	TargetFrame_TypeFrame_2D:SetProperty("SetCurrentImage","TypeFrame"..tostring( nNpcRelation ) );
	TargetFrame_TypeIcon:SetProperty("SetCurrentImage","TypeName2" );
	
	g_TargetID = -1
	--Target:TargetFrame_Update_Model_Team();
	TargetFrame_UpdateShow2DHead()
end;

function TargetFrame_Update_HP_Team()

	local TeamHP = Target:TargetFrame_Update_HP_Team();
	TargetFrame_HP:SetProgress(TeamHP, 1);
end;

function TargetFrame_Update_MP_Team()

	local TeamMp = Target:TargetFrame_Update_MP_Team();
	TargetFrame_MP:SetProgress(TeamMp, 1);
end;

function TargetFrame_Update_Rage_Team()

	local TeamRange = Target:TargetFrame_Update_Rage_Team();
	local nMenpai = Target:GetData( "MEMPAI" );
	if nMenpai == nID_TaoHuaDao then
		TargetFrame_GQ:SetProgress(TeamRange, 1000);
	else
		TargetFrame_SP:SetProgress(TeamRange, 1000);
	end
end;

function TargetFrame_Update_Level_Team()

	local TeamLevel = Target:TargetFrame_Update_Level_Team();
	TargetFrame_LevelText:SetText(tostring(TeamLevel));
end;

function TargetFrame_Select_TargetOfTarget_Func()
         --SelectTargetOfTarget();
	PushDebugMessage("该功能暂未开放");

end;

function TargetFrame_Shoujitujian_Func()
         ShoujiTargetTujian();
         SendBullet(169); --吸魂特效
end;

function TargetFrame_OnShow()
	PushEvent("SHOW_PHOENIXPLAINWAR_SCORE_S",2)
end

function	TargetFrame_Update_Name_Raid()
	local strName = Target:TargetFrame_Update_Name_Raid();
	local nMenpai = Target:TargetFrame_Update_Menpai_Raid();
	TargetFrame_Name:SetText(strName);
	if( tonumber(nMenpai) == -1 ) then
		TargetFrame_CampFrame1:Hide();
	else
		TargetFrame_CampFrame1:Show();
		TargetFrame_CampFrame:SetProperty("SetCurrentImage","Reputation"..tostring( nMenpai ) );
		TargetFrame_CampFrame:SetToolTip( strMenPaiName[ nMenpai + 1 ] );
	end
	local strIcon = Target:TargetFrame_Update_Icon_Raid();
	TargetFrame_Head_2D:SetProperty("Image", strIcon);
	TargetFrame_TypeFrame:SetProperty("SetCurrentImage","TypeFrame1" );
	TargetFrame_TypeFrame_2D:SetProperty("SetCurrentImage","TypeFrame1" );
	TargetFrame_TypeIcon:SetProperty("SetCurrentImage","TypeName2" );
	
	g_TargetID = -1
	Target:TargetFrame_Update_Model_Raid();
	TargetFrame_UpdateShow2DHead()
end;

function TargetFrame_Update_HP_Raid()

	local RaidHP = Target:TargetFrame_Update_HP_Raid();
	TargetFrame_HP:SetProgress(RaidHP, 1);
end;

function TargetFrame_Update_MP_Raid()

	local RaidMp = Target:TargetFrame_Update_MP_Raid();
	TargetFrame_MP:SetProgress(RaidMp, 1);
end;

function	TargetFrame_Update_Rage_Raid()

	local RaidRange = Target:TargetFrame_Update_Rage_Raid();
	local nMenpai = Target:GetData( "MEMPAI" );
	if nMenpai == nID_TaoHuaDao then
		TargetFrame_GQ:SetProgress(RaidRange, 1000);
	else
		TargetFrame_SP:SetProgress(RaidRange, 1000);
	end
end;

function	TargetFrame_Update_Level_Raid()

	local RaidLevel = Target:TargetFrame_Update_Level_Raid();
	TargetFrame_LevelText:SetText(tostring(RaidLevel));
end;

function	TargetFrame_Update_Head()

	local npcID = Target:GetData("MODELID");
	local tempNpcID = Target:GetData("NPCID");
	if (tempNpcID ~= nil) then
			if (g_TargetID ~= tempNpcID) then
				g_TargetID = tempNpcID
			end		
		TargetFrame_UpdateShow2DHead()
	end
end


function GetDW(StrDW)
g_XieZi_DwStr={
["ti01"]={"体力","1级","0/2","体力+10","set:TattooShow image:TattooShow_1",""},
["ti02"]={"体力","2级","0/9","体力+20","set:TattooShow image:TattooShow_1",""}, 
["ti03"]={"体力","3级","0/50","体力+50","set:TattooShow image:TattooShow_1",""}, 
["ti04"]={"体力","4级","0/87","体力+80","set:TattooShow image:TattooShow_2",""}, 
["ti05"]={"体力","5级","0/165","体力+180","set:TattooShow image:TattooShow_2",""}, 
["ti06"]={"体力","6级","0/284","体力+270","set:TattooShow image:TattooShow_2",""}, 
["ti07"]={"体力","7级","0/811","体力+560","set:TattooShow image:TattooShow_3",""}, 
["ti08"]={"体力","8级","0/2988","体力+810","set:TattooShow image:TattooShow_3",""}, 
["ti09"]={"体力","9级","0/3570","体力+1200","set:TattooShow image:TattooShow_3",""}, 
["ti10"]={"体力","10级","满级","体力+2100","set:TattooShow image:TattooShow_4",""}, 

["ll01"]={"力量","1级","0/2","力量+10","set:TattooShow image:TattooShow_1",""},  
["ll02"]={"力量","2级","0/9","力量+20","set:TattooShow image:TattooShow_1",""}, 
["ll03"]={"力量","3级","0/50","力量+50","set:TattooShow image:TattooShow_1",""}, 
["ll04"]={"力量","4级","0/87","力量+80","set:TattooShow image:TattooShow_2",""}, 
["ll05"]={"力量","5级","0/165","力量+180","set:TattooShow image:TattooShow_2",""}, 
["ll06"]={"力量","6级","0/284","力量+270","set:TattooShow image:TattooShow_2",""}, 
["ll07"]={"力量","7级","0/811","力量+560","set:TattooShow image:TattooShow_3",""}, 
["ll08"]={"力量","8级","0/2988","力量+810","set:TattooShow image:TattooShow_3",""}, 
["ll09"]={"力量","9级","0/3570","力量+1200","set:TattooShow image:TattooShow_3",""}, 
["ll10"]={"力量","10级","满级","力量+2100","set:TattooShow image:TattooShow_4",""}, 

["lt01"]={"灵气","1级","0/2","灵气+10","set:TattooShow image:TattooShow_1",""},  
["lt02"]={"灵气","2级","0/9","灵气+20","set:TattooShow image:TattooShow_1",""}, 
["lt03"]={"灵气","3级","0/50","灵气+50","set:TattooShow image:TattooShow_1",""}, 
["lt04"]={"灵气","4级","0/87","灵气+80","set:TattooShow image:TattooShow_2",""}, 
["lt05"]={"灵气","5级","0/165","灵气+180","set:TattooShow image:TattooShow_2",""}, 
["lt06"]={"灵气","6级","0/284","灵气+270","set:TattooShow image:TattooShow_2",""}, 
["lt07"]={"灵气","7级","0/811","灵气+560","set:TattooShow image:TattooShow_3",""}, 
["lt08"]={"灵气","8级","0/2988","灵气+810","set:TattooShow image:TattooShow_3",""}, 
["lt09"]={"灵气","9级","0/3570","灵气+1200","set:TattooShow image:TattooShow_3",""}, 
["lt10"]={"灵气","10级","满级","灵气+2100","set:TattooShow image:TattooShow_4",""}, 

["sf01"]={"身法","1级","0/2","身法+10","set:TattooShow image:TattooShow_1",""},  
["sf02"]={"身法","2级","0/9","身法+20","set:TattooShow image:TattooShow_1",""}, 
["sf03"]={"身法","3级","0/50","身法+50","set:TattooShow image:TattooShow_1",""}, 
["sf04"]={"身法","4级","0/87","身法+80","set:TattooShow image:TattooShow_2",""}, 
["sf05"]={"身法","5级","0/165","身法+180","set:TattooShow image:TattooShow_2",""}, 
["sf06"]={"身法","6级","0/284","身法+270","set:TattooShow image:TattooShow_2",""}, 
["sf07"]={"身法","7级","0/811","身法+560","set:TattooShow image:TattooShow_3",""}, 
["sf08"]={"身法","8级","0/2988","身法+810","set:TattooShow image:TattooShow_3",""}, 
["sf09"]={"身法","9级","0/3570","身法+1200","set:TattooShow image:TattooShow_3",""}, 
["sf10"]={"身法","10级","满级","身法+2100","set:TattooShow image:TattooShow_4",""}, 


["bg01"]={"冰攻","1级","0/2","冰攻击+10","set:TattooShow image:TattooShow_9",""},  
["bg02"]={"冰攻","2级","0/9","冰攻击+20","set:TattooShow image:TattooShow_9",""}, 
["bg03"]={"冰攻","3级","0/50","冰攻击+50","set:TattooShow image:TattooShow_9",""}, 
["bg04"]={"冰攻","4级","0/87","冰攻击+100","set:TattooShow image:TattooShow_10",""}, 
["bg05"]={"冰攻","5级","0/165","冰攻击+210","set:TattooShow image:TattooShow_10",""}, 
["bg06"]={"冰攻","6级","0/284","冰攻击+360","set:TattooShow image:TattooShow_10",""}, 
["bg07"]={"冰攻","7级","0/811","冰攻击+640","set:TattooShow image:TattooShow_11",""}, 
["bg08"]={"冰攻","8级","0/2988","冰攻击+1080","set:TattooShow image:TattooShow_11",""}, 
["bg09"]={"冰攻","9级","0/3570","冰攻击+1600","set:TattooShow image:TattooShow_11",""}, 
["bg10"]={"冰攻","10级","满级","冰攻击+2700","set:TattooShow image:TattooShow_12",""}, 

["hg01"]={"火攻","1级","0/2","火攻击+10","set:TattooShow image:TattooShow_9",""},  
["hg02"]={"火攻","2级","0/9","火攻击+20","set:TattooShow image:TattooShow_9",""}, 
["hg03"]={"火攻","3级","0/50","火攻击+50","set:TattooShow image:TattooShow_9",""}, 
["hg04"]={"火攻","4级","0/87","火攻击+100","set:TattooShow image:TattooShow_10",""}, 
["hg05"]={"火攻","5级","0/165","火攻击+210","set:TattooShow image:TattooShow_10",""}, 
["hg06"]={"火攻","6级","0/284","火攻击+360","set:TattooShow image:TattooShow_10",""}, 
["hg07"]={"火攻","7级","0/811","火攻击+640","set:TattooShow image:TattooShow_11",""}, 
["hg08"]={"火攻","8级","0/2988","火攻击+1080","set:TattooShow image:TattooShow_11",""}, 
["hg09"]={"火攻","9级","0/3570","火攻击+1600","set:TattooShow image:TattooShow_11",""}, 
["hg10"]={"火攻","10级","满级","火攻击+2700","set:TattooShow image:TattooShow_12",""}, 

["xg01"]={"玄攻","1级","0/2","玄攻击+10","set:TattooShow image:TattooShow_9",""},  
["xg02"]={"玄攻","2级","0/9","玄攻击+20","set:TattooShow image:TattooShow_9",""}, 
["xg03"]={"玄攻","3级","0/50","玄攻击+50","set:TattooShow image:TattooShow_9",""}, 
["xg04"]={"玄攻","4级","0/87","玄攻击+100","set:TattooShow image:TattooShow_10",""}, 
["xg05"]={"玄攻","5级","0/165","玄攻击+210","set:TattooShow image:TattooShow_10",""}, 
["xg06"]={"玄攻","6级","0/284","玄攻击+360","set:TattooShow image:TattooShow_10",""}, 
["xg07"]={"玄攻","7级","0/811","玄攻击+640","set:TattooShow image:TattooShow_11",""}, 
["xg08"]={"玄攻","8级","0/2988","玄攻击+1080","set:TattooShow image:TattooShow_11",""}, 
["xg09"]={"玄攻","9级","0/3570","玄攻击+1600","set:TattooShow image:TattooShow_11",""}, 
["xg10"]={"玄攻","10级","满级","玄攻击+2700","set:TattooShow image:TattooShow_12",""}, 

["dg01"]={"毒攻","1级","0/2","毒攻击+10","set:TattooShow image:TattooShow_9",""},  
["dg02"]={"毒攻","2级","0/9","毒攻击+20","set:TattooShow image:TattooShow_9",""}, 
["dg03"]={"毒攻","3级","0/50","毒攻击+50","set:TattooShow image:TattooShow_9",""}, 
["dg04"]={"毒攻","4级","0/87","毒攻击+100","set:TattooShow image:TattooShow_10",""}, 
["dg05"]={"毒攻","5级","0/165","毒攻击+210","set:TattooShow image:TattooShow_10",""}, 
["dg06"]={"毒攻","6级","0/284","毒攻击+360","set:TattooShow image:TattooShow_10",""}, 
["dg07"]={"毒攻","7级","0/811","毒攻击+640","set:TattooShow image:TattooShow_11",""}, 
["dg08"]={"毒攻","8级","0/2988","毒攻击+1080","set:TattooShow image:TattooShow_11",""}, 
["dg09"]={"毒攻","9级","0/3570","毒攻击+1600","set:TattooShow image:TattooShow_11",""}, 
["dg10"]={"毒攻","10级","满级","毒攻击+2700","set:TattooShow image:TattooShow_12",""}, 

["bj01"]={"减冰抗","1级","0/2","忽略目标冰抗+8","set:TattooShow image:TattooShow_17",""},  
["bj02"]={"减冰抗","2级","0/9","忽略目标冰抗+16","set:TattooShow image:TattooShow_17",""}, 
["bj03"]={"减冰抗","3级","0/50","忽略目标冰抗+24","set:TattooShow image:TattooShow_17",""}, 
["bj04"]={"减冰抗","4级","0/87","忽略目标冰抗+32","set:TattooShow image:TattooShow_18",""}, 
["bj05"]={"减冰抗","5级","0/165","忽略目标冰抗+40","set:TattooShow image:TattooShow_18",""}, 
["bj06"]={"减冰抗","6级","0/284","忽略目标冰抗+48","set:TattooShow image:TattooShow_18",""}, 
["bj07"]={"减冰抗","7级","0/811","忽略目标冰抗+56","set:TattooShow image:TattooShow_19",""}, 
["bj08"]={"减冰抗","8级","0/2988","忽略目标冰抗+64","set:TattooShow image:TattooShow_19",""}, 
["bj09"]={"减冰抗","9级","0/3570","忽略目标冰抗+72","set:TattooShow image:TattooShow_19",""}, 
["bj10"]={"减冰抗","10级","满级","忽略目标冰抗+80","set:TattooShow image:TattooShow_20",""}, 

["hj01"]={"减火抗","1级","0/2","忽略目标火抗+8","set:TattooShow image:TattooShow_17",""},  
["hj02"]={"减火抗","2级","0/9","忽略目标火抗+16","set:TattooShow image:TattooShow_17",""}, 
["hj03"]={"减火抗","3级","0/50","忽略目标火抗+24","set:TattooShow image:TattooShow_17",""}, 
["hj04"]={"减火抗","4级","0/87","忽略目标火抗+32","set:TattooShow image:TattooShow_18",""}, 
["hj05"]={"减火抗","5级","0/165","忽略目标火抗+40","set:TattooShow image:TattooShow_18",""}, 
["hj06"]={"减火抗","6级","0/284","忽略目标火抗+48","set:TattooShow image:TattooShow_18",""}, 
["hj07"]={"减火抗","7级","0/811","忽略目标火抗+56","set:TattooShow image:TattooShow_19",""}, 
["hj08"]={"减火抗","8级","0/2988","忽略目标火抗+64","set:TattooShow image:TattooShow_19",""}, 
["hj09"]={"减火抗","9级","0/3570","忽略目标火抗+72","set:TattooShow image:TattooShow_19",""}, 
["hj10"]={"减火抗","10级","满级","忽略目标火抗+80","set:TattooShow image:TattooShow_20",""}, 

["xj01"]={"减玄抗","1级","0/2","忽略目标玄抗+8","set:TattooShow image:TattooShow_17",""},  
["xj02"]={"减玄抗","2级","0/9","忽略目标玄抗+16","set:TattooShow image:TattooShow_17",""}, 
["xj03"]={"减玄抗","3级","0/50","忽略目标玄抗+24","set:TattooShow image:TattooShow_17",""}, 
["xj04"]={"减玄抗","4级","0/87","忽略目标玄抗+32","set:TattooShow image:TattooShow_18",""}, 
["xj05"]={"减玄抗","5级","0/165","忽略目标玄抗+40","set:TattooShow image:TattooShow_18",""}, 
["xj06"]={"减玄抗","6级","0/284","忽略目标玄抗+48","set:TattooShow image:TattooShow_18",""}, 
["xj07"]={"减玄抗","7级","0/811","忽略目标玄抗+56","set:TattooShow image:TattooShow_19",""}, 
["xj08"]={"减玄抗","8级","0/2988","忽略目标玄抗+64","set:TattooShow image:TattooShow_19",""}, 
["xj09"]={"减玄抗","9级","0/3570","忽略目标玄抗+72","set:TattooShow image:TattooShow_19",""}, 
["xj10"]={"减玄抗","10级","满级","忽略目标玄抗+80","set:TattooShow image:TattooShow_20",""}, 

["dj01"]={"减毒抗","1级","0/2","忽略目标毒抗+8","set:TattooShow image:TattooShow_17",""},  
["dj02"]={"减毒抗","2级","0/9","忽略目标毒抗+16","set:TattooShow image:TattooShow_17",""}, 
["dj03"]={"减毒抗","3级","0/50","忽略目标毒抗+24","set:TattooShow image:TattooShow_17",""}, 
["dj04"]={"减毒抗","4级","0/87","忽略目标毒抗+32","set:TattooShow image:TattooShow_18",""}, 
["dj05"]={"减毒抗","5级","0/165","忽略目标毒抗+40","set:TattooShow image:TattooShow_18",""}, 
["dj06"]={"减毒抗","6级","0/284","忽略目标毒抗+48","set:TattooShow image:TattooShow_18",""}, 
["dj07"]={"减毒抗","7级","0/811","忽略目标毒抗+56","set:TattooShow image:TattooShow_19",""}, 
["dj08"]={"减毒抗","8级","0/2988","忽略目标毒抗+64","set:TattooShow image:TattooShow_19",""}, 
["dj09"]={"减毒抗","9级","0/3570","忽略目标毒抗+72","set:TattooShow image:TattooShow_19",""}, 
["dj10"]={"减毒抗","10级","满级","忽略目标毒抗+80","set:TattooShow image:TattooShow_20",""}, 

["bk01"]={"冰抗","1级","0/2","冰抗性+8","set:TattooShow image:TattooShow_13",""},  
["bk02"]={"冰抗","2级","0/9","冰抗性+16","set:TattooShow image:TattooShow_13",""}, 
["bk03"]={"冰抗","3级","0/50","冰抗性+24","set:TattooShow image:TattooShow_13",""}, 
["bk04"]={"冰抗","4级","0/87","冰抗性+32","set:TattooShow image:TattooShow_14",""}, 
["bk05"]={"冰抗","5级","0/165","冰抗性+40","set:TattooShow image:TattooShow_14",""}, 
["bk06"]={"冰抗","6级","0/284","冰抗性+48","set:TattooShow image:TattooShow_14",""}, 
["bk07"]={"冰抗","7级","0/811","冰抗性+56","set:TattooShow image:TattooShow_15",""}, 
["bk08"]={"冰抗","8级","0/2988","冰抗性+64","set:TattooShow image:TattooShow_15",""}, 
["bk09"]={"冰抗","9级","0/3570","冰抗性+72","set:TattooShow image:TattooShow_15",""}, 
["bk10"]={"冰抗","10级","满级","冰抗性+80","set:TattooShow image:TattooShow_16",""}, 

["hk01"]={"火抗","1级","0/2","火抗性+8","set:TattooShow image:TattooShow_13",""},  
["hk02"]={"火抗","2级","0/9","火抗性+16","set:TattooShow image:TattooShow_13",""}, 
["hk03"]={"火抗","3级","0/50","火抗性+24","set:TattooShow image:TattooShow_13",""}, 
["hk04"]={"火抗","4级","0/87","火抗性+32","set:TattooShow image:TattooShow_14",""}, 
["hk05"]={"火抗","5级","0/165","火抗性+40","set:TattooShow image:TattooShow_14",""}, 
["hk06"]={"火抗","6级","0/284","火抗性+48","set:TattooShow image:TattooShow_14",""}, 
["hk07"]={"火抗","7级","0/811","火抗性+56","set:TattooShow image:TattooShow_15",""}, 
["hk08"]={"火抗","8级","0/2988","火抗性+64","set:TattooShow image:TattooShow_15",""}, 
["hk09"]={"火抗","9级","0/3570","火抗性+72","set:TattooShow image:TattooShow_15",""}, 
["hk10"]={"火抗","10级","满级","火抗性+80","set:TattooShow image:TattooShow_16",""}, 

["xk01"]={"玄抗","1级","0/2","玄抗性+8","set:TattooShow image:TattooShow_13",""},  
["xk02"]={"玄抗","2级","0/9","玄抗性+16","set:TattooShow image:TattooShow_13",""}, 
["xk03"]={"玄抗","3级","0/50","玄抗性+24","set:TattooShow image:TattooShow_13",""}, 
["xk04"]={"玄抗","4级","0/87","玄抗性+32","set:TattooShow image:TattooShow_14",""}, 
["xk05"]={"玄抗","5级","0/165","玄抗性+40","set:TattooShow image:TattooShow_14",""}, 
["xk06"]={"玄抗","6级","0/284","玄抗性+48","set:TattooShow image:TattooShow_14",""}, 
["xk07"]={"玄抗","7级","0/811","玄抗性+56","set:TattooShow image:TattooShow_15",""}, 
["xk08"]={"玄抗","8级","0/2988","玄抗性+64","set:TattooShow image:TattooShow_15",""}, 
["xk09"]={"玄抗","9级","0/3570","玄抗性+72","set:TattooShow image:TattooShow_15",""}, 
["xk10"]={"玄抗","10级","满级","玄抗性+80","set:TattooShow image:TattooShow_16",""}, 

["dk01"]={"毒抗","1级","0/2","毒抗性+8","set:TattooShow image:TattooShow_13",""},  
["dk02"]={"毒抗","2级","0/9","毒抗性+16","set:TattooShow image:TattooShow_13",""}, 
["dk03"]={"毒抗","3级","0/50","毒抗性+24","set:TattooShow image:TattooShow_13",""}, 
["dk04"]={"毒抗","4级","0/87","毒抗性+32","set:TattooShow image:TattooShow_14",""}, 
["dk05"]={"毒抗","5级","0/165","毒抗性+40","set:TattooShow image:TattooShow_14",""}, 
["dk06"]={"毒抗","6级","0/284","毒抗性+48","set:TattooShow image:TattooShow_14",""}, 
["dk07"]={"毒抗","7级","0/811","毒抗性+56","set:TattooShow image:TattooShow_15",""}, 
["dk08"]={"毒抗","8级","0/2988","毒抗性+64","set:TattooShow image:TattooShow_15",""}, 
["dk09"]={"毒抗","9级","0/3570","毒抗性+72","set:TattooShow image:TattooShow_15",""}, 
["dk10"]={"毒抗","10级","满级","毒抗性+80","set:TattooShow image:TattooShow_16",""}, 

["ww01"]={"忘无","1级","0/2","强化第一本心法第一个技能，附加伤害15","set:TattooShow image:TattooShow_5",""},  
["ww02"]={"忘无","2级","0/9","强化第一本心法第一个技能，附加伤害30","set:TattooShow image:TattooShow_5",""}, 
["ww03"]={"忘无","3级","0/50","强化第一本心法第一个技能，附加伤害45","set:TattooShow image:TattooShow_5",""}, 
["ww04"]={"忘无","4级","0/87","强化第一本心法第一个技能，附加伤害90","set:TattooShow image:TattooShow_6",""}, 
["ww05"]={"忘无","5级","0/165","强化第一本心法第一个技能，附加伤害150","set:TattooShow image:TattooShow_6",""}, 
["ww06"]={"忘无","6级","0/284","强化第一本心法第一个技能，附加伤害180","set:TattooShow image:TattooShow_6",""}, 
["ww07"]={"忘无","7级","0/811","强化第一本心法第一个技能，附加伤害195","set:TattooShow image:TattooShow_7",""}, 
["ww08"]={"忘无","8级","0/2988","强化第一本心法第一个技能，附加伤害210","set:TattooShow image:TattooShow_7",""}, 
["ww09"]={"忘无","9级","0/3570","强化第一本心法第一个技能，附加伤害270","set:TattooShow image:TattooShow_7",""}, 
["ww10"]={"忘无","10级","满级","强化第一本心法第一个技能，附加伤害360","set:TattooShow image:TattooShow_8",""}, 

["mx01"]={"冥想","1级","0/2","强化第二本心法第一个技能，技能的伤害效果提升10％","set:TattooShow image:TattooShow_5",""},  
["mx02"]={"冥想","2级","0/9","强化第二本心法第一个技能，技能的伤害效果提升20％","set:TattooShow image:TattooShow_5",""}, 
["mx03"]={"冥想","3级","0/50","强化第二本心法第一个技能，技能的伤害效果提升40％","set:TattooShow image:TattooShow_5",""}, 
["mx04"]={"冥想","4级","0/87","强化第二本心法第一个技能，技能的伤害效果提升70％","set:TattooShow image:TattooShow_6",""}, 
["mx05"]={"冥想","5级","0/165","强化第二本心法第一个技能，技能的伤害效果提升100％","set:TattooShow image:TattooShow_6",""}, 
["mx06"]={"冥想","6级","0/284","强化第二本心法第一个技能，技能的伤害效果提升110％","set:TattooShow image:TattooShow_6",""}, 
["mx07"]={"冥想","7级","0/811","强化第二本心法第一个技能，技能的伤害效果提升120％","set:TattooShow image:TattooShow_7",""}, 
["mx08"]={"冥想","8级","0/2988","强化第二本心法第一个技能，技能的伤害效果提升130％","set:TattooShow image:TattooShow_7",""}, 
["mx09"]={"冥想","9级","0/3570","强化第二本心法第一个技能，技能的伤害效果提升140％","set:TattooShow image:TattooShow_7",""}, 
["mx10"]={"冥想","10级","满级","强化第二本心法第一个技能，技能的伤害效果提升150％","set:TattooShow image:TattooShow_8",""}, 

["yj01"]={"御劲","1级","0/2","强化第五本心法第三个技能，技能的伤害效果提升10％","set:TattooShow image:TattooShow_5",""},  
["yj02"]={"御劲","2级","0/9","强化第五本心法第三个技能，技能的伤害效果提升20％","set:TattooShow image:TattooShow_5",""}, 
["yj03"]={"御劲","3级","0/50","强化第五本心法第三个技能，技能的伤害效果提升40％","set:TattooShow image:TattooShow_5",""}, 
["yj04"]={"御劲","4级","0/87","强化第五本心法第三个技能，技能的伤害效果提升70％","set:TattooShow image:TattooShow_6",""}, 
["yj05"]={"御劲","5级","0/165","强化第五本心法第三个技能，技能的伤害效果提升100％","set:TattooShow image:TattooShow_6",""}, 
["yj06"]={"御劲","6级","0/284","强化第五本心法第三个技能，技能的伤害效果提升110％","set:TattooShow image:TattooShow_6",""}, 
["yj07"]={"御劲","7级","0/811","强化第五本心法第三个技能，技能的伤害效果提升120％","set:TattooShow image:TattooShow_7",""}, 
["yj08"]={"御劲","8级","0/2988","强化第五本心法第三个技能，技能的伤害效果提升130％","set:TattooShow image:TattooShow_7",""}, 
["yj09"]={"御劲","9级","0/3570","强化第五本心法第三个技能，技能的伤害效果提升140％","set:TattooShow image:TattooShow_7",""}, 
["yj10"]={"御劲","10级","满级","强化第五本心法第三个技能，技能的伤害效果提升150％","set:TattooShow image:TattooShow_8",""}, 

["bn01"]={"暴怒","1级","0/2","强化第六本心法第一个技能，技能的伤害效果提升10％","set:TattooShow image:TattooShow_5",""},  
["bn02"]={"暴怒","2级","0/9","强化第六本心法第一个技能，技能的伤害效果提升20％","set:TattooShow image:TattooShow_5",""}, 
["bn03"]={"暴怒","3级","0/50","强化第六本心法第一个技能，技能的伤害效果提升40％","set:TattooShow image:TattooShow_5",""}, 
["bn04"]={"暴怒","4级","0/87","强化第六本心法第一个技能，技能的伤害效果提升70％","set:TattooShow image:TattooShow_6",""}, 
["bn05"]={"暴怒","5级","0/165","强化第六本心法第一个技能，技能的伤害效果提升100％","set:TattooShow image:TattooShow_6",""}, 
["bn06"]={"暴怒","6级","0/284","强化第六本心法第一个技能，技能的伤害效果提升110％","set:TattooShow image:TattooShow_6",""}, 
["bn07"]={"暴怒","7级","0/811","强化第六本心法第一个技能，技能的伤害效果提升120％","set:TattooShow image:TattooShow_7",""}, 
["bn08"]={"暴怒","8级","0/2988","强化第六本心法第一个技能，技能的伤害效果提升130％","set:TattooShow image:TattooShow_7",""}, 
["bn09"]={"暴怒","9级","0/3570","强化第六本心法第一个技能，技能的伤害效果提升140％","set:TattooShow image:TattooShow_7",""}, 
["bn10"]={"暴怒","10级","满级","强化第六本心法第一个技能，技能的伤害效果提升150％","set:TattooShow image:TattooShow_8",""}, 
}	

local b ,c ,d="","",""
if StrDW ==nil or StrDW =="" then 
return 0,0,0
end 
local ax,ay,str,str1 = string.find(StrDW,"&DW("..string.rep("%w",4)..")("..string.rep("%w",4)..")")
 if ax ==nil or ay ==nil or str==nil then
return 0,0,0
end
if g_XieZi_DwStr[str] == nil then
return 0,0,0	
end	

if g_XieZi_DwStr[str] ~= nil and g_XieZi_DwStr[str1] == nil then
 b ="#cFF0000"..g_XieZi_DwStr[str][1].."雕纹"..g_XieZi_DwStr[str][2].."\n升级需要的材料数："..g_XieZi_DwStr[str][3].."\n"..g_XieZi_DwStr[str][4].."\n"
 c= g_XieZi_DwStr[str][5]
 d= 0
end 

if g_XieZi_DwStr[str] ~= nil and g_XieZi_DwStr[str1] ~= nil then
 b ="#cFF0000双级雕纹："..g_XieZi_DwStr[str][1].."·"..g_XieZi_DwStr[str1][1].."("..g_XieZi_DwStr[str][2].."·"..g_XieZi_DwStr[str1][2]..")\n升级所需："..g_XieZi_DwStr[str][1].."("..g_XieZi_DwStr[str][3]..") "..g_XieZi_DwStr[str1][1].."("..g_XieZi_DwStr[str1][3]..") \n双级·"..g_XieZi_DwStr[str][1].."："..g_XieZi_DwStr[str][4].."\n双级·"..g_XieZi_DwStr[str1][1].."："..g_XieZi_DwStr[str1][4].."\n"
 c= g_XieZi_DwStr[str][5]
 d= g_XieZi_DwStr[str1][5]
end 
return b,c,d
end	


function  TargetFrame_UpdateShow2DHead()
	TargetFrame_Head_2D:Show()
	TargetFrame_TypeFrame:Hide()
	TargetFrame_TypeFrame_2D:Show()
	TargetFrame:SetProperty("UnifiedSize","{{0.000000,320.000000},{0.000000,107.000000}");
	TargetFrame2_BG:SetProperty("Image","set:CommonFrame18 image:TragetFrame");
	TargetFrame2_BG:SetProperty("UnifiedPosition","{{1.000000,-285.000000},{0.000000,1.000000}}");
	TargetFrame2_Image:SetProperty("UnifiedPosition","{{0.000000,0.000000},{0.000000,12.000000}}");
	TargetFrame_DataBack:SetProperty("UnifiedPosition","{{0.000000,24.000000},{0.000000,28.000000}}");
	TargetFrame_DataBack2:SetProperty("UnifiedPosition","{{0.000000,24.000000},{0.000000,28.000000}}");
	TargetFrame_NameBar:SetProperty("UnifiedPosition","{{0.000000,27.000000},{0.000000,14.000000}}");
	TargetFrame_CampFrame:SetProperty("UnifiedPosition","{{0.000000,100.000000},{0.000000,57.000000}}");
	TargetFrame_LevelText:SetProperty("UnifiedPosition","{{0.000000,164.000000},{0.000000,56.000000}}");
	TargetFrame_TypeIcon:SetProperty("UnifiedPosition","{{0.000000,192.000000},{0.000000,55.000000}}");
end