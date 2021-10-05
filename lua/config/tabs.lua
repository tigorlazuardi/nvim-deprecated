return function(use)
	-- use({
	-- 	'akinsho/nvim-bufferline.lua',
	-- 	requires = 'kyazdani42/nvim-web-devicons',
	-- 	cond = require('config.firenvim').not_run,
	-- 	disable = vim.g.vscode,
	-- 	config = function()
	-- 		local present, bufferline = pcall(require, 'bufferline')
	-- 		if not present then
	-- 			return
	-- 		end
	-- 		bufferline.setup({})
	-- 	end,
	-- })
	use({
		'nanozuki/tabby.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('tabby').setup()
			vim.api.nvim_set_keymap('n', '<leader>ta', ':$tabnew<CR>', { noremap = true })
			vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
			vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true })
			vim.api.nvim_set_keymap('n', ']T', ':tabn<CR>', { noremap = true })
			vim.api.nvim_set_keymap('n', '[T', ':tabp<CR>', { noremap = true })
			-- move current tab to preview position
			vim.api.nvim_set_keymap('n', '<leader>tmp', ':-tabmove<CR>', { noremap = true })
			-- move current tab to next position
			vim.api.nvim_set_keymap('n', '<leader>tmn', ':+tabmove<CR>', { noremap = true })
		end,
	})
end
