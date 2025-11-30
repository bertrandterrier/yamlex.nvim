local p= {}

local config = require("yamlex.lua.setup").opts
local cache = require("yamlex.lua.cache")
local lyaml = require("lyaml")

---@param path string
---@param keysep? string Matching pattern
---@return string[] result
function p.get_path(path, keysep)
    keysep = keysep or config.keysep_pattern
    local result = {}
    local start, stop, i
    i = 1
    while i < #path do
        start, stop = path:find(keysep, i)
        if not stop or not start then
            table.insert(result, path:sub(i, #path))
            break
        end
        if start - 1 > i then
            table.insert(result, path:sub(i, start - 1))
        end
        i = stop + 1
    end
    return result
end

---@param data table Raw data
---@param field? string Fieldname. Defaults to "yamlex"
---@param map? string Mapname. Defaults to "meta". Only be used, if fieldname is not found.
---@param prefix? string Prefixing mapname, or fieldname without mapname. Defaults to "_".
---@return boolean is_yamlex Is Yamlex data.
function p.get_meta(data, field, map, prefix)
    field = field or config.meta.fieldname
    map = map or config.meta.mapname
    prefix = prefix or config.meta.prefix

    if data[prefix..field] then
        cache.meta = data[prefix..field]
        return true
    elseif data[prefix..map] then
        if data[prefix..map][field] then
            cache.meta = data[prefix..map][field]
            return true
        end
    end
    return false
end

---@param lines string[]
---@param path string[]
function p.get_data(lines, path)
end


return p
