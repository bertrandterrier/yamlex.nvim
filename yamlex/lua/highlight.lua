local hl = {}

local setup = require("yamlex.setup")

hl.namespace = vim.api.nvim_create_namespace("NsYamLex")

---@param buffer integer Buffer-ID. Defaults to current
---@param row integer Line row, 1-based.
---@param l? string Line content. Will be extracted from buffer using row.
---@param icon? string 
---@param group? table
function hl.llink(link, buffer, row, l, icon, group)
    l = l or vim.api.nvim_buf_get_lines(buffer, row - 1, row, false)[1]
    icon = icon or setup.opts[link.."_ref"].icon or ""
end

function hl.set_hlgroups(groups)
    groups = groups or {}
    groups.HlYLexPassive = groups.HlYLexPassive or {
        underline = true,
        italic = true
    }
    groups.HlYLexActive = groups.HlYLexActive or {
        underline = true,
        standout = true,
        italic = true,
    }
    for name, spec in pairs(groups) do
        vim.api.nvim_set_hl(0, name, spec)
    end
end

---@param mode "global"|"local"|"sibling" 
---@param buffer integer Buffer-ID
---@param row integer 1-indexed
---@param line? string
---@param active? boolean Means current line
---@param opts? table
function hl.hlline(mode, buffer, row, line, active, opts)
    line = line or vim.api.nvim_buf_get_lines(buffer, row - 1, row, false)[1]
    active = active or false
    opts = vim.tbl_deep_extend('force', {
        hlgroups = { passive = "HlYLexPassive", active = "HlYLexActive"  }
    })
end

return hl
