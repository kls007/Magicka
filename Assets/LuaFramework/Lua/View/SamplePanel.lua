module("SamplePanel", package.seeall)

local transform
local gameObject

--启动事件--
function Awake(obj)
	gameObject = obj
	transform = obj.transform

	InitPanel()
end

function Start(obj)

end

--初始化面板--
function InitPanel()
	gameObject:GetComponent('RectTransform').sizeDelta = Vector2.New(0, 0)

	-- xx_component = transform:FindChild('xx_name').gameObject
end

--单击事件--
function OnDestroy()
	
end