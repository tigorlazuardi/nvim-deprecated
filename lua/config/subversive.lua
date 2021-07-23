return function(use)
	use({
		"svermeulen/vim-subversive",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>(SubversiveSubstitute)", {})
			vim.api.nvim_set_keymap("n", "<leader>ss", "<Plug>(SubversiveSubstituteLine)", {})
			vim.api.nvim_set_keymap("n", "<leader>sW", "<plug>(SubversiveSubstituteToEndOfLine)", {})
		end,
	})
end
