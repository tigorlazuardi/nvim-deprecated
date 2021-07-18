vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    -- Let the packer manages itself
    use 'wbthomason/packer.nvim'
    -- Auto cwd to workspace root
    require('config.rooter')(use)
    require('config.theme')(use)
    require('config.autopairs')(use)

    require('config.kommentary')(use)

    require('config.explorer')(use)

    -- require('config.formatter')(use)

    require('config.git')(use)

    require('config.golang')(use)

    require('config.lsp')(use)

    require('config.status_line')(use)

    require('config.snippets')(use)

    require('config.todo')(use)

    require('config.telescope')(use)

    require('config.terminal')(use)

    require('config.treesitter')(use)

    require('config.textobjects')(use)

    require('config.dashboard')(use)

    use {
        'glacambre/firenvim',
        run = function()
            vim.fn['firenvim#install'](0)
        end,
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = { 'markdown' },
    }

    require('config.indent_blankline')(use)

    require('config.subversive')(use)

    require('config.cutlass')(use)

    require('config.surround')(use)

    require('config.register')(use)

    require('config.transparent')(use)

    require('config.tabs')(use)

    -- use "yamatsum/nvim-cursorline"

    require('config.completion')(use)

    require('config.trouble')(use)

    require('config.debugger')(use)

    require('config.discord')(use)

end)
