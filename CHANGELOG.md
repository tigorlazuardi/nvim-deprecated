<a name="unreleased"></a>
## [Unreleased]


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


[Unreleased]: https://github.com/tigorlazuardi/nvim/compare/v2.0.1...HEAD
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
