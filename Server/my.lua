--���Ƿ��ڱ�Ľű��ڣ�shuaxingclient���е���
--���ص�ֵ�ֱ�Ϊ��0~499)��buff������(������),�Լ���0~275000������Ϊ500������(������)
x892002_g_buffNew = {
	["����"] = {17000, 17499, 17500, 18049},
	["��"] = {18050, 18549, 18550, 19099},
	["����"] = {19100, 19599, 19600, 20149},
	["����"] = {20150, 20649, 20650, 21199},
	["����"] = {13000, 13499, 13500, 13699},
	["����"] = {13700, 14199, 14200, 14399},
	["����"] = {14400, 14899, 14900, 15599},
	["����"] = {15600, 16099, 16100, 16299},
	["��"] = {16300, 16799, 16800, 16999}
}

x892002_g_numToChar = {[1]="����",[2]="��",[3]="����",[4]="����",[13]="����",[14]="����",
[15]="����",[16]="����",[17]="��"}


--�㷨����
--1. ����Ҫ�����ֵ����ȡ500��ģ����ã�0~499����ֵ
--2. ����Ҫ�����ֵ���г�500�����㣬��ã�0~275000����ֵ
function x892002_SetAbility(sceneId,selfId,opcode,value)
	--local head1,tail1,head2,tail2 = x892002_g_buffNew[opcode]
	x892002_ShowNotice(sceneId,selfId,"����"..opcode.."ֵ��"..value)

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