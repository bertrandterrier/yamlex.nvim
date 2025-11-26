local parser = {}

---@function Extract map keys for lines
---@param lines? string[] Array of lines. Defaults to lines of current buffer.
---@return string[] reg Register containing for every line the key as string.
parser.get_mapkeys = function(lines)
    lines = lines or vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local result = {}
    for i, l in ipairs(lines) do
        local match = l:match("%s*([^%s#]%S*):[%s\n]")
        if match then table.insert(result, i, match) end
    end
    return result
end



return parser
