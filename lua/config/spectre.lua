local function config()
	local remap = vim.api.nvim_set_keymap
	require('spectre').setup()

	local opts = { noremap = true, silent = true }

	remap('n', '<leader>fr', [[<cmd>lua require('spectre').open()<cr>]], opts)
	remap('n', '<leader>fw', [[<cmd>lua require('spectre').open_visual({select_word = true})<cr>]], opts)
	remap('v', '<leader>fr', [[<cmd>lua require('spectre').open_visual()<cr>]], opts)
	remap('n', '<leader>fs', [[<cmd>lua require('spectre').open_file_search()<cr>]], opts)
end

return function(use)
	use({ 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' }, config = config, disable = vim.g.vscode })
end
