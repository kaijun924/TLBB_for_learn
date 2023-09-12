--新的元宝商店
x888902_g_scriptId = 888902
--元宝商店列表 要与客户端界面对应
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {180,215,270,216,222,217,182,283}	--217,			--大卖场
x888902_g_shoplist[2]	= {150,151,154,212,227,153}	--152,		--宝石商城,添加"大理宝石斋--149",czf,2009.07.21
x888902_g_shoplist[3]	= {132,218,219,260,133,134,135}			--珍兽商城
x888902_g_shoplist[4]	= {136,137,181,144}				--南北杂货
x888902_g_shoplist[5]	= {282,279,165,213,220,121,120,280,281}			--形象广场
x888902_g_shoplist[6]	= {284,221,189,188,178}	--190, 191,192, 193			--花舞人间
x888902_g_shoplist[7]	= {146,164,223,224,228}						--武功秘籍
x888902_g_shoplist[8]	= {156,157,158,159,160,161,162,163}	--打造图

x888902_g_shoplist[9]	= {146}			--我要更强大
x888902_g_shoplist[10]	= {146}			--我要更有魅力
x888902_g_shoplist[11]	= {146}			--我要打造极品装备
x888902_g_shoplist[12]	= {146}				--我要打造极品珍兽
x888902_g_shoplist[13]	= {146}					--我要移动的更快
x888902_g_shoplist[14]	= {146}			--我要向别人表白
x888902_g_shoplist[15]	= {146}				--我要学习新技能

--x888902_g_shoplist[101]	= {212, 211, 213, 214, 226,227}	--至尊商店
x888902_g_shoplist[101] = {285}
x888902_g_shoplist[102]	= {286,289}
x888902_g_shoplist[103]	= {287}
x888902_g_shoplist[104]	= {288} 
x888902_g_shoplist[105]	= {289}


--机缘
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
-- 检查此随身NPC的功能
-- op是请求类别，比如1代表元宝相关的随身操作……
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB,shopC,shopD)
   x888902_NotifyTip( sceneId, selfId, "shopA是"..shopA.."shopB是"..shopB.."targetId是"..targetId )
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
              x888902_NotifyTip( sceneId, selfId, "机缘秘宝现已开放欢迎选购。" )
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
              x888902_NotifyTip( sceneId, selfId, "你已经买过这个商品了。" )
              return
           end

           if LuaFnGetMaterialBagSpace(sceneId, selfId) < 2  then
              x888902_NotifyTip( sceneId, selfId, "材料栏要不少于2个空格，请确认" )
              return
           end
           if LuaFnGetPropertyBagSpace(sceneId, selfId) < 2  then
              x888902_NotifyTip( sceneId, selfId, "道具栏要不少于2个空格，请确认" )
              return
           end
           if -1 == YuanBao(sceneId,selfId,-1,2,x888902_jiyuanmibaobuy[shopC]) then
              x888902_NotifyTip( sceneId, selfId, "您的元宝不足以购买，请确认" )
              return
           end
           SetMissionData(sceneId,selfId,JIYUANMIBAOBUY,myjiyuanmibaobuy+10^(shopC-1))
           pos = TryRecieveItem( sceneId, selfId, x888902_jiyuanmibao[ab[shopC]], 1 )
	   if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	      LuaFnItemBind(sceneId,selfId,pos)
	   end
           x888902_NotifyTip( sceneId, selfId, "恭喜，购买成功" )
         end

        if targetId == 1825 and shopA == 1825 then  
           if shopB < 1 or shopB > 10000 then
              return
           end
           if mod(shopB,100) ~= 0 then
              x888902_NotifyTip( sceneId, selfId, "输入数值必须为100的倍数" )
              return
           end
           if GetMoney(sceneId,selfId) > 100000000 then
              x888902_NotifyTip( sceneId, selfId, "你身上已携带太多金币，请消费一些再来兑换" )
              return
           end
           if -1 == YuanBao(sceneId,selfId,-1,2,floor((shopB/0.85),1)) then
              x888902_NotifyTip( sceneId, selfId, "您的元宝不足以购买，请确认" )
              return
           end
           AddMoney(sceneId,selfId,shopB*10000 );
           x888902_NotifyTip( sceneId, selfId, "恭喜，购买成功" )
         end

        if targetId == 1826 and shopA == 1826 then  
           if shopB < 1 or shopB > 10000 then
              return
           end
           if mod(shopB,100) ~= 0 then
              x888902_NotifyTip( sceneId, selfId, "输入数值必须为100的倍数" )
              return
           end

	   if (shopB +YuanBao(sceneId,selfId,targetId,3,0) ) > 2100000000 then
              x888902_NotifyTip( sceneId, selfId, "你身上元宝超过上限了，请消费一些再来兑换" )
              return
           end

           if -1 == LuaFnCostMoney(sceneId, selfId,(shopB/0.85)*10000 ) then
              x888902_NotifyTip( sceneId, selfId, "您的金币不足以购买，请确认" )
              return
           end
           YuanBao(sceneId,selfId,-1,1, shopB );
           x888902_NotifyTip( sceneId, selfId, "恭喜，购买成功" )
         end
end


function x888902_g_UIVIP(sceneId, selfId)  --vip等级
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
	--地府
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:地府里不能使用随身功能", 0);
		return 0
	end
	--组队跟随
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
	--双人骑乘
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--处于双人骑乘状态，且是被动的，交给主动方来处理
			return 0
		end
	end
	--15级以上
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 1 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:此功能只有当您的等级大于等于15级的时候方可使用", 0);
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
		x888902_NotifyTip( sceneId, selfId, "材料栏请留一个空格" )
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

