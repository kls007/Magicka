module("DailyAttendanceCtrl", package.seeall)

-- DailyAttendanceCtrl = {};
local this = DailyAttendanceCtrl;

local luabehaviour;
local transform;
local gameObject;
local mView;

--构建函数--
function New()
	return this;
end

function Awake()
	panelMgr:CreatePanel('DailyAttendance', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;
	mView = DailyAttendancePanel;
	luabehaviour = gameObject:GetComponent('LuaBehaviour')

	luabehaviour:AddClick(mView.Button_close.gameObject, OnClick_close)


	resMgr:LoadPrefab('dailyAttendance', { 'DailyAttendanceItem' }, InitPanel)
end

--初始化面板--
function InitPanel(objs)
	currentDay = M2.DailyAttendance.currentDay

print_t(M2.DailyAttendance.lastAttendanceTime, 'M2.DailyAttendance.lastAttendanceTime')
	local date_lastAttendanceTime = os.date("*t", M2.DailyAttendance.lastAttendanceTime or 0)
	local date_nowTime = os.date("*t", os.time())
	if date_nowTime.year == date_lastAttendanceTime.year and date_nowTime.month == date_lastAttendanceTime.month and date_nowTime.day == date_lastAttendanceTime.day then
		isCheck = true
	else
		isCheck = false
	end

	print_t(M2.DailyAttendance.lastAttendanceTime, '0')
	print_t(date_lastAttendanceTime, 'date_lastAttendanceTime')
	print_t(date_nowTime, 'date_nowTime')
	print_t(currentDay, 'currentDay')
	print_t(isCheck, 'isCheck')

	local Prefab_DailyAttendanceItem = objs[0]
	for i = 1, GetListNum(Data_DailyAttendance), 1 do
		local go = GameObject.Instantiate(Prefab_DailyAttendanceItem)
		go.name = tostring(i)
		go.transform.parent = mView.gridParent.transform
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero

		local item_id = Data_DailyAttendance[tostring(i)].item_id

		local item = DailyAttendanceItem:new()
		item:InitPanel(go)
		item.Text_count.text = Data_DailyAttendance[tostring(i)].count
		item.Text_name.text = DataTool.Get_Name(item_id)
		item.Image_icon.sprite = DataTool.Get_Icon(item_id)
		item.Image_frame.sprite = DataTool.Get_Frame(item_id)
		item.Image_notcheck.gameObject:SetActive(false)
		item.Image_check.gameObject:SetActive(false)

		if i < currentDay then
			go.transform:FindChild('Main/Image_check').gameObject:SetActive(true)
		elseif i == currentDay then
			if isCheck then
				go.transform:FindChild('Main/Image_check').gameObject:SetActive(true)
			else
				go.transform:FindChild('Main/Image_notcheck').gameObject:SetActive(true)
			end
		end

		EventTriggerListener.Get(go.gameObject).onClick = OnItemClick
	end
end

--关闭--
function OnItemClick(go)
	local index = tonumber(go.name)
	print_t(index, 'index')

	if index == currentDay and isCheck == false then
		go.transform:FindChild('Main/Image_notcheck').gameObject:SetActive(false)
		go.transform:FindChild('Main/Image_check').gameObject:SetActive(true)


		M2.DailyAttendance.lastAttendanceTime = os.time()
		Set_M2Data(M2)
	end
end

--关闭--
function OnClick_close(go)
	OnClose(gameObject)
end

--关闭事件--
function OnClose(go)
	destroy(gameObject);
end