-- module("M2Service", package.seeall)
M2Service = {}

function M2Service.InitListener()
	Event.AddListener("Event_Reward", M2Service.handler_M2)
end

function M2Service.handler_M2(...)
	local args = {...}
	
	local table_reward = args[1]
	print_t(table_reward, 'table_reward')

		for m, n in pairs(table_reward) do
			local bag = Get_bagById(n.id)
			if bag ~= nil then
				bag.count = bag.count + n.count
			else
				table.insert(M2.Bag, n)
			end
		end

	Set_M2Data(M2)
end

function Get_bagById(id)
	for k, v in pairs(M2.Bag) do
		if v.id == id then
			return v
		end
	end
	return nil
end