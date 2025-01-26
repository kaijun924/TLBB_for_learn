--GM内部工具
local g_FourSlot_Frame_UnifiedPosition;
local g_FourSlot_Item = -1
local g_FourSlot_Item2 = -1
local open = -1

function FourSlot_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_NOTIFY");
	this:RegisterEvent("ADJEST_UI_POS",false)
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED",false)
	--元宝
	this:RegisterEvent("UNIT_MONEY");
	this : RegisterEvent( "HIDE_ON_SCENE_TRANSED" );			-- 离开场景
end

function FourSlot_OnLoad()
	g_FourSlot_Frame_UnifiedPosition=FourSlot_Frame:GetProperty("UnifiedPosition");
end


function FourSlot_OnEvent(event)
	if(event == "UI_COMMAND" and arg0 == "20200431") then
		this:Show();
		
		Initial()
		FourSlot_Title:SetProperty("Text","装备打孔")
		FourSlot_Title:SetProperty("TextColor","FFFFF263")
		open = 0
	elseif(event == "UI_COMMAND" and arg0 == "20200433") then
		this:Show();
		
		Initial()
		FourSlot_Title:SetProperty("Text","极限打孔")
		FourSlot_Title:SetProperty("TextColor","FFFFF263")
		open = 1
	end
	if (event == "ADJEST_UI_POS" ) then
		FourSlot_Frame_On_ResetPos()
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		FourSlot_Frame_On_ResetPos()
	elseif (event == "HIDE_ON_SCENE_TRANSED" ) then
        FourSlot_OnHiden()	
	elseif (event == "UI_COMMAND" and arg0 == "20200104" and this:IsVisible()) then
		if open == 0 then
			FourSlot_Update(arg1)
		elseif open == 1 then
			FourSlot_Update2(arg1)
		end
	elseif (event == "UI_COMMAND" and arg0 == "20200432" and this:IsVisible()) then
		--SetNotifyTip("被触发！！！");
		local money = Get_XParam_INT(0)
		--SetNotifyTip(" money:"..money);
		FourSlot_UpdateBasic2(money)
	elseif (event == "UNIT_MONEY" and this:IsVisible()) then
		FourSlot_UpdateBasic()
	end
end

function FourSlot_Update(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")
	local theItem = tonumber(PlayerPackage:GetItemTableIndex(index))
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		--先判断是打孔材料还是装备
		--若是打孔材料
		if(theItem >= 20109001 and theItem <= 20109012) then
			--SetNotifyTip("是打孔的");
			if g_FourSlot_Item2 ~= -1 then
				LifeAbility:Lock_Packet_Item(g_FourSlot_Item2, 0)
			end
			FourSlot_Object2:SetActionItem(theAction:GetID())
			LifeAbility:Lock_Packet_Item(index, 1)
			g_FourSlot_Item2 = index
		elseif theItem >=10100000 and theItem <=12100000 then
			--SetNotifyTip("是装备");
			if g_FourSlot_Item ~= -1 then
				LifeAbility:Lock_Packet_Item(g_FourSlot_Item, 0)
			end
			FourSlot_Object:SetActionItem(theAction:GetID())
			LifeAbility:Lock_Packet_Item(index, 1)
			g_FourSlot_Item = index
			SendToServer(0,index)
		else
			SetNotifyTip("这个物品不是装备也不是打孔材料");
		end
	end
end 

function FourSlot_Update2(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")
	local theItem = tonumber(PlayerPackage:GetItemTableIndex(index))
	local number = theAction:GetNum()
	if theAction:GetID() ~= 0 then
		--先判断是打孔材料还是装备
		--若是打孔材料
		if(theItem == 20310111 or theItem == 20109101) then
			--SetNotifyTip("是打孔的");
			if g_FourSlot_Item2 ~= -1 then
				LifeAbility:Lock_Packet_Item(g_FourSlot_Item2, 0)
			end
			FourSlot_Object2:SetActionItem(theAction:GetID())
			LifeAbility:Lock_Packet_Item(index, 1)
			g_FourSlot_Item2 = index
		elseif theItem >=10100000 and theItem <=12100000 then
			--SetNotifyTip("是装备");
			if g_FourSlot_Item ~= -1 then
				LifeAbility:Lock_Packet_Item(g_FourSlot_Item, 0)
			end
			FourSlot_Object:SetActionItem(theAction:GetID())
			LifeAbility:Lock_Packet_Item(index, 1)
			g_FourSlot_Item = index
			SendToServer(3,index)
		else
			SetNotifyTip("这个物品不是装备也不是打孔材料");
		end
	end
end 

function SendToServer(mode,pos)
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200104));
	Set_XSCRIPT_Parameter(1,tonumber(mode));
	Set_XSCRIPT_Parameter(2,tonumber(pos));
	Set_XSCRIPT_ParamCount( 3 );				-- 参数个数
	Send_XSCRIPT()  
end

function SendToServer2(mode,pos,index2)
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(20200104));
	Set_XSCRIPT_Parameter(1,tonumber(mode));
	Set_XSCRIPT_Parameter(2,tonumber(pos));
	Set_XSCRIPT_Parameter(3,tonumber(index2));
	Set_XSCRIPT_ParamCount( 4 );				-- 参数个数
	Send_XSCRIPT()  
end

--=========================================================
-- 重置界面
--=========================================================
function FourSlot_Clear()
	if g_FourSlot_Item ~= -1 then
		FourSlot_Object:SetActionItem(-1)
		LifeAbility:Lock_Packet_Item(g_FourSlot_Item, 0)
		g_FourSlot_Item = -1
	end
end

function FourSlot_Clear2()
	if g_FourSlot_Item2 ~= -1 then
		FourSlot_Object2:SetActionItem(-1)
		LifeAbility:Lock_Packet_Item(g_FourSlot_Item2, 0)
		g_FourSlot_Item2 = -1
	end
end

function FourSlot_Resume_Equip()
	--SetNotifyTip("右键了");
	FourSlot_Clear()
end

function FourSlot_Resume_Equip2()
	FourSlot_Clear2()
end

function FourSlot_Submit()
	if g_FourSlot_Item ~= -1 and g_FourSlot_Item2 ~= -1 then
		SendToServer2(open + 1,g_FourSlot_Item,PlayerPackage:GetItemTableIndex(g_FourSlot_Item2));
		FourSlot_Clear()
		FourSlot_Clear2()
		FourSlot_UpdateBasic2(0)
	else
		SetNotifyTip("请放入装备和打孔材料");
	end
end


function FourSlot_Frame_On_ResetPos()
	FourSlot_Frame:SetProperty("UnifiedPosition", g_FourSlot_Frame_UnifiedPosition);
end


function FourSlot_UpdateBasic()
	FourSlot_SelfMoney:SetProperty("MoneyNumber",tostring(Player:GetData("MONEY")));
end

function FourSlot_UpdateBasic2(money)
	FourSlot_RewardMoney:SetProperty("MoneyNumber",tostring(money));
end

--=========================================================
-- 界面隐藏
--=========================================================
function FourSlot_OnHiden()
	--SetNotifyTip("隐藏了");
	FourSlot_Clear()
	FourSlot_Clear2()
	this:Hide();
	open = -1
	return
end

function Initial()
	FourSlot_Clear()
	FourSlot_Clear2()
	FourSlot_UpdateBasic()
	FourSlot_UpdateBasic2(0)
	open = -1
end