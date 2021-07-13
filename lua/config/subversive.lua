return function(use)
    use {
        "svermeulen/vim-subversive",
        config = function()
            vim.api.nvim_set_keymap("n", "sw", "<Plug>(SubversiveSubstitute)",
                {})
            vim.api.nvim_set_keymap("n", "sww",
                "<Plug>(SubversiveSubstituteLine)", {})
            vim.api.nvim_set_keymap("n", "sW",
                "<plug>(SubversiveSubstituteToEndOfLine)", {})
        end,
    }
end
