return function(use)
	vim.g.dashboard_default_executive = 'telescope'

	use({
		'glepnir/dashboard-nvim',
		cond = require('config.firenvim').not_run,
	})
end
