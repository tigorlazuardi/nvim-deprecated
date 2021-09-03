return function(use)
	use({
		'ray-x/go.nvim',
		disable = vim.g.vscode,
		config = require('lsp.go').rayxgo_setup,
		ft = { 'go' },
	})

	use({
		'edolphin-ydf/goimpl.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		ft = {'go'},
		config = function()
			require('telescope').load_extension('goimpl')

			local ok, wk = pcall(require, 'which-key')
			if not ok then
				return
			end

			wk.register({
				['<leader>im'] = {[[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], 'Go Impl' },
			})
		end,
	})
end
