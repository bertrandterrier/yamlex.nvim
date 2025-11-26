local M = {}

local setup require("yamlex.config")

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
