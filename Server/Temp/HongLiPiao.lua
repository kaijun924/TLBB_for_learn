--脚本号
x889996_g_scriptId = 889996
x889996_Table = {}
x889996_Table[39910018] = 50 --50点红利
x889996_Table[39910019] = 100 --100点红利
x889996_Table[39910020] = 500 --500点红利
x889996_Table[39910021] = 1000 --1000点红利
x889996_Table[39910022] = 5000 --5000点红利

function x889996_Tips( sceneId, selfId,msg )
BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--事件交互入口
--**********************************
function x889996_OnDefaultEvent( sceneId, selfId )

end
--**********************************
--只会执行一次入口：
--返回1：处理成功；返回0：处理失败。
--**********************************
function x889996_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local Piao = x889996_Table[itemTblIndex]
	local bagpos = GetItemBagPos( sceneId, selfId, itemTblIndex, 0 )

	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, itemTblIndex );	
		if nItemNum <= 0 then
			x889996_MsgBox( sceneId, selfId, targetId, "此物品已被锁定！" )
			return 0;
		end
	end

	ZengDian(sceneId,selfId, targetId, 1, Piao)
	x889996_Tips( sceneId, selfId,"您成功的增加了"..(Piao).."点红利。" )
	LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	--删除物品
	return 1
end
--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889996_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x889996_OnDeplete( sceneId, selfId )
	return 1
end


--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
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
	return 1; --不是引导性脚本, 只保留空函数.
end

--ZVMRU作式了中以我些开作上7

