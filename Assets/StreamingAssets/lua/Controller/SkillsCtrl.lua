require "Common/define"

SkillsCtrl = {};
local this = SkillsCtrl;

local luabehaviour;
local transform;
local gameObject;
local mView;

--构建函数--
function SkillsCtrl.New()
	return this;
end

function SkillsCtrl.Awake()
	panelMgr:CreatePanel('Skills', this.OnCreate);
end

--启动事件--
function SkillsCtrl.OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;
	mView = SkillsPanel;
	luabehaviour = gameObject:GetComponent('LuaBehaviour');

	luabehaviour:AddClick(mView.button_skill_Q.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_W.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_E.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_R.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_A.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_S.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_D.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_F.gameObject, this.OnClick_skills);

	luabehaviour:AddClick(mView.button_skill_Left.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_Middle.gameObject, this.OnClick_skills);
	luabehaviour:AddClick(mView.button_skill_Right.gameObject, this.OnClick_skills);
end

--使用技能--
function SkillsCtrl.OnClick_skills(go)
	if go.name == 'SkillBg_Q' then
		SkillTool.Skill_Q()
	elseif go.name == 'SkillBg_W' then
		SkillTool.Skill_W()
	elseif go.name == 'SkillBg_E' then
		SkillTool.Skill_E()
	elseif go.name == 'SkillBg_R' then
		SkillTool.Skill_R()
	elseif go.name == 'SkillBg_A' then
		SkillTool.Skill_A()
	elseif go.name == 'SkillBg_S' then
		SkillTool.Skill_S()
	elseif go.name == 'SkillBg_D' then
		SkillTool.Skill_D()
	elseif go.name == 'SkillBg_F' then
		SkillTool.Skill_F()

	elseif go.name == 'SkillBg_Left' then
		SkillTool.Skill_Left()
	elseif go.name == 'SkillBg_Middle' then
		SkillTool.Skill_Middle()
	elseif go.name == 'SkillBg_Right' then
		SkillTool.Skill_Right()
	end

	
end

--关闭事件--
function SkillsCtrl.OnClose(go)
	destroy(gameObject);
end