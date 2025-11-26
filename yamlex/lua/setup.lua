local setup = {}

---@type _YlexDefOpts
local defaults = {
    enable_auto = true,
    global_refs = {
        enable = true,
        fallback_ref = false,
        pattern = "",
        icon = "->|"
    },
    local_refs = {
        enable = true,
        icon = "|->",
        pattern = "",
        fallback_ref = { 'global' },
    },
    sibling_refs = {
        enable = true,
        icon = ">->",
        pattern = "",
        fallback_ref = { 'local', 'global' }
    },
    line_highlight = 'links',
    keysep_pattern = '[:/]',
    meta = {
        mapname = "meta",
        fieldname = "yamlex",
        prefix = "_",
        enforce = false,
    }
}

---@type YlexOpts|_YlexDefOpts
setup.opts = {}

---@param opts? YlexOpts
setup.setup = function(opts)
    local defs = vim.deepcopy(defaults)
    setup.opts = vim.tbl_deep_extend('force', defs, opts or {})
end

return setup
