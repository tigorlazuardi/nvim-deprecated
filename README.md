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

|                         Filetype                         |   Formatter   |    Linter     |            LSP             |                         Binary Formatter                          |               Binary Linter                |                    Binary LSP                    |
| :------------------------------------------------------: | :-----------: | :-----------: | :------------------------: | :---------------------------------------------------------------: | :----------------------------------------: | :----------------------------------------------: |
|                         markdown                         |   prettier    |      ❌       |             ❌             |                     `npm install -g prettier`                     |                     ❌                     |                        ❌                        |
| typescript, javascript, typescriptreact, javascriptreact |   prettier    |   eslint_d    | typescript-language-server |                     `npm install -g prettier`                     |         `npm install -g eslint_d`          |   `npm install -g typescript-language-server`    |
|                            go                            |   goimports   | golangci-lint |           gopls            |             `go get golang.org/x/tools/cmd/goimports`             | `go get github.com/golangci/golangci-lint` |     `go get golang.org/x/tools/gopls@latest`     |
|                           lua                            | lua-formatter |      ❌       |       folke/lua-dev        | `luarocks install --server=https://luarocks.org/dev luaformatter` |                     ❌                     | `https://github.com/sumneko/lua-language-server` |
|                           yaml                           |      ❌       |   yamllint    |           yamlls           |                                ❌                                 |       `pip install --user yamllint`        |      `npm install -g yaml-language-server`       |

# TODO

-   [x] Per language lsp configuration instead of generic
-   [x] Ditch `vim-plug` in favor of `packer`
-   [ ] Find some way to make the config cross-platform
-   [ ] Integrate more with snippets
-   [x] Make TSServer integration better
