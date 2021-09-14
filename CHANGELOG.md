<a name="unreleased"></a>
## [Unreleased]


<a name="v3.0.2"></a>
## [v3.0.2] - 2021-09-14
### Feature
- **easy-align:** added easy align plugin
- **markdown:** removed markdown preview, uses Glow instead


<a name="v3.0.1"></a>
## [v3.0.1] - 2021-09-13
### Feature
- **gui-font:** change font size to h16
- **lsp:** added rust_analyzer native setup (but commented)
- **package-info:** added nui.nvim as dependency
- **rust-tools:** temporarily move to Joakker's fork until simrat's is updated


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-09-12
### Feature
- **lualine:** moved requirement from forked lib to original lib
- **publishDiagnostics:** moved to 0.6.X publish diagnostic syntax


<a name="v2.1.0"></a>
## [v2.1.0] - 2021-09-04
### Feature
- **font:** reduce font size for GUI
- **font:** update firacode font setting
- **golang:** added goimpl plugin `<leader>im` for filetype go
- **luasnip:** fix luasnip friendly-snippets and add golang snippet
- **package-info:** added virtual text support for `package.json`
- **package.json:** added virtual text for dependency versions
- **telescope:** Get Code actions changed from `gA` to `ga`


<a name="v2.0.6"></a>
## [v2.0.6] - 2021-09-02
### Feature
- **autopairs:** autopairs now check ts and does not enter completion on enter
- **lualine:** update lsp_status symbols
- **on_attach:** update in insert now false
- **tabout:** update tabout to add '<' and '>' and disable completion check


<a name="v2.0.5"></a>
## [v2.0.5] - 2021-09-01
### Feature
- **diagnostics:** virtual text default level is hint
- **lualine:** moved all lualines to left side because of length
- **lualine:** now requires nvim-web-devicons and added lsp name
- **lualine:** added diagnostic message source
- **rust:** enabled cargo check on save


<a name="v2.0.4"></a>
## [v2.0.4] - 2021-09-01
### Feature
- **cmp:** removed nvim_lua from source because nvim lua has problems
- **golangcilint:** golangcilint config now hardcoded to nvim config dir
- **linter:** update prettierrc json
- **lualine:** moved from galaxyline to lualine
- **null_ls:** removed lsp status from being attached to null_ls

### Fix
- **completion:** fix cmp logic for lsp symbols

### Refactor
- **publish_diagnostics:** now can generate publish diagnostics based on levels

### Removed
- **fugitive:** removed fugitive in favor of lazygit for conflict handling


<a name="v2.0.3"></a>
## [v2.0.3] - 2021-08-27
### Delete
- **plugins:** formatter and snippets

### Feature
- **autopairs:** refactor


<a name="v2.0.2"></a>
## [v2.0.2] - 2021-08-27
### Feature
- **luasnip:** changed snippet engine to luasnip engine


<a name="v2.0.1"></a>
## [v2.0.1] - 2021-08-27
### Fix
- **completion:** fixed bad mapping on completion confirm


<a name="v2.0.0"></a>
## [v2.0.0] - 2021-08-27
### Chore
- **cutlass:** format code

### Feature
- **completion:** removed compe, moved to cmp
- **nvim-tree:** `CHANGELOG.md` is now considered special file


<a name="v1.2.2"></a>
## [v1.2.2] - 2021-08-27
### Chore
- **subversive:** removed unused codes

### Feature
- **nightfox:** update deprecated configurations
- **sneak:** changed `s` and `S` to `<leader>m` and `<leader>M` respectively
- **spellsitter:** disabled spellsitter on rust files
- **spellsitter:** spellsitter is disabled on windows
- **surround:** prefix now return to `s` from `x`
- **transparent:** disabled

### Mappings
- **lsp:** `gD` now open definition in split window

### Settings
- **font:** increase gui font size to 16

### Uninstall
- **theme:** removed nordbuddy and dracula/vim


<a name="v1.2.1"></a>
## [v1.2.1] - 2021-08-25
### Feature
- **treesitter:** added spellsitter
- **treesitter:** nvim ts context now only loads on typescriptreact and javascriptreact


<a name="v1.2.0"></a>
## [v1.2.0] - 2021-08-25
### Chore
- formatting

### Feature
- **fugitive:** added vim fugitive for integrated vimdiff

### Fix
- **auto-session:** fix sessionoptions break lsp and other plugins

### Mappings
- **surround:** surround nvim uses 'x' as prefix


<a name="v1.1.1"></a>
## [v1.1.1] - 2021-08-25
### Feature
- **session-lens:** registered to telescope extension


<a name="v1.1.0"></a>
## [v1.1.0] - 2021-08-23
### Feature
- **auto-session:** added auto session with session lens

### Update
- **font:** increase font size for neovide


<a name="v1.0.5"></a>
## [v1.0.5] - 2021-08-23
### Chore
- format
- cleanup unused codes

### Feature
- **sneak:** added vim-sneak
- **tabout:** tabout now completely handle tabs

### Update
- **keymaps:** tab will not move autocomplete selection or jump. it replaced by c-j


<a name="v1.0.4"></a>
## [v1.0.4] - 2021-08-22
### Feature
- **vscode:** support for vscode-neovim

### License
- create MIT License

### Update
- **gitsigns:** update configuration
- **null_ls:** formatting now done in sync manner and autocmd is grouped
- **rust:** disabled info spam for proc macro


<a name="v1.0.3"></a>
## [v1.0.3] - 2021-08-19
### Config
- **treesitter:** removed lsp_interop and changed `<leader>d` key to show line diagnostics

### Doc
- update changelog.md
- **chglog:** update changelog settings


<a name="v1.0.2"></a>
## [v1.0.2] - 2021-08-18
### Chore
- format

### Doc
- update changelog.md
- update CHANGELOG.md

### Keymap
- changed leader-d to leader-D to handle overlaps

### Refactor
- consolidate publishDiagnostic handling
- cleanup efm settings


<a name="v1.0.1"></a>
## [v1.0.1] - 2021-08-18
### Chore
- readability

### Feat
- added nightfox theme
- added changelog.md support

### Fix
- removed problem ignore lsp limiting history


<a name="v1.0.0"></a>
## v1.0.0 - 2021-08-18
### CHORE
- Format
- Format

### Chore
- format

### Feat
- dashboard now on VimEnter
- added dashboard custom section
- added projects nvim
- added taboout plugin
- **lsp:** added rust lsp

### Fix
- **lsp:** use rust lsp as formatter

### Refactor
- moved vim guifont to settings lua

### Revert
- **lsp:** removed lspsaga


[Unreleased]: https://github.com/tigorlazuardi/nvim/compare/v3.0.2...HEAD
[v3.0.2]: https://github.com/tigorlazuardi/nvim/compare/v3.0.1...v3.0.2
[v3.0.1]: https://github.com/tigorlazuardi/nvim/compare/v3.0.0...v3.0.1
[v3.0.0]: https://github.com/tigorlazuardi/nvim/compare/v2.1.0...v3.0.0
[v2.1.0]: https://github.com/tigorlazuardi/nvim/compare/v2.0.6...v2.1.0
[v2.0.6]: https://github.com/tigorlazuardi/nvim/compare/v2.0.5...v2.0.6
[v2.0.5]: https://github.com/tigorlazuardi/nvim/compare/v2.0.4...v2.0.5
[v2.0.4]: https://github.com/tigorlazuardi/nvim/compare/v2.0.3...v2.0.4
[v2.0.3]: https://github.com/tigorlazuardi/nvim/compare/v2.0.2...v2.0.3
[v2.0.2]: https://github.com/tigorlazuardi/nvim/compare/v2.0.1...v2.0.2
[v2.0.1]: https://github.com/tigorlazuardi/nvim/compare/v2.0.0...v2.0.1
[v2.0.0]: https://github.com/tigorlazuardi/nvim/compare/v1.2.2...v2.0.0
[v1.2.2]: https://github.com/tigorlazuardi/nvim/compare/v1.2.1...v1.2.2
[v1.2.1]: https://github.com/tigorlazuardi/nvim/compare/v1.2.0...v1.2.1
[v1.2.0]: https://github.com/tigorlazuardi/nvim/compare/v1.1.1...v1.2.0
[v1.1.1]: https://github.com/tigorlazuardi/nvim/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/tigorlazuardi/nvim/compare/v1.0.5...v1.1.0
[v1.0.5]: https://github.com/tigorlazuardi/nvim/compare/v1.0.4...v1.0.5
[v1.0.4]: https://github.com/tigorlazuardi/nvim/compare/v1.0.3...v1.0.4
[v1.0.3]: https://github.com/tigorlazuardi/nvim/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/tigorlazuardi/nvim/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/tigorlazuardi/nvim/compare/v1.0.0...v1.0.1
