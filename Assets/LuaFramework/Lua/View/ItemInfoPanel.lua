module("ItemInfoPanel", package.seeall)

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

	Button_close = transform:FindChild('Bg/Button_close').gameObject
	Text_name = transform:FindChild('Bg/Item/Main/Text_name').gameObject:GetComponent('Text')
	Image_icon = transform:FindChild('Bg/Item/Main/Image_icon').gameObject:GetComponent('Image')
	Image_frame = transform:FindChild('Bg/Item/Main/Image_frame').gameObject:GetComponent('Image')
	Text_info = transform:FindChild('Bg/Item/Main/Bg_Text_info/Text_info').gameObject:GetComponent('Text')
end

--单击事件--
function OnDestroy()
	
end