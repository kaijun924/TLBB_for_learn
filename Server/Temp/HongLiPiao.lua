--�ű���
x889996_g_scriptId = 889996
x889996_Table = {}
x889996_Table[39910018] = 50 --50�����
x889996_Table[39910019] = 100 --100�����
x889996_Table[39910020] = 500 --500�����
x889996_Table[39910021] = 1000 --1000�����
x889996_Table[39910022] = 5000 --5000�����

function x889996_Tips( sceneId, selfId,msg )
BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�¼��������
--**********************************
function x889996_OnDefaultEvent( sceneId, selfId )

end
--**********************************
--ֻ��ִ��һ����ڣ�
--����1������ɹ�������0������ʧ�ܡ�
--**********************************
function x889996_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local Piao = x889996_Table[itemTblIndex]
	local bagpos = GetItemBagPos( sceneId, selfId, itemTblIndex, 0 )

	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, itemTblIndex );	
		if nItemNum <= 0 then
			x889996_MsgBox( sceneId, selfId, targetId, "����Ʒ�ѱ�������" )
			return 0;
		end
	end

	ZengDian(sceneId,selfId, targetId, 1, Piao)
	x889996_Tips( sceneId, selfId,"���ɹ���������"..(Piao).."�������" )
	LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	--ɾ����Ʒ
	return 1
end
--**********************************
-- ����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889996_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--���ļ�⼰������ڣ��������ĵļ���ִ�У�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889996_OnDeplete( sceneId, selfId )
	return 1
end


--**********************************
-- ���������ڣ�����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889996_OnConditionCheck( sceneId, selfId )
	return 1
end
--**********************************
-- 
--**********************************
function x889996_IsSkillLikeScript( sceneId, selfId)
	return 1
end
function x889996_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--ZVMRU��ʽ��������Щ������7

