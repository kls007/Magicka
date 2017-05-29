require "Common/define"

StartupScreenCtrl = {};
local this = StartupScreenCtrl;

local luabehaviour;
local transform;
local gameObject;
local mView;

--构建函数--
function StartupScreenCtrl.New()
	return this;
end

function StartupScreenCtrl.Awake()
	panelMgr:CreatePanel('StartupScreen', this.OnCreate);
end

--启动事件--
function StartupScreenCtrl.OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;
	mView = StartupScreenPanel;
	luabehaviour = gameObject:GetComponent('LuaBehaviour');

	table_Image = {mView.Image_1, mView.Image_2, mView.Image_3}

	index = 1
	currentImage = table_Image[index]
	this.SetImageActive(currentImage)


	holdTime = 2
	alplaTime = 0.01
	deltaAlpha = 0.008

	--测试用
	-- holdTime = 0.01
	-- alplaTime = 0.01
	-- deltaAlpha = 0.1

	timer_hold = Timer.New(this.Timer_hold, holdTime, -1, 1)
	timer_hold:Start()

	timer_alpha = Timer.New(this.Timer_alpha, alplaTime, -1, 1)
	timer_alpha:Stop()

end

function StartupScreenCtrl.Timer_hold()
	timer_hold:Stop()
	timer_alpha:Start()
end

function StartupScreenCtrl.Timer_alpha()
	this.SetAlphaMinus(currentImage , deltaAlpha)
	if currentImage.color.a <= -0.2 then
		if index < 3 then
			index = index + 1
			currentImage = table_Image[index]
			this.SetImageActive(currentImage)

			timer_hold:Start()
			timer_alpha:Stop()
		else
			timer_hold:Stop()
			timer_alpha:Stop()
			timer_hold = nil
			timer_alpha = nil

			gameObject:SetActive(false)


			OpenCtrl(CtrlNames.HUD)
    		OpenCtrl(CtrlNames.Skills)
		end
	end
end

function StartupScreenCtrl.SetAlphaMinus(image, deltaAlpha)
	image.color = Color.New(1, 1, 1, image.color.a - deltaAlpha)
end

function StartupScreenCtrl.SetImageActive(image)
	mView.Image_1.gameObject:SetActive(false)
	mView.Image_2.gameObject:SetActive(false)
	mView.Image_3.gameObject:SetActive(false)

	image.gameObject:SetActive(true)
end

--关闭事件--
function StartupScreenCtrl.Close()
	panelMgr:ClosePanel(CtrlNames.StartupScreen);
end