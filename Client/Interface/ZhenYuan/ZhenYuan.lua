--*********************
--真元主界面
--*********************
local ZhenYuan_GFPage = 0 --0是攻击，1是防御

local ZhenYuan_EquipActionBtn = {}
local ZhenYuan_EquipPneumaActionBtn = {}
local ZhenYuan_EquipPneumaActionBtn_Name = {}
local ZhenYuan_BagPneumaActionBtn = {}
local ZhenYuan_InfoText = {}
local ZhenYuan_UpgradeButton = {}
local ZhenYuan_UpgradeButton_Name = {}

local ZhenYuan_UpgradeTipsBtn = {}
local ZhenYuan_EquipImage = {}
local ZhenYuan_FengBtn = {}

local ZhenYuan_EquipPos = 0
local ZhenYuan_Bag = 36
local ZhenYuan_SmeltBag = 72
local ZhenYuan_Size = 24

local ZhenYuanPageSize = 6
local ZhenYuan_TabIndex = 0
local iSexy = 1
local ZhenYuan_UXP;
local ZhenYuan_UYP;
local ZhenYuan_MF = { 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602 }
local ZhenYuan_LevelUp_ActMission_JieZhenYuan = 1604
local ZhenYuan_LevelUp_ActMission_HanRuHai = 1603
local ZhenYuan_LevelUp_ActMission_MiZhenZhi = 1602
local ZhenYuan_SelectItem = 0
local ZhenYuanData1 = "00000000"
local ZhenYuanData2 = "0000000000000000000000000000000000000000"
local yuanjin = 0
local zenyuanlevel = { { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
	{ 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
	{ 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
	{ 0, 0, 0, "0", "00", "0" } }
local zenyuanlevel2 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
local ZhenYuan_upitemos = 0
local jinsui = 0
local minquajinjei = 0
ZhenYuan_equipoit = { 7, 6, 11, 14, 12, 13, 16, 5, 3, 4, 1, 15 }
ZhenYuan_yuanse = { "#W", "#G", "#c6699ff", "#cff99ff", "#cff9900" }

adddsuxingvalue = {}


adddsuxingvalue[1] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·勇力", "力量" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·勇力", "力量" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·勇力",
	"力量" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·勇力", "力量" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·勇力", "力量" } }
adddsuxingvalue[2] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·灵慧", "灵气" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·灵慧", "灵气" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·灵慧",
	"灵气" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·灵慧", "灵气" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·灵慧", "灵气" } }
adddsuxingvalue[3] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·厚体", "体力" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·厚体", "体力" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·厚体",
	"体力" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·厚体", "体力" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·厚体", "体力" } }
adddsuxingvalue[4] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·气定", "定力" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·气定", "定力" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·气定",
	"定力" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·气定", "定力" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·气定", "定力" } }
adddsuxingvalue[5] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·迅捷", "身法" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·迅捷", "身法" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·迅捷",
	"身法" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·迅捷", "身法" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·迅捷", "身法" } }
adddsuxingvalue[6] = { { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, "真元·血涌丹田", "血上限" },
	{ 2000, 4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, "真元·血涌丹田", "血上限" },
	{ 3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000, 27000, "真元·血涌丹田", "血上限" },
	{ 4000, 8000, 12000, 16000, 20000, 24000, 28000, 32000, 36000, "真元·血涌丹田", "血上限" },
	{ 5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, "真元·血涌丹田", "血上限" } }
adddsuxingvalue[7] = { { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, "真元·气贯神庭", "气上限" },
	{ 2000, 4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, "真元·气贯神庭", "气上限" },
	{ 3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000, 27000, "真元·气贯神庭", "气上限" },
	{ 4000, 8000, 12000, 16000, 20000, 24000, 28000, 32000, 36000, "真元·气贯神庭", "气上限" },
	{ 5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, "真元·气贯神庭", "气上限" } }
adddsuxingvalue[8] = { { 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, "真元·内劲绵绵", "内功攻击" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·内劲绵绵", "内功攻击" },
	{ 600, 1200, 1800, 2400, 3000, 3600, 4200, 4800, 5400, "真元·内劲绵绵", "内功攻击" },
	{ 800, 1600, 2400, 3200, 4000, 4800, 5600, 6400, 7200, "真元·内劲绵绵", "内功攻击" },
	{ 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, "真元·内劲绵绵", "内功攻击" } }
adddsuxingvalue[9] = { { 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, "真元·外功罡猛", "外功攻击" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·外功罡猛", "外功攻击" },
	{ 600, 1200, 1800, 2400, 3000, 3600, 4200, 4800, 5400, "真元·外功罡猛", "外功攻击" },
	{ 800, 1600, 2400, 3200, 4000, 4800, 5600, 6400, 7200, "真元·外功罡猛", "外功攻击" },
	{ 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, "真元·外功罡猛", "外功攻击" } }
adddsuxingvalue[10] = { { 100, 200, 300, 400, 500, 600, 700, 800, 900, "真元·千转柔筋", "内功防御" },
	{ 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, "真元·千转柔筋", "内功防御" },
	{ 300, 600, 900, 1200, 1500, 1800, 2100, 2400, 2700, "真元·千转柔筋", "内功防御" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·千转柔筋", "内功防御" },
	{ 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, "真元·千转柔筋", "内功防御" } }
adddsuxingvalue[11] = { { 100, 200, 300, 400, 500, 600, 700, 800, 900, "真元·百炼铁骨", "外功防御" },
	{ 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, "真元·百炼铁骨", "外功防御" },
	{ 300, 600, 900, 1200, 1500, 1800, 2100, 2400, 2700, "真元·百炼铁骨", "外功防御" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·百炼铁骨", "外功防御" },
	{ 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, "真元·百炼铁骨", "外功防御" } }
adddsuxingvalue[12] = { { 100, 200, 300, 400, 500, 600, 700, 800, 900, "真元·百步穿杨", "命中" },
	{ 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, "真元·百步穿杨", "命中" },
	{ 300, 600, 900, 1200, 1500, 1800, 2100, 2400, 2700, "真元·百步穿杨", "命中" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·百步穿杨", "命中" },
	{ 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, "真元·百步穿杨", "命中" } }
adddsuxingvalue[13] = { { 80, 160, 240, 320, 400, 480, 560, 640, 720, "真元·滑不沾衣", "闪避" },
	{ 160, 320, 480, 640, 800, 960, 1120, 1280, 1440, "真元·滑不沾衣", "闪避" },
	{ 240, 480, 720, 960, 1200, 1440, 1680, 1920, 2160, "真元·滑不沾衣", "闪避" },
	{ 320, 640, 960, 1280, 1600, 1920, 2240, 2560, 2880, "真元·滑不沾衣", "闪避" },
	{ 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, "真元·滑不沾衣", "闪避" } }
adddsuxingvalue[14] = { { 3, 6, 9, 12, 15, 18, 21, 24, 27, "真元·暴猛如焰", "会心攻击" },
	{ 6, 12, 18, 24, 30, 36, 42, 48, 54, "真元·暴猛如焰", "会心攻击" },
	{ 9, 18, 27, 36, 45, 54, 63, 72, 81, "真元·暴猛如焰", "会心攻击" },
	{ 12, 24, 36, 48, 60, 72, 84, 96, 108, "真元·暴猛如焰", "会心攻击" },
	{ 15, 30, 45, 60, 75, 90, 105, 120, 135, "真元·暴猛如焰", "会心攻击" } }
adddsuxingvalue[15] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·坚韧如岳", "会心防御" },
	{ 4, 8, 12, 16, 20, 24, 28, 32, 36, "真元·坚韧如岳", "会心防御" },
	{ 6, 12, 18, 24, 30, 36, 42, 48, 54, "真元·坚韧如岳", "会心防御" },
	{ 8, 16, 24, 32, 40, 48, 56, 64, 72, "真元·坚韧如岳", "会心防御" },
	{ 10, 20, 30, 40, 50, 60, 70, 80, 90, "真元·坚韧如岳", "会心防御" } }
adddsuxingvalue[16] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·沉冰", "冰攻击" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·沉冰", "冰攻击" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·沉冰",
	"冰攻击" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·沉冰", "冰攻击" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·沉冰", "冰攻击" } }
adddsuxingvalue[17] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·炽火", "火攻击" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·炽火", "火攻击" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·炽火",
	"火攻击" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·炽火", "火攻击" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·炽火", "火攻击" } }
adddsuxingvalue[18] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·印玄", "玄攻击" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·印玄", "玄攻击" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·印玄",
	"玄攻击" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·印玄", "玄攻击" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·印玄", "玄攻击" } }
adddsuxingvalue[19] = { { 2, 4, 6, 8, 10, 12, 14, 16, 18, "真元·蛊毒", "毒攻击" },
	{ 5, 9, 13, 17, 21, 25, 29, 33, 37, "真元·蛊毒", "毒攻击" }, { 9, 16, 23, 30, 37, 44, 51, 58, 65, "真元·蛊毒",
	"毒攻击" }, { 20, 38, 56, 74, 92, 110, 128, 146, 164, "真元·蛊毒", "毒攻击" },
	{ 24, 46, 67, 89, 111, 132, 154, 176, 197, "真元·蛊毒", "毒攻击" } }



delitemcom = {}
delitemcom[1] = { 10, 55, 130, 230, 360, 525, 715, 930 }
delitemcom[2] = { 30, 150, 390, 790, 1370, 2155, 3170, 4435 }
delitemcom[3] = { 40, 300, 1080, 2735, 5705, 10460, 17540, 27515 }
delitemcom[4] = { 50, 775, 3785, 11625, 27760, 56520, 103115, 173575 }
delitemcom[5] = { 100, 1485, 7585, 24455, 61025, 129255, 244275, 424505 }

function ZhenYuan_PreLoad()
	this:RegisterEvent("PNEUMAITEM_CHANGED");
	this:RegisterEvent("PNEUMALIST_CHANGED");
	this:RegisterEvent("TOGGLE_PNEUMA_UI");
	this:RegisterEvent("REFRESH_EQUIP");
	-- 游戏窗口尺寸发生了变化
	this:RegisterEvent("ADJEST_UI_POS")

	-- 游戏分辨率发生了变化
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
	this:RegisterEvent("PNEUMA_EXPCHIP_CHANGED")

	this:RegisterEvent("UI_COMMAND")
	this:RegisterEvent("PNEUMA_MISSIONFLAG");
	this:RegisterEvent("OPEN_WINDOW")

	--this:RegisterEvent("SHOW_SUPERTOOLTIP");
end

function ZhenYuan_OnLoad()
	--和槽位对应
	ZhenYuan_EquipActionBtn = {
		ZhenYuan_Equip1, ZhenYuan_Equip2, ZhenYuan_Equip3,
		ZhenYuan_Equip4, ZhenYuan_Equip5, ZhenYuan_Equip6,
	}
	ZhenYuan_EquipPneumaActionBtn = {
		ZhenYuan_Slots1, ZhenYuan_Slots2, ZhenYuan_Slots3,
		ZhenYuan_Slots4, ZhenYuan_Slots5, ZhenYuan_Slots6
	}
	ZhenYuan_EquipPneumaActionBtn_Name = {
		"ZhenYuan_Slots1", "ZhenYuan_Slots2", "ZhenYuan_Slots3",
		"ZhenYuan_Slots4", "ZhenYuan_Slots5", "ZhenYuan_Slots6"
	}
	ZhenYuan_BagPneumaActionBtn = {
		ZhenYuan_Item1, ZhenYuan_Item2, ZhenYuan_Item3, ZhenYuan_Item4, ZhenYuan_Item5, ZhenYuan_Item6, ZhenYuan_Item7,
		ZhenYuan_Item8,
		ZhenYuan_Item9, ZhenYuan_Item10, ZhenYuan_Item11, ZhenYuan_Item12, ZhenYuan_Item13, ZhenYuan_Item14,
		ZhenYuan_Item15, ZhenYuan_Item16,
		ZhenYuan_Item17, ZhenYuan_Item18, ZhenYuan_Item19, ZhenYuan_Item20, ZhenYuan_Item21, ZhenYuan_Item22,
		ZhenYuan_Item23, ZhenYuan_Item24,
	}
	ZhenYuan_InfoText = {
		ZhenYuan_Info1, ZhenYuan_Info2, ZhenYuan_Info3, ZhenYuan_Info4, ZhenYuan_Info5, ZhenYuan_Info6,
	}
	ZhenYuan_UpgradeButton = {
		ZhenYuan_Button1, ZhenYuan_Button2, ZhenYuan_Button3, ZhenYuan_Button4, ZhenYuan_Button5, ZhenYuan_Button6, }
	ZhenYuan_UpgradeButton_Name = {
		"ZhenYuan_Button1", "ZhenYuan_Button2", "ZhenYuan_Button3", "ZhenYuan_Button4", "ZhenYuan_Button5",
		"ZhenYuan_Button6", }

	ZhenYuan_UpgradeTipsBtn = {
		ZhenYuan_Tips1, ZhenYuan_Tips2, ZhenYuan_Tips3, ZhenYuan_Tips4, ZhenYuan_Tips5, ZhenYuan_Tips6, }

	ZhenYuan_UXP = ZhenYuan_Frame:GetProperty("UnifiedXPosition");
	ZhenYuan_UYP = ZhenYuan_Frame:GetProperty("UnifiedYPosition");
	ZhenYuan_FengBtn = {
		ZhenYuan_Feng1, ZhenYuan_Feng2, ZhenYuan_Feng3, ZhenYuan_Feng4, ZhenYuan_Feng5, ZhenYuan_Feng6,
	}
	--设置客户端界面使用的图片资源，根据是否为唯美版选择不同的图片资源集
	--"衣服","腰带","护手","鞋","帽子","护肩","项链","戒指","戒指","护腕","护符","护符"
	--[[if SystemSetup:IsClassic() == 0 then	--若客户端是唯美版，则重新设置图标资源为唯美版对应的资源
		ZhenYuan_EquipImage={
		"set:WM_Button2 image:Equip_Necklace",
		"set:WM_Button2 image:Equip_Ring",
		"set:WM_Button2 image:Equip_Ring",
		"set:WM_Button2 image:Equip_Wrist",
		"set:WM_Button2 image:Equip_Cloak",
		"set:WM_Button2 image:Equip_Cloak",
		"set:WM_Button2 image:Equip_Cloth",
		"set:WM_Button2 image:Equip_Sash",
		"set:WM_Button2 image:Equip_Hand",
		"set:WM_Button2 image:Equip_Shoe",
		"set:WM_Button2 image:Equip_Cap",
		"set:WM_Button2 image:Equip_Shoulder",
		}
	else--]]
	ZhenYuan_EquipImage = {
		"set:UIIcons image:Equip_Nacket",
		"set:UIIcons image:Equip_Ring",
		"set:UIIcons image:Equip_Ring",
		"set:UIIcons image:Equip_Wrist",
		"set:UIIcons image:Equip_Pifeng",
		"set:UIIcons image:Equip_Pifeng",
		"set:UIIcons image:Equip_Armo",
		"set:UIIcons image:Equip_Sash",
		"set:UIIcons image:Equip_Hand",
		"set:UIIcons image:Equip_Shot",
		"set:UIIcons image:Equip_Cap",
		"set:UIIcons image:Equip_Shoulder",
	}
	--end
end

function ZhenYuan_Close()
	this:Hide()
	ZhenYuan_TabIndex = 0
	ZhenYuan_SelectItem = 0
end

function ZhenYuan_pickinitem(seeswe, keyid)
	if keyid == 1 then
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OpenZhenYuan");
		Set_XSCRIPT_ScriptID(300105);
		Set_XSCRIPT_Parameter(0, ZhenYuan_upitemos);
		Set_XSCRIPT_Parameter(1, seeswe);
		Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();
		ZhenYuan_OnUpdateBag()
	else
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("ApplyNiangLian");
		Set_XSCRIPT_ScriptID(300105);
		Set_XSCRIPT_Parameter(0, -1);
		Set_XSCRIPT_Parameter(1, 3);
		Set_XSCRIPT_Parameter(2, 2);
		Set_XSCRIPT_Parameter(3, seeswe);
		Set_XSCRIPT_ParamCount(4);
		Send_XSCRIPT();
		ZhenYuan_OnUpdateBag()
	end
end

function ZhenYuan_OnEvent(event)
	if (event == "PNEUMAITEM_CHANGED" or event == "PNEUMALIST_CHANGED" or event == "REFRESH_EQUIP" or event == "PNEUMA_EXPCHIP_CHANGED") then
		if (this:IsVisible()) then
			ZhenYuan_OnUpdate()
		end
		if event == "PNEUMAITEM_CHANGED" and arg0 ~= nil then
			if (arg1 ~= nil) then
				--	PushDebugMessage(arg1)
				return
			end
			--ZhenYuan_BagPneumaActionBtn[tonumber(arg0)]:Disable();
		end
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 20131210 and this:IsVisible()) then
		yuanjin       = Get_XParam_INT(1)
		jinsui        = Get_XParam_INT(2)
		ZhenYuanData1 = Get_XParam_STR(0)
		ZhenYuanData2 = Get_XParam_STR(1)
		zenyuanlevel  = GetZhenYuanData2(ZhenYuanData2)
		zenyuanlevel2 = GetZhenYuanData()
		local lisi    = { 0, 0, 0, 0, 0 }
		local bijiao  = { 1, 2, 3, 4, 5 }
		minquajinjei  = 0
		for i = 1, 12 do
			if zenyuanlevel[i][1] >= bijiao[5] then
				lisi[5] = lisi[5] + 1
				if lisi[5] >= 6 then
					minquajinjei = 5
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[4] then
				lisi[4] = lisi[4] + 1
				if lisi[4] >= 6 then
					minquajinjei = 4
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[3] then
				lisi[3] = lisi[3] + 1
				if lisi[3] >= 6 then
					minquajinjei = 3
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[2] then
				lisi[2] = lisi[2] + 1
				if lisi[2] >= 6 then
					minquajinjei = 2
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[1] then
				lisi[1] = lisi[1] + 1
				if lisi[1] >= 6 then
					minquajinjei = 1
					break
				end
			end
		end
		ZhenYuan_OnUpdate()
	elseif (event == "TOGGLE_PNEUMA_UI") or (event == "UI_COMMAND" and tonumber(arg0) == 2019082803) then
		if Get_XParam_STR(0) == nil then
			return
		end
		if Get_XParam_STR(0) ~= "u" and Get_XParam_STR(0) ~= "o" then
			return
		end
		if Get_XParam_STR(0) == "u" and not this:IsVisible() then
			return
		end
		ZhenYuanData1 = Get_XParam_STR(1)
		ZhenYuanData2 = Get_XParam_STR(2)
		yuanjin       = Get_XParam_INT(0)
		iSexy         = Get_XParam_INT(1)
		jinsui        = Get_XParam_INT(2)
		zenyuanlevel  = GetZhenYuanData2(ZhenYuanData2)
		zenyuanlevel2 = GetZhenYuanData()
		local lisi    = { 0, 0, 0, 0, 0 }
		local bijiao  = { 1, 2, 3, 4, 5 }
		minquajinjei  = 0
		for i = 1, 12 do
			if zenyuanlevel[i][1] >= bijiao[5] then
				lisi[5] = lisi[5] + 1
				if lisi[5] >= 6 then
					minquajinjei = 5
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[4] then
				lisi[4] = lisi[4] + 1
				if lisi[4] >= 6 then
					minquajinjei = 4
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[3] then
				lisi[3] = lisi[3] + 1
				if lisi[3] >= 6 then
					minquajinjei = 3
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[2] then
				lisi[2] = lisi[2] + 1
				if lisi[2] >= 6 then
					minquajinjei = 2
					break
				end
			elseif zenyuanlevel[i][1] >= bijiao[1] then
				lisi[1] = lisi[1] + 1
				if lisi[1] >= 6 then
					minquajinjei = 1
					break
				end
			end
		end
		local selfUnionPos = Variable:GetVariable("SelfUnionPos");
		if (selfUnionPos ~= nil) then
			ZhenYuan_Frame:SetProperty("UnifiedPosition", selfUnionPos);
		end
		local miZhenYuanTips = tonumber(arg0)
		ZhenYuan_OnShow()
		ZhenYuan_OnUpdate()
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 2015074499) then
		if ZhenYuan_upitemos ~= 0 and this:IsVisible() and tonumber(arg1) ~= nil then
			SetNotifyTip("ZhenYuan_upitemos  "..ZhenYuan_upitemos.."  arg1  "..arg1)
			if ZhenYuan_upitemos ~= -1 then
				ZhenYuan_pickinitem(tonumber(arg1), 1)
			else
				ZhenYuan_pickinitem(tonumber(arg1), 2)
			end
		end
	elseif (event == "ADJEST_UI_POS" or "VIEW_RESOLUTION_CHANGED" == event) then
		-- 更新背包界面位置
		ZhenYuan_Frame_On_ResetPos()
	elseif (event == "PNEUMA_MISSIONFLAG" and this:IsVisible()) then
		ZhenYuan_OnUpdate()
	elseif (event == "OPEN_WINDOW") then
		if (arg0 == "ZhenYuan1") then
			this:Hide()
			local selfUnionPos = Variable:GetVariable("SelfUnionPos");
			if (selfUnionPos ~= nil) then
				ZhenYuan_Frame:SetProperty("UnifiedPosition", selfUnionPos);
			end
			ZhenYuan_OnUpdate()
			ZhenYuan_OnShow()
		end
	elseif (event == "UI_COMMAND" and this:IsVisible() and tonumber(arg0) == 20200440) then
		--SetNotifyTip("接收到了")
		--每当预览装备时候，更新相关装备的真元信息
		ZhenYuanUpdate_kaijun()
	end
end

-- ActionWeapon 		= EnumAction(0, "equip");
-- ActionCap    		= EnumAction(1, "equip");
-- ActionArmor  		= EnumAction(16, "equip"); ---衣服
-- ActionCuff   		= EnumAction(3, "equip");
-- ActionBoot   		= EnumAction(4, "equip");
-- ActionSash   		= EnumAction(5, "equip");
-- ActionRing    	= EnumAction(6, "equip");
-- ActionNecklace	= EnumAction(7, "equip");
-- ActionMount			= EnumAction(17, "equip");
-- ActionRing_2		= EnumAction(11, "equip");
-- ActionCharm 		= EnumAction(12, "equip");
-- ActionCharm_2   = EnumAction(13, "equip");
-- ActionWrist  		= EnumAction(14, "equip");
-- ActionShoulder  = EnumAction(15, "equip");
-- ActionLongwen   	= EnumAction(18, "equip");
-- AciontRL					= EnumAction(9, "equip");

local currentItem;
local equip_info;
function ZhenYuanUpdate_kaijun()
	currentItem = SuperTooltips:GetActionID()
	local ChooseEquip = {
		{"项链","盔甲"},{"戒指","腰带"},{"戒指2","手套"},{"护腕","鞋子"},{"护符","帽子"},{"护符2","护肩"}
	}
	local ActionEquip = {}
	if (ZhenYuan_TabIndex == 0) then
		ActionEquip[1] = EnumAction(7, "equip") --项链
		ActionEquip[2] = EnumAction(6, "equip") --戒子
		ActionEquip[3] = EnumAction(11, "equip")--戒指2
		ActionEquip[4] = EnumAction(14, "equip")--护腕
		ActionEquip[5] = EnumAction(12, "equip")--护符
		ActionEquip[6] = EnumAction(13, "equip")--护符2
	elseif (ZhenYuan_TabIndex == 1) then
		ActionEquip[1] = EnumAction(16, "equip")--盔甲
		ActionEquip[2] = EnumAction(5, "equip")--腰带
		ActionEquip[3] = EnumAction(3, "equip")--手套
		ActionEquip[4] = EnumAction(4, "equip")--鞋
		ActionEquip[5] = EnumAction(1, "equip")--帽子
		ActionEquip[6] = EnumAction(15, "equip")--护肩
	end

	local select = -1
	for j = 1, 6 do
		if currentItem == ActionEquip[j]:GetID() then
			select = j
			break
		end
	end
	if select == -1 then
		return
	end
	select = select + ZhenYuan_TabIndex * 6
	equip_info = SuperTooltips:GetPropertys()
	--local check = string.gsub(equip_info,"#","")
	--local findposx2,findposy2,shuxinzhi2 = string.find(equip_info,"{equip_attr_attack_fire}%s%p(%d+)%s")
	--check = string.gsub(check,"\n","")
	-- file = io.open("D:/sss.txt","w")
	-- io.output(file)
	-- io.write(tostring(shuxinzhi2))
	-- io.close(file)
	local shuxingtable ={0,0,0,0,0,0,0,0,0,0} --前五个为属性，后四个为属性攻击
	local wqstr = {
		"{equip_attr_str}","{equip_attr_spr}","{equip_attr_con}","{equip_attr_int}","{equip_attr_dex}",
		"{equip_attr_attack_cold}","{equip_attr_attack_fire}", "{equip_attr_attack_light}","{equip_attr_attack_poison}",
		"{equip_attr_all}"
	}
	local info = "";
	for i, str in wqstr do
		-- local findposx,findposy,shuxinzhi = string.find(equip_info,str.."%s%p(%d+)".."\n")  
		-- if shuxinzhi~=nil then
		-- 	shuxingtable[i] = tonumber(shuxinzhi)
		-- end
		for s in string.gfind(equip_info,str.."%s%p(%d+)%s") do
			shuxingtable[i] = shuxingtable[i] + tonumber(s)
		end
	end

	local output = {0,0,0,0,0}
	for i=1,5 do
		output[i] = shuxingtable[i*2 - 1] * 100000 + shuxingtable[i*2]
	end
	--SetNotifyTip("被选中装备的属性="..info)

	--用来更新真元装备的函数
	Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name("GetNewPrizes");
	Set_XSCRIPT_ScriptID(889853);
	Set_XSCRIPT_Parameter(0,tonumber(2020010500 + select));
	for i = 1, 5 do
		Set_XSCRIPT_Parameter(i,tonumber(output[i]));
	end
	Set_XSCRIPT_ParamCount( 6 );				-- 参数个数
	Send_XSCRIPT()  
end

function ZhenYuan_OnUpdate()
	ZhenYuan_OnUpdateBag()
	ZhenYuan_OnUpdateEquip()
end

function ZhenYuan_OnShow()
	ZhenYuan_ZhenYuan:SetCheck(1)
	this:Show()
end

function ZhenYuan_OnUpdateBag()
	for i = 1, 24 do
		ZhenYuan_BagPneumaActionBtn[i]:SetActionItem(-1);
		ZhenYuan_BagPneumaActionBtn[i]:Disable();
	end
	--真元背包显示
	local Lock_Flag = 0
	local bLocked = 0
	local theAction = 0
	local renditem = 0
	local retisont = 0
	local jistu = 0
	for i = 0, 29 do
		local theAction = EnumAction(i, "packageitem")
		if (theAction:GetID() ~= 0) and (theAction:GetDefineID() >= 38101001 and theAction:GetDefineID() <= 38519009) then --**这里要定义ID
			jistu = jistu + 1
			ZhenYuan_BagPneumaActionBtn[jistu]:SetActionItem(theAction:GetID());
			ZhenYuan_BagPneumaActionBtn[jistu]:Enable();
		end
		if jistu >= 24 then
			break
		end
	end
	if Lock_Flag == 0 then
		ZhenYuan_Arrange_Button:Enable();
	else
		ZhenYuan_Arrange_Button:Disable();
	end
	ZhenYuan_SelectItem = 0
end

function ZhenYuan_Refuse_Click()
	ZhenYuan_Close()
end

function ZhenYuan_ChangeTabIndex(nTabIndex)
	ZhenYuan_TabIndex = nTabIndex
	ZhenYuan_OnUpdateEquip()
end

function ZhenYuan_OnUpdateEquip()
	local startIndex = 0
	local ActionEquip = {}
	if (ZhenYuan_TabIndex == 0) then
		ZhenYuan_FenYe1:SetText("#{ZYXT_120528_166}") --#G乾天
		ZhenYuan_FenYe2:SetText("#{ZYXT_120528_21}")
		startIndex = 0
		ActionEquip[1] = EnumAction(7, "equip")
		ActionEquip[2] = EnumAction(6, "equip")
		ActionEquip[3] = EnumAction(11, "equip")
		ActionEquip[4] = EnumAction(14, "equip")
		ActionEquip[5] = EnumAction(12, "equip")
		ActionEquip[6] = EnumAction(13, "equip")
	elseif (ZhenYuan_TabIndex == 1) then
		ZhenYuan_FenYe1:SetText("#{ZYXT_120528_22}") --乾天
		ZhenYuan_FenYe2:SetText("#{ZYXT_120528_165}")
		startIndex = ZhenYuanPageSize
		ActionEquip[1] = EnumAction(16, "equip")
		ActionEquip[2] = EnumAction(5, "equip")
		ActionEquip[3] = EnumAction(3, "equip")
		ActionEquip[4] = EnumAction(4, "equip")
		ActionEquip[5] = EnumAction(1, "equip")
		ActionEquip[6] = EnumAction(15, "equip")
	end


	for j = 1, ZhenYuanPageSize do
		ZhenYuan_EquipActionBtn[j]:SetActionItem(ActionEquip[j]:GetID())
		if ActionEquip[j]:GetID() == 0 then
			ZhenYuan_EquipActionBtn[j]:SetProperty("BackImage", ZhenYuan_EquipImage[j + startIndex])
		end
	end


	ZhenYuan_SetUpgradeButton()
	--女or男
	if iSexy == 2 then
		ZhenYuan_NV:Hide()
		ZhenYuan_NAN:Show()
	else
		ZhenYuan_NV:Show()
		ZhenYuan_NAN:Hide()
	end


	ZhenYuan_UpdatePneumaSet()
	ZhenYuan_SetInfoText()
end

function ZhenYuan_Pet_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);

	TogglePetPage();
	ZhenYuan_Close()
end

function ZhenYuan_SelfEquip_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);

	OpenEquip(1);
	ZhenYuan_Close()
end

function ZhenYuan_SelfData_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("self");
	ZhenYuan_Close()
end

function ZhenYuan_Wuhun_Switch()
	ZhenYuan_Close()
	OpenShenDingPage(1002)
end

function ZhenYuan_Xiulian_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(8)
	ZhenYuan_Close()
end

function ZhenYuan_OpenBaoJian()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(11)
	ZhenYuan_Close()
end

function ZhenYuan_ShenDing_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(4)
	ZhenYuan_Close()
end

function ZhenYuan_Ride_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenRidePage();
	ZhenYuan_Close()
end

function ZhenYuan_JingMai_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(13)
	ZhenYuan_Close()
end

function ZhenYuan_OtherInfo_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);

	OtherInfoPage();
	ZhenYuan_Close()
end

function ZhenYuan_Frame_On_ResetPos()
	ZhenYuan_Frame:SetProperty("UnifiedXPosition", ZhenYuan_UXP);
	ZhenYuan_Frame:SetProperty("UnifiedYPosition", ZhenYuan_UYP);
end

function ZhenYuan_Blog_Switch()
	local strCharName = Player:GetName();
	local strAccount = Player:GetData("ACCOUNTNAME")
	Blog:OpenBlogPage(strAccount, strCharName, true);
	ZhenYuan_Close()
end

function ZhenYuan_ShowPneumaToolTips(idx)
	local startIdx = 0
	if (ZhenYuan_TabIndex == 1 and idx ~= -1) then
		startIdx = 6
	end
	ZhenYuan_upitemos = idx + startIdx
end

function ZhenYuan_SetInfoText()
	for i = 1, ZhenYuanPageSize do
		ZhenYuan_SetSubInfoText(i)
	end
end

local ZYtable = {25,26,27,289,290,291,96,97,98,292,293,435} 
local x892002_g_numTonum = {[1]=1,[2]=2,[3]=3,[4]=4,[5]=5,[16]=6,[17]=7,[18]=8,[19]=9}

function ZhenYuan_SetSubInfoText(idx)
	-- if idx == 6 then
	-- 	SetNotifyTip(DataPool:GetPlayerMission_DataRound(ZYtable[idx + ZhenYuan_TabIndex * 6]))
	-- end
	local startIdx = 0
	local qeuiosds = EnumAction(ZhenYuan_equipoit[idx + ZhenYuan_TabIndex * 6], "equip")
	ZhenYuan_EquipPneumaActionBtn[idx]:SetProperty("DragAcceptName", "")
	ZhenYuan_EquipPneumaActionBtn[idx]:SetProperty("DragAcceptName", "G35")
	ZhenYuan_FengBtn[idx]:SetProperty("Visible", "True")
	ZhenYuan_FengBtn[idx]:SetProperty("Image", "")
	ZhenYuan_FengBtn[idx]:SetText("")
	ZhenYuan_InfoText[idx]:SetText("")
	ZhenYuan_YuanJing:SetText("")
	ZhenYuan_YuanJing:SetText("#{ZYXT_120528_24}" .. yuanjin .. "")
	ZhenYuan_ZhenYuanSuiPian:SetText("")
	ZhenYuan_ZhenYuanSuiPian:SetText("#{ZYXT_120528_25}" .. jinsui .. "")
	ZhenYuan_FengBtn[idx]:SetProperty("Tooltip", "")
	ZhenYuan_FengBtn[idx]:SetToolTip("")
	ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("")
	ZhenYuan_UpgradeButton[idx]:SetToolTip("")
	if qeuiosds:GetID() > 0 then
		if zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] > 0 and zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2] ~= nil then
			if x892002_g_numTonum[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]] ~= nil then
				ZhenYuan_InfoText[idx]:SetText("" ..
				ZhenYuan_yuanse[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]] ..
				"" ..
				adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]
				[table.getn(adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]) - 1] ..
				"#r#W等级:" ..
				zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] ..
				"#r#W" ..
				adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]
				[table.getn(adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]])] ..
				" +" ..math.mod((DataPool:GetPlayerMission_DataRound(ZYtable[idx + ZhenYuan_TabIndex * 6])),100000000))
			else
				ZhenYuan_InfoText[idx]:SetText("" ..
				ZhenYuan_yuanse[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]] ..
				"" ..
				adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]
				[table.getn(adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]) - 1] ..
				"#r#W等级:" ..
				zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] ..
				"#r#W" ..
				adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]]
				[table.getn(adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]])] ..
				" +" ..
				math.floor(adddsuxingvalue[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][2]]
				[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3]] / 2.5 + 0.5) ..
				"%")
			end
		end
		if zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] > 0 and zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] < 9 then
			--ZhenYuan_FengBtn[idx]:SetToolTip("提升到下一级，需要消耗"..delitemcom[zenyuanlevel[idx+ZhenYuan_TabIndex*6][3]+1].."#cfff263元晶。")
			ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("提升到下一级，需要消耗" ..
			delitemcom[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3]] ..
			"#cfff263元晶。")
			ZhenYuan_UpgradeButton[idx]:SetToolTip("提升到下一级，需要消耗" ..
			delitemcom[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3]] ..
			"#cfff263元晶。")
			if zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] > 0 and delitemcom[zenyuanlevel[idx + ZhenYuan_TabIndex * 6][1]][zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3]] <= yuanjin then
				ZhenYuan_UpgradeButton[idx]:Enable()
			else
				ZhenYuan_UpgradeButton[idx]:Disable()
			end
		else
			if zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] >= 9 then
				ZhenYuan_FengBtn[idx]:SetToolTip("当前所装备的真元等级已达最高级")
				ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("当前所装备的真元等级已达最高级")
				ZhenYuan_UpgradeButton[idx]:SetToolTip("当前所装备的真元等级已达最高级")
				ZhenYuan_UpgradeButton[idx]:Disable()
			else
				ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("暂未放入真元")
				ZhenYuan_UpgradeButton[idx]:SetToolTip("暂未放入真元")
				ZhenYuan_UpgradeButton[idx]:Disable()
			end
		end
	else
		ZhenYuan_InfoText[idx]:SetText("#cfff263没有装备")
		ZhenYuan_UpgradeButton[idx]:Disable()
	end

	if zenyuanlevel2[idx + ZhenYuan_TabIndex * 6] ~= 0 then
		ZhenYuan_EquipPneumaActionBtn[idx]:SetProperty("Visible", "True")
		ZhenYuan_EquipPneumaActionBtn[idx]:SetActionItem(-1);
		if zenyuanlevel[idx + ZhenYuan_TabIndex * 6][3] > 0 then
			local itosowoodwg = tonumber("38" ..
			zenyuanlevel[idx + ZhenYuan_TabIndex * 6][4] ..
			"" .. zenyuanlevel[idx + ZhenYuan_TabIndex * 6][5] .. "00" .. zenyuanlevel[idx + ZhenYuan_TabIndex * 6][6] ..
			"")
			if itosowoodwg ~= nil then
				local ProductAction = GemCarve:UpdateProductAction(itosowoodwg)
				if ProductAction:GetID() > 0 then
					ZhenYuan_EquipPneumaActionBtn[idx]:SetActionItem(ProductAction:GetID());
					ZhenYuan_EquipPneumaActionBtn[idx]:SetProperty("DragAcceptName", "")
				end
			end
		else
			ZhenYuan_FengBtn[idx]:SetToolTip("盘眼已启封，暂未放入任何真元。")
			ZhenYuan_InfoText[idx]:SetText("暂未放入真元")
			ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("暂未放入真元")
			ZhenYuan_UpgradeButton[idx]:SetToolTip("暂未放入真元")
		end
	else
		ZhenYuan_EquipPneumaActionBtn[idx]:SetProperty("Visible", "Flase")
		ZhenYuan_EquipPneumaActionBtn[idx]:SetActionItem(-1);
		ZhenYuan_FengBtn[idx]:SetProperty("Image", "set:ZhenYuanUI1 image:ZhenYuanActivation_Feng")
		ZhenYuan_FengBtn[idx]:SetToolTip("#{ZYXT_120528_26}")
		ZhenYuan_UpgradeTipsBtn[idx]:SetToolTip("#{ZYXT_120528_159}")
		ZhenYuan_UpgradeButton[idx]:SetToolTip("#{ZYXT_120528_159}")
		ZhenYuan_InfoText[idx]:SetText("#{ZYXT_120528_159}")
	end
	ZhenYuan_Refresh_Page_Button()
end

function ZhenYuan_UpgradeToolTips(idx)

end

function ZhenYuan_UpgradeBtnToolTips(idx)

end

function ZhenYuan_Quit()
	ZhenYuan_Close()
end

function ZhenYuan_Tidy()

end

function ZhenYuan_SlotClicked(idx)
	if idx < 1 or idx > 6 then
		return
	end
	ZhenYuan_EquipPneumaActionBtn[idx]:DoAction()
end

function ZhenYuan_ItemClicked(idx)
	if (idx < 1 or idx > ZhenYuan_Size) then
		return
	end
	ZhenYuan_SelectItem = idx
	for i = 1, ZhenYuan_Size do
		ZhenYuan_BagPneumaActionBtn[i]:SetPushed(0)
	end
	ZhenYuan_BagPneumaActionBtn[idx]:SetPushed(1)
	ZhenYuan_BagPneumaActionBtn[idx]:DoAction()
end

function ZhenYuan_UpgradeClicked(idx)
	Set_XSCRIPT_Function_Name(OnLoad)
	Set_XSCRIPT_ScriptID(tonumber(OnEvent))
	Set_XSCRIPT_Parameter(0, -82)
	Set_XSCRIPT_Parameter(1, idx + ZhenYuan_TabIndex * 6)
	Set_XSCRIPT_ParamCount(2)
	Send_XSCRIPT();
end

--设置升级按钮是否灰化
function ZhenYuan_SetUpgradeButton()
	for idx = 1, ZhenYuanPageSize do
		ZhenYuan_UpgradeButton[idx]:Disable()
	end
end

function ZhenYuan_LockClicked()

end

function ZhenYuan_UnLockClicked()

end

function ZhenYuan_OnMoved()

end

function ZhenYuan_OnHidden()

end

function ZhenYuan_PickUpToBag(idx)
	Set_XSCRIPT_Function_Name(OnLoad)
	Set_XSCRIPT_ScriptID(tonumber(OnEvent))
	Set_XSCRIPT_Parameter(0, -81)
	Set_XSCRIPT_Parameter(1, idx + ZhenYuan_TabIndex * 6)
	Set_XSCRIPT_ParamCount(2)
	Send_XSCRIPT();
end

function ZhenYuan_UpdatePneumaSet()
	ZhenYuan_Blue:Hide()
	ZhenYuan_Purple:Hide()
	ZhenYuan_Orange:Hide()
	ZhenYuan_Lock:Hide()
	if (minquajinjei == 3) then
		ZhenYuan_Blue:Show()
	elseif (minquajinjei == 4) then
		ZhenYuan_Purple:Show()
	elseif (minquajinjei == 5) then
		ZhenYuan_Orange:Show()
	else
		ZhenYuan_Lock:Show()
	end
end

function ZhenYuan_GetMinLvlQualityInLabel()
	local minlvl = 9
	local minqua = 5

	return minlvl, minqua
end

function ZhenYuan_Set_MouseEnter(idx)
	local minlvl, minqua = ZhenYuan_GetMinLvlQualityInLabel()
	--真圆盘坐标和大小
	local SetX = ZhenYuan_Orange:GetProperty("AbsoluteXPosition") + ZhenYuan_Frame:GetProperty("AbsoluteXPosition") +
	ZhenYuan_List:GetProperty("AbsoluteXPosition") + ZhenYuan_Frame_Client:GetProperty("AbsoluteXPosition") +
	ZhenYuan_Main_Frame:GetProperty("AbsoluteXPosition")
	local SetY = ZhenYuan_Orange:GetProperty("AbsoluteYPosition") + ZhenYuan_Frame:GetProperty("AbsoluteYPosition") +
	ZhenYuan_List:GetProperty("AbsoluteYPosition") + ZhenYuan_Frame_Client:GetProperty("AbsoluteYPosition") +
	ZhenYuan_Main_Frame:GetProperty("AbsoluteYPosition")
	local SetWidth = ZhenYuan_Orange:GetProperty("AbsoluteWidth")
	local SetHeight = ZhenYuan_Orange:GetProperty("AbsoluteHeight")
	PushEvent("ZHENYUAN_SET_MOUSEENTER", minlvl, idx, ZhenYuan_TabIndex, SetX, SetY, SetWidth, SetHeight)
end

function ZhenYuan_Set_MouseLeave(idx)

end

function ZhenYuan_Miji_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(12)
	ZhenYuan_Close()
end

function ZhenYuan_Infant_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(14)
	ZhenYuan_Close()
end

function ZhenYuan_JueWei_Page_Switch()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(9)
	ZhenYuan_Close()
end

function ZhenYuan_OpenWuYi()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(15)
	ZhenYuan_Close()
end

function ZhenYuan_OpenShenQi()
	Variable:SetVariable("SelfUnionPos", ZhenYuan_Frame:GetProperty("UnifiedPosition"), 1);
	OpenShenDingPage(16)
	ZhenYuan_Close()
end

function GetZhenYuanData()
	local ZhenYuanBUFFF = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	local substringlisi = "0"
	for i = 1, 12 do
		substringlisi = string.sub(ZhenYuanData1, i, i)
		if substringlisi == nil then
			substringlisi = "0"
		end
		ZhenYuanBUFFF[i] = tonumber(substringlisi)
	end
	return ZhenYuanBUFFF
end

function GetZhenYuanData2(Editdatastring)
	local ZhenYuanBUFFF = { { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
		{ 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
		{ 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" }, { 0, 0, 0, "0", "00", "0" },
		{ 0, 0, 0, "0", "00", "0" } }
	local substringlisi = "0000"
	for i = 1, 12 do
		substringlisi = string.sub(Editdatastring, (i - 1) * 4 + 1, i * 4)
		if substringlisi == nil then
			substringlisi = "0000"
		end
		local pisilisi = string.sub(substringlisi, 1, 1)
		local leijinlisi = string.sub(substringlisi, 2, 3)
		local Lvlisi = string.sub(substringlisi, 4, 4)
		if pisilisi == nil then
			pisilisi = "0"
		end
		if leijinlisi == nil then
			leijinlisi = "00"
		end
		if Lvlisi == nil then
			Lvlisi = "0"
		end
		ZhenYuanBUFFF[i] = { tonumber(pisilisi), tonumber(leijinlisi), tonumber(Lvlisi), pisilisi, leijinlisi, Lvlisi }
	end
	return ZhenYuanBUFFF
end

function ToggleZhenYuanPage()
	Clear_XSCRIPT();
	Set_XSCRIPT_Function_Name("OpenQUANjmWindow");
	Set_XSCRIPT_ScriptID(390101);
	Set_XSCRIPT_Parameter(0, 3)
	Set_XSCRIPT_ParamCount(1);
	Send_XSCRIPT();
end

function ZhenYuan_Refresh_Page_Button()
	local nLevel = Player:GetData("LEVEL")
	--神鼎
	if (nLevel < 15) then
		ZhenYuan_ShenDing:Disable()
		ZhenYuan_ShenDing_tips:Show()
	else
		ZhenYuan_ShenDing:Enable()
		ZhenYuan_ShenDing_tips:Hide()
	end
	--子女
	if (nLevel < 50) then
		ZhenYuan_Infant:Disable()
		ZhenYuan_Infant_tips:Show()
	else
		ZhenYuan_Infant:Enable()
		ZhenYuan_Infant_tips:Hide()
	end
	--武魂
	--	if ( nLevel < 65 ) then
	--		ZhenYuan_Wuhun:Disable()
	--		ZhenYuan_Wuhun_tips:Show()
	--	ZhenYuan_Wuhun:SetToolTip("#{RWYQ_150707_02}")
	--	else
	ZhenYuan_Wuhun:Enable()
	ZhenYuan_Wuhun_tips:Hide()
	--	end
	--修炼
	if (nLevel < 70) then
		ZhenYuan_Xiulian:Disable()
		ZhenYuan_Xiulian_tips:Show()
	else
		ZhenYuan_Xiulian:Enable()
		ZhenYuan_Xiulian_tips:Hide()
	end
	--秘籍
	if (nLevel < 75) then
		ZhenYuan_Miji:Disable()
		ZhenYuan_Miji_tips:Show()
	else
		ZhenYuan_Miji:Enable()
		ZhenYuan_Miji_tips:Hide()
	end
	--真元
	if (nLevel < 80) then
		ZhenYuan_ZhenYuan:Disable()
		ZhenYuan_ZhenYuan_tips:Show()
	else
		ZhenYuan_ZhenYuan:Enable()
		ZhenYuan_ZhenYuan_tips:Hide()
	end
	--侠印
	if (nLevel < 85) then
		ZhenYuan_JueWei:Disable()
		ZhenYuan_JueWei_tips:Show()
	else
		ZhenYuan_JueWei:Enable()
		ZhenYuan_JueWei_tips:Hide()
	end
	--经脉
	if (nLevel < 90) then
		ZhenYuan_JingMai:Disable()
		ZhenYuan_JingMai_tips:Show()
	else
		ZhenYuan_JingMai:Enable()
		ZhenYuan_JingMai_tips:Hide()
	end
	--真元
	if (nLevel < 85) then
		ZhenYuan_BaoJian:Disable()
		ZhenYuan_BaoJian_tips:Show()
	else
		ZhenYuan_BaoJian:Enable()
		ZhenYuan_BaoJian_tips:Hide()
	end
	--武意
	if (nLevel < 85) then
		ZhenYuan_WuYi:Disable()
		ZhenYuan_WuYi_tips:Show()
	else
		ZhenYuan_WuYi:Enable()
		ZhenYuan_WuYi_tips:Hide()
	end

	ZhenYuan_ShenQi:Enable()
	ZhenYuan_ShenQi_tips:Hide()
end

function ReBuff()
	Clear_XSCRIPT();
	Set_XSCRIPT_Function_Name("AHa_ReMyBuff")
	Set_XSCRIPT_ScriptID(892002)
	Set_XSCRIPT_ParamCount(0)
	Send_XSCRIPT();
	KillTimer("ReBuff()");
end
