return function(use)
	use({ 'mfussenegger/nvim-dap', cond = require('config.firenvim').not_run })
	use({ 'rcarriga/nvim-dap-ui', cond = require('config.firenvim').not_run })
	use({ 'theHamsta/nvim-dap-virtual-text', cond = require('config.firenvim').not_run })
	use({ 'nvim-telescope/telescope-dap.nvim', cond = require('config.firenvim').not_run })
end
