DataTool = {}

function DataTool.Get_Name(id)
	return Data_Item[tostring(id)].name
end

function DataTool.Get_Icon(id)
	local path = tostring(Data_Item[tostring(id)].icon)
	local sprite = UnityEngine.Resources.Load(path, typeof(UnityEngine.Sprite))
	return sprite
end

function DataTool.Get_Frame(id)
	local quality = DataTool.Get_Quality(id)
	local path
	if quality == 1 then
		path = "Textures/frame/public_avatar_frame0"
	elseif quality == 2 then
		path = "Textures/frame/public_avatar_frame2"
	elseif quality == 3 then
		path = "Textures/frame/public_avatar_frame3"
	elseif quality == 4 then
		path = "Textures/frame/public_avatar_frame4"
	end
	local sprite = UnityEngine.Resources.Load(path, typeof(UnityEngine.Sprite))
	return sprite
end

function DataTool.Get_Quality(id)
	return Data_Item[tostring(id)].quality
end
