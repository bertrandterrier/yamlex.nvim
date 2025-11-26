# yamlex.nvim
Neovim module for creating interconnected "Lexika", where certain fields referring 
fields in other Lexika, where each Lexika is a Yaml file.

- [License](#license)
- [Contact](#contact)


## Setup
### Defaults
```lua
---@type _YlexDefOpts
local defaults = {
  enable_auto = true,
  meta = {
    fieldname = "yamlex",     -- 1. search 'data[<prefix><fieldname>]'
    mapname = "meta",         -- 2. search 'data[<prefix><mapname>][<fieldname>]'
    prefix = "_",
    enforce = false,          -- If turned of, any yaml file is interpreted as yamlex.
  },
    global_refs = {               -- Reference to entry in another yaml file.
      enable = true,          
      fallback_ref = false,
      pattern = "",
      icon = "->|"
    },
    local_refs = {                -- Reference to entry in file of entry.
      enable = true,            
      icon = "|->",
      pattern = "",
      fallback_ref = { 'global' },
    },
    sibling_refs = {              -- Reference to entry in same parent map/dictionary
      enable = true,
      icon = ">->",
      pattern = "",
      fallback_ref = { 'local', 'global' }
    },
    line_highlight = 'links',     -- Can be "links"|"all"|false|true|nil; true -> "all"
    keysep = '.',                 -- Interpreted as "keypath" to entry, with keysep seperating map keys.
  }
}
```

### Commands

| Usage             | Command  | Arguments      | Note                     |
| :---              |  :---:   | :---           | :---                     |
| Scan file         | `YLScan` | *file*         | Defaults to current file |
| Jump to reference | `YLOpen` | *file/line*    | Number interpreted as line (defaults to `.`), otherwise target file (if not provided, uses the meta data).

## License
Licensed under [AGPLv3](LICENSE).


## Contact
by Immanuel Stemmert ([E-mail](mailto:bertrandterrier@devmule.net), [Mastodon](https://ifwo.eu/@bertrandterrier))
