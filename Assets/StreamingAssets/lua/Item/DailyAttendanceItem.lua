DailyAttendanceItem = {}

DailyAttendanceItem.mt = {}

function DailyAttendanceItem:new(o)
	local self = {}
	setmetatable(self, DailyAttendanceItem.mt)
	return self
end

DailyAttendanceItem.mt.__index = DailyAttendanceItem

DailyAttendanceItem.mt.__tostring = function (a)
	return "DailyAttendanceItem"
end

function DailyAttendanceItem:InitPanel(obj)
	self.gameObject = obj
	self.transform = self.gameObject.transform

	self.Text_count = self.transform:FindChild('Main/Text_count').gameObject:GetComponent('Text')
	self.Text_name = self.transform:FindChild('Main/Text_name').gameObject:GetComponent('Text')
	self.Image_icon = self.transform:FindChild('Main/Image_icon').gameObject:GetComponent('Image')
	self.Image_frame = self.transform:FindChild('Main/Image_frame').gameObject:GetComponent('Image')
	self.Image_notcheck = self.transform:FindChild('Main/Image_notcheck').gameObject:GetComponent('Image')
	self.Image_check = self.transform:FindChild('Main/Image_check').gameObject:GetComponent('Image')
end

return DailyAttendanceItem