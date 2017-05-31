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

	resMgr:LoadPrefab('dailyAttendance', {'DailyAttendanceItem'}, InitPanel)
end

--初始化面板--
function InitPanel(objs)
	currentDay = M2.DailyAttendance.currentDay

	local date_lastAttendanceTime = os.date("*t", M2.DailyAttendance.lastAttendanceTime or 0)
	local date_nowTime = os.date("*t", os.time())
	if date_nowTime.year == date_lastAttendanceTime.year and date_nowTime.month == date_lastAttendanceTime.month and date_nowTime.day == date_lastAttendanceTime.day then
		isCheck = true
	else
		isCheck = false
	end

	local Prefab_DailyAttendanceItem = objs[0]
	for i = 1, GetListNum(Data_DailyAttendance), 1 do
		local go = GameObject.Instantiate(Prefab_DailyAttendanceItem)
		go.name = tostring(i)
		go.transform.parent = mView.Grid_Parent.transform
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero

		local dailyAttendance_id = tostring(i)
		local count = Data_DailyAttendance[dailyAttendance_id].count
		local item_id = Data_DailyAttendance[dailyAttendance_id].item_id

		local item = DailyAttendanceItem:new()
		item:InitPanel(go)
		item.Text_count.text = count
		item.Text_name.text = DataTool.Get_Name(item_id)
		item.Text_name.color = DataTool.Get_CommonColor(item_id)
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

				local pre = UnityEngine.Resources.Load("Effects/DL_Fantasy_RPG_Effects/prefab/star1")
				local ggg = GameObject.Instantiate(pre, Vector3.zero, pre.transform.rotation)
				ggg.transform.parent = go.transform
				ggg.transform.localPosition = Vector3.zero
				ggg.transform.localScale = Vector3.one * 0.1

			end
		end

		EventTriggerListener.Get(go.gameObject).onClick = OnItemClick
	end
end

--关闭--
function OnItemClick(go)
	local index = tonumber(go.name)
	print_t(index, 'index')

	local dailyAttendance_id = tostring(index)
	local item_id = Data_DailyAttendance[dailyAttendance_id].item_id
	local count = Data_DailyAttendance[dailyAttendance_id].count
	Event.Brocast("Event_Reward", {{item_id = item_id, count = count}})

	if index == currentDay and isCheck == false then
		isCheck = true
		go.transform:FindChild('Main/Image_notcheck').gameObject:SetActive(false)
		go.transform:FindChild('Main/Image_check').gameObject:SetActive(true)

		OpenCtrl(CtrlNames.Reward, {{item_id = tostring(item_id), count = count}})

		M2.DailyAttendance.lastAttendanceTime = os.time()
		Set_M2Data(M2)

	else
		OpenCtrl(CtrlNames.ItemInfo, {tostring(item_id)})
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