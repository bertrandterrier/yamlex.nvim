---@class YlexRefOpts
---@field enable boolean Enable reference type.
---@field pattern string Matching pattern for field keys.
---@field fallback_ref string|string[]|nil|boolean If and which reference type to imitate, if no key was found. Boolean true = next higher, false = nil
---@field icon string|nil Icon displayed in virtual line at end of line.

---@class YlexMetaMapOpts
---@field fieldname string Yamlex meta map field name. Defaults to "yamlex". At highest level prefixed by 'prefix'. If not there searched inside of 'mapname' unprefixed.
---@field mapname string Meta map containing 'fieldname'. Prefixed with 'prefix'. Defaults to "meta".
---@field prefix string Meta prefix. Either before 'fieldname' or 'mapname'. Defaults to "_".
---@field enforce boolean Treat any Yaml file as Yamlex instance.

---@class YlexOpts
---@field enable_auto? boolean Evaluate yaml files without command. Defaults to `false`
---@field local_refs? YlexRefOpts Options for local references (same file).
---@field sibling_refs? YlexRefOpts Options for sibling references (in same parent map).
---@field global_refs? YlexRefOpts Options for global references (outside file).
---@field meta? YlexMetaMapOpts Options for the meta map that is used for settings.
---@field keysep_pattern? string Character interpreted as key seperator. Defaults to "-".
---@field line_highlight? boolean|"all"|"links"|nil Highlights current line or line containing reference. true = "links"; false = nil.

---@class _YlexDefOpts
---@field enable_auto? boolean Evaluate yaml files without command. Defaults to `false`
---@field local_refs YlexRefOpts Options for local references (same file).
---@field sibling_refs YlexRefOpts Options for sibling references (in same parent map).
---@field global_refs YlexRefOpts Options for global references (outside file).
---@field meta YlexMetaMapOpts Options for the meta map that is used for settings.
---@field keysep_pattern string Character interpreted as key seperator. Defaults to "-".
---@field line_highlight boolean|"all"|"links"|nil Highlights current line or line containing reference. true = "links"; false = nil.
