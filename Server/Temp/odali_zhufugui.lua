--����NPC
--ף����
--��ʯת���ű�
x002102_g_ScriptId = 002102
x002102_g_gemlv1 = {50101001,50101002,50103001,50104002,50111001,50111002,50112001,50112002,50112003,
50112004,50113001,50113002,50113003,50113004,50113005,50113006,50114001,
}
--**********************************
--�¼��������
--**********************************
function x002102_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "����/Ů�����, �������������б�ʯת���Լ���ʯ�ϳ�")
		AddNumText( sceneId, x002102_g_ScriptId, "10���ת��2Ԫ��",5,2) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "100���ת��20Ԫ��",5,3) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "500���ת��100Ԫ��",5,4) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "�̾�ʯ(1��)�ϳ�",6,5) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "�쾧ʯ(1��)�ϳ�",6,6) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "����ʯ(1��)�ϳ�",6,7) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "�ƾ�ʯ(1��)�ϳ�",6,8) --OK
		AddNumText( sceneId, x002102_g_ScriptId, "������ʯת��Ϊ�̾�ʯ(1��)",6,9) --OK
		--AddNumText( sceneId, x002102_g_ScriptId, "����",6,10) --OK
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��һ��
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
			x002102_ShowNotice( sceneId, selfId,"���ɹ���������2��Ԫ����" )
		end
	elseif Choose_id == 3 then
		if money >= 1000000 then
			LuaFnCostMoney(sceneId, selfId, 1000000)
			YuanBao(sceneId,selfId,-1,1, 20 )
			x002102_ShowNotice( sceneId, selfId,"���ɹ���������20��Ԫ����" )
		end
	elseif Choose_id == 4 then
		if money >= 5000000 then
			LuaFnCostMoney(sceneId, selfId, 5000000)
			YuanBao(sceneId,selfId,-1,1, 100 )
			x002102_ShowNotice( sceneId, selfId,"���ɹ���������100��Ԫ����" )
		end

	elseif Choose_id == 5 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102004)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"�̾�ʯ(1��)����5��" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102004,5)
		TryRecieveItem( sceneId, selfId, 50202004, 1)
		x002102_ShowNotice( sceneId, selfId,"���ɹ��ϳ��̾�ʯ(2��)" )

	elseif Choose_id == 6 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102003)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"�쾧ʯ(1��)����5��" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102003,5)
		TryRecieveItem( sceneId, selfId, 50202003, 1)
		x002102_ShowNotice( sceneId, selfId,"���ɹ��ϳɺ쾧ʯ(2��)" )

	elseif Choose_id == 7 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102002)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"����ʯ(1��)����5��" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102002,5)
		TryRecieveItem( sceneId, selfId, 50202002, 1)
		x002102_ShowNotice( sceneId, selfId,"���ɹ��ϳ�����ʯ(2��)" )

	elseif Choose_id == 8 then
		check = LuaFnGetAvailableItemCount(sceneId, selfId, 50102001)
		if check < 5 then
			x002102_ShowNotice( sceneId, selfId,"�ƾ�ʯ(1��)����5��" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,50102001,5)
		TryRecieveItem( sceneId, selfId, 50202001, 1)
		x002102_ShowNotice( sceneId, selfId,"���ɹ��ϳɻƾ�ʯ(2��)" )

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
		x002102_ShowNotice( sceneId, selfId,"��ת���˸�"..total_gem.."�̾�ʯ(1��)��" )
	elseif Choose_id == 10 then
		ZengDian(sceneId,selfId, targetId, 1, 1000 )
		addSomeBuff(sceneId, selfId, 80000)
		local coldQ = GetHumanAttr(sceneId, selfId, 3)
		SetMissionData(sceneId,selfId,SD_HUOKANGX,900)
		x002102_ShowNotice( sceneId, selfId,"����"..coldQ.."��" )
	end
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
	--���buff
	local total = buff1[1] + buff1[2] * 10 + buff1[3] * 100 + buff1[4] * 1000 + buff1[5] * 10000 + buff1[6] * 100000 + add
	local lefting = 0
	for i=1,6 do
		--����ȡģ
		if i ~= 6 then
			lefting = total - x770003_g_BuffAdd[i+1] * floor(total/x770003_g_BuffAdd[i+1])
		else
			lefting = total
		end

		--�ȼ����
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
