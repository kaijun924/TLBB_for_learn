x000110_g_scriptId = 000110

--**********************************
--�¼��������
--**********************************
function x000110_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		BeginEvent( sceneId )
		AddText( sceneId, "    ����������Խ���װ���ͱ�ʯ�Ĵ󲿷ֲ�����" )
		AddText( sceneId, "    ���#Gװ������#Wѡ��ɴ�װ�����#W��#G��ʯ��Ƕ#W��#G��ʯժ��#W���棻" )
		AddText( sceneId, "    ���#G��ʯ����#Wѡ��ɴ򿪱�ʯ�ϳ�#W��#G��ʯ����#W��#G��ʯ����#W��#G��ʯ����#W��#G���̷���#W��#Gװ����ʯ����#W���档" )
                AddNumText( sceneId, x000110_g_scriptId, "#Gװ������", 6, 18 )
		AddNumText( sceneId, x000110_g_scriptId, "#G��ʯ����", 6, 17 )
		AddNumText( sceneId, x000110_g_scriptId, "���Ϻϳ�", 6, 4 )
		AddNumText( sceneId, x000110_g_scriptId, "���ϵ��", 6, 7000 )				
		AddNumText( sceneId, x000110_g_scriptId, "װ����������", 11, 0 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ��������", 11, 55 )
                --Ы�����α�ʯת�ƣ���������д����⣬ת��֮��ԭװ����ʯ������ʧ������Դװ���ĵ��ơ�ǿ��������ȣ����Ḵ�Ƹ���װ��
		--AddNumText( sceneId, x000110_g_scriptId, "��ʯת��", 6, 889 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000110_OnEventRequest( sceneId, selfId, targetId, eventId )

-------------------���ڷ���������----------------------------------------
	if GetNumText() == 3003 then
	        BeginEvent( sceneId )
		AddText( sceneId, "    ����������Խ���װ���ͱ�ʯ�Ĵ󲿷ֲ�����" )
		AddText( sceneId, "    ���#Gװ������#Wѡ��ɴ�װ�����#W��#G��ʯ��Ƕ#W��#G��ʯժ��#W���棻" )
		AddText( sceneId, "    ���#G��ʯ����#Wѡ��ɴ򿪱�ʯ�ϳ�#W��#G��ʯ����#W��#G��ʯ����#W��#G��ʯ����#W��#G���̷���#W��#Gװ����ʯ����#W���档" )
                AddNumText( sceneId, x000110_g_scriptId, "#Gװ������", 6, 18 )
		AddNumText( sceneId, x000110_g_scriptId, "#G��ʯ����", 6, 17 )
		AddNumText( sceneId, x000110_g_scriptId, "���Ϻϳ�", 6, 4 )
		AddNumText( sceneId, x000110_g_scriptId, "װ����������", 11, 0 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ��������", 11, 55 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
end

---------------------------����-------------------------------------------------
		if GetNumText() == 0 then
			BeginEvent(sceneId)		
				AddText(sceneId,"#{function_help_054}")	
				AddNumText(sceneId, x000110_g_scriptId,"װ����׽���",11,8);
				AddNumText(sceneId, x000110_g_scriptId,"��ʯ�ϳɽ���",11,9);
				AddNumText(sceneId, x000110_g_scriptId,"��ʯ��Ƕ����",11,10);
				AddNumText(sceneId, x000110_g_scriptId,"��ʯժ������",11,11);
				AddNumText(sceneId, x000110_g_scriptId,"װ���������",11,12);
				AddNumText(sceneId, x000110_g_scriptId,"��ʯ��������",11,13);
				AddNumText(sceneId, x000110_g_scriptId,"��ʯ��������",11,14);
				AddNumText(sceneId, x000110_g_scriptId,"ʤ����ʯ����",11,15);
				AddNumText(sceneId, x000110_g_scriptId,"#W������һҳ",8,3003);
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
---------------------------���Ϻϳɽ���-------------------------------------------
		if GetNumText() == 20 then  
			BeginEvent(sceneId)			
				AddText(sceneId,"#{SJSJ_081021_001}")
				AddNumText(sceneId, x000110_g_scriptId,"�����Ĳ�������",11,21);
				AddNumText(sceneId, x000110_g_scriptId,"�����Ĳ�������",11,22);
				AddNumText(sceneId, x000110_g_scriptId,"�޲��Ĳ�������",11,23);				
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
---------------------------��ʯ����-------------------------------------------
	    if  GetNumText() == 17 then
		BeginEvent( sceneId )
		AddText( sceneId, "    ����԰Ѽ�����ͬ�ı�ʯ�ϳ�Ϊһ�Ÿ�һ���ı�ʯ���Ѽ����ͼ��Ĳ��Ϻϳ�Ϊһ����һ���Ĳ��ϣ�Ҳ���Ը�װ�������������Ƕ��ʯ��Ҳ���԰ѱ�ʯժ����" )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ��ؽ���", 11, 0 )
		AddNumText( sceneId, x000110_g_scriptId, "���Ϻϳɽ���", 11, 20 ) 
		--AddNumText( sceneId, x000110_g_scriptId, "#eaf0c14#Y��ʯ����", 6, 300 ) --���û���꣬�ݲ�����
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ�ϳ�", 6, 10000 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ��Ƕ", 6, 5 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯժ��", 6, 3 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ����", 6, 6 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ����", 6, 7 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ����", 6, 100 )
		AddNumText( sceneId, x000110_g_scriptId, "���̷���", 6, 200 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ������Ƕ", 6, 31 )
		AddNumText( sceneId, x000110_g_scriptId, "��ʯ����ժ��", 6, 32 )
		--AddNumText( sceneId, x000110_g_scriptId, "#eaf0c14#Y��ʯת��", 6, 2 )
		AddNumText(sceneId, x000110_g_scriptId,"#W������һҳ",8,3003);	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
         end
---------------------------װ������-------------------------------------------
         if  GetNumText() == 18 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{OBJ_suzhou_0020}" )
		--AddNumText( sceneId, x000110_g_scriptId, "һ���Ŀ�", 6, 2010 )
		--AddNumText( sceneId, x000110_g_scriptId, "#Gһ����Ƕ", 6, 2020 )
		AddNumText( sceneId, x000110_g_scriptId, "#G���޴��", 6, 10 )
		AddNumText( sceneId, x000110_g_scriptId, "װ�����", 6, 2 ) --ȥ����׹��ܣ���ʵ��
		AddNumText( sceneId, x000110_g_scriptId, "װ��ǿ��", 6, 1001 )
		AddNumText( sceneId, x000110_g_scriptId, "װ������", 6, 1003 )
		AddNumText( sceneId, x000110_g_scriptId, "װ�����ʼ���", 6, 1004 )
		AddNumText( sceneId, x000110_g_scriptId, "װ�������ؼ�", 6, 1005 )
		AddNumText(sceneId, x000110_g_scriptId,"#W������һҳ",8,3003);	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
         end

--****************************************************************************

--------------------------- װ��ǿ��-----------------------------------
		if	GetNumText()==1001 then
		        BeginEvent(sceneId)
		        AddText(sceneId,"#{ZBQHJ_130508_1}")
		        AddNumText(sceneId,x000110_g_ScriptId,"#cffcc00ʹ��#Gǿ������#cffcc00ǿ��װ��",6,1599)
		        AddNumText(sceneId,x000110_g_ScriptId,"#cffcc00ʹ��#Gǿ������#cffcc00ǿ��װ��",6,1699)
		        AddNumText(sceneId,x000110_g_ScriptId,"#cffcc00ǿ��ת��",6,1002)
		        AddNumText(sceneId,x000110_g_ScriptId,"#cffcc00װ��ǿ������",11,3333)
		        AddNumText(sceneId,x000110_g_ScriptId,"#cffcc00ǿ��ת�ƽ���",11,3334)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if GetNumText()== 1599 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1002)
			return
		end

		if GetNumText() == 1699 then
	   	        BeginUICommand( sceneId )
		        UICommand_AddInt( sceneId, selfId )
                        UICommand_AddInt( sceneId, 11)
                        UICommand_AddInt( sceneId, 50000)---��Ҫ��Ǯ
	                UICommand_AddInt( sceneId, 10000000) --װ����ʼ
	                UICommand_AddInt( sceneId, 20000000)  --װ������
	                UICommand_AddInt( sceneId, -1)  --��Ʒid
		        UICommand_AddString(sceneId,"װ��ǿ��������");
		        UICommand_AddString(sceneId,"#{ZBQHJ_130508_7}");
		        UICommand_AddString(sceneId,"�뽫װ������˿�");
		        UICommand_AddString(sceneId,"�뽫ǿ���������˿�");
		        EndUICommand( sceneId )
		        DispatchUICommand( sceneId,selfId,21090722)
			return
		end

--------------------------- װ��ǿ��ת��-------------------------------

		if GetNumText() == 1002 then
                    BeginUICommand(sceneId)
		    UICommand_AddInt(sceneId,targetId);
		    EndUICommand(sceneId )
		    DispatchUICommand(sceneId,selfId, 20130521 )
                    return
                end


--------------------------- װ������------------------------------------
		if	GetNumText()==1003 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1005)
			return
		end


-------------------------װ�����ʼ���-----------------------------------
		if GetNumText() == 1004 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1001 )
			return
		end
-------------------------װ�����-----------------------------------
		if GetNumText() == 2 then
			local equipMaxGemCount = GetBagGemCount( sceneId, selfId, 0 )
			local equipId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 0 )
			local equipLevel = GetBagItemLevel( sceneId, selfId, 0 )
			x000110_NotifyTip( sceneId, selfId, " ��ǰװ���ȼ���"..equipLevel.."��"  )
			if equipMaxGemCount  >= 3 then
				x000110_NotifyTip( sceneId, selfId, " ��ǰ�����������"  )
				return
			end
			local hasItem = LuaFnGetAvailableItemCount(sceneId, selfId, 20109011) 
			if hasItem >= 1 then
				LuaFnDelAvailableItem(sceneId,selfId,20109011,1)
				local ret = AddBagItemSlot( sceneId, selfId, 0 )
				if ret == 1 then
					LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
					x000110_NotifyTip( sceneId, selfId, "��׳ɹ���"  )

				else
					x000110_NotifyTip( sceneId, selfId, "���ʧ��"  )
				end
				return			
			end

			x000110_NotifyTip( sceneId, selfId, "�����Ƿ�����ˮ֮��"  )
			return
		end
		
	if GetNumText() == 7000 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#{ZZQH_180929_5}" )				
		AddNumText( sceneId, x000110_g_ScriptId, "��������޲�",6,7001 )	
		AddNumText( sceneId, x000110_g_ScriptId, "�����������",6,7002 )	
		AddNumText( sceneId, x000110_g_ScriptId, "���ϵ�����",6,7003 )		
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	

	elseif GetNumText() == 7001 then
	local nStoneId0 = 20501003
	       	local nStoneId1 = 38002048
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20501003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,38002048,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20501005, 1)--������Ʒ
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ���ɹ����������޲�" )
		local	nam	= LuaFnGetName( sceneId, selfId )
		DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#b#c66ccff���ϲ��������Ƿ񱳰���1����������3���޲���һ���������ĵ���񣡣�"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 7002 then
	local nStoneId0 = 20502003
	       	local nStoneId1 = 38002048
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20502003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,38002048,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20502005, 1)--������Ʒ
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ���ɹ�������������" )
		local	nam	= LuaFnGetName( sceneId, selfId )
		DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#b#c66ccff���ϲ��������Ƿ񱳰���1����������3��������һ���������ĵ���񣡣�"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end		
			end						

--------------------- ���¼���װ������-----------------------------------
		if	GetNumText()==1005 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 112233)
			return
		end
		if	GetNumText() == 7003 then
			BeginEvent(sceneId)						
			AddText(sceneId,"#{ZZQH_180929_5}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end			
------------------------- ���Ϻϳ�---------------------------------------
		if GetNumText() == 4 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19810424 )
			return
		end



		if GetNumText()== 300 then --��ʯ��������ʱû�����UI
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 201408140 )
		 return
		 end

	if GetNumText() == 299999 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,0);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 201302201 )
	   return
	end

	if GetNumText()== 2020 then
		 x000110_yiqianaddbiaoshi( sceneId, selfId,targetId)
		 return
	end

        if GetNumText() == 889 then	
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
                UICommand_AddInt( sceneId, 6)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)		
	return
        end	

	
	if GetNumText() == 888 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,2013060601 )
		return
	end	
	
	if GetNumText() == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,201210120)
		return
	elseif GetNumText() == 200 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201210121)
		return
	end
	
	if GetNumText() == 889 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )
		return
	end
	if GetNumText() == 893 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1004 )
		return
	end
	if GetNumText() == 890 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1005 )
		return
	end
	if GetNumText() == 891 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1006 )
		return
	end
	if GetNumText() == 892 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112233 )
		return
	end
	if GetNumText() == 8 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_039}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 9 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_040}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 10 then
		BeginEvent(sceneId)						
		AddNumText( sceneId, x000110_g_scriptId, "������", 6, 30 )
		AddNumText( sceneId, x000110_g_scriptId, "�����", 6, 11 )
		AddNumText( sceneId, x000110_g_scriptId, "#W������һҳ", 8, 18 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
		
	if GetNumText() == 30 then
		local equipMaxGemCount = GetBagGemCount( sceneId, selfId, 0 )
		if equipMaxGemCount  < 3 then
			x000110_NotifyTip( sceneId, selfId, "���������޷����м��޴�ף�"  )
			return
		end
		local hasItem = LuaFnGetAvailableItemCount(sceneId, selfId, 20310111) 
		if hasItem >= 1 then
			LuaFnDelAvailableItem(sceneId,selfId,20310111,1)
			for i = 0,10 do
				AddBagItemSlotFour( sceneId, selfId, 0 )
			end
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
			x000110_NotifyTip( sceneId, selfId, "��׳ɹ���"  )
			return		
		end
		x000110_NotifyTip( sceneId, selfId, "�����Ƿ��к��񾫴�")
		return
	end
		
	if GetNumText() == 31 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 751107 )
		return
	end
		
	if GetNumText() == 32 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 25702 )
		return
	end
		
	if GetNumText() == 11 then
		local equipMaxGemCount = GetBagGemCount( sceneId, selfId, 0 )
		if equipMaxGemCount  < 3 then
			x000110_NotifyTip( sceneId, selfId, "���������޷����м��޴�ף�"  )
			return
		end
		local hasItem = LuaFnGetAvailableItemCount(sceneId, selfId, 20109101) 
		if hasItem >= 1 then
			LuaFnDelAvailableItem(sceneId,selfId,20109101,1)
			for i = 0,10 do
				AddBagItemSlotFour( sceneId, selfId, 0 )
			end
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
			x000110_NotifyTip( sceneId, selfId, "��׳ɹ���"  )
			return		
		end
		x000110_NotifyTip( sceneId, selfId, "�����Ƿ��е��֮��")
		return
	end	
	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 13 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{INTERFACE_XML_GemCarve_6}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 10000 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 23 )
		return
	end
	if GetNumText() == 3 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 27 )
		return
	end
	
	if GetNumText() == 5 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19830424 )
		return
	end
	if GetNumText() == 6 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112236 )
		return
	end
		
	if GetNumText() == 7 then
	  BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112237 )
		return
	end
	if GetNumText() == 2010 then
		x000110_OneKey4Slot( sceneId, selfId, 1 )
    end	
end	




function x000110_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId ) --���
    if not selectRadioId then
		return
	end	 

	local itemid = LuaFnGetItemTableIndexByIndex(sceneId, selfId,30)
	if floor( itemid/ 10000000 ) ~= 5 then
	    x000110_NotifyTip( sceneId, selfId, "����Ҫ����ת���ı�ʯ�ŵ�������һ������" )	
		return
	end
	local bagindex = GetBagItemTransfer( sceneId, selfId, 30 )
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, 30 )
	if ret ~= 1 then
	x000110_NotifyTip( sceneId, selfId, "������ʯ���ɶһ�" )
		return		
	end	

	  if LuaFnGetItemType(itemid) ~= LuaFnGetItemType(selectRadioId) then
        x000110_NotifyTip( sceneId, selfId, "ѡ��ĺͲ�������һ�������Ͳ�ƥ��" )	
		return
	 end
	 if GetItemQuality( itemid ) ~= GetItemQuality( selectRadioId ) then
	    x000110_NotifyTip( sceneId, selfId, "ѡ��ĺͲ�������һ���ĵȼ���ƥ��" )	
		return
	 end
	local idxa = 30503177  --4���ĸ�
	
	--if  GetItemQuality( itemid ) == 6 then
	--idxa = 30503179
	--elseif GetItemQuality( itemid ) == 7 then
	--  idxa = 30503180
	--elseif GetItemQuality( itemid ) == 8 then
	--idxa = 30503181
	--end
	
	
	if LuaFnGetAvailableItemCount(sceneId, selfId,idxa) < 1 then
		
	x000110_NotifyTip(sceneId, selfId, "��ȱ��"..GetItemName( sceneId,idxa))	
		return
	end	
	
	LuaFnDelAvailableItem(sceneId,selfId,idxa,1)
		if LuaFnEraseItem(sceneId, selfId, 30) ~= 1 then
			x000110_NotifyTip(sceneId, selfId, "�۳���Ʒʧ�ܣ�")
			return
		end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	local ret1 = TryRecieveItem(sceneId, selfId, selectRadioId, 1)
	LuaFnItemBind( sceneId, selfId,ret1);
	x000110_NotifyTip( sceneId, selfId,"�һ��ɹ�")
	local szTranItm1	= GetBagItemTransfer( sceneId, selfId, ret1 )
	local szMsg = format( "#H��ϲ���#{_INFOUSR%s}ʹ�� #{_INFOMSG%s} ��#G����(163.106)#H���ɹ��һ���һ��#{_INFOMSG%s1}��",LuaFnGetName( sceneId, selfId ), bagindex,szTranItm1 )
	BroadMsgByChatPipe( sceneId, selfId, szMsg,4)
end

function x000110_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
function x000110_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
function x000110_OneKey4Slot( sceneId, selfId,isTips )
	local tEquipGemTable = {0,1,16,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18}
    local bagbegin = GetBasicBagStartPos(sceneId, selfId)
    local bagend = GetBasicBagEndPos(sceneId, selfId)
    for i = 0,10 do
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )	
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )	
					local ret = AddBagItemSlot( sceneId, selfId, i )
					local ret1 = AddBagItemSlotFour( sceneId, selfId, i )  
					equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )

				end
			end
		end
	end
    local tEquipGemTable1 = {2}
    local bagbegin1 = GetBasicBagStartPos(sceneId, selfId)
    local bagend1 = GetBasicBagEndPos(sceneId, selfId)
    for i = 0,10 do
		for i=bagbegin1, bagend1 do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )	
				local find = 0
				for j, gem in tEquipGemTable1 do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					--local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )	
					--local ret = AddBagItemSlot( sceneId, selfId, i )
					--**--local ret1 = AddBagItemSlotFour( sceneId, selfId, i )  ---�Ŀף�ʱװ������
					--equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )

				end
			end
		end
	end
	
	if isTips==1 then
	x000110_NotifyTip( sceneId, selfId, "��ϲ��������������װ���Ѿ��ɹ������Ŀ�" )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	end
end
--**********************************
--һ����Ƕ8����ʯ
--**********************************
function x000110_yiqianaddbiaoshi( sceneId, selfId,targetId)
local mybiaoshilist_g_Gem = 
{
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--����0��
{ 50321303,50302007,50303001,50304002,50313004,50314001,50311001,50312006 },--����1��
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--ؤ��2��
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312005 },--�䵱3��
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312007 },--��ü4��
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--����5��
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--����6��
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312007 },--��ɽ7��
{ 50321303,50302007,50303001,50304002,50313004,50314001,50311001,50312006 },--��ң8��
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--������9��
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--Ľ��10��
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--����11��
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--���12��
}

		local tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 17, 18 } 
		local Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local nLevel					= GetBagItemLevel( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )			
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )				
				local find = 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )	
					local axiaocs = 0				
					while equipMaxGemCount<3 do		
axiaocs = axiaocs + 1
if axiaocs > 30 then
AddGlobalCountNews( sceneId, "���������ϵGM���������13" )
break
end		
						local ret = AddBagItemSlot( sceneId, selfId, i )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )			
					end
                 AddBagItemSlotFour( sceneId, selfId, i )--��
				end
			end
                local can = 0
                local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )
				local equipEmbededGemCount = 0
				equipMaxGemCount = 0
				if EquipType >= 0 and EquipType ~= 16 then
				-- �ж��Ƿ񻹿�����Ƕ���౦ʯ
				equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )
				equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, i )
                end
				--modi:lby�Ƿ������Ƕ
				if equipMaxGemCount > equipEmbededGemCount and equipMaxGemCount ~= 0 then
					can = 1
				end
				if can == 1 then	
					if EquipType == 0 or EquipType == 6 or EquipType == 7 or EquipType == 11 or EquipType == 12 or EquipType == 13 or EquipType == 14 or EquipType == 17 or EquipType == 18 or EquipType == 10 or EquipType == 9 then

						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=1, 4 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- �Ա����ű�ʯ�����ͣ���ʯ���ࣩ
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
						
					elseif EquipType == 1 or EquipType == 2 or EquipType == 3 or EquipType == 4 or EquipType == 5 or EquipType == 15  then
						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=5, 8 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- �Ա����ű�ʯ�����ͣ���ʯ���ࣩ
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
					end
				end
	end
		x000110_NotifyTip( sceneId, selfId, "  ��ϲ���������������е�װ������ȫ����Ƕ��[#R6����ʯ#Y]��"  )
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)

end


--XBQTIAFKXBQ��չ������
