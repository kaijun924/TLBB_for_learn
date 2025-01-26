--GMÄÚ²¿¹¤¾ß
local g_JunShenJian_Frame_UnifiedPosition;
local current_pos = -1;
local current_mode = -1;

function JunShenJian_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	--Ôª±¦
	this:RegisterEvent("UNIT_MONEY");
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- Àë¿ª³¡¾°
end

function JunShenJian_OnLoad()
	g_JunShenJian_Frame_UnifiedPosition=JunShenJian_Frame:GetProperty("UnifiedPosition");
end


function JunShenJian_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200445") then
		item_str = Get_XParam_STR(0)
		item_pos = Get_XParam_INT(0)
		--SetNotifyTip("¾üÉñ½£±»´¥·¢ÁË")
		JunShenJian_Set(item_pos)
		JunShenJian_GetNumber(item_str)
		--SetNotifyTip(item_str)
		JunShenJian_Level:AddTextItem("±ù¹¥»÷" ,0)
		JunShenJian_Level:AddTextItem("»ð¹¥»÷" ,1)
		JunShenJian_Level:AddTextItem("Ðþ¹¥»÷" ,2)
		JunShenJian_Level:AddTextItem("¶¾¹¥»÷" ,3)
		this:Show();
	end
	if (event == "ADJEST_UI_POS" ) then
		JunShenJian_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		JunShenJian_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        JunShenJian_OnHiden()	
	end
end

local numToChar = {[0]="±ù¹¥»÷",[1]="»ð¹¥»÷",[2]="Ðþ¹¥»÷",[3]="¶¾¹¥»÷"}

function JunShenJian_GetNumber(str)
	local mode,ice,fire,light,poison,_ = 0,0,0,0,0,0
	_,_,mode = string.find(str,"A(%d)")
	_,_,ice = string.find(str,"bg(%d+)")
	_,_,fire = string.find(str,"hg(%d+)")
	_,_,light = string.find(str,"xg(%d+)")
	_,_,poison = string.find(str,"dg(%d+)")
	JunShenJian_Level:SetText(numToChar[tonumber(mode)])
	JunShenJian_Perporty1:SetProperty("Text",ice)
	JunShenJian_Perporty2:SetProperty("Text",fire)
	JunShenJian_Perporty3:SetProperty("Text",light)
	JunShenJian_Perporty4:SetProperty("Text",poison)
	JunShenJian_Level:SetCurrentSelect(tonumber(mode))
	SetNotifyTip("mode:"..tostring(mode).." ice:"..tostring(ice).." fire:"..tostring(fire).." light:"..tostring(light).." poison:"..tostring(poison))

end

function JunShenJian_SetMode()
	local __txt, id = JunShenJian_Level:GetCurrentSelect();
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200106));
	Set_XSCRIPT_Parameter(1,tonumber(id));
	Set_XSCRIPT_ParamCount( 2 );				-- ²ÎÊý¸öÊý
	Send_XSCRIPT()  
end

function JunShenJian_Set(pos)
	local theAction = EnumAction(pos, "packageitem")
	JunShenJian_Object:SetActionItem(theAction:GetID())
	LifeAbility:Lock_Packet_Item(pos, 1)
	current_pos = pos
end

function JunShenJian_Clear()
	JunShenJian_Object:SetActionItem(-1)
	LifeAbility:Lock_Packet_Item(current_pos, 0)
	JunShenJian_Level:ResetList()
	current_mode = -1;
	current_pos = -1;
end

function JunShenJian_Submit()
	JunShenJian_SetMode()
	JunShenJian_Clear()
	this:Hide();
end

function JunShenJian_OnHiden()
	JunShenJian_Clear()
	this:Hide();
end

function JunShenJian_Frame_On_ResetPos()
	JunShenJian_Frame:SetProperty("UnifiedPosition", g_JunShenJian_Frame_UnifiedPosition);
end