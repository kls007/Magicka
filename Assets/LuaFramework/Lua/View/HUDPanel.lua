local transform;
local gameObject;

HUDPanel = {};
local this = HUDPanel;

--启动事件--
function HUDPanel.Awake(obj)
	gameObject = obj;
	transform = obj.transform;

	this.InitPanel();
end

function HUDPanel.Start(obj)

end

--初始化面板--
function HUDPanel.InitPanel()
	gameObject:GetComponent('RectTransform').sizeDelta = Vector2.New(0, 0)

	this.Image_head_icon = transform:FindChild('PlayerInfo/Image_bg/Head/Image_head_icon').gameObject:GetComponent('Image')
	this.Image_head_frame = transform:FindChild('PlayerInfo/Image_bg/Head/Image_head_icon/Image_head_frame').gameObject:GetComponent('Image')
	this.Text_name = transform:FindChild('PlayerInfo/Image_bg/Text_name').gameObject:GetComponent('Text')
	this.Text_level = transform:FindChild('PlayerInfo/Image_bg/Text_level').gameObject:GetComponent('Text')

	this.Button_DailyAttendance = transform:FindChild('Buttons/Button_DailyAttendance').gameObject
	this.Button_Bag = transform:FindChild('Buttons/Button_Bag').gameObject
end

--单击事件--
function HUDPanel.OnDestroy()
	
end

