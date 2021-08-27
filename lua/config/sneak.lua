return function(use)
	use({
		'justinmk/vim-sneak',
		config = function()
			local option = { silent = true }
			vim.api.nvim_set_keymap('n', '<leader>m', '<Plug>Sneak_s', option)
			vim.api.nvim_set_keymap('n', '<leader>M', '<Plug>Sneak_S', option)
			vim.api.nvim_set_keymap('n', 'f', '<Plug>Sneak_f', option)
			vim.api.nvim_set_keymap('n', 'F', '<Plug>Sneak_F', option)
			vim.api.nvim_set_keymap('n', 't', '<Plug>Sneak_t', option)
			vim.api.nvim_set_keymap('n', 'T', '<Plug>Sneak_T', option)


			local ok, wk = pcall(require, 'which-key')
			if not ok then
				return
			end

			wk.register({
				['<leader>m'] = { '<Plug>Sneak_s', 'Sneak Forward' },
				['<leader>M'] = { '<Plug>Sneak_S', 'Sneak Backward' },
				f = { '<Plug>Sneak_f', 'Sneak Find One Character Forward' },
				F = { '<Plug>Sneak_F', 'Sneak Find One Character Backward' },
				t = { '<Plug>Sneak_t', 'Sneak Till One Character Forward' },
				T = { '<Plug>Sneak_T', 'Sneak Till One Character Backward' },
			})
		end,
	})
end
