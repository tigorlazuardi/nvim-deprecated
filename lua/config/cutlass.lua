return function(use)
	use({
		"svermeulen/vim-cutlass",
		config = function()
			local remap = vim.api.nvim_set_keymap
			local opts = { noremap = true }
			remap("n", "x", "d", opts)
			remap("x", "x", "d", opts)
			remap("n", "xx", "dd", opts)
			remap("n", "X", "D", opts)
		end,
	})
end
