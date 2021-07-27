return function(use)
	use({
		'blackCauldron7/surround.nvim',
		config = function()
			local present, surround = pcall(require, 'surround')
			if not present then
				return
			end
			surround.setup({})
		end,
	})
end
