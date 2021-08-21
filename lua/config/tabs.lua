return function(use)
	use({
		'akinsho/nvim-bufferline.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		cond = require('config.firenvim').not_run,
		disable = vim.g.vscode,
		config = function()
			local present, bufferline = pcall(require, 'bufferline')
			if not present then
				return
			end
			bufferline.setup({})
		end,
	})
end
