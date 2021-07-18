local function run()
    require'nvim-treesitter.configs'.setup {
        context_commentstring = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
        textsubjects = {
            enable = true,
            keymaps = { ['.'] = 'textsubjects-smart', [';'] = 'textsubjects-container-outer' },
        },
        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            swap = {
                enable = true,
                swap_next = { ['<leader>a'] = '@parameter.inner' },
                swap_previous = { ['<leader>A'] = '@parameter.inner' },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = { [']]'] = '@function.outer', [']m'] = '@class.outer' },
                goto_next_end = { [']['] = '@function.outer', [']M'] = '@class.outer' },
                goto_previous_start = { ['[['] = '@function.outer', ['[m'] = '@class.outer' },
                goto_previous_end = { ['[]'] = '@function.outer', ['[m'] = '@class.outer' },
            },
            lsp_interop = {
                enable = true,
                border = 'none',
                peek_definition_code = { ['<leader>df'] = '@function.outer', ['<leader>dF'] = '@class.outer' },
            },
        },
    }
end

local function configure_kommentary()
    require('kommentary.config').configure_language('typescriptreact', {
        single_line_comment_string = 'auto',
        multi_line_comment_strings = 'auto',
        hook_function = function()
            require('ts_context_commentstring.internal').update_commentstring()
        end,
    })

    require('kommentary.config').configure_language('javascriptreact', {
        single_line_comment_string = 'auto',
        multi_line_comment_strings = 'auto',
        hook_function = function()
            require('ts_context_commentstring.internal').update_commentstring()
        end,
    })
end

return function(use)
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = 'nvim-treesitter/nvim-treesitter', config = run }
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
            vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    underline = true,
                    virtual_text = { spacing = 5, severity_limit = 'Warning' },
                    update_in_insert = true,
                })
        end,
    }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', config = configure_kommentary }
    use 'RRethy/nvim-treesitter-textsubjects'
end
