--GM内部工具
local g_ItemExchange_Frame_UnifiedPosition;
function ItemExchange_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	this:RegisterEvent("PACKAGE_ITEM_CHANGED")
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- 离开场景
end

function ItemExchange_OnLoad()
	g_ItemExchange_Frame_UnifiedPosition=ItemExchange_Frame:GetProperty("UnifiedPosition");
end


function ItemExchange_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200428") then
		--SetNotifyTip("被调用了");
		--ItemExchange_Init()
		this:Show();
	end
	if (event == "ADJEST_UI_POS" ) then
		ItemExchange_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		ItemExchange_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        this:Hide()	
	elseif (event == "UI_COMMAND" and arg0 == "20200103" and this:IsVisible()) then
		SetNotifyTip("这里是"..arg1);
		ItemExchange_Update(arg1)
	end
end

function ItemExchange_Update(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")

	if theAction:GetID() ~= 0 then
		ItemExchange_Object:SetActionItem(theAction:GetID())
		LifeAbility:Lock_Packet_Item(index, 1)
	end
end

function ItemExchange_Resume_Equip()
	--SetNotifyTip("右键了");
end



function ItemExchange_yuanbao(index)--1增加 2减少
    local nNum = ItemExchange_yuanbaoEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,1);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();	
end

function ItemExchange_item(index)--1增加 2减少
    local nNum = ItemExchange_itemEdix:GetText()
	local nItiemNum = ItemExchange_itemEdixnum:GetText()
	if nItiemNum == nil then	return end
	if tonumber(nItiemNum)< 0 then return end
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,2);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_Parameter(3,tonumber(nItiemNum));
		Set_XSCRIPT_ParamCount(4);
    Send_XSCRIPT();	
end

function ItemExchange_money(index)--1增加 2减少
    local nNum = ItemExchange_moneyEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,3);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();	
end

function ItemExchange_bindyuanbao(index)--1增加 2减少
    local nNum = ItemExchange_bindyuanbaoEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,4);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();
end

function ItemExchange_level(index)--1增加 2减少
    local nNum = ItemExchange_levelEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,5);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();
end


function ItemExchange_Frame_On_ResetPos()
	ItemExchange_Frame:SetProperty("UnifiedPosition", g_ItemExchange_Frame_UnifiedPosition);
end
