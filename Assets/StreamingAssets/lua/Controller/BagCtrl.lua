module("BagCtrl", package.seeall)

-- BagCtrl = {};
local this = BagCtrl;

local luabehaviour;
local transform;
local gameObject;
local mView;

--构建函数--
function New()
	return this;
end

function Awake()
	panelMgr:CreatePanel('Bag', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj;
	transform = obj.transform;
	mView = BagPanel;
	luabehaviour = gameObject:GetComponent('LuaBehaviour')

	table_cell = {}
	for i = 1, mView.Grid_Parent.transform.childCount, 1 do
		local cell = mView.Grid_Parent.transform:GetChild(i - 1).gameObject
		table.insert(table_cell, cell)
	end

	print_t(table_cell, 'table_cell')
	print_t(M2.Bag, 'M2.Bag')

	resMgr:LoadPrefab('dailyAttendance', {'DailyAttendanceItem'}, InitPanel)
	luabehaviour:AddClick(mView.Button_close.gameObject, OnClick_close)
end

--初始化面板--
function InitPanel(objs)
	local Prefab_BagItem = objs[0]
	print_t(GetListNum(M2.Bag), 'GetListNum(M2.Bag)')
	for i = 1, GetListNum(M2.Bag), 1 do
		local go = GameObject.Instantiate(Prefab_BagItem)
		go.name = tostring(i)
		go.transform.parent = table_cell[i].transform
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero

		local Bag_id = tonumber(i)
		local count = M2.Bag[Bag_id].count
		local item_id = M2.Bag[Bag_id].item_id

		local item = DailyAttendanceItem:new()
		item:InitPanel(go)
		item.Text_count.text = count
		item.Text_name.text = DataTool.Get_Name(item_id)
		item.Text_name.color = DataTool.Get_CommonColor(item_id)
		item.Image_icon.sprite = DataTool.Get_Icon(item_id)
		item.Image_frame.sprite = DataTool.Get_Frame(item_id)
		item.Image_notcheck.gameObject:SetActive(false)
		item.Image_check.gameObject:SetActive(false)

		local main = go.transform:FindChild('Main').gameObject:GetComponent("RectTransform")
		main.sizeDelta = Vector2.New(60, 60)

		EventTriggerListener.Get(go.gameObject, i).onClick = OnItemClick
	end
end

--关闭--
function OnItemClick(go, param)
	local index = param
	print_t(index, 'index')

	local item_id = M2.Bag[index].item_id
	OpenCtrl(CtrlNames.ItemInfo, {tostring(item_id)})
end

--关闭--
function OnClick_close(go)
	OnClose(gameObject)
end

--关闭事件--
function OnClose(go)
	destroy(gameObject);
end