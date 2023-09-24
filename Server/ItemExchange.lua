x770005_g_ItemExchange_Item = {
	[20310004] = 2,[20310005] = 2, [20310020] = 2, [20310021] = 2, 
	--润魂石
	[20310122] = 3,[20310131] = 3, [20310140] = 3, [20310149] = 3,
	--麟木箭，破天箭,金蚕丝,丹青
	[20310158] = 5, [20310159] = 12,[20310168] = 3, [20310173] = 1,
	--玉龙髓
	[20310200] = 5, 
	--重楼
	[20310185] = 600, [20310186] = 600, [20310187] = 600, [20310188] = 600, [20310189] = 600, 
	[20310190] = 600,
	--三精
	[30501168] = 1, [30501355] = 2, [30501357] = 1,
	--雕纹蚀刻溶剂, 熔金粉, 融合符
	[30121001] = 10, [30121002] = 10,[38000991] = 300,
	--神符
	[30505800] = 20, [30505801] = 40, [30505802] = 60, [30505803] = 80, [30505804] = 100, [30505805] = 120, 
	[30505806] = 150,
	--神兵符
	[30505817] = 10, [30505818] = 10, [30505819] = 10,
	--玄兵符,女娲神石，魔血石
	[30505815] = 50, [30505814] = 100, [30505813] = 20,
	--低级宝石镶嵌，高级宝石镶嵌
	[30900009] = 8, [30900010] = 10,
	--低级宝石合成，高级宝石合成,极率之珠
	[30900015] = 5, [30900016] = 40,[30900011] = 30,
	--低级刻铭符, 高级刻铭符, 子女
	[30900013] = 30, [30900014] = 100,[31001468] = 50, [31001466] = 60
	--子女书
}
--GetBagItemLevel

function x770005_GetPrize(sceneId, selfId, opcode, itemId, number)
	
	if opcode == 0 then
		Check_Item(sceneId,selfId,itemId,number)
	elseif opcode == 1 then
		Cost_Item(sceneId,selfId,itemId,number)
	end
end

--想法，不用表尽量不用
function x770005_ItemPrice(sceneId,itemId)
	--打造图大于等于5级的
	if itemId > 20308000 and itemId <= 20308228 and LuaFnGetItemPrice(sceneId,itemId) >= 250 then
		return 0,2
	--魂冰珠
	elseif itemId > 20309100 and itemId <= 20309110  then
		return 0,(3 ^ (itemId - 20309100));
	--雕纹图样
	elseif itemId >= 30120001 and itemId <= 30120020  then
		return 0,20
	--武魂书
	elseif itemId >= 30700214 and itemId <= 30700229  then
		return 0,1000
	--宝石符
	elseif itemId >= 30900026 and itemId <= 30900034  then
		return 0,(itemId - 30900026 + 1) * 5
	elseif itemId >= 30900036 and itemId <= 30900044 then
		return 0,(itemId - 30900036 + 1) * 5
	--令牌书
	elseif itemId >= 38000965 and itemId <= 38000974 then
		return 0,1200
	--子女书
	elseif itemId >= 31001111 and itemId <= 31001464 then
		return 0,100
	elseif itemId >= 31001470 and itemId <= 31001474 then
		return 0,10
	--门派秘籍
	elseif itemId >= 30308000 and itemId <= 30308011 then
		return 0,100
	elseif itemId >= 30307200 and itemId <= 30307232 then
		return 0,100
	--宝石
	elseif itemId >= 50101001 and itemId <= 50921409 then
		return 0,2
	elseif x770005_g_ItemExchange_Item[itemId] ~= nil then
		return 0,g_ItemExchange_Item[itemId]
	else
		return 1,LuaFnGetItemPrice(sceneId, itemId)
	end
end

function Check_Item(sceneId,selfId,itemId, number)
	x770005_NotifyTip( sceneId, selfId, "你放入了"..itemId.." * "..number )
	--0代表元宝，1代表金币
	local priceType, price = x770005_ItemPrice(sceneId,itemId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, priceType)
	UICommand_AddInt( sceneId, price * number)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20200429 )
end

function Cost_Item(sceneId,selfId,itemId, number)
	local priceType, price = x770005_ItemPrice(sceneId,itemId)
	if priceType == 0 then
		YuanBao(sceneId,selfId,0,1,price * number)
	else
		AddMoney(sceneId,selfId,price * number );
	end
	LuaFnDelAvailableItem(sceneId,selfId,itemId,number)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, 1)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20200430 )
	x770005_NotifyTip( sceneId, selfId, "恭喜你典当了"..itemId.." * "..number )
end

function x770005_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end	