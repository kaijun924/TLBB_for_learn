--脚本号
x770007_g_scriptId = 770007

function x770007_Tips( sceneId, selfId,msg )
    BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--事件交互入口
--**********************************
function x770007_OnDefaultEvent( sceneId, selfId )
end

--**********************************
--只会执行一次入口：
--返回1：处理成功；返回0：处理失败。
--**********************************
function x770007_OnActivateOnce( sceneId, selfId )
	x770007_Tips( sceneId, selfId,"物品被打开了" )
	--获取物品的creater
	local pos = GetItemBagPos( sceneId, selfId, 39910023, 0 )
	local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos)
	if skilstring == nil or skilstring == "" then
		skilstring = "&0bg0hg0xg0dg0"
	end
	skilstring = "&1bg100hg45xg30dg121"
	LuaFnSetItemCreator( sceneId, selfId, pos, skilstring )
	--传给客户端20200445
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId,skilstring)
	UICommand_AddInt(sceneId,pos)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 20200445)
	return 1
end

--**********************************
--用来处理物品模式变换的函数
--**********************************
function x770007_SetMode( sceneId, selfId, mode )
	--获取物品的creater
	local pos = GetItemBagPos( sceneId, selfId, 39910023, 0 )
	local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos)

	if skilstring == nil or skilstring == "" then
		skilstring = "&0bg0hg0xg0dg0"
	end
	skillstring = "&"..mode..strsub(skilstring,2,strlen(skilstring))
	LuaFnSetItemCreator( sceneId, selfId, pos, skilstring )
end



--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x770007_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x770007_OnDeplete( sceneId, selfId )
	return 1
end


--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
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
	return 1; --不是引导性脚本, 只保留空函数.
end

--ZVMRU作式了中以我些开作上7

