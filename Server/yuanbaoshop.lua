--�µ�Ԫ���̵�
x888902_g_scriptId = 888902
--Ԫ���̵��б� Ҫ��ͻ��˽����Ӧ
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {180,215,270,216,222,217,182,283}	--217,			--������
x888902_g_shoplist[2]	= {150,151,154,212,227,153}	--152,		--��ʯ�̳�,���"����ʯի--149",czf,2009.07.21
x888902_g_shoplist[3]	= {132,218,219,260,133,134,135}			--�����̳�
x888902_g_shoplist[4]	= {136,137,181,144}				--�ϱ��ӻ�
x888902_g_shoplist[5]	= {282,279,165,213,220,121,120,280,281}			--����㳡
x888902_g_shoplist[6]	= {284,221,189,188,178}	--190, 191,192, 193			--�����˼�
x888902_g_shoplist[7]	= {146,164,223,224,228}						--�书�ؼ�
x888902_g_shoplist[8]	= {156,157,158,159,160,161,162,163}	--����ͼ

x888902_g_shoplist[9]	= {146}			--��Ҫ��ǿ��
x888902_g_shoplist[10]	= {146}			--��Ҫ��������
x888902_g_shoplist[11]	= {146}			--��Ҫ���켫Ʒװ��
x888902_g_shoplist[12]	= {146}				--��Ҫ���켫Ʒ����
x888902_g_shoplist[13]	= {146}					--��Ҫ�ƶ��ĸ���
x888902_g_shoplist[14]	= {146}			--��Ҫ����˱��
x888902_g_shoplist[15]	= {146}				--��Ҫѧϰ�¼���

--x888902_g_shoplist[101]	= {212, 211, 213, 214, 226,227}	--�����̵�
x888902_g_shoplist[101] = {285}
x888902_g_shoplist[102]	= {286,289}
x888902_g_shoplist[103]	= {287}
x888902_g_shoplist[104]	= {288} 
x888902_g_shoplist[105]	= {289}


--��Ե
x888902_jiyuanmibao =  {20310185,20310186,20310187,20310189,20310190,
                     20501005,20502005,38001111,38001099,31001469,
                     38000398,38000401,38000947,38000952,38000438,
                     38000439,38000440,38000441,38000442,38000443,					 
                     50921109,50921209,50921309,50921409,50921409,					 
                     20310203,20310204,20309103,20309104,20309105,
                     20310128,20310137,20310146,20310155,20310159,
                     38002015,38000531,38000529,38001454,38001100}
x888902_jiyuanmibaobuy = {7000,7000,7000,7000,7000,
                        3000,3000,13000,1200,1100,
                        630,1200,8000,28000,8000,
                        8000,8000,8000,8000,8000,			
                        21000,21000,21000,21000,21000,
                        600,900,900,3500,21000,
                        53000,53000,53000,53000,70,
                        400,1800,400,600,1200}


--**********************************
-- ��������NPC�Ĺ���
-- op��������𣬱���1����Ԫ����ص������������
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB,shopC,shopD)
   x888902_NotifyTip( sceneId, selfId, "shopA��"..shopA.."shopB��"..shopB.."targetId��"..targetId )
     if targetId == -53 then
	if shopA == nil then
	return
	end
	if shopA < 0 or shopA > 29 then
	return
	end
	local sussceisnot,condsbaoshi,baoshilist = x888902_sanbiaocheck( sceneId, selfId,shopA)
	if sussceisnot == 0 then
	return
	end
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, shopA )	
        for i = 1,4 do
		UICommand_AddInt( sceneId, baoshilist[i])
        end		
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2016012298 )
      return
    end

if GetDayTime() ~= floor(GetMissionData(sceneId, selfId, JIYUANMIBAO2)/10000) then
   SetMissionData(sceneId, selfId, JIYUANMIBAO1,0 )
   SetMissionData(sceneId, selfId, JIYUANMIBAO2,GetDayTime()*10000 )
   SetMissionData(sceneId,selfId,JIYUANMIBAOBUY,0)
   for j = 1,6 do
       odds = random(1,getn(x888902_jiyuanmibao))
       if j < 5 then
          SetMissionData(sceneId, selfId, JIYUANMIBAO1,GetMissionData(sceneId, selfId, JIYUANMIBAO1) + odds*(10^(2*(j-1))) )
       else
          SetMissionData(sceneId, selfId, JIYUANMIBAO2,GetMissionData(sceneId, selfId, JIYUANMIBAO2) + odds*(10^(2*(j-5))) )
       end
   end
end

        local sun = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)
	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);
	if bCheck > 0 then
	if shopA > 10000 and shopB >10000 then
		CallScriptFunction((800103), "OnSignalPetProcreateRegister", sceneId, selfId, targetId, shopA ,shopB )
		return
	end
		if shopA > 0 and shopA < 300 and x888902_g_shoplist[shopA][shopB] ~= nil then
			if targetId == -1 then		
				-- if shopA == 101 and shopB > sun then 
				-- 	return
				-- end 
				x888902_g_UIVIP(sceneId, selfId)
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
		end
	end

        if targetId == 1987 and shopA == 1987 and  shopB == 1987 then 

           if shopA == 1987 and  shopB == 1987 then 
              x888902_NotifyTip( sceneId, selfId, "��Ե�ر����ѿ��Ż�ӭѡ����" )
              --return
           end

           local pos = -1
           local myjiyuanmibao1 = GetMissionData(sceneId,selfId,JIYUANMIBAO1)
           local myjiyuanmibao2 = GetMissionData(sceneId,selfId,JIYUANMIBAO2)
           local myjiyuanmibaobuy = GetMissionData(sceneId,selfId,JIYUANMIBAOBUY)

            ab = {}
               ab[1] = mod(myjiyuanmibao1,100)
               ab[2] = mod(floor(myjiyuanmibao1/100),100)
               ab[3] = mod(floor(myjiyuanmibao1/10000),100)
               ab[4] = mod(floor(myjiyuanmibao1/1000000),100)
               ab[5] = mod(myjiyuanmibao2,100)
               ab[6] = mod(floor(myjiyuanmibao2/100),100)

            red = {}
               red[1] = mod(myjiyuanmibaobuy,10)
               red[2] = mod(floor(myjiyuanmibaobuy/10),10)
               red[3] = mod(floor(myjiyuanmibaobuy/100),10)
               red[4] = mod(floor(myjiyuanmibaobuy/1000),10)
               red[5] = mod(floor(myjiyuanmibaobuy/10000),10)
               red[6] = floor(myjiyuanmibaobuy/100000)

           if shopC < 1 or shopC > 6 then
              return
           end

           if red[shopC] ~= 0 then
              x888902_NotifyTip( sceneId, selfId, "���Ѿ���������Ʒ�ˡ�" )
              return
           end

           if LuaFnGetMaterialBagSpace(sceneId, selfId) < 2  then
              x888902_NotifyTip( sceneId, selfId, "������Ҫ������2���ո���ȷ��" )
              return
           end
           if LuaFnGetPropertyBagSpace(sceneId, selfId) < 2  then
              x888902_NotifyTip( sceneId, selfId, "������Ҫ������2���ո���ȷ��" )
              return
           end
           if -1 == YuanBao(sceneId,selfId,-1,2,x888902_jiyuanmibaobuy[shopC]) then
              x888902_NotifyTip( sceneId, selfId, "����Ԫ�������Թ�����ȷ��" )
              return
           end
           SetMissionData(sceneId,selfId,JIYUANMIBAOBUY,myjiyuanmibaobuy+10^(shopC-1))
           pos = TryRecieveItem( sceneId, selfId, x888902_jiyuanmibao[ab[shopC]], 1 )
	   if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	      LuaFnItemBind(sceneId,selfId,pos)
	   end
           x888902_NotifyTip( sceneId, selfId, "��ϲ������ɹ�" )
         end

        if targetId == 1825 and shopA == 1825 then  
           if shopB < 1 or shopB > 10000 then
              return
           end
           if mod(shopB,100) ~= 0 then
              x888902_NotifyTip( sceneId, selfId, "������ֵ����Ϊ100�ı���" )
              return
           end
           if GetMoney(sceneId,selfId) > 100000000 then
              x888902_NotifyTip( sceneId, selfId, "��������Я��̫���ң�������һЩ�����һ�" )
              return
           end
           if -1 == YuanBao(sceneId,selfId,-1,2,floor((shopB/0.85),1)) then
              x888902_NotifyTip( sceneId, selfId, "����Ԫ�������Թ�����ȷ��" )
              return
           end
           AddMoney(sceneId,selfId,shopB*10000 );
           x888902_NotifyTip( sceneId, selfId, "��ϲ������ɹ�" )
         end

        if targetId == 1826 and shopA == 1826 then  
           if shopB < 1 or shopB > 10000 then
              return
           end
           if mod(shopB,100) ~= 0 then
              x888902_NotifyTip( sceneId, selfId, "������ֵ����Ϊ100�ı���" )
              return
           end

	   if (shopB +YuanBao(sceneId,selfId,targetId,3,0) ) > 2100000000 then
              x888902_NotifyTip( sceneId, selfId, "������Ԫ�����������ˣ�������һЩ�����һ�" )
              return
           end

           if -1 == LuaFnCostMoney(sceneId, selfId,(shopB/0.85)*10000 ) then
              x888902_NotifyTip( sceneId, selfId, "���Ľ�Ҳ����Թ�����ȷ��" )
              return
           end
           YuanBao(sceneId,selfId,-1,1, shopB );
           x888902_NotifyTip( sceneId, selfId, "��ϲ������ɹ�" )
         end
end


function x888902_g_UIVIP(sceneId, selfId)  --vip�ȼ�
local sun = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)
local mypoint = GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)
if 	sun > 6 then
	sun = 6
end	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId,sun )
		UICommand_AddInt( sceneId,mypoint )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20160227 )	
end	

function x888902_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end	

function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--�ظ�
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:�ظ��ﲻ��ʹ��������", 0);
		return 0
	end
	--��Ӹ���
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	--˫�����
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--����˫�����״̬�����Ǳ����ģ�����������������
			return 0
		end
	end
	--15������
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 1 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:�˹���ֻ�е����ĵȼ����ڵ���15����ʱ�򷽿�ʹ��", 0);
		return 0
	else

		return 1
	end
	return 0
end

function x888902_sanbiaocheck( sceneId, selfId,Index)
	local ret = GetGemEmbededCount( sceneId, selfId, Index )
	if ret ~= 0 then
		local materbagspace = LuaFnGetMaterialBagSpace( sceneId, selfId)
		if materbagspace < 1 then
		x888902_NotifyTip( sceneId, selfId, "����������һ���ո�" )
		return 0,0,{0,0,0,0}
	   end
	end
	local equipMaxGemCount = GetBagGemCount( sceneId, selfId, Index )
	local biaoshi = {0,0,0,0}
	local gemEmbededIdx = -1
	local jisu = 0
	if equipMaxGemCount > 0 then
	for i = 0,equipMaxGemCount-1 do
	gemEmbededIdx = GetGemEmbededType( sceneId, selfId, Index, i )
	jisu = jisu + 1
	if gemEmbededIdx > 0 then
	biaoshi[jisu] = gemEmbededIdx
	end
	end	
	end
return 1,equipMaxGemCount,biaoshi	
end	

