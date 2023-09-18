--GM内部工具
local g_VIP_EquipItem_Frame_UnifiedPosition;
function VIP_EquipItem_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- 离开场景
end

function VIP_EquipItem_OnLoad()
	g_VIP_EquipItem_Frame_UnifiedPosition=VIP_EquipItem_Frame:GetProperty("UnifiedPosition");
end


function VIP_EquipItem_OnEvent(event)
	
	if(event == "UI_COMMAND" and arg0 == "20200427") then
		--VIP_EquipItem_Init()
		this:Show();
	end
	if (event == "ADJEST_UI_POS" ) then
		VIP_EquipItem_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		VIP_EquipItem_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        this:Hide()	
	end
end



function VIP_EquipItem_yuanbao(index)--1增加 2减少
    local nNum = VIP_EquipItem_yuanbaoEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,1);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();	
end

function VIP_EquipItem_item(index)--1增加 2减少
    local nNum = VIP_EquipItem_itemEdix:GetText()
	local nItiemNum = VIP_EquipItem_itemEdixnum:GetText()
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

function VIP_EquipItem_money(index)--1增加 2减少
    local nNum = VIP_EquipItem_moneyEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,3);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();	
end

function VIP_EquipItem_bindyuanbao(index)--1增加 2减少
    local nNum = VIP_EquipItem_bindyuanbaoEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,4);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();
end

function VIP_EquipItem_level(index)--1增加 2减少
    local nNum = VIP_EquipItem_levelEdix:GetText()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("GMToolType");
		Set_XSCRIPT_ScriptID(070051);
		Set_XSCRIPT_Parameter(0,5);
		Set_XSCRIPT_Parameter(1,index);
		Set_XSCRIPT_Parameter(2,tonumber(nNum));
		Set_XSCRIPT_ParamCount(3);
    Send_XSCRIPT();
end


function VIP_EquipItem_Frame_On_ResetPos()
	VIP_EquipItem_Frame:SetProperty("UnifiedPosition", g_VIP_EquipItem_Frame_UnifiedPosition);
end
