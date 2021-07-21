return function(use)
    use {
        'mfussenegger/nvim-lint',
        config = function()
            -- require('lint').linters_by_ft = { go = { 'golangcilint' } }
            -- vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
        end,
    }
end
