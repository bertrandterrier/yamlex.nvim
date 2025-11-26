local io = {}

local lyaml = require("lyaml")

---@function Parses yaml file with lyaml
---@param file string Path to file
---@param mfield? string Name of the yamlex field. Defaults to /"yamlex"/
---@param mpar? string First looksup /<mfield>/ then /<mprefix>.<mfield>/. Defaults to "meta".
---@param prefix? string Prefix for added to mfield or mpar.
---@return boolean success, table|nil yamlex, table data
io.get_data = function(file, mfield, mpar, prefix)
    prefix = prefix or "_"
    mfield = mfield or "yamlex"
    mpar = prefix .. (mpar or "meta")
    local path = vim.fn.fnamemodify(file, ":p")
    local f = io.open(path, 'r')
    if not f then
        return false, nil, {}
    end

    local cont = f:read("*all")
    local data = lyaml.load(cont)
    if not data then return false, nil, {} end

    local ylex_field = data[prefix..mfield]
    if not ylex_field and not data[mpar] then
        return true, nil, data
    else
        return true, data[mpar][mfield], data
    end
end

return io
