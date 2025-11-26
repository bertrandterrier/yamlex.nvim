local setup = {}

local defaults = {
    auto_enable = true,
}

setup.opts = vim.deepcopy(defaults)

setup.setup = function(opts)
    setup.opts = vim.tbl_deep_extend('force', setup.opts, opts or {})
end

return setup
