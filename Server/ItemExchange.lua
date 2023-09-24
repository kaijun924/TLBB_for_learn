x770005_g_ItemExchange_Item = {
	[20310004] = 2,[20310005] = 2, [20310020] = 2, [20310021] = 2, 
	--���ʯ
	[20310122] = 3,[20310131] = 3, [20310140] = 3, [20310149] = 3,
	--��ľ���������,���˿,����
	[20310158] = 5, [20310159] = 12,[20310168] = 3, [20310173] = 1,
	--������
	[20310200] = 5, 
	--��¥
	[20310185] = 600, [20310186] = 600, [20310187] = 600, [20310188] = 600, [20310189] = 600, 
	[20310190] = 600,
	--����
	[30501168] = 1, [30501355] = 2, [30501357] = 1,
	--����ʴ���ܼ�, �۽��, �ںϷ�
	[30121001] = 10, [30121002] = 10,[38000991] = 300,
	--���
	[30505800] = 20, [30505801] = 40, [30505802] = 60, [30505803] = 80, [30505804] = 100, [30505805] = 120, 
	[30505806] = 150,
	--�����
	[30505817] = 10, [30505818] = 10, [30505819] = 10,
	--������,Ů���ʯ��ħѪʯ
	[30505815] = 50, [30505814] = 100, [30505813] = 20,
	--�ͼ���ʯ��Ƕ���߼���ʯ��Ƕ
	[30900009] = 8, [30900010] = 10,
	--�ͼ���ʯ�ϳɣ��߼���ʯ�ϳ�,����֮��
	[30900015] = 5, [30900016] = 40,[30900011] = 30,
	--�ͼ�������, �߼�������, ��Ů
	[30900013] = 30, [30900014] = 100,[31001468] = 50, [31001466] = 60
	--��Ů��
}
--GetBagItemLevel

function x770005_GetPrize(sceneId, selfId, opcode, itemId, number)
	
	if opcode == 0 then
		Check_Item(sceneId,selfId,itemId,number)
	elseif opcode == 1 then
		Cost_Item(sceneId,selfId,itemId,number)
	end
end

--�뷨�����ñ�������
function x770005_ItemPrice(sceneId,itemId)
	--����ͼ���ڵ���5����
	if itemId > 20308000 and itemId <= 20308228 and LuaFnGetItemPrice(sceneId,itemId) >= 250 then
		return 0,2
	--�����
	elseif itemId > 20309100 and itemId <= 20309110  then
		return 0,(3 ^ (itemId - 20309100));
	--����ͼ��
	elseif itemId >= 30120001 and itemId <= 30120020  then
		return 0,20
	--�����
	elseif itemId >= 30700214 and itemId <= 30700229  then
		return 0,1000
	--��ʯ��
	elseif itemId >= 30900026 and itemId <= 30900034  then
		return 0,(itemId - 30900026 + 1) * 5
	elseif itemId >= 30900036 and itemId <= 30900044 then
		return 0,(itemId - 30900036 + 1) * 5
	--������
	elseif itemId >= 38000965 and itemId <= 38000974 then
		return 0,1200
	--��Ů��
	elseif itemId >= 31001111 and itemId <= 31001464 then
		return 0,100
	elseif itemId >= 31001470 and itemId <= 31001474 then
		return 0,10
	--�����ؼ�
	elseif itemId >= 30308000 and itemId <= 30308011 then
		return 0,100
	elseif itemId >= 30307200 and itemId <= 30307232 then
		return 0,100
	--��ʯ
	elseif itemId >= 50101001 and itemId <= 50921409 then
		return 0,2
	elseif x770005_g_ItemExchange_Item[itemId] ~= nil then
		return 0,g_ItemExchange_Item[itemId]
	else
		return 1,LuaFnGetItemPrice(sceneId, itemId)
	end
end

function Check_Item(sceneId,selfId,itemId, number)
	x770005_NotifyTip( sceneId, selfId, "�������"..itemId.." * "..number )
	--0����Ԫ����1������
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
	x770005_NotifyTip( sceneId, selfId, "��ϲ��䵱��"..itemId.." * "..number )
end

function x770005_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end	