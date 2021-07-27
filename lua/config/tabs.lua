return function(use)
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		cond = require("config.firenvim").not_run,
		config = function()
			require("bufferline").setup({})
		end,
	})
end
