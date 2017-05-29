module("SampleCtrl", package.seeall)

local luabehaviour
local transform
local gameObject
local mView

--构建函数--
function New()
	return SampleCtrl
end

function Awake()
	panelMgr:CreatePanel('Sample', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	mView = SamplePanel
	luabehaviour = gameObject:GetComponent('LuaBehaviour')
end

--关闭事件--
function OnClose(go)
	destroy(gameObject)
end