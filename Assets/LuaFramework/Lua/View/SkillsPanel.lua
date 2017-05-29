local transform;
local gameObject;

SkillsPanel = {};
local this = SkillsPanel;

--启动事件--
function SkillsPanel.Awake(obj)
	gameObject = obj;
	transform = obj.transform;

	this.InitPanel();
end

function SkillsPanel.Start(obj)

end

--初始化面板--
function SkillsPanel.InitPanel()
	gameObject:GetComponent('RectTransform').sizeDelta = Vector2.New(0, 0);

	this.button_skill_Q = transform:FindChild('skills/skill_Q/SkillBg_Q').gameObject;
	this.button_skill_W = transform:FindChild('skills/skill_W/SkillBg_W').gameObject;
	this.button_skill_E = transform:FindChild('skills/skill_E/SkillBg_E').gameObject;
	this.button_skill_R = transform:FindChild('skills/skill_R/SkillBg_R').gameObject;
	this.button_skill_A = transform:FindChild('skills/skill_A/SkillBg_A').gameObject;
	this.button_skill_S = transform:FindChild('skills/skill_S/SkillBg_S').gameObject;
	this.button_skill_D = transform:FindChild('skills/skill_D/SkillBg_D').gameObject;
	this.button_skill_F = transform:FindChild('skills/skill_F/SkillBg_F').gameObject;

	this.button_skill_Left = transform:FindChild('skillsControl/skill_Left/SkillBg_Left').gameObject;
	this.button_skill_Middle = transform:FindChild('skillsControl/skill_Middle/SkillBg_Middle').gameObject;
	this.button_skill_Right = transform:FindChild('skillsControl/skill_Right/SkillBg_Right').gameObject;
end

--单击事件--
function SkillsPanel.OnDestroy()
	
end