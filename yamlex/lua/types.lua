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

---@class YlexIcons
---@field global? string Icon used for links pointing to fields in other files.
---@field flocal? string Icon used for links pointing to fields in same file.
---@field mlocal? string Icon used for links pointing for fields in same map.


---@alias YlexMapPath string Containing defined seperators for nested keys, pointing to the directory

---@class YlexLoc
---@field row integer Row of the entry key.
---@field col integer Column of the entry start.
---@field row_count integer How many rows this entry is long.

---@class YlexLink
---@field active boolean If false, link is claimed but not active.
---@field yid integer YamLex ID. Position in cache of buffers.
---@field file? string File path. Only for g-type links
---@field link_loc? YlexLoc
---@field map string
---@field entry string[]
---@field entry_loc? YlexLoc

---@class YlexMapSpec
---@field key string[]|YlexMapPath Key for spec.
---@field to_file? string target file
---@field map_path? YlexMapPath Used if you want to replace key for where to point to.

---@alias YlexMode
---|"on" Yamlex scans and provides linking automatically
---|"off" Yamlex is turned off and only on command will scan
---|"on_command" Alt to "off"
---|"auto" Alt to "on"

---@class YlexMetaConfig
---@field mode YlexMode
---@field enable_highlighting boolean Defaults to true.
---@field enable_icons boolean Defaults to true.
---@field specs table
---@field ignore_pattern string Matching pattern for ignored maps.

---@class YlexBufCache
---@field yid integer Unique yamlex ID.
---@field meta YlexMetaConfig
---@field links YlexLink[] Array of yamlex links found.
---@field buffer? integer Neovim Buffer-ID.
---@field file? string Path to file or assumed file.
---@field data? table filtered table.

---@class YlexCache
---@field icons YlexIcons
---@field yid integer Yamlex-ID
---@field meta YlexMetaConfig Table with meta data
---@field links YlexLink[] Links
---@field buffer integer Buffer-ID for current buffer.
---@field file string File name/path.
---@field data table Filtered data table (without meta and ignoring keys)
---@field bufs YlexBufCache[] Array of (1) already opened buffer (2) scanned files because of other buffer links (for faster loading)

---@class _ylex_def_opts
---@field mode YlexMode
---@field local_refs YlexRefOpts Options for local references (same file).
---@field sibling_refs YlexRefOpts Options for sibling references (in same parent map).
---@field global_refs YlexRefOpts Options for global references (outside file).
---@field meta YlexMetaMapOpts Options for the meta map that is used for settings.
---@field ignore_patterns string[] Pattern matching for keys fully ignored by Yamlex
---@field keysep_pattern string Character interpreted as key seperator. Defaults to "-".
---@field enable_highlighting boolean
---@field enable_nf_icons boolean Use for enabling default nerd font icons.
---@field icons_nerdfont YlexIcons
---@field icons_font_agnostic YlexIcons
---@field enable_icons boolean Defaults to true
---@field map_specs YlexMapSpec[]

---@class YlexOpts
---@field mode? YlexMode
---@field local_refs? YlexRefOpts Options for local references (same file).
---@field sibling_refs? YlexRefOpts Options for sibling references (in same parent map).
---@field global_refs? YlexRefOpts Options for global references (outside file).
---@field meta? YlexMetaMapOpts Options for the meta map that is used for settings.
---@field keysep_pattern? string Character interpreted as key seperator. Defaults to "-".
---@field enable_icons? boolean Defaults to true
---@field enable_nf_icons? boolean Use for enabling default nerd font icons.
---@field icon? string Icon displayed after yamlex links. Will be used as fallback icon, if 'icons' is used.
---@field icons? YlexIcons
---@field map_specs? YlexMapSpec[]
---@field ignore_patterns? string[] Matching patterns for keys always being ignored.
