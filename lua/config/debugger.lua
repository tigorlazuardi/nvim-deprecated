return function(use)
	local disable = vim.g.vscode
	use({ 'mfussenegger/nvim-dap', disable = disable, cond = require('config.firenvim').not_run })
	use({ 'rcarriga/nvim-dap-ui', disable = disable, cond = require('config.firenvim').not_run })
	use({ 'theHamsta/nvim-dap-virtual-text', disable = disable, cond = require('config.firenvim').not_run })
	use({ 'nvim-telescope/telescope-dap.nvim', disable = disable, cond = require('config.firenvim').not_run })
end
