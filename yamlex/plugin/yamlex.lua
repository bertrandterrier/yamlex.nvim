local plugin = {}

local setup = require("yamlex.lua.setup")
local io_ops = require("yamlex.lua.io_ops")

if setup.opts.auto_enable == true then
    if vim.bo.filetype ~= 'yaml' then
        return
    end
    local success, yldata, data = io_ops.get_data(vim.fn.expand("%:p"), "yamlex", "meta", "_")
    if not success or not yldata then
        return
    end
end

return plugin
