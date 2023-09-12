---@diagnostic disable: lowercase-global, undefined-global, redundant-parameter
--杀怪任务
--嗜魂试炼
--MisDescBegin
--脚本号
x770003_g_ScriptId = 770003

--接受任务NPC属性
x770003_g_Position_X=131
x770003_g_Position_Z=124
x770003_g_SceneID=2
x770003_g_AccomplishNPC_Name="拈花寺僧"

--上一个任务的ID
--g_MissionIdPre =

--任务号
x770003_g_MissionId = 1310

--目标NPC
x770003_g_Name	="拈花寺僧"

--任务归类
x770003_g_MissionKind = 13

--任务等级
x770003_g_MissionLevel = 1

--是否是精英任务
x770003_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--任务需要杀死的怪
x770003_g_DemandKill ={{id=719,num=8}}		--变量第1位

--以上是动态**************************************************************

--任务文本描述
x770003_g_MissionName="嗜魂试炼"
x770003_g_MissionInfo="通过杀怪嗜魂,凝练天地灵气"
x770003_g_MissionTarget="杀死指定的怪物"
x770003_g_ContinueInfo="你领悟了吗？"
x770003_g_MissionComplete="  干得好，现在你的境界又提升。"
x770003_g_SignPost = {x = 131, z = 124, tip = "拈花寺僧"}
--任务奖励
x770003_g_MoneyBonus=200
x770003_g_ItemBonus={{id=30505160,num=2},{id=30505161,num=2}}
x770003_g_DemandTrueKill ={{name="蜀道白猿",num=20}}
x770003_g_IsMissionOkFail = 1		--变量的第0位

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
x770003_g_addofBuff = {1,10,15,25,40,60,80,100,120,150,180,210,240}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x770003_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x770003_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x770003_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x770003_g_MissionName)
			AddText(sceneId,x770003_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x770003_g_MoneyBonus )
		EndEvent( )
		bDone = x770003_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x770003_g_ScriptId,x770003_g_MissionId,bDone)
    --满足任务接收条件
    elseif x770003_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x770003_g_MissionName)
				AddText(sceneId,x770003_g_MissionInfo)
				AddText(sceneId,"杀死指定的蜀道白猿")
				AddText(sceneId,x770003_g_MissionTarget)
				for i, item in x770003_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x770003_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x770003_g_ScriptId,x770003_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x770003_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
	--local buff = {[1] = 0,[2]= 0,[3] = 0,[4] = 0,[5] = 0}
	--buff[1],buff[2],buff[3],buff[4],buff[5] = x770003_getBuff(sceneId, selfId)
	--x770003_ShowNotice( sceneId, selfId,"buff1:"..buff[1].."buff2:"..buff[2].."buff3:"..buff[3].."buff4:"..buff[4].."buff5:"..buff[5] )
    if IsHaveMission(sceneId,selfId,x770003_g_MissionId) > 0 then
		AddNumText(sceneId,x770003_g_ScriptId,x770003_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x770003_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x770003_g_ScriptId,x770003_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x770003_CheckAccept( sceneId, selfId )
	--需要4级才能接
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x770003_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x770003_g_MissionId, x770003_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x770003_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：第一次杀怪",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x770003_g_SignPost.x, x770003_g_SignPost.z, x770003_g_SignPost.tip )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 7, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 75, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 76, 71, 250, "白猿" )
end

--**********************************
--放弃
--**********************************
function x770003_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x770003_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x770003_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x770003_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x770003_g_MissionName)
		AddText(sceneId,x770003_g_MissionComplete)
		AddMoneyBonus( sceneId, x770003_g_MoneyBonus )
		for i, item in x770003_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x770003_g_ScriptId,x770003_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x770003_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x770003_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x770003_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x770003_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local my_level = GetLevel( sceneId, selfId )
	if x770003_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x770003_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
			AddMoney(sceneId,selfId,x770003_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 50000)
			my_level = floor(my_level / 10) + 1
			addSomeBuff(sceneId, selfId, x770003_g_addofBuff[my_level])
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x770003_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x770003_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：第一次杀怪",MSG2PLAYER_PARA )
			end
		else
		--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死蜀道白猿或玩家
--**********************************
function x770003_OnKillObject( sceneId, selfId, objdataId ,objId)
	local MonsterLevel = floor(GetLevel(sceneId, objId) / 10)
	local num = GetMonsterOwnerCount(sceneId,objId)

	for j=0,num-1  do
		local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
		local humanLevel = GetLevel(sceneId, humanObjId)
		humanLevel = floor(humanLevel / 10)
		-- x770003_ShowNotice( sceneId, selfId,"怪物"..MonsterLevel.."以及玩家"..humanLevel.." " )
		-- 看有没有这个任务
		if MonsterLevel == humanLevel then
			if IsHaveMission(sceneId, humanObjId, x770003_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x770003_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)
				if nNum < x770003_g_DemandTrueKill[1].num then
					if nNum == x770003_g_DemandTrueKill[1].num - 1 then
						SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					end
					
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
				BeginEvent(sceneId)
					strText = format("已杀死怪物%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
				end
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x770003_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x770003_OnItemChanged( sceneId, selfId, itemdataId )
end

function x770003_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x770003_getBuff( sceneId, selfId)
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
	buff1[1],buff1[2],buff1[3],buff1[4],buff1[5],buff1[6] = x770003_getBuff(sceneId, selfId)
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


--JZBQR开代上了要发我些展58
