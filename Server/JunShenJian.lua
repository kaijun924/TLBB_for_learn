--�ű���
x770007_g_scriptId = 770007

function x770007_Tips( sceneId, selfId,msg )
    BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�¼��������
--**********************************
function x770007_OnDefaultEvent( sceneId, selfId )
end

--**********************************
--ֻ��ִ��һ����ڣ�
--����1������ɹ�������0������ʧ�ܡ�
--**********************************
function x770007_OnActivateOnce( sceneId, selfId )
	x770007_Tips( sceneId, selfId,"��Ʒ������" )
	--��ȡ��Ʒ��creater
	local pos = GetItemBagPos( sceneId, selfId, 39910023, 0 )
	local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos)
	if skilstring == nil or skilstring == "" then
		skilstring = "&0bg0hg0xg0dg0"
	end
	skilstring = "&1bg100hg45xg30dg121"
	LuaFnSetItemCreator( sceneId, selfId, pos, skilstring )
	--�����ͻ���20200445
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId,skilstring)
	UICommand_AddInt(sceneId,pos)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 20200445)
	return 1
end

--**********************************
--����������Ʒģʽ�任�ĺ���
--**********************************
function x770007_SetMode( sceneId, selfId, mode )
	--��ȡ��Ʒ��creater
	local pos = GetItemBagPos( sceneId, selfId, 39910023, 0 )
	local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos)

	if skilstring == nil or skilstring == "" then
		skilstring = "&0bg0hg0xg0dg0"
	end
	skillstring = "&"..mode..strsub(skilstring,2,strlen(skilstring))
	LuaFnSetItemCreator( sceneId, selfId, pos, skilstring )
end



--**********************************
-- ����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x770007_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--���ļ�⼰������ڣ��������ĵļ���ִ�У�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x770007_OnDeplete( sceneId, selfId )
	return 1
end


--**********************************
-- ���������ڣ�����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x770007_OnConditionCheck( sceneId, selfId )
	return 1
end
--**********************************
-- 
--**********************************
function x770007_IsSkillLikeScript( sceneId, selfId)
	return 1
end
function x770007_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--ZVMRU��ʽ��������Щ������7

