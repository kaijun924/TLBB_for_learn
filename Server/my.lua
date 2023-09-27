--考虑放在别的脚本内，shuaxingclient进行调用
--返回的值分别为（0~499)的buff的索引(闭区间),以及（0~275000）步长为500的索引(闭区间)
x892002_g_buffNew = {
	["冰攻"] = {17000, 17499, 17500, 18049},
	["火攻"] = {18050, 18549, 18550, 19099},
	["玄攻"] = {19100, 19599, 19600, 20149},
	["毒攻"] = {20150, 20649, 20650, 21199},
	["力量"] = {13000, 13499, 13500, 13699},
	["灵气"] = {13700, 14199, 14200, 14399},
	["体力"] = {14400, 14899, 14900, 15599},
	["定力"] = {15600, 16099, 16100, 16299},
	["身法"] = {16300, 16799, 16800, 16999}
}

x892002_g_numToChar = {[1]="冰攻",[2]="火攻",[3]="玄攻",[4]="毒攻",[13]="力量",[14]="灵气",
[15]="体力",[16]="定力",[17]="身法"}


--算法介绍
--1. 对需要传入的值进行取500的模，获得（0~499）的值
--2. 对需要传入的值进行除500的运算，获得（0~275000）的值
function x892002_SetAbility(sceneId,selfId,opcode,value)
	--local head1,tail1,head2,tail2 = x892002_g_buffNew[opcode]
	x892002_ShowNotice(sceneId,selfId,"内容"..opcode.."值是"..value)

	-- local lefting = value - 500 * floor(value/500)
	-- local lefting2 = floor(value/500)

	-- if lefting + head1 > tail1 then
	-- 	lefting = tail1
	-- end

	-- if lefting2 + head2 > tail2 then
	-- 	lefting2 = tail2
	-- end

	-- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, lefting + head1, 0)
	-- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, lefting2 + head2, 0)
end