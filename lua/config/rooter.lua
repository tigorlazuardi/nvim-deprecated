return function(use)
	use({
		'ahmedkhalf/lsp-rooter.nvim',
		config = function()
			local present, lsprooter = pcall(require, 'lsprooter')
			if not present then
				return
			end
			lsprooter.setup({})
		end,
	})
end
