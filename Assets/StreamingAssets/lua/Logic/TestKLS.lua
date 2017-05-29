local TestKLS = {}
TestKLS.param = 'param'

function TestKLS:TestQ()
	print_t("Q", "快捷键调用>>>")

	-- print_t(Util.DataPath, "Get_M2Data()")

-- OpenCtrl(CtrlNames.Reward, 111, 222)

-- RewardCtrl.Awake('swsw')

-- print_t(RewardCtrl.Awake, '1111')

-- "10003", 250

OpenCtrl(CtrlNames.Reward, {"2", "3", "4"})

	-- print_t(os.time(), 'os')

	-- local date_table = os.date("*t", os.time())
	-- print_t(date_table, 'date_table')

end

function TestKLS:TestW()
	print_t("W", "快捷键调用>>>")
end

function TestKLS:TestE()
	print_t("E", "快捷键调用>>>")
end

function TestKLS:TestR()
	print_t("R", "快捷键调用>>>")

	-- ViewHelper.ShowTip("快捷键调用--R:重新加载lua")
	
	package.path = "D:/IDE/Unity5WorkSpace/Magicka_LuaFramework_UGUI/Assets/LuaFramework/Lua/Controller/DailyAttendanceCtrl.lua"
	package.loaded['DailyAttendanceCtrl'] = nil
	require('DailyAttendanceCtrl')
	package.path = "D:/IDE/Unity5WorkSpace/Magicka_LuaFramework_UGUI/Assets/LuaFramework/Lua/View/?.lua"
	package.loaded['DailyAttendancePanel'] = nil
    require('DailyAttendancePanel')
end


return TestKLS