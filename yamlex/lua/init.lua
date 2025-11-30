local M = {}

local setup require("yamlex.lua.setup")
M.fn = require("yamlex.lua.functions")
M.cache = require("yamlex.lua.cache")

---@function External setup function for YamLex options
---@param opts? YlexOpts Compare the readme.
M.setup = function(opts)
    setup.setup(opts)
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNew' }, {
    pattern=".-%.yaml",
    callback=function()
        if vim.filetype ~= "yaml" then return end

        if setup.opts.line_highlight == 'all' then
            vim.wo.cursorline = true
        end
    end
})

return M
