-- require "Common/define"
-- require "Controller/PromptCtrl"
-- require "Controller/MessageCtrl"
-- require "Controller/HUDCtrl"
-- require "Controller/StartupScreenCtrl"
-- require "Controller/SkillsCtrl"
-- require "Controller/DailyAttendanceCtrl"

CtrlManager = {}
local this = CtrlManager
local ctrlList = {}	--控制器列表--

function CtrlManager.Init()
	logWarn("CtrlManager.Init----->>>")
	ctrlList[CtrlNames.Prompt] = PromptCtrl.New()
	ctrlList[CtrlNames.Message] = MessageCtrl.New()
	ctrlList[CtrlNames.HUD] = HUDCtrl.New()
	ctrlList[CtrlNames.StartupScreen] = StartupScreenCtrl.New()
	ctrlList[CtrlNames.Skills] = SkillsCtrl.New()
	ctrlList[CtrlNames.DailyAttendance] = DailyAttendanceCtrl.New()
	ctrlList[CtrlNames.Reward] = RewardCtrl.New()
	
	return this
end

--添加控制器--
function CtrlManager.AddCtrl(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj
end

--获取控制器--
function CtrlManager.GetCtrl(ctrlName)
	return ctrlList[ctrlName]
end

--移除控制器--
function CtrlManager.RemoveCtrl(ctrlName)
	ctrlList[ctrlName] = nil
end

--关闭控制器--
function CtrlManager.Close()
	logWarn('CtrlManager.Close---->>>')
end