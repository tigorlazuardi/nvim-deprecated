return function(use)
	use({
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		disable = vim.g.vscode,
		config = function()
			require('todo-comments').setup({
				highlight = { pattern = [[.*<(KEYWORDS)\s*]] },
				search = { pattern = [[\s(KEYWORDS)\b]] },
			})
			vim.cmd([[nnoremap <silent> <leader>td :TodoTelescope<CR>]])
		end,
	})
end
