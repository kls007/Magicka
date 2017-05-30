HUDCtrl = {};
local this = HUDCtrl;

local luabehaviour;
local transform;
local gameObject;
local mView;

--构建函数--
function HUDCtrl.New()
	return this;
end

function HUDCtrl.Awake()
	panelMgr:CreatePanel('HUD', this.OnCreate);
end

--启动事件--
function HUDCtrl.OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;
	mView = HUDPanel;
	luabehaviour = gameObject:GetComponent('LuaBehaviour');


	this.RefreshUI()
	Event.AddListener('level_change', this.RefreshUI)
	

	luabehaviour:AddClick(mView.Button_DailyAttendance, this.Click_Open_Attendance)
	luabehaviour:AddClick(mView.Button_Bag, this.Click_Open_Bag)
	
end

function HUDCtrl.RefreshUI(...)
	local args = {...}
	-- print_t(args, 'args')

	mView.Text_name.text = '姓名：' .. tostring(M2.User.name)
	mView.Text_level.text = '等级：' .. tostring(M2.User.level)
end

--打开每日签到--
function HUDCtrl.Click_Open_Attendance(go)
	print_t(go, '打开签到')

	OpenCtrl(CtrlNames.DailyAttendance)
end

--打开背包--
function HUDCtrl.Click_Open_Bag(go)
	print_t(go, '打开背包')

	OpenCtrl(CtrlNames.Bag)
end

--关闭事件--
function HUDCtrl.OnClose(go)
	destroy(gameObject)
end