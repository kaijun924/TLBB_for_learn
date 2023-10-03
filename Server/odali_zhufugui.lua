--大理NPC
--祝富贵
--宝石转换脚本
x002102_g_ScriptId = 002102
x002102_g_gemlv1 = {50101001,50101002,50103001,50104002,50111001,50111002,50112001,50112002,50112003,
50112004,50113001,50113002,50113003,50113004,50113005,50113006,50114001,
}
--**********************************
--事件交互入口
--**********************************
function x002102_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "少侠/女侠你好, 你可以在这里进行宝石转换以及宝石合成")
		AddNumText( sceneId, x002102_g_ScriptId, "10金币转换2元宝",5,2) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "100金币转换20元宝",5,3) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "500金币转换100元宝",5,4) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "绿晶石(1级)合成",6,5) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "红晶石(1级)合成",6,6) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "蓝晶石(1级)合成",6,7) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "黄晶石(1级)合成",6,8) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "其他宝石转换为绿晶石(1级)",6,9) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "测试",6,10) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "测试2",6,11) --OK
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x002102_OnEventRequest(sceneId,selfId,targetId,eventId)
	local Choose_id = GetNumText()
	local check = 0
	local money = GetMoney(sceneId, selfId)
	local unuse_gem = 0
	local total_gem = 0

	if Choose_id == 2 then
		if money >= 100000 then
			LuaFnCostMoney(sceneId, selfId, 100000)
			YuanBao(sceneId,selfId,-1,1, 2 )
			x002102_ShowNotice( sceneId, selfId,"您成功的增加了2点元宝。" )
		end
	elseif Choose_id == 3 then
		if money >= 1000000 then
			LuaFnCostMoney(sceneId, selfId, 1000000)
			YuanBao(sceneId,selfId,-1,1, 20 )
			x002102_ShowNotice( sceneId, selfId,"您成功的增加了20点元宝。" )
		end
	elseif Choose_id == 4 then
		if money >= 5000000 then
			LuaFnCostMoney(sceneId, selfId, 5000000)
			YuanBao(sceneId,selfId,-1,1, 100 )
			x002102_ShowNotice( sceneId, selfId,"您成功的增加了100点元宝。" )
		end

	elseif Choose_id == 5 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102004)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"绿晶石(1级)少于5颗" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102004,5)
		TryRecieveItem( sceneId, selfId, 50202004, 1)
		x002102_ShowNotice( sceneId, selfId,"您成功合成绿晶石(2级)" )

	elseif Choose_id == 6 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102003)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"红晶石(1级)少于5颗" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102003,5)
		TryRecieveItem( sceneId, selfId, 50202003, 1)
		x002102_ShowNotice( sceneId, selfId,"您成功合成红晶石(2级)" )

	elseif Choose_id == 7 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102002)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"蓝晶石(1级)少于5颗" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102002,5)
		TryRecieveItem( sceneId, selfId, 50202002, 1)
		x002102_ShowNotice( sceneId, selfId,"您成功合成蓝晶石(2级)" )

	elseif Choose_id == 8 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102001)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"黄晶石(1级)少于5颗" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102001,5)
		TryRecieveItem( sceneId, selfId, 50202001, 1)
		x002102_ShowNotice( sceneId, selfId,"您成功合成黄晶石(2级)" )

	elseif Choose_id == 9 then
		for i = 1, 17, 1 do
			unuse_gem = LuaFnGetAvailableItemCount(sceneId, selfId, x002102_g_gemlv1[i])
			if unuse_gem > 0 then
				LuaFnDelAvailableItem(sceneId,selfId,x002102_g_gemlv1[i],unuse_gem)
				total_gem = total_gem + unuse_gem
			end
		end
		for i = 1, total_gem, 1 do
			TryRecieveItem( sceneId, selfId, 50102004, 1)
		end
		x002102_ShowNotice( sceneId, selfId,"您转换了个"..total_gem.."绿晶石(1级)。" )
	elseif Choose_id == 10 then
		--ZengDian(sceneId,selfId, targetId, 1, 1000 )
		--addSomeBuff(sceneId, selfId, 80000)
		--ocal coldQ = GetHumanAttr(sceneId, selfId, 3)
		--SetMissionData(sceneId,selfId,SD_HUOKANGX,900)
		--x002102_ShowNotice( sceneId, selfId,"测试"..coldQ.."。" )
		x002102_CCBUF(sceneId, selfId)
	elseif Choose_id == 11 then
		-- local _, myname = LuaFnGetItemCreator(sceneId, selfId, 100);
		-- local k = gsub(myname, "#","")
		-- k = gsub(k, "\n","")
		-- local itemId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 100 )
		-- local itemInfo = GetBagItemTransfer( sceneId, selfId, 100 )
		-- local msg = format("个#{_INFOMSG%s}，真是羡煞旁人。",itemInfo)
		-- local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
		-- local param = ""
		-- if GetBagItemParam ~=nil then
		-- 	--param = GetBagItemParam(sceneId, selfId, 100, 5,1)
		-- 	for i = 1,10 do
		-- 		param = param .. GetBagItemParam(sceneId, selfId, 100, i,1) .. ","
		-- 	end
		-- else
		-- 	param = "无"
		-- end
		--local sree1 = strfind( myname[i],"wq1")
		--local test2 = gsub(myname, "\n","")
		-- SetNotifyTip(test2)
		local str = ""
		for i=1,5 do 
			if GetMissionData(sceneId,selfId,i+400 -1) ~= nil then
				str = str ..GetMissionData(sceneId,selfId,i+400 - 1)..","
			end
		end
		-- BeginUICommand( sceneId )
        -- UICommand_AddString( sceneId, msg)
        -- EndUICommand( sceneId )
        -- DispatchUICommand( sceneId, selfId, 20200439 )
		-- if itemDesc == "" then
		-- 	itemDesc = "无"
		-- end
		--LuaFnRefreshItemInfo( sceneId, selfId, 100 )
		--LuaFnRefreshItemInfo( sceneId, selfId, 0 )
		x002102_ShowNotice( sceneId, selfId,"msg:"..str )
	end
end

function x002102_CCBUF(sceneId, selfId) --查看人物buff	
	local p = {}
	local u = 0
	for i = 1, 32766 do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, i) == 1 then
			u = u + 1
			p[u] = i
		end
	end
	local str = ""
	for j = 1, getn(p) do
		str = str .. p[j] .. ","
	end
	x002102_ShowNotice(sceneId, selfId, "看看角色身上有多少个buff:" .. u)
	x002102_ShowNotice(sceneId, selfId, str)
end


function x002102_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

x770003_g_BUff ={
	[1] = {32713,32714,32715,32716,32717,32718,32719,32720,32721},
	[2] = {32722,32723,32724,32725,32726,32727,32728,32729,32730},
	[3] = {32731,32732,32733,32734,32735,32736,32737,32738,32739},
	[4] = {32740,32741,32742,32743,32744,32745,32746,32747,32748},
	[5] = {32749,32750,32751,32752,32753,32754,32755,32756,32757},
	[6] = {32758,32759,32760}
}

x770003_g_Buff_max = {9,9,9,9,9,3}
x770003_g_BuffAdd = {1,10,100,1000,10000,100000}

function getBuff( sceneId, selfId)
	local buff = {[1] = 0,[2]= 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0}
	for i=1,6 do
		for j=1,x770003_g_Buff_max[i] do
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x770003_g_BUff[i][j]) == 1 then
				buff[i] = j
			end
		end
	end
	return buff[1],buff[2],buff[3],buff[4],buff[5],buff[6]
end

function addSomeBuff(sceneId, selfId, add)
	local buff1 = {[1] = 0,[2]= 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0}
	buff1[1],buff1[2],buff1[3],buff1[4],buff1[5],buff1[6] = getBuff(sceneId, selfId)
	--添加buff
	local total = buff1[1] + buff1[2] * 10 + buff1[3] * 100 + buff1[4] * 1000 + buff1[5] * 10000 + buff1[6] * 100000 + add
	local lefting = 0
	for i=1,6 do
		--类似取模
		if i ~= 6 then
			lefting = total - x770003_g_BuffAdd[i+1] * floor(total/x770003_g_BuffAdd[i+1])
		else
			lefting = total
		end

		--先减后除
		total = total - lefting
		lefting = floor(lefting/x770003_g_BuffAdd[i])
		if lefting == 0 and buff1[i] ~= 0 then
			LuaFnCancelSpecificImpact(sceneId,selfId,x770003_g_BUff[i][buff1[i]])
		end
		if lefting ~= 0 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x770003_g_BUff[i][lefting], 0)
		end
	end
end
