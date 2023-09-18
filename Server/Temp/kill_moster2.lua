---@diagnostic disable: lowercase-global, undefined-global, redundant-parameter
--ɱ������
--�Ȼ�����
--MisDescBegin
--�ű���
x770004_g_ScriptId = 770004

--��������NPC����
x770004_g_Position_X=131
x770004_g_Position_Z=124
x770004_g_SceneID=2
x770004_g_AccomplishNPC_Name="�黨��ɮ"

--��һ�������ID
--g_MissionIdPre =

--�����
x770004_g_MissionId = 1311

--Ŀ��NPC
x770004_g_Name	="�黨��ɮ"

--�������
x770004_g_MissionKind = 13

--����ȼ�
x770004_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x770004_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫɱ���Ĺ�
x770004_g_DemandKill ={{id=719,num=8}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x770004_g_MissionName="����������"
x770004_g_MissionInfo="ͨ��ɱ�ֲ�����������,������������"
x770004_g_MissionTarget="ɱ��ָ���Ĺ���"
x770004_g_ContinueInfo="����������"
x770004_g_MissionComplete="  �ɵúã�������ľ�����������"
x770004_g_SignPost = {x = 131, z = 124, tip = "�黨��ɮ"}
--������
x770004_g_MoneyBonus=200
x770004_g_ItemBonus={{id=30505160,num=2},{id=30505161,num=2}}
x770004_g_DemandTrueKill ={{name="�����Գ",num=20}}
x770004_g_IsMissionOkFail = 1		--�����ĵ�0λ

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
--������ں���
--**********************************
function x770004_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x770004_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x770004_g_MissionId) > 0 then
		--���������������Ϣ
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
    --���������������
    elseif x770004_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x770004_g_MissionName)
				AddText(sceneId,x770004_g_MissionInfo)
				AddText(sceneId,"ɱ��ָ���������Գ")
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
--�о��¼�
--**********************************
function x770004_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x770004_g_MissionId) > 0 then
		AddNumText(sceneId,x770004_g_ScriptId,x770004_g_MissionName,2,-1);
		--���������������
	elseif x770004_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x770004_g_ScriptId,x770004_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x770004_CheckAccept( sceneId, selfId )
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
function x770004_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x770004_g_MissionId, x770004_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x770004_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺵�һ��ɱ��",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x770004_g_SignPost.x, x770004_g_SignPost.z, x770004_g_SignPost.tip )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 7, 71, 250, "��Գ" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 75, 71, 250, "��Գ" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 76, 71, 250, "��Գ" )
end

--**********************************
--����
--**********************************
function x770004_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x770004_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x770004_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x770004_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
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
--����Ƿ�����ύ
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
--�ύ
--**********************************
function x770004_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local my_level = GetLevel( sceneId, selfId )
	if x770004_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x770004_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
	if ret > 0 then
			AddMoney(sceneId,selfId,x770004_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 50000)
			my_level = floor(my_level / 10) + 1
			x770004_addSomeBuff(sceneId, selfId, x770004_g_addofBuff[my_level])
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x770004_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x770004_g_MissionId )
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
function x770004_OnKillObject( sceneId, selfId, objdataId ,objId)
	local MonsterLevel = floor(GetLevel(sceneId, objId) / 10)
	local num = GetMonsterOwnerCount(sceneId,objId)

	for j=0,num-1  do
		local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
		local humanLevel = GetLevel(sceneId, humanObjId)
		humanLevel = floor(humanLevel / 10)
		-- x770004_ShowNotice( sceneId, selfId,"����"..MonsterLevel.."�Լ����"..humanLevel.." " )
		-- ����û���������
		if MonsterLevel == humanLevel then
			if IsHaveMission(sceneId, humanObjId, x770004_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x770004_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)
				if nNum < x770004_g_DemandTrueKill[1].num then
					if nNum == x770004_g_DemandTrueKill[1].num - 1 then
						x770004_addSomeBuff(sceneId, humanObjId, x770004_g_addofBuff[humanLevel])
						SetMissionByIndex(sceneId,humanObjId,misIndex,1,0)
						BeginEvent(sceneId)
						strText = "ͻ��ƿ����"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,humanObjId)
					else
						SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
						BeginEvent(sceneId)
						strText = format("��ɱ������%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
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
function x770004_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
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
	x770004_ShowNotice( sceneId, selfId, "���"..add.."��Ǳ��")
end