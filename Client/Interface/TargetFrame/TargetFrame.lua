local strMenPaiName =
{
	"����",
	"����",
	"ؤ��",
	"�䵱",
	"����",
	"����",
	"����",
	"��ɽ",
	"��ң",
	"����",
	"Ľ��",
	"����",
	"����",
	"����",
	"����",
	"����",
	"����",
	"����",
	"����",
	"����",
	"ç��",
	"����",
	"����",
	"����",
	"����",
	"����",
	"ԽŮ",
	"Խ��",
	"����",
	"Ұ��",
	"����",
	"��ħ",
	"����",
	"����",
	"",
	"",
	"",
	"",
};

local nID_TaoHuaDao = 13 --�һ��� 2019-11-26 17:29:10 ��ң��
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
	this:RegisterEvent("UI_SHOW_2DHEAD")	--��ʾ2Dͷ��
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
		
		--AxTrace(0,0,"��main target");
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
	-- ��target���Լ���ʱ���޷�ˢ�¡�
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
--��ǰ���ͳһ��ʾΪ��ɫ��������ö5��27���ĵ����ģ���Һ�NPC��ͬһ����
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
--����ж�Ŀ�����Ե����
	--���衱���ˡ����������ޡ���ç�����ޡ�������
	local nNpcType = Target:GetData("TYPE" );
	TargetFrame_TypeIcon:SetProperty("SetCurrentImage","TypeName"..tostring( nNpcType ) );

	--1.�Ѻ�
	--2.����
	--3.����
	--4.��ͨ����
	--5.��Ӣ����
	--6.�з�boss
	local nNpcRelation = Target:GetData("RELATION" );
	TargetFrame_TypeFrame:SetProperty("SetCurrentImage","TypeFrame"..tostring( nNpcRelation ) );
	TargetFrame_TypeFrame_2D:SetProperty("SetCurrentImage","TypeFrame"..tostring( nNpcRelation ) );

	--��������
	local nNpcReputation = Target:GetData("MEMPAI" );
	if( nNpcReputation == -1 ) then
		TargetFrame_CampFrame1:Hide();
	else
		TargetFrame_CampFrame1:Show();
		--ע�⣺�����Ǻ����ε���д��������ֵ��ο��ͻ��˴�����
		--Client\Game\Interface\GMGameInterface_Script_Character.cpp
		--INT Character::GetData(LuaPlus::LuaState* state) ����
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

	--ͼ���ղ���ʾ
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

	AxTrace( 0,0,"�ȼ���Ϊ"..tostring( level ) );
--������ö5��27�ղ߻��ĵ��޸�
--	if( level > 12 ) then
--		txtColor ="#R";
--	elseif( level > 4 ) then
--		txtColor ="#cff9000";
--		--��ǰ��c9ccf00��������ҫ�ṩ��.jpg�޸�
--	elseif( level > -4 ) then
--		txtColor="#Y";
--	elseif( level > -12 ) then
--		txtColor="#G"
--	else
--		txtColor="#c4b4b4b";
--������ҫ�����޸�
--		txtColor="#c240c0c";
--	end

--������ö5��27�ղ߻��ĵ��޸�����
	if( level > 5 ) then
		txtColor ="#R";
	elseif( level > 2 ) then
		txtColor ="#cff9000";
		--��ǰ��c9ccf00��������ҫ�ṩ��.jpg�޸�
	elseif( level >= -2 ) then
		txtColor="#Y";
	elseif( level >= -5 ) then
		txtColor="#W"
	else
--		txtColor="#c4b4b4b";
--������ҫ�����޸�
		txtColor="#W";
	end



	TargetFrame_LevelText:SetText(txtColor .. tostring(Target:GetData("LEVEL" )));

end

function TargetFrame_ArtLayout_Click()
	ShowContexMenu("other_player");
end

-- ��ʾ�Ҽ��˵�
function TargetFrame_Show_Menu_Func()

	--AxTrace( 0,0,"Target �Ҽ��˵�!");
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
	PushDebugMessage("�ù�����δ����");

end;

function TargetFrame_Shoujitujian_Func()
         ShoujiTargetTujian();
         SendBullet(169); --������Ч
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
["ti01"]={"����","1��","0/2","����+10","set:TattooShow image:TattooShow_1",""},
["ti02"]={"����","2��","0/9","����+20","set:TattooShow image:TattooShow_1",""}, 
["ti03"]={"����","3��","0/50","����+50","set:TattooShow image:TattooShow_1",""}, 
["ti04"]={"����","4��","0/87","����+80","set:TattooShow image:TattooShow_2",""}, 
["ti05"]={"����","5��","0/165","����+180","set:TattooShow image:TattooShow_2",""}, 
["ti06"]={"����","6��","0/284","����+270","set:TattooShow image:TattooShow_2",""}, 
["ti07"]={"����","7��","0/811","����+560","set:TattooShow image:TattooShow_3",""}, 
["ti08"]={"����","8��","0/2988","����+810","set:TattooShow image:TattooShow_3",""}, 
["ti09"]={"����","9��","0/3570","����+1200","set:TattooShow image:TattooShow_3",""}, 
["ti10"]={"����","10��","����","����+2100","set:TattooShow image:TattooShow_4",""}, 

["ll01"]={"����","1��","0/2","����+10","set:TattooShow image:TattooShow_1",""},  
["ll02"]={"����","2��","0/9","����+20","set:TattooShow image:TattooShow_1",""}, 
["ll03"]={"����","3��","0/50","����+50","set:TattooShow image:TattooShow_1",""}, 
["ll04"]={"����","4��","0/87","����+80","set:TattooShow image:TattooShow_2",""}, 
["ll05"]={"����","5��","0/165","����+180","set:TattooShow image:TattooShow_2",""}, 
["ll06"]={"����","6��","0/284","����+270","set:TattooShow image:TattooShow_2",""}, 
["ll07"]={"����","7��","0/811","����+560","set:TattooShow image:TattooShow_3",""}, 
["ll08"]={"����","8��","0/2988","����+810","set:TattooShow image:TattooShow_3",""}, 
["ll09"]={"����","9��","0/3570","����+1200","set:TattooShow image:TattooShow_3",""}, 
["ll10"]={"����","10��","����","����+2100","set:TattooShow image:TattooShow_4",""}, 

["lt01"]={"����","1��","0/2","����+10","set:TattooShow image:TattooShow_1",""},  
["lt02"]={"����","2��","0/9","����+20","set:TattooShow image:TattooShow_1",""}, 
["lt03"]={"����","3��","0/50","����+50","set:TattooShow image:TattooShow_1",""}, 
["lt04"]={"����","4��","0/87","����+80","set:TattooShow image:TattooShow_2",""}, 
["lt05"]={"����","5��","0/165","����+180","set:TattooShow image:TattooShow_2",""}, 
["lt06"]={"����","6��","0/284","����+270","set:TattooShow image:TattooShow_2",""}, 
["lt07"]={"����","7��","0/811","����+560","set:TattooShow image:TattooShow_3",""}, 
["lt08"]={"����","8��","0/2988","����+810","set:TattooShow image:TattooShow_3",""}, 
["lt09"]={"����","9��","0/3570","����+1200","set:TattooShow image:TattooShow_3",""}, 
["lt10"]={"����","10��","����","����+2100","set:TattooShow image:TattooShow_4",""}, 

["sf01"]={"��","1��","0/2","��+10","set:TattooShow image:TattooShow_1",""},  
["sf02"]={"��","2��","0/9","��+20","set:TattooShow image:TattooShow_1",""}, 
["sf03"]={"��","3��","0/50","��+50","set:TattooShow image:TattooShow_1",""}, 
["sf04"]={"��","4��","0/87","��+80","set:TattooShow image:TattooShow_2",""}, 
["sf05"]={"��","5��","0/165","��+180","set:TattooShow image:TattooShow_2",""}, 
["sf06"]={"��","6��","0/284","��+270","set:TattooShow image:TattooShow_2",""}, 
["sf07"]={"��","7��","0/811","��+560","set:TattooShow image:TattooShow_3",""}, 
["sf08"]={"��","8��","0/2988","��+810","set:TattooShow image:TattooShow_3",""}, 
["sf09"]={"��","9��","0/3570","��+1200","set:TattooShow image:TattooShow_3",""}, 
["sf10"]={"��","10��","����","��+2100","set:TattooShow image:TattooShow_4",""}, 


["bg01"]={"����","1��","0/2","������+10","set:TattooShow image:TattooShow_9",""},  
["bg02"]={"����","2��","0/9","������+20","set:TattooShow image:TattooShow_9",""}, 
["bg03"]={"����","3��","0/50","������+50","set:TattooShow image:TattooShow_9",""}, 
["bg04"]={"����","4��","0/87","������+100","set:TattooShow image:TattooShow_10",""}, 
["bg05"]={"����","5��","0/165","������+210","set:TattooShow image:TattooShow_10",""}, 
["bg06"]={"����","6��","0/284","������+360","set:TattooShow image:TattooShow_10",""}, 
["bg07"]={"����","7��","0/811","������+640","set:TattooShow image:TattooShow_11",""}, 
["bg08"]={"����","8��","0/2988","������+1080","set:TattooShow image:TattooShow_11",""}, 
["bg09"]={"����","9��","0/3570","������+1600","set:TattooShow image:TattooShow_11",""}, 
["bg10"]={"����","10��","����","������+2700","set:TattooShow image:TattooShow_12",""}, 

["hg01"]={"��","1��","0/2","�𹥻�+10","set:TattooShow image:TattooShow_9",""},  
["hg02"]={"��","2��","0/9","�𹥻�+20","set:TattooShow image:TattooShow_9",""}, 
["hg03"]={"��","3��","0/50","�𹥻�+50","set:TattooShow image:TattooShow_9",""}, 
["hg04"]={"��","4��","0/87","�𹥻�+100","set:TattooShow image:TattooShow_10",""}, 
["hg05"]={"��","5��","0/165","�𹥻�+210","set:TattooShow image:TattooShow_10",""}, 
["hg06"]={"��","6��","0/284","�𹥻�+360","set:TattooShow image:TattooShow_10",""}, 
["hg07"]={"��","7��","0/811","�𹥻�+640","set:TattooShow image:TattooShow_11",""}, 
["hg08"]={"��","8��","0/2988","�𹥻�+1080","set:TattooShow image:TattooShow_11",""}, 
["hg09"]={"��","9��","0/3570","�𹥻�+1600","set:TattooShow image:TattooShow_11",""}, 
["hg10"]={"��","10��","����","�𹥻�+2700","set:TattooShow image:TattooShow_12",""}, 

["xg01"]={"����","1��","0/2","������+10","set:TattooShow image:TattooShow_9",""},  
["xg02"]={"����","2��","0/9","������+20","set:TattooShow image:TattooShow_9",""}, 
["xg03"]={"����","3��","0/50","������+50","set:TattooShow image:TattooShow_9",""}, 
["xg04"]={"����","4��","0/87","������+100","set:TattooShow image:TattooShow_10",""}, 
["xg05"]={"����","5��","0/165","������+210","set:TattooShow image:TattooShow_10",""}, 
["xg06"]={"����","6��","0/284","������+360","set:TattooShow image:TattooShow_10",""}, 
["xg07"]={"����","7��","0/811","������+640","set:TattooShow image:TattooShow_11",""}, 
["xg08"]={"����","8��","0/2988","������+1080","set:TattooShow image:TattooShow_11",""}, 
["xg09"]={"����","9��","0/3570","������+1600","set:TattooShow image:TattooShow_11",""}, 
["xg10"]={"����","10��","����","������+2700","set:TattooShow image:TattooShow_12",""}, 

["dg01"]={"����","1��","0/2","������+10","set:TattooShow image:TattooShow_9",""},  
["dg02"]={"����","2��","0/9","������+20","set:TattooShow image:TattooShow_9",""}, 
["dg03"]={"����","3��","0/50","������+50","set:TattooShow image:TattooShow_9",""}, 
["dg04"]={"����","4��","0/87","������+100","set:TattooShow image:TattooShow_10",""}, 
["dg05"]={"����","5��","0/165","������+210","set:TattooShow image:TattooShow_10",""}, 
["dg06"]={"����","6��","0/284","������+360","set:TattooShow image:TattooShow_10",""}, 
["dg07"]={"����","7��","0/811","������+640","set:TattooShow image:TattooShow_11",""}, 
["dg08"]={"����","8��","0/2988","������+1080","set:TattooShow image:TattooShow_11",""}, 
["dg09"]={"����","9��","0/3570","������+1600","set:TattooShow image:TattooShow_11",""}, 
["dg10"]={"����","10��","����","������+2700","set:TattooShow image:TattooShow_12",""}, 

["bj01"]={"������","1��","0/2","����Ŀ�����+8","set:TattooShow image:TattooShow_17",""},  
["bj02"]={"������","2��","0/9","����Ŀ�����+16","set:TattooShow image:TattooShow_17",""}, 
["bj03"]={"������","3��","0/50","����Ŀ�����+24","set:TattooShow image:TattooShow_17",""}, 
["bj04"]={"������","4��","0/87","����Ŀ�����+32","set:TattooShow image:TattooShow_18",""}, 
["bj05"]={"������","5��","0/165","����Ŀ�����+40","set:TattooShow image:TattooShow_18",""}, 
["bj06"]={"������","6��","0/284","����Ŀ�����+48","set:TattooShow image:TattooShow_18",""}, 
["bj07"]={"������","7��","0/811","����Ŀ�����+56","set:TattooShow image:TattooShow_19",""}, 
["bj08"]={"������","8��","0/2988","����Ŀ�����+64","set:TattooShow image:TattooShow_19",""}, 
["bj09"]={"������","9��","0/3570","����Ŀ�����+72","set:TattooShow image:TattooShow_19",""}, 
["bj10"]={"������","10��","����","����Ŀ�����+80","set:TattooShow image:TattooShow_20",""}, 

["hj01"]={"����","1��","0/2","����Ŀ���+8","set:TattooShow image:TattooShow_17",""},  
["hj02"]={"����","2��","0/9","����Ŀ���+16","set:TattooShow image:TattooShow_17",""}, 
["hj03"]={"����","3��","0/50","����Ŀ���+24","set:TattooShow image:TattooShow_17",""}, 
["hj04"]={"����","4��","0/87","����Ŀ���+32","set:TattooShow image:TattooShow_18",""}, 
["hj05"]={"����","5��","0/165","����Ŀ���+40","set:TattooShow image:TattooShow_18",""}, 
["hj06"]={"����","6��","0/284","����Ŀ���+48","set:TattooShow image:TattooShow_18",""}, 
["hj07"]={"����","7��","0/811","����Ŀ���+56","set:TattooShow image:TattooShow_19",""}, 
["hj08"]={"����","8��","0/2988","����Ŀ���+64","set:TattooShow image:TattooShow_19",""}, 
["hj09"]={"����","9��","0/3570","����Ŀ���+72","set:TattooShow image:TattooShow_19",""}, 
["hj10"]={"����","10��","����","����Ŀ���+80","set:TattooShow image:TattooShow_20",""}, 

["xj01"]={"������","1��","0/2","����Ŀ������+8","set:TattooShow image:TattooShow_17",""},  
["xj02"]={"������","2��","0/9","����Ŀ������+16","set:TattooShow image:TattooShow_17",""}, 
["xj03"]={"������","3��","0/50","����Ŀ������+24","set:TattooShow image:TattooShow_17",""}, 
["xj04"]={"������","4��","0/87","����Ŀ������+32","set:TattooShow image:TattooShow_18",""}, 
["xj05"]={"������","5��","0/165","����Ŀ������+40","set:TattooShow image:TattooShow_18",""}, 
["xj06"]={"������","6��","0/284","����Ŀ������+48","set:TattooShow image:TattooShow_18",""}, 
["xj07"]={"������","7��","0/811","����Ŀ������+56","set:TattooShow image:TattooShow_19",""}, 
["xj08"]={"������","8��","0/2988","����Ŀ������+64","set:TattooShow image:TattooShow_19",""}, 
["xj09"]={"������","9��","0/3570","����Ŀ������+72","set:TattooShow image:TattooShow_19",""}, 
["xj10"]={"������","10��","����","����Ŀ������+80","set:TattooShow image:TattooShow_20",""}, 

["dj01"]={"������","1��","0/2","����Ŀ�궾��+8","set:TattooShow image:TattooShow_17",""},  
["dj02"]={"������","2��","0/9","����Ŀ�궾��+16","set:TattooShow image:TattooShow_17",""}, 
["dj03"]={"������","3��","0/50","����Ŀ�궾��+24","set:TattooShow image:TattooShow_17",""}, 
["dj04"]={"������","4��","0/87","����Ŀ�궾��+32","set:TattooShow image:TattooShow_18",""}, 
["dj05"]={"������","5��","0/165","����Ŀ�궾��+40","set:TattooShow image:TattooShow_18",""}, 
["dj06"]={"������","6��","0/284","����Ŀ�궾��+48","set:TattooShow image:TattooShow_18",""}, 
["dj07"]={"������","7��","0/811","����Ŀ�궾��+56","set:TattooShow image:TattooShow_19",""}, 
["dj08"]={"������","8��","0/2988","����Ŀ�궾��+64","set:TattooShow image:TattooShow_19",""}, 
["dj09"]={"������","9��","0/3570","����Ŀ�궾��+72","set:TattooShow image:TattooShow_19",""}, 
["dj10"]={"������","10��","����","����Ŀ�궾��+80","set:TattooShow image:TattooShow_20",""}, 

["bk01"]={"����","1��","0/2","������+8","set:TattooShow image:TattooShow_13",""},  
["bk02"]={"����","2��","0/9","������+16","set:TattooShow image:TattooShow_13",""}, 
["bk03"]={"����","3��","0/50","������+24","set:TattooShow image:TattooShow_13",""}, 
["bk04"]={"����","4��","0/87","������+32","set:TattooShow image:TattooShow_14",""}, 
["bk05"]={"����","5��","0/165","������+40","set:TattooShow image:TattooShow_14",""}, 
["bk06"]={"����","6��","0/284","������+48","set:TattooShow image:TattooShow_14",""}, 
["bk07"]={"����","7��","0/811","������+56","set:TattooShow image:TattooShow_15",""}, 
["bk08"]={"����","8��","0/2988","������+64","set:TattooShow image:TattooShow_15",""}, 
["bk09"]={"����","9��","0/3570","������+72","set:TattooShow image:TattooShow_15",""}, 
["bk10"]={"����","10��","����","������+80","set:TattooShow image:TattooShow_16",""}, 

["hk01"]={"��","1��","0/2","����+8","set:TattooShow image:TattooShow_13",""},  
["hk02"]={"��","2��","0/9","����+16","set:TattooShow image:TattooShow_13",""}, 
["hk03"]={"��","3��","0/50","����+24","set:TattooShow image:TattooShow_13",""}, 
["hk04"]={"��","4��","0/87","����+32","set:TattooShow image:TattooShow_14",""}, 
["hk05"]={"��","5��","0/165","����+40","set:TattooShow image:TattooShow_14",""}, 
["hk06"]={"��","6��","0/284","����+48","set:TattooShow image:TattooShow_14",""}, 
["hk07"]={"��","7��","0/811","����+56","set:TattooShow image:TattooShow_15",""}, 
["hk08"]={"��","8��","0/2988","����+64","set:TattooShow image:TattooShow_15",""}, 
["hk09"]={"��","9��","0/3570","����+72","set:TattooShow image:TattooShow_15",""}, 
["hk10"]={"��","10��","����","����+80","set:TattooShow image:TattooShow_16",""}, 

["xk01"]={"����","1��","0/2","������+8","set:TattooShow image:TattooShow_13",""},  
["xk02"]={"����","2��","0/9","������+16","set:TattooShow image:TattooShow_13",""}, 
["xk03"]={"����","3��","0/50","������+24","set:TattooShow image:TattooShow_13",""}, 
["xk04"]={"����","4��","0/87","������+32","set:TattooShow image:TattooShow_14",""}, 
["xk05"]={"����","5��","0/165","������+40","set:TattooShow image:TattooShow_14",""}, 
["xk06"]={"����","6��","0/284","������+48","set:TattooShow image:TattooShow_14",""}, 
["xk07"]={"����","7��","0/811","������+56","set:TattooShow image:TattooShow_15",""}, 
["xk08"]={"����","8��","0/2988","������+64","set:TattooShow image:TattooShow_15",""}, 
["xk09"]={"����","9��","0/3570","������+72","set:TattooShow image:TattooShow_15",""}, 
["xk10"]={"����","10��","����","������+80","set:TattooShow image:TattooShow_16",""}, 

["dk01"]={"����","1��","0/2","������+8","set:TattooShow image:TattooShow_13",""},  
["dk02"]={"����","2��","0/9","������+16","set:TattooShow image:TattooShow_13",""}, 
["dk03"]={"����","3��","0/50","������+24","set:TattooShow image:TattooShow_13",""}, 
["dk04"]={"����","4��","0/87","������+32","set:TattooShow image:TattooShow_14",""}, 
["dk05"]={"����","5��","0/165","������+40","set:TattooShow image:TattooShow_14",""}, 
["dk06"]={"����","6��","0/284","������+48","set:TattooShow image:TattooShow_14",""}, 
["dk07"]={"����","7��","0/811","������+56","set:TattooShow image:TattooShow_15",""}, 
["dk08"]={"����","8��","0/2988","������+64","set:TattooShow image:TattooShow_15",""}, 
["dk09"]={"����","9��","0/3570","������+72","set:TattooShow image:TattooShow_15",""}, 
["dk10"]={"����","10��","����","������+80","set:TattooShow image:TattooShow_16",""}, 

["ww01"]={"����","1��","0/2","ǿ����һ���ķ���һ�����ܣ������˺�15","set:TattooShow image:TattooShow_5",""},  
["ww02"]={"����","2��","0/9","ǿ����һ���ķ���һ�����ܣ������˺�30","set:TattooShow image:TattooShow_5",""}, 
["ww03"]={"����","3��","0/50","ǿ����һ���ķ���һ�����ܣ������˺�45","set:TattooShow image:TattooShow_5",""}, 
["ww04"]={"����","4��","0/87","ǿ����һ���ķ���һ�����ܣ������˺�90","set:TattooShow image:TattooShow_6",""}, 
["ww05"]={"����","5��","0/165","ǿ����һ���ķ���һ�����ܣ������˺�150","set:TattooShow image:TattooShow_6",""}, 
["ww06"]={"����","6��","0/284","ǿ����һ���ķ���һ�����ܣ������˺�180","set:TattooShow image:TattooShow_6",""}, 
["ww07"]={"����","7��","0/811","ǿ����һ���ķ���һ�����ܣ������˺�195","set:TattooShow image:TattooShow_7",""}, 
["ww08"]={"����","8��","0/2988","ǿ����һ���ķ���һ�����ܣ������˺�210","set:TattooShow image:TattooShow_7",""}, 
["ww09"]={"����","9��","0/3570","ǿ����һ���ķ���һ�����ܣ������˺�270","set:TattooShow image:TattooShow_7",""}, 
["ww10"]={"����","10��","����","ǿ����һ���ķ���һ�����ܣ������˺�360","set:TattooShow image:TattooShow_8",""}, 

["mx01"]={"ڤ��","1��","0/2","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������10��","set:TattooShow image:TattooShow_5",""},  
["mx02"]={"ڤ��","2��","0/9","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������20��","set:TattooShow image:TattooShow_5",""}, 
["mx03"]={"ڤ��","3��","0/50","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������40��","set:TattooShow image:TattooShow_5",""}, 
["mx04"]={"ڤ��","4��","0/87","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������70��","set:TattooShow image:TattooShow_6",""}, 
["mx05"]={"ڤ��","5��","0/165","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������100��","set:TattooShow image:TattooShow_6",""}, 
["mx06"]={"ڤ��","6��","0/284","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������110��","set:TattooShow image:TattooShow_6",""}, 
["mx07"]={"ڤ��","7��","0/811","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������120��","set:TattooShow image:TattooShow_7",""}, 
["mx08"]={"ڤ��","8��","0/2988","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������130��","set:TattooShow image:TattooShow_7",""}, 
["mx09"]={"ڤ��","9��","0/3570","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������140��","set:TattooShow image:TattooShow_7",""}, 
["mx10"]={"ڤ��","10��","����","ǿ���ڶ����ķ���һ�����ܣ����ܵ��˺�Ч������150��","set:TattooShow image:TattooShow_8",""}, 

["yj01"]={"����","1��","0/2","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������10��","set:TattooShow image:TattooShow_5",""},  
["yj02"]={"����","2��","0/9","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������20��","set:TattooShow image:TattooShow_5",""}, 
["yj03"]={"����","3��","0/50","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������40��","set:TattooShow image:TattooShow_5",""}, 
["yj04"]={"����","4��","0/87","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������70��","set:TattooShow image:TattooShow_6",""}, 
["yj05"]={"����","5��","0/165","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������100��","set:TattooShow image:TattooShow_6",""}, 
["yj06"]={"����","6��","0/284","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������110��","set:TattooShow image:TattooShow_6",""}, 
["yj07"]={"����","7��","0/811","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������120��","set:TattooShow image:TattooShow_7",""}, 
["yj08"]={"����","8��","0/2988","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������130��","set:TattooShow image:TattooShow_7",""}, 
["yj09"]={"����","9��","0/3570","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������140��","set:TattooShow image:TattooShow_7",""}, 
["yj10"]={"����","10��","����","ǿ�����屾�ķ����������ܣ����ܵ��˺�Ч������150��","set:TattooShow image:TattooShow_8",""}, 

["bn01"]={"��ŭ","1��","0/2","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������10��","set:TattooShow image:TattooShow_5",""},  
["bn02"]={"��ŭ","2��","0/9","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������20��","set:TattooShow image:TattooShow_5",""}, 
["bn03"]={"��ŭ","3��","0/50","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������40��","set:TattooShow image:TattooShow_5",""}, 
["bn04"]={"��ŭ","4��","0/87","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������70��","set:TattooShow image:TattooShow_6",""}, 
["bn05"]={"��ŭ","5��","0/165","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������100��","set:TattooShow image:TattooShow_6",""}, 
["bn06"]={"��ŭ","6��","0/284","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������110��","set:TattooShow image:TattooShow_6",""}, 
["bn07"]={"��ŭ","7��","0/811","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������120��","set:TattooShow image:TattooShow_7",""}, 
["bn08"]={"��ŭ","8��","0/2988","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������130��","set:TattooShow image:TattooShow_7",""}, 
["bn09"]={"��ŭ","9��","0/3570","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������140��","set:TattooShow image:TattooShow_7",""}, 
["bn10"]={"��ŭ","10��","����","ǿ���������ķ���һ�����ܣ����ܵ��˺�Ч������150��","set:TattooShow image:TattooShow_8",""}, 
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
 b ="#cFF0000"..g_XieZi_DwStr[str][1].."����"..g_XieZi_DwStr[str][2].."\n������Ҫ�Ĳ�������"..g_XieZi_DwStr[str][3].."\n"..g_XieZi_DwStr[str][4].."\n"
 c= g_XieZi_DwStr[str][5]
 d= 0
end 

if g_XieZi_DwStr[str] ~= nil and g_XieZi_DwStr[str1] ~= nil then
 b ="#cFF0000˫�����ƣ�"..g_XieZi_DwStr[str][1].."��"..g_XieZi_DwStr[str1][1].."("..g_XieZi_DwStr[str][2].."��"..g_XieZi_DwStr[str1][2]..")\n�������裺"..g_XieZi_DwStr[str][1].."("..g_XieZi_DwStr[str][3]..") "..g_XieZi_DwStr[str1][1].."("..g_XieZi_DwStr[str1][3]..") \n˫����"..g_XieZi_DwStr[str][1].."��"..g_XieZi_DwStr[str][4].."\n˫����"..g_XieZi_DwStr[str1][1].."��"..g_XieZi_DwStr[str1][4].."\n"
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