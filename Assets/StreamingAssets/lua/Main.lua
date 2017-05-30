--核心文件
require "Common/define"
require "Common/functions"
require "Logic/LuaClass"
require "Logic/LuaClass"
require "Logic/CtrlManager"
require "Common/protocal"

Event = require "events"
require "Common/M2Service"

-- require "Logic/Game"

--工具类
require "Tool/DataTool"

require "Common/skills"

--数据表
require "Data/Enum"
require "Data/Data_Item"
require "Data/Data_DailyAttendance"

--Ctrl
require "Controller/PromptCtrl"
require "Controller/MessageCtrl"
require "Controller/HUDCtrl"
require "Controller/StartupScreenCtrl"
require "Controller/SkillsCtrl"
require "Controller/DailyAttendanceCtrl"
require "Controller/RewardCtrl"
require "Controller/ItemInfoCtrl"
require "Controller/BagCtrl"

--Item
require "Item/DailyAttendanceItem"

json = require "cjson"
util = require "3rd/cjson.util"


--主入口函数。从这里开始lua逻辑
function Main()					
	Util.LogError("主入口Main()函数。从这里开始lua逻辑")
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end