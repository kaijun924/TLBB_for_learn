--GM�ڲ�����
local g_ShouGongChaiLiao_Frame_UnifiedPosition;
local current_pos = -1;
local current_mode = -1;

function ShouGongChaiLiao_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	--Ԫ��
	this:RegisterEvent("UNIT_MONEY");
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- �뿪����
end

function ShouGongChaiLiao_OnLoad()
	g_ShouGongChaiLiao_Frame_UnifiedPosition=ShouGongChaiLiao_Frame:GetProperty("UnifiedPosition");
end


function ShouGongChaiLiao_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200446") then
		--SetNotifyTip("���񽣱�������")
		--SetNotifyTip(item_str)
		--1�Ƕ�ʯ��2���͸3������4��������5�ǲ�Ƭ��6������(��itemlevel Ϊitemid)
		ShouGongChaiLiao_Level:AddTextItem("��ʯ" ,1)
		ShouGongChaiLiao_Level:AddTextItem("�͸�" ,2)
		ShouGongChaiLiao_Level:AddTextItem("����" ,3)
		ShouGongChaiLiao_Level:AddTextItem("����" ,4)
		ShouGongChaiLiao_Level:AddTextItem("��Ƭ" ,5)
		ShouGongChaiLiao_Level:AddTextItem("��ʯ" ,6)
		ShouGongChaiLiao_Level:AddTextItem("��/��" ,7)

		ShouGongChaiLiao_Level2:AddTextItem("1��" ,1)
		ShouGongChaiLiao_Level2:AddTextItem("2��" ,2)
		ShouGongChaiLiao_Level2:AddTextItem("3��" ,3)
		ShouGongChaiLiao_Level2:AddTextItem("4��" ,4)
		ShouGongChaiLiao_Level2:AddTextItem("5��" ,5)
		ShouGongChaiLiao_Level2:AddTextItem("6��" ,6)
		ShouGongChaiLiao_Level2:AddTextItem("7��" ,7)
		ShouGongChaiLiao_Level2:AddTextItem("8��" ,8)
		ShouGongChaiLiao_Level2:AddTextItem("9��" ,9)
		ShouGongChaiLiao_Level2:AddTextItem("10��" ,10)
		ShouGongChaiLiao_Level2:AddTextItem("11��" ,11)
		ShouGongChaiLiao_Level2:AddTextItem("12��" ,12)

		ShouGongChaiLiao_Level:SetCurrentSelect(0)
		ShouGongChaiLiao_Level2:SetCurrentSelect(0)

		ShouGongChaiLiao_SelfMoney:SetProperty("MoneyNumber",tostring(Player:GetData("MONEY")))
		this:Show();
	end
	if (event == "ADJEST_UI_POS" ) then
		ShouGongChaiLiao_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		ShouGongChaiLiao_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        ShouGongChaiLiao_OnHiden()	
	elseif (event == "UNIT_MONEY") then
		ShouGongChaiLiao_SelfMoney:SetProperty("MoneyNumber",tostring(Player:GetData("MONEY")))
	end
end

local x001027_lvToId = {}
x001027_lvToId[1] = 20103060
x001027_lvToId[2] = 20103072
x001027_lvToId[3] = 20103084
x001027_lvToId[4] = 20103096
x001027_lvToId[5] = 20103099
x001027_lvToId[6] = 20103000
x001027_lvToId[7] = 20105000


function ShouGongChaiLiao_Submit()
	local __txt, type = ShouGongChaiLiao_Level:GetCurrentSelect();
	local __txt2, level = ShouGongChaiLiao_Level2:GetCurrentSelect();

	if type >= 6 then
		level = x001027_lvToId[type] + level
		type = 6
	end
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200107));
	Set_XSCRIPT_Parameter(1,tonumber(type));
	Set_XSCRIPT_Parameter(2,tonumber(level));
	Set_XSCRIPT_ParamCount( 3 );				-- ��������
	Send_XSCRIPT()
end

local x001027_lvReplace = {}
x001027_lvReplace[1] = 1.1
x001027_lvReplace[2] = 0.9
x001027_lvReplace[3] = 0.9
x001027_lvReplace[4] = 0.85
x001027_lvReplace[5] = 0.8
x001027_lvReplace[6] = 0.75
x001027_lvReplace[7] = 0.8
x001027_lvReplace[8] = 0.9
x001027_lvReplace[9] = 1.3
x001027_lvReplace[10] = 2.4
x001027_lvReplace[11] = 1
x001027_lvReplace[12] = 1

function ShouGongChaiLiao_LineChanged()
	local __txt, type = ShouGongChaiLiao_Level:GetCurrentSelect();
	local __txt2, level = ShouGongChaiLiao_Level2:GetCurrentSelect();

	if type == 5 or type == 4 then
		if level > 3 then
			SetNotifyTip("��Ƭ������ֻ��ѡ��1-3��")
			ShouGongChaiLiao_Level2:SetCurrentSelect(0)
			ShouGongChaiLiao_Level2:SetText("1��") 
			return
		end
	end
	local cost = 0
	if type >= 1 and type <= 3  then
		cost = level * 100 * 200 * x001027_lvReplace[level]
	elseif type >= 4 and type <= 5 then
		cost = level * 100 * 200 * x001027_lvReplace[level + 7]
	elseif type >= 6 then
		cost = 3000 * 200
 	end
	ShouGongChaiLiao_RewardMoney:SetProperty("MoneyNumber",tostring(cost));

end



function ShouGongChaiLiao_OnHiden()
	ShouGongChaiLiao_Level:ResetList()
	ShouGongChaiLiao_Level2:ResetList()
	this:Hide();
end

function ShouGongChaiLiao_Frame_On_ResetPos()
	ShouGongChaiLiao_Frame:SetProperty("UnifiedPosition", g_ShouGongChaiLiao_Frame_UnifiedPosition);
end