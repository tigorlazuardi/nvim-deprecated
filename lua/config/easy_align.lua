return function(use)
	use({
		'junegunn/vim-easy-align',
		config         = function()
			local opts = { silent = true }
			vim.api.nvim_set_keymap('x', 'gA', '<Plug>(EasyAlign)', opts)
			vim.api.nvim_set_keymap('n', 'gA', '<Plug>(EasyAlign)', opts)
		end,
	})
end
