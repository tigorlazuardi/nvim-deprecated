local function run()
	local lint = require('lint')
	lint.linters.custom_golangcilint = require('linter.go')
	vim.cmd([[
        augroup Linters
            autocmd!
            au BufWritePost * lua require('lint').try_lint()
        augroup END
    ]])
end

return function(use)
	use({
		'mfussenegger/nvim-lint',
		disable = vim.g.vscode,
		cond = function()
			return O.enable_nvim_lint
		end,
		config = run,
	})

	use({
		'jose-elias-alvarez/null-ls.nvim',
		disable = vim.g.vscode,
		cond = function()
			return O.enable_null_ls
		end,
		requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
		config = require('lsp.null_ls').lsp_setup,
	})
end
