-- local json = require "cjson"
-- local util = require "3rd/cjson.util"

--输出日志--
function log(str)
    Util.Log(str);
end

--错误日志--
function logError(str) 
	Util.LogError(str);
end

--警告日志--
function logWarn(str) 
	Util.LogWarning(str);
end

--查找对象--
function find(str)
	return GameObject.Find(str);
end

function destroy(obj)
	GameObject.Destroy(obj);
end

function newObject(prefab)
	return GameObject.Instantiate(prefab);
end

--创建面板--
function createPanel(name)
	PanelManager:CreatePanel(name);
end

function child(str)
	return transform:FindChild(str);
end

function subGet(childNode, typeName)		
	return child(childNode):GetComponent(typeName);
end

function findPanel(str) 
	local obj = find(str);
	if obj == nil then
		error(str.." is null");
		return nil;
	end
	return obj:GetComponent("BaseLua");
end

--一个用以打印table的函数
function print_t(t, name, indent)   
    local tableList = {}   
    function table_r (t, name, indent, full)   
        local id = not full and name or type(name)~="number" and tostring(name) or '['..name..']'   
        local tag = indent .. id .. ' = '   
        local out = {}  -- result   
        if type(t) == "table" then   
            if tableList[t] ~= nil then   
                table.insert(out, tag .. '{} -- ' .. tableList[t] .. ' (self reference)')   
            else  
                tableList[t]= full and (full .. '.' .. id) or id  
                if next(t) then -- Table not empty   
                    table.insert(out, tag .. '{')   
                    for key,value in pairs(t) do   
                        table.insert(out,table_r(value,key,indent .. '   ',tableList[t]))   
                    end   
                    table.insert(out,indent .. '}')   
                else table.insert(out,tag .. '{}') end   
            end   
        else  
            local val = type(t)~="number" and type(t)~="boolean" and '"'..tostring(t)..'"' or tostring(t)   
            table.insert(out, tag .. val)   
        end   
        return table.concat(out, '\n')   
    end   

    -- return print(table_r(t,name or 'Value',indent or ''))
    return logError(table_r(t,name or 'Value',indent or ''))
end

function OpenCtrl(ctrlName)
    local ctrl = CtrlManager.GetCtrl(ctrlName);
    if ctrl ~= nil then
        ctrl:Awake();
        return ctrl
    end
    return nil
end

function GetListNum(list)
    local num = 0
    for k,v in pairs(list) do
        num = num + 1
    end
    return num
end

function Get_M2Data()
    local path = Util.DataPath.."lua/3rd/cjson/M2.json"
    local json_string = util.file_load(path)
    local lua_table = json.decode(json_string)
    return lua_table
end

function Set_M2Data(lua_table)
    local path = Util.DataPath.."lua/3rd/cjson/M2.json"
    local json_string = json.encode(lua_table)
    util.file_save(path, json_string)
end