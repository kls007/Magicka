-- module("M2Service", package.seeall)
M2Service = {}

function M2Service.InitListener()
	Event.AddListener("Event_Reward", M2Service.handler_M2)
end

function M2Service.handler_M2(...)
	local args = {...}
	local table_reward = args[1]
	print_t(table_reward, 'table_reward')

		for k, v in pairs(table_reward) do
			local bag = Get_bagById(v.id)
			if bag ~= nil then
				bag.count = bag.count + v.count
			else
				table.insert(M2.Bag, v)
			end
		end

	Set_M2Data(M2)
end

function Get_bagById(id)
	for k, v in pairs(M2.Bag) do
		if v.item_id == id then
			return v
		end
	end
	return nil
end