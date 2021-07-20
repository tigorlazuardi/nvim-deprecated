return function(use)
    use {
        'gennaro-tedesco/nvim-peekup',
        config = function()
            require('nvim-peekup.config').on_keystroke['delay'] = '1ms'
            require('nvim-peekup.config').on_keystroke['paste_reg'] = '"'
            vim.api.nvim_set_keymap('n', '<leader>P', '<Plug>PeekupPasteBefore', {})
            vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>PeekupPasteAfter', {})
        end,
    }
end
