module("ItemInfoCtrl", package.seeall)

local luabehaviour
local transform
local gameObject
local mView

--构建函数--
function New()
	return ItemInfoCtrl
end

function Awake(...)
	local args = {...}
	list_item_id = args[1]

	panelMgr:CreatePanel('ItemInfo', OnCreate)
end

--启动事件--
function OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	mView = ItemInfoPanel
	luabehaviour = gameObject:GetComponent('LuaBehaviour')

	luabehaviour:AddClick(mView.Button_close.gameObject, OnClick_close)

	InitPanel()
end

--初始化面板--
function InitPanel()
	local item_id = list_item_id[1]

	mView.Text_name.text = DataTool.Get_Name(item_id)
	mView.Text_name.color = DataTool.Get_CommonColor(item_id)
	mView.Image_icon.sprite = DataTool.Get_Icon(item_id)
	mView.Image_frame.sprite = DataTool.Get_Frame(item_id)
	mView.Text_info.text = DataTool.Get_Info(item_id)
end

--关闭--
function OnClick_close(go)
	OnClose(gameObject)
end

--关闭事件--
function OnClose(go)
	destroy(go)
end