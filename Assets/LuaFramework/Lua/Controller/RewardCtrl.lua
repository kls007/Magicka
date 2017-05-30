module("RewardCtrl", package.seeall)

local luabehaviour
local transform
local gameObject
local mView

--构建函数--
function New()
	return RewardCtrl
end

function Awake(...)
	local args = {...}
	list_item = args[1]

	panelMgr:CreatePanel('Reward', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	mView = RewardPanel
	luabehaviour = gameObject:GetComponent('LuaBehaviour')

	luabehaviour:AddClick(mView.Button_close.gameObject, OnClick_close)

	resMgr:LoadPrefab('dailyAttendance', {'DailyAttendanceItem'}, InitPanel)
end

--初始化面板--
function InitPanel(objs)
	local Prefab_DailyAttendanceItem = objs[0]
	for i = 1, #list_item, 1 do
		local go = GameObject.Instantiate(Prefab_DailyAttendanceItem)
		go.name = tostring(i)
		go.transform.parent = mView.Grid_Parent.transform
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero

		-- local dailyAttendance_id = list_dailyAttendance_id[i]
		
		local item_id = list_item[i].item_id --Data_DailyAttendance[dailyAttendance_id].item_id
		local count = list_item[i].count --Data_DailyAttendance[dailyAttendance_id].count

		local item = DailyAttendanceItem:new()
		item:InitPanel(go)
		item.Text_count.text = count
		item.Text_name.text = DataTool.Get_Name(item_id)
		item.Image_icon.sprite = DataTool.Get_Icon(item_id)
		item.Image_frame.sprite = DataTool.Get_Frame(item_id)
		item.Image_notcheck.gameObject:SetActive(false)
		item.Image_check.gameObject:SetActive(false)
	end
end

--关闭--
function OnClick_close(go)
	OnClose(gameObject)
end

--关闭事件--
function OnClose(go)
	destroy(go)
end