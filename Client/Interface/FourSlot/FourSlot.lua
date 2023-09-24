--GM�ڲ�����
local g_FourSlot_Frame_UnifiedPosition;
local g_FourSlot_Item = -1

function FourSlot_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	--Ԫ��
	this:RegisterEvent("UPDATE_YUANBAO");
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- �뿪����
end

function FourSlot_OnLoad()
	g_FourSlot_Frame_UnifiedPosition=FourSlot_Frame:GetProperty("UnifiedPosition");
end


function FourSlot_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200431") then
		--SetNotifyTip("��������");
		--FourSlot_Init()
		this:Show();
		FourSlot_UpdateBasic()
		-- FourSlot_UpdateBasic2(0)
	end
	if (event == "ADJEST_UI_POS" ) then
		FourSlot_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		FourSlot_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        this:Hide()	
	elseif (event == "UI_COMMAND" and arg0 == "20200103" and this:IsVisible()) then
		--SetNotifyTip("������"..arg1);
		FourSlot_Update(arg1)
	elseif (event == "UI_COMMAND" and arg0 == "20200429" and this:IsVisible()) then
		--SetNotifyTip("������������");
		local mode = Get_XParam_INT(0)
		local money = Get_XParam_INT(1)
		SetNotifyTip("mode:"..mode.." money:"..money);
		if mode == 0 then
			FourSlot_UpdateBasic2(money)
		elseif mode == 1 then
			FourSlot_UpdateBasic3(money)
		end
	elseif (event == "UPDATE_YUANBAO") then
		FourSlot_UpdateBasic()
	end
end

function FourSlot_Update(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")
	local theItem = PlayerPackage:GetItemTableIndex(index)
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		if g_FourSlot_Item ~= -1 then
			LifeAbility:Lock_Packet_Item(g_FourSlot_Item, 0)
		end
		--SetNotifyTip("�����Ʒ��"..theItem.."������"..number);
		SendToServer(theItem,number)
		FourSlot_Object:SetActionItem(theAction:GetID())
		LifeAbility:Lock_Packet_Item(index, 1)
		g_FourSlot_Item = index
	else
		--SetNotifyTip("�����Ʒ�ǿյ�");
		FourSlot_Clear()
	end
end 

function SendToServer(index,number)
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200103));
	Set_XSCRIPT_Parameter(1,tonumber(0));
	Set_XSCRIPT_Parameter(2,tonumber(index));
	Set_XSCRIPT_Parameter(3,tonumber(number));
	Set_XSCRIPT_ParamCount( 4 );				-- ��������
	Send_XSCRIPT()  
end

function SendToServer2(index,number)
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200103));
	Set_XSCRIPT_Parameter(1,tonumber(1));
	Set_XSCRIPT_Parameter(2,tonumber(index));
	Set_XSCRIPT_Parameter(3,tonumber(number));
	Set_XSCRIPT_ParamCount( 4 );				-- ��������
	Send_XSCRIPT()  
end

--=========================================================
-- ���ý���
--=========================================================
function FourSlot_Clear()
	if g_FourSlot_Item ~= -1 then
		FourSlot_Object:SetActionItem(-1)
		LifeAbility:Lock_Packet_Item(g_FourSlot_Item, 0)
		g_FourSlot_Item = -1
	end
end

function FourSlot_Resume_Equip()
	--SetNotifyTip("�Ҽ���");
	FourSlot_Clear()
end

function FourSlot_Submit()
	local index = g_FourSlot_Item
	local theAction = EnumAction(index, "packageitem")
	local theItem = PlayerPackage:GetItemTableIndex(index)
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		LifeAbility:Lock_Packet_Item(index, 0)
		FourSlot_Clear()
		FourSlot_UpdateBasic2(0)
		SendToServer2(theItem,number)
	else
		SetNotifyTip("�����Ʒ�ǿյ�");
	end
end


function FourSlot_Frame_On_ResetPos()
	FourSlot_Frame:SetProperty("UnifiedPosition", g_FourSlot_Frame_UnifiedPosition);
end


function FourSlot_UpdateBasic()
	FourSlot_SelfYuanbao:SetText(tostring(Player:GetData("YUANBAO")));
end

function FourSlot_UpdateBasic2(money)
	FourSlot_RewardYuanbao:SetText(tostring(money));
	FourSlot_RewardMoney:SetProperty("MoneyNumber", tostring(0))
end

function FourSlot_UpdateBasic3(money)
	FourSlot_RewardMoney:SetProperty("MoneyNumber", tostring(money))
	FourSlot_RewardYuanbao:SetText(tostring(0));
end

--=========================================================
-- ��������
--=========================================================
function FourSlot_OnHiden()
	--SetNotifyTip("������");
	FourSlot_Clear()
	this:Hide();
	return
end