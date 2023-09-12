-- 760701
-- �׳���

--�ű���
x760701_g_scriptId = 760701
x770003_g_MissionId = 770003
x770004_g_MissionId = 770004
x770005_g_MissionId = 770005

--��ӵ�е��¼�ID�б�
x760701_g_eventList={770003,770004}

--**********************************
--�¼��б�
--**********************************
function x760701_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����/Ů�� �� ������������");
		for i, eventId in x760701_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x760325_g_ScriptId, "��ʯת���ɻƾ�ʯ",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x760701_OnDefaultEvent( sceneId, selfId,targetId )
	x760701_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x760701_OnEventRequest( sceneId, selfId, targetId, eventId )
	local Choose_id = GetNumText()
	for i, findId in x760701_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end 
	if Choose_id == 1 then
		local k = ZengDian(sceneId, selfId, -1, 4, 200)
		if not k then
			x760701_ShowNotice( sceneId, selfId, "none")
		else
			x760701_ShowNotice( sceneId, selfId, "have")
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x760701_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x760701_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x760701_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x760701_g_eventList do
		if missionScriptId == findId then
			x760701_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x760701_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x760701_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x760701_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x760701_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x760701_OnDie( sceneId, selfId, killerId )
end

function x760701_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end