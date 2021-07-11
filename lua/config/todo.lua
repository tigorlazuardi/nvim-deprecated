return function(use)
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
            vim.cmd([[nnoremap <silent> <leader>td :TodoTelescope<CR>]])
        end
    }
end
