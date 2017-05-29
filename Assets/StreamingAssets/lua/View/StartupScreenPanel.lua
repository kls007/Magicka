local transform;
local gameObject;

StartupScreenPanel = {};
local this = StartupScreenPanel;

--启动事件--
function StartupScreenPanel.Awake(obj)
	gameObject = obj;
	transform = obj.transform;

	this.InitPanel();
end

function StartupScreenPanel.Start(obj)

end

--初始化面板--
function StartupScreenPanel.InitPanel()
	gameObject:GetComponent('RectTransform').sizeDelta = Vector2.New(0, 0);

	this.Image_1 = transform:FindChild("Image_1").gameObject:GetComponent("Image")
	this.Image_2 = transform:FindChild("Image_2").gameObject:GetComponent("Image")
	this.Image_3 = transform:FindChild("Image_3").gameObject:GetComponent("Image")
end

--单击事件--
function StartupScreenPanel.OnDestroy()

end