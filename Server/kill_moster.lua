---@diagnostic disable: lowercase-global, undefined-global, redundant-parameter
--ɱ������
--�Ȼ�����
--MisDescBegin
--�ű���
x770003_g_ScriptId = 770003

--��������NPC����
x770003_g_Position_X=131
x770003_g_Position_Z=124
x770003_g_SceneID=2
x770003_g_AccomplishNPC_Name="�黨��ɮ"

--��һ�������ID
--g_MissionIdPre =

--�����
x770003_g_MissionId = 1310

--Ŀ��NPC
x770003_g_Name	="�黨��ɮ"

--�������
x770003_g_MissionKind = 13

--����ȼ�
x770003_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x770003_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫɱ���Ĺ�
x770003_g_DemandKill ={{id=719,num=8}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x770003_g_MissionName="�Ȼ�����"
x770003_g_MissionInfo="ͨ��ɱ���Ȼ�,�����������"
x770003_g_MissionTarget="ɱ��ָ���Ĺ���"
x770003_g_ContinueInfo="����������"
x770003_g_MissionComplete="  �ɵúã�������ľ�����������"
x770003_g_SignPost = {x = 131, z = 124, tip = "�黨��ɮ"}
--������
x770003_g_MoneyBonus=200
x770003_g_ItemBonus={{id=30505160,num=2},{id=30505161,num=2}}
x770003_g_DemandTrueKill ={{name="�����Գ",num=20}}
x770003_g_IsMissionOkFail = 1		--�����ĵ�0λ

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
x770003_g_addofBuff = {1,3,5,7,9,11,13,15,17,19,21,23,25}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x770003_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x770003_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x770003_g_MissionId) > 0 then
		--���������������Ϣ
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
    --���������������
    elseif x770003_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x770003_g_MissionName)
				AddText(sceneId,x770003_g_MissionInfo)
				AddText(sceneId,"ɱ��ָ���������Գ")
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
--�о��¼�
--**********************************
function x770003_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
	--local buff = {[1] = 0,[2]= 0,[3] = 0,[4] = 0,[5] = 0}
	--buff[1],buff[2],buff[3],buff[4],buff[5] = x770003_getBuff(sceneId, selfId)
	--x770003_ShowNotice( sceneId, selfId,"buff1:"..buff[1].."buff2:"..buff[2].."buff3:"..buff[3].."buff4:"..buff[4].."buff5:"..buff[5] )
    if IsHaveMission(sceneId,selfId,x770003_g_MissionId) > 0 then
		AddNumText(sceneId,x770003_g_ScriptId,x770003_g_MissionName,2,-1);
		--���������������
	elseif x770003_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x770003_g_ScriptId,x770003_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x770003_CheckAccept( sceneId, selfId )
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x770003_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x770003_g_MissionId, x770003_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x770003_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺵�һ��ɱ��",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x770003_g_SignPost.x, x770003_g_SignPost.z, x770003_g_SignPost.tip )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 7, 71, 250, "��Գ" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 75, 71, 250, "��Գ" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 76, 71, 250, "��Գ" )
end

--**********************************
--����
--**********************************
function x770003_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x770003_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x770003_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x770003_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
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
--����Ƿ�����ύ
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
--�ύ
--**********************************
function x770003_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local my_level = GetLevel( sceneId, selfId )
	if x770003_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x770003_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
			AddMoney(sceneId,selfId,x770003_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 50000)
			my_level = floor(my_level / 10) + 1
			addSomeBuff(sceneId, selfId, x770003_g_addofBuff[my_level])
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x770003_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x770003_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y������񣺵�һ��ɱ��",MSG2PLAYER_PARA )
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ�������Գ�����
--**********************************
function x770003_OnKillObject( sceneId, selfId, objdataId ,objId)
	local MonsterLevel = floor(GetLevel(sceneId, objId) / 10)
	local num = GetMonsterOwnerCount(sceneId,objId)

	for j=0,num-1  do
		local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
		local humanLevel = GetLevel(sceneId, humanObjId)
		humanLevel = floor(humanLevel / 10)
		-- x770003_ShowNotice( sceneId, selfId,"����"..MonsterLevel.."�Լ����"..humanLevel.." " )
		-- ����û���������
		if MonsterLevel == humanLevel then
			if IsHaveMission(sceneId, humanObjId, x770003_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x770003_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)
				if nNum < x770003_g_DemandTrueKill[1].num then
					-- if nNum == x770003_g_DemandTrueKill[1].num - 1 then
					-- 	SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					-- end
					if nNum == x770003_g_DemandTrueKill[1].num - 1 then
						SetMissionByIndex(sceneId,humanObjId,misIndex,1,0)
						addSomeBuff(sceneId, selfId, x770003_g_addofBuff[humanLevel + 1])
						BeginEvent(sceneId)
						strText = "ͻ��ƿ����"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,humanObjId)
					else
						SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
						BeginEvent(sceneId)
						strText = format("����ȡ����%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
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
--���������¼�
--**********************************
function x770003_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
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

x770003_g_numToChar = {[1]="����",[2]="��",[3]="����",[4]="����",[13]="����",[14]="����",
[15]="����",[16]="����",[17]="��"}
x770003_g_charToChar = {[1]="bg",[2]="hg",[3]="xg",[4]="dg"}

function addSomeBuff(sceneId, selfId, add)
	--��ȡ������ȡ
	local pos = GetItemBagPos( sceneId, selfId, 39910023, 0 )
	local _,skilstring = LuaFnGetItemCreator(sceneId, selfId,pos)

	if skilstring == nil or skilstring == "" then
		skilstring = "&A0bg0hg0xg0dg0"
	end
	local _,mode = 0,0
	local attr = {}
	_,_,mode = strfind(skilstring,"A(%d)")
	local opcode = x770003_g_numToChar[tonumber(mode) + 1]
	for i=1,4 do
		_,_,attr[i] = strfind(skilstring,x770003_g_charToChar[i].."(%d+)")
		attr[i] = tonumber(attr[i])
	end

	attr[tonumber(mode) + 1] = tonumber(attr[tonumber(mode) + 1]) + add
	local current_attr = CallScriptFunction( 892002, "GetAbility", sceneId, selfId, opcode )
	current_attr = current_attr + add

	CallScriptFunction( 892002, "SetAbility", sceneId, selfId, opcode, current_attr )



	skilstring = "&"..mode
	for i=1,4 do
		skilstring = skilstring..x770003_g_charToChar[i]..attr[i]
	end
	LuaFnSetItemCreator( sceneId, selfId, pos, skilstring )


end


--JZBQR��������Ҫ����Щչ58
