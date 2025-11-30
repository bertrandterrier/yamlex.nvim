local setup = {}

---@type _ylex_def_opts
local defaults = {
    mode = "auto",
    global_refs = {
        enable = true,
        fallback_ref = false,
        pattern = "",
    },
    local_refs = {
        enable = true,
        pattern = "",
        fallback_ref = { 'global' },
    },
    sibling_refs = {
        enable = true,
        pattern = "",
        fallback_ref = { 'local', 'global' }
    },
    enable_icons = true,
    enable_nf_icons = false,
    icons_nerdfont = {
        global = " ",
        mlocal = " ",
        flocal = " ",
    },
    icons_font_agnostic = {
        global = ">//",
        mlocal = ">>",
        flocal = ">/"
    },
    enable_highlighting = false,
    keysep_pattern = '[:/]',
    meta = {
        mapname = "meta",
        fieldname = "yamlex",
        prefix = "_",
        enforce = false,
    },
    global_map_specs = {
        ignore_keys = {},
    }
}

---@type YlexOpts|_ylex_def_opts
setup.opts = vim.deepcopy(defaults)

---@param opts? YlexOpts
setup.setup = function(opts)
    setup.opts = vim.tbl_deep_extend('force', defaults, opts or {})
end

setup.set_hlgroup = function(passive, active)
    passive = passive or { underline = true }
    active = active or {
        standout = true,
        italic = true,
        underline = true,
    }
end

return setup
