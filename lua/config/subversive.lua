return function(use)
	use({
		'svermeulen/vim-subversive',
		config = function()
			local option = { silent = true }
			vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(SubversiveSubstitute)', option)
			vim.api.nvim_set_keymap('n', '<leader>ss', '<Plug>(SubversiveSubstituteLine)', option)
			vim.api.nvim_set_keymap('n', '<leader>sw', '<plug>(SubversiveSubstituteToEndOfLine)', option)
			local ok, wk = pcall(require, 'which-key')
			if not ok then
				return
			end
			wk.register({
				['<leader>s'] = { '<Plug>(SubversiveSubstitute)', 'Substitute (Motion)' },
				['<leader>ss'] = { '<Plug>(SubversiveSubstituteLine)', 'Substitute Line' },
				['<leader>sw'] = { '<plug>(SubversiveSubstituteToEndOfLine)', 'Substitute to End of Line' },
			})
		end,
	})
end
