# nvim

Neovim 0.5.X configuration

# Installation

Install Packer Nvim Linux

```sh
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install Packer Nvim for Windows

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

Run `:PackerInstall` then followed by `:PackerCompile`

# Language / Filetype Supports

Required binaries for filetype supports and completions. Requirement:

[efm-langserver](https://github.com/mattn/efm-langserver) for formats and linters.

```
go get github.com/mattn/efm-langserver
```

|                         Filetype                         |                            Formatter                             |                       Linter                        |                                          LSP                                          |
| :------------------------------------------------------: | :--------------------------------------------------------------: | :-------------------------------------------------: | :-----------------------------------------------------------------------------------: |
|                         markdown                         |         [prettierd](https://github.com/fsouza/prettierd)         |                         ❌                          |                                          ❌                                           |
| typescript, javascript, typescriptreact, javascriptreact |         [prettierd](https://github.com/fsouza/prettierd)         | [eslint_d](https://github.com/mantoni/eslint_d.js/) | [typescript-language-server](https://github.com/theia-ide/typescript-language-server) |
|                            go                            | [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) |                    golangci-lint                    |                                         gopls                                         |
|                           lua                            |                          lua-formatter                           |                         ❌                          |                                     folke/lua-dev                                     |
|                           yaml                           |                                ❌                                |                      yamllint                       |                                        yamlls                                         |

# TODO

- [x] Per language lsp configuration instead of generic
- [x] Ditch `vim-plug` in favor of `packer`
- [x] Find some way to make the config cross-platform
- [ ] Integrate more with snippets
- [x] Make TSServer integration better
