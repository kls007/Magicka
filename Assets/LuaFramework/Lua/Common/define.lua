
CtrlNames = {
	Prompt = "PromptCtrl",
	Message = "MessageCtrl",
	HUD = "HUDCtrl",
	StartupScreen = "StartupScreenCtrl",
	Skills = "SkillsCtrl",
	DailyAttendance = "DailyAttendanceCtrl",
	Reward = "RewardCtrl",
	ItemInfo = "ItemInfoCtrl",
	Bag = "BagCtrl"
}

PanelNames = {
	"PromptPanel",	
	"MessagePanel",
	"HUDPanel",
	"StartupScreenPanel",
	"SkillsPanel",
	"DailyAttendancePanel",
	"RewardPanel",
	"ItemInfoPanel",
	"BagPanel"
}

--协议类型--
ProtocalType = {
	BINARY = 0,
	PB_LUA = 1,
	PBC = 2,
	SPROTO = 3,
}
--当前使用的协议类型--
TestProtoType = ProtocalType.BINARY;

Util = LuaFramework.Util;
AppConst = LuaFramework.AppConst;
LuaHelper = LuaFramework.LuaHelper;
ByteBuffer = LuaFramework.ByteBuffer;

resMgr = LuaHelper.GetResManager();
panelMgr = LuaHelper.GetPanelManager();
soundMgr = LuaHelper.GetSoundManager();
networkMgr = LuaHelper.GetNetManager();

WWW = UnityEngine.WWW;
GameObject = UnityEngine.GameObject;