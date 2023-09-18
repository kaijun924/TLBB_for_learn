---@diagnostic disable: lowercase-global, undefined-global, redundant-parameter
--杀怪任务
--嗜魂试炼
--MisDescBegin
--脚本号
x770004_g_ScriptId = 770004

--接受任务NPC属性
x770004_g_Position_X=131
x770004_g_Position_Z=124
x770004_g_SceneID=2
x770004_g_AccomplishNPC_Name="拈花寺僧"

--上一个任务的ID
--g_MissionIdPre =

--任务号
x770004_g_MissionId = 1311

--目标NPC
x770004_g_Name	="拈花寺僧"

--任务归类
x770004_g_MissionKind = 13

--任务等级
x770004_g_MissionLevel = 1

--是否是精英任务
x770004_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--任务需要杀死的怪
x770004_g_DemandKill ={{id=719,num=8}}		--变量第1位

--以上是动态**************************************************************

--任务文本描述
x770004_g_MissionName="天王诀试炼"
x770004_g_MissionInfo="通过杀怪参悟天王神韵,凝练天王霸气"
x770004_g_MissionTarget="杀死指定的怪物"
x770004_g_ContinueInfo="你领悟了吗？"
x770004_g_MissionComplete="  干得好，现在你的境界又提升。"
x770004_g_SignPost = {x = 131, z = 124, tip = "拈花寺僧"}
--任务奖励
x770004_g_MoneyBonus=200
x770004_g_ItemBonus={{id=30505160,num=2},{id=30505161,num=2}}
x770004_g_DemandTrueKill ={{name="蜀道白猿",num=20}}
x770004_g_IsMissionOkFail = 1		--变量的第0位

x770004_g_BUff ={
	[1] = {32752, 32753, 32754, 32755},
	[2] = {32756, 32757, 32758, 32759},
	[3] = {32760, 32761, 32762},
	[4] = {32763, 32764, 32765, 32766},
	[5] = {12961, 12962, 12963, 12964, 12965},
    [6] = {12966, 12967, 12968, 12969, 12970, 12971, 12972, 12973, 12974, 12975},
}
x770004_g_Buff_max = {4,4,3,4,5,10}
x770004_g_addofBuff = {1,10,15,25,40,60,80,100,120,150,180,210,240}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x770004_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x770004_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x770004_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x770004_g_MissionName)
			AddText(sceneId,x770004_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x770004_g_MoneyBonus )
		EndEvent( )
		bDone = x770004_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x770004_g_ScriptId,x770004_g_MissionId,bDone)
    --满足任务接收条件
    elseif x770004_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x770004_g_MissionName)
				AddText(sceneId,x770004_g_MissionInfo)
				AddText(sceneId,"杀死指定的蜀道白猿")
				AddText(sceneId,x770004_g_MissionTarget)
				for i, item in x770004_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x770004_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x770004_g_ScriptId,x770004_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x770004_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x770004_g_MissionId) > 0 then
		AddNumText(sceneId,x770004_g_ScriptId,x770004_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x770004_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x770004_g_ScriptId,x770004_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x770004_CheckAccept( sceneId, selfId )
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
function x770004_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x770004_g_MissionId, x770004_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x770004_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：第一次杀怪",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x770004_g_SignPost.x, x770004_g_SignPost.z, x770004_g_SignPost.tip )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 7, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 75, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 76, 71, 250, "白猿" )
end

--**********************************
--放弃
--**********************************
function x770004_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x770004_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x770004_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x770004_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x770004_g_MissionName)
		AddText(sceneId,x770004_g_MissionComplete)
		AddMoneyBonus( sceneId, x770004_g_MoneyBonus )
		for i, item in x770004_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x770004_g_ScriptId,x770004_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x770004_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x770004_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x770004_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x770004_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local my_level = GetLevel( sceneId, selfId )
	if x770004_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x770004_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
			AddMoney(sceneId,selfId,x770004_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 50000)
			my_level = floor(my_level / 10) + 1
			x770004_addSomeBuff(sceneId, selfId, x770004_g_addofBuff[my_level])
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x770004_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x770004_g_MissionId )
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
function x770004_OnKillObject( sceneId, selfId, objdataId ,objId)
	local MonsterLevel = floor(GetLevel(sceneId, objId) / 10)
	local num = GetMonsterOwnerCount(sceneId,objId)

	for j=0,num-1  do
		local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
		local humanLevel = GetLevel(sceneId, humanObjId)
		humanLevel = floor(humanLevel / 10)
		-- x770004_ShowNotice( sceneId, selfId,"怪物"..MonsterLevel.."以及玩家"..humanLevel.." " )
		-- 看有没有这个任务
		if MonsterLevel == humanLevel then
			if IsHaveMission(sceneId, humanObjId, x770004_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x770004_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)
				if nNum < x770004_g_DemandTrueKill[1].num then
					if nNum == x770004_g_DemandTrueKill[1].num - 1 then
						x770004_addSomeBuff(sceneId, humanObjId, x770004_g_addofBuff[humanLevel])
						SetMissionByIndex(sceneId,humanObjId,misIndex,1,0)
						BeginEvent(sceneId)
						strText = "突破瓶颈！"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,humanObjId)
					else
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

end

--**********************************
--进入区域事件
--**********************************
function x770004_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x770004_OnItemChanged( sceneId, selfId, itemdataId )
end

function x770004_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x770004_getBuff( sceneId, selfId)
	local buff = {[1] = 0,[2]= 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0}
	for i=1,6 do
		for j=1,x770004_g_Buff_max[i] do
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x770004_g_BUff[i][j]) == 1 then
				buff[i] = j
			end
		end
	end
	return buff[1],buff[2],buff[3],buff[4],buff[5],buff[6]
end

function x770004_addSomeBuff(sceneId, selfId, add)
	local RemainPoint = GetPlayerRemainPoints(sceneId, selfId)
	RemainPoint = RemainPoint + add
	SetPlayerRemainPoints(sceneId, selfId, RemainPoint)
	x770004_ShowNotice( sceneId, selfId, "获得"..add.."点潜能")
end