function x770006_GetPrice(sceneId,selfId,opcode,pos,itemId)
    --x770006_NotifyTip( sceneId, selfId, " ��������"  )
    if opcode == 0 then
        GetPrice2(sceneId, selfId, pos)
    elseif opcode == 1 then
        x770006_CostMoney(sceneId, selfId, pos, itemId)
    elseif opcode == 2 then
        x770006_CostMoney2(sceneId, selfId, pos, itemId)
    elseif opcode == 3 then
        BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, 100000)
        EndUICommand( sceneId )
        DispatchUICommand( sceneId, selfId, 20200432 )
    end
end

function GetPrice2(sceneId, selfId, pos)
	local equipLevel = GetBagItemLevel( sceneId, selfId, pos )
    local price = (floor(equipLevel / 10) + 1)   * 2500

    BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, price)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20200432 )
end

function x770006_CostMoney2(sceneId, selfId, pos, itemId)
    local equipMaxGemCount = GetBagGemCount( sceneId, selfId, pos )
    if equipMaxGemCount  < 3 then
        x000110_NotifyTip( sceneId, selfId, "���������޷����м��޴�ף�"  )
        return
    end
    if CostMoney(sceneId,selfId,100000) == -1 then
        x770006_NotifyTip( sceneId, selfId, "��Ǯ����" )
        return
    end
    LuaFnDelAvailableItem(sceneId,selfId,itemId,1)
    for i = 0,10 do
        AddBagItemSlotFour( sceneId, selfId, pos )
    end
    LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
    x000110_NotifyTip( sceneId, selfId, "��׳ɹ���"  )
end

function x770006_CostMoney(sceneId, selfId, pos, itemId)
    local equipLevel = floor(GetBagItemLevel( sceneId, selfId, pos ) / 10) + 1
    local price = equipLevel  * 2500
    --x770006_NotifyTip( sceneId, selfId, " ��ǰװ���ȼ���"..equipLevel.."���Ҵ�ײ���Ϊ"..itemId  )
    if equipLevel <= (itemId - 20109000) then
        local equipMaxGemCount = GetBagGemCount( sceneId, selfId, pos )
        --local equipId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 0 )
        --local equipLevel = GetBagItemLevel( sceneId, selfId, 0 )
        --x000110_NotifyTip( sceneId, selfId, " ��ǰװ���ȼ���"..equipLevel.."��"  )
        if equipMaxGemCount  >= 3 then
            x770006_NotifyTip( sceneId, selfId, " ��ǰ�����������"  )
            return
        end
        if CostMoney(sceneId,selfId,price) == -1 then
			x770006_NotifyTip( sceneId, selfId, "��Ǯ����" )
			return
		end
        LuaFnDelAvailableItem(sceneId,selfId,itemId,1)
        local ret = AddBagItemSlot( sceneId, selfId, pos )
        if ret == 1 then
            LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
            x770006_NotifyTip( sceneId, selfId, "��׳ɹ���"  )

        else
            x770006_NotifyTip( sceneId, selfId, "���ʧ��"  )
        end

    else
        x770006_NotifyTip( sceneId, selfId, "�����ײ����Ƿ�ƥ��"  )
        return
    end
end

function x770006_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end	