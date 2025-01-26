--GM�ڲ�����
local g_ItemExchange_Frame_UnifiedPosition;
local g_ItemExchange_Item = -1

function ItemExchange_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	--Ԫ��
	this:RegisterEvent("UPDATE_YUANBAO");
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- �뿪����
end

function ItemExchange_OnLoad()
	g_ItemExchange_Frame_UnifiedPosition=ItemExchange_Frame:GetProperty("UnifiedPosition");
end


function ItemExchange_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200428") then
		--SetNotifyTip("��������");
		--ItemExchange_Init()
		this:Show();
		ItemExchange_UpdateBasic()
		ItemExchange_UpdateBasic2(0)
	end
	if (event == "ADJEST_UI_POS" ) then
		ItemExchange_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		ItemExchange_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        this:Hide()	
	elseif (event == "UI_COMMAND" and arg0 == "20200103" and this:IsVisible()) then
		--SetNotifyTip("������"..arg1);
		ItemExchange_Update(arg1)
	elseif (event == "UI_COMMAND" and arg0 == "20200429" and this:IsVisible()) then
		--SetNotifyTip("������������");
		local mode = Get_XParam_INT(0)
		local money = Get_XParam_INT(1)
		SetNotifyTip("mode:"..mode.." money:"..money);
		if mode == 0 then
			ItemExchange_UpdateBasic2(money)
		elseif mode == 1 then
			ItemExchange_UpdateBasic3(money)
		end
	elseif (event == "UPDATE_YUANBAO") then
		ItemExchange_UpdateBasic()
	end
end

function ItemExchange_Update(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")
	local theItem = PlayerPackage:GetItemTableIndex(index)
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		if g_ItemExchange_Item ~= -1 then
			LifeAbility:Lock_Packet_Item(g_ItemExchange_Item, 0)
		end
		SetNotifyTip("�����Ʒ��"..theItem.."������"..number);
		SendToServer_1(theItem,number)
		ItemExchange_Object:SetActionItem(theAction:GetID())
		LifeAbility:Lock_Packet_Item(index, 1)
		g_ItemExchange_Item = index
	else
		--SetNotifyTip("�����Ʒ�ǿյ�");
		ItemExchange_Clear()
	end
end 

function SendToServer_1(index,number)
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

function SendToServer2_1(index,number)
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
function ItemExchange_Clear()
	if g_ItemExchange_Item ~= -1 then
		ItemExchange_Object:SetActionItem(-1)
		LifeAbility:Lock_Packet_Item(g_ItemExchange_Item, 0)
		g_ItemExchange_Item = -1
	end
end

function ItemExchange_Resume_Equip()
	--SetNotifyTip("�Ҽ���");
	ItemExchange_Clear()
end

function ItemExchange_Submit()
	local index = g_ItemExchange_Item
	local theAction = EnumAction(index, "packageitem")
	local theItem = PlayerPackage:GetItemTableIndex(index)
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		LifeAbility:Lock_Packet_Item(index, 0)
		ItemExchange_Clear()
		ItemExchange_UpdateBasic2(0)
		SendToServer2_1(theItem,number)
	else
		SetNotifyTip("�����Ʒ�ǿյ�");
	end
end


function ItemExchange_Frame_On_ResetPos()
	ItemExchange_Frame:SetProperty("UnifiedPosition", g_ItemExchange_Frame_UnifiedPosition);
end


function ItemExchange_UpdateBasic()
	ItemExchange_SelfYuanbao:SetText(tostring(Player:GetData("YUANBAO")));
end

function ItemExchange_UpdateBasic2(money)
	ItemExchange_RewardYuanbao:SetText(tostring(money));
	ItemExchange_RewardMoney:SetProperty("MoneyNumber", tostring(0))
end

function ItemExchange_UpdateBasic3(money)
	ItemExchange_RewardMoney:SetProperty("MoneyNumber", tostring(money))
	ItemExchange_RewardYuanbao:SetText(tostring(0));
end

--=========================================================
-- ��������
--=========================================================
function ItemExchange_OnHiden()
	--SetNotifyTip("������");
	ItemExchange_Clear()
	this:Hide();
	return
end