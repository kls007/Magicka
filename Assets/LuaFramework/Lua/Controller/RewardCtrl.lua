module("RewardCtrl", package.seeall)

local luabehaviour
local transform
local gameObject
local mView

--构建函数--
function New()
	return RewardCtrl
end

function Awake()
	panelMgr:CreatePanel('Reward', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	mView = RewardPanel
	luabehaviour = gameObject:GetComponent('LuaBehaviour')

	luabehaviour:AddClick(mView.Button_close.gameObject, OnClick_close)
end

--关闭--
function OnClick_close(go)
	OnClose(gameObject)
end

--关闭事件--
function OnClose(go)
	destroy(go)
end