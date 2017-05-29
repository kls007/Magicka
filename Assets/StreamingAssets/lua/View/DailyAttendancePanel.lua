local transform;
local gameObject;

DailyAttendancePanel = {};
local this = DailyAttendancePanel;

--启动事件--
function DailyAttendancePanel.Awake(obj)
	gameObject = obj;
	transform = obj.transform;

	this.InitPanel();
end

function DailyAttendancePanel.Start(obj)

end

--初始化面板--
function DailyAttendancePanel.InitPanel()
	gameObject:GetComponent('RectTransform').sizeDelta = Vector2.New(0, 0)

	this.Button_close = transform:FindChild('Bg/Button_close').gameObject
	this.gridParent = transform:FindChild('Bg/Scroll View/Viewport/Content').gameObject
end

--单击事件--
function DailyAttendancePanel.OnDestroy()
	
end