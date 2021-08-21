return function(use)
	use({
		'xiyaowong/nvim-transparent',
		disable = vim.g.vscode,
		config = function()
			require('transparent').setup({
				enable = require('config.firenvim').run(), -- boolean: enable transparent
				extra_groups = { -- table/string: additional groups that should be clear
					-- In particular, when you set it to 'all', that means all avaliable groups

					-- example of akinsho/nvim-bufferline.lua
					'BufferLineTabClose',
					'BufferlineBufferSelected',
					'BufferLineFill',
					'BufferLineBackground',
					'BufferLineSeparator',
					'BufferLineIndicatorSelected',
				},
				exclude = {}, -- table: groups you don't want to clear
			})
		end,
	})
end
