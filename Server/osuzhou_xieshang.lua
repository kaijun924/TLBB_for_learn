--����NPC
--л��
--һ��

--**********************************
--�¼��������
--**********************************
function x001027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����̻����Ͼ�Ҫ��ʽ��ҵ�ˡ�")
		AddNumText( sceneId, x001027_g_ScriptId, "�����ֹ�����",5,2) --OK
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001027_OnEventRequest(sceneId,selfId,targetId,eventId)
	local Choose_id = GetNumText()
	--�򿪽������
	if Choose_id == 2 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20200446)
	end
end

x001027_lvToId = {}
x001027_lvToId[1] = 20103060
x001027_lvToId[2] = 20103073
x001027_lvToId[3] = 20103084
x001027_lvToId[4] = 20103096
x001027_lvToId[5] = 20103099
x001027_lvToId[6] = 0

x001027_lvReplace = {}
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




function x001027_CostItem(sceneId,selfId,itemid,itemlevel)
	--��Ǯ�������Ʒ
	--1�Ƕ�ʯ��2���͸3������4��������5�ǲ�Ƭ��6������(��itemlevel Ϊitemid)
	local cost = 0
	local id = 0
	if itemid >= 1 and itemid <= 3  then
		cost = itemlevel * 100 * 200 * x001027_lvReplace[itemlevel]
	elseif itemid >= 4 and itemid <= 5 then
		cost = itemlevel * 100 * 200 * x001027_lvReplace[itemlevel + 7]
	elseif itemid == 6 then
		cost = 3000 * 200
 	end

	id = x001027_lvToId[itemid] + itemlevel

	--�����Ʒ
	BeginAddItem(sceneId)
	AddItem( sceneId,id,200)
	local ret = EndAddItem(sceneId,selfId)
	if ret > 0 then
		ret = CostMoney(sceneId,selfId,cost)
		if ret == -1 then
			x001027_ShowNotice( sceneId, selfId, "��Ǯ����" )
			return
		end
		AddItemListToHuman(sceneId,selfId)
		x001027_ShowNotice( sceneId, selfId, "����ɹ�" )
	else
		x001027_ShowNotice( sceneId, selfId, "�����ռ䲻��" )
		return
	end
end


function x001027_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end


