return function(use)
	-- https://github.com/folke/trouble.nvim#%EF%B8%8F-configuration
	use({
		'folke/trouble.nvim',
		disable = vim.g.vscode,
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('trouble').setup({
				position = 'right',
			})
			local ok, wk = pcall(require, 'which-key')
			if not ok then
				return
			end

			wk.register({
				['<leader>x'] = {
					name = '+trouble',
					x = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
					w = {
						'<cmd>TroubleToggle lsp_workspace_diagnostics<cr>',
						'Toggle Trouble LSP Workspace Diagnostics',
					},
					d = {
						'<cmd>TroubleToggle lsp_document_diagnostics<cr>',
						'Toggle Trouble LSP Document Diagnostics',
					},
					l = { '<cmd>TroubleToggle loclist<cr>', 'Toggle Trouble loclist' },
					q = { '<cmd>TroubleToggle quickfix<cr>', 'Toggle Trouble quickfix' },
					r = { '<cmd>TroubleToggle lsp_references<cr>', 'Toggle Trouble LSP References' },
				},
			})
		end,
	})
end
