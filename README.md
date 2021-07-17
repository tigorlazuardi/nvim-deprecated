# nvim
Neovim 0.5.X configuration

# Installation

Install Packer Nvim

```sh
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Run `:PackerInstall` then followed by `:PackerCompile`

Support only Linux for now (nvim lspinstall really hinders the cross-platform-ness of this config)

# TODO

* [X] Extend TextObject support
* [X] Move config to pure lua
* [X] Extend `on_attach` lsp function with callbacks
* [X] Per language lsp configuration instead of generic
* [X] Ditch `vim-plug` in favor of `packer`
* [ ] Find some way to make the config cross-platform
* [ ] Integrate more with snippets
* [ ] Make TSServer integration better

# Bugs

* [ ] Efm Langserver won't trigger commands
