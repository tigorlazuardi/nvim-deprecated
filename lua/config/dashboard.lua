return function(use)
	local custom_section = {
		a = {
			description = { '  Find File          ' },
			command = 'Telescope find_files',
		},
		b = {
			description = { '  Recently Used Files' },
			command = 'Telescope oldfiles',
		},
		c = {
			description = { '  Recent Projects    ' },
			command = 'Telescope projects',
		},
		d = {
			description = { '  Load Last Session  ' },
			command = 'SessionLoad',
		},
		e = {
			description = { '  Find Word          ' },
			command = 'Telescope live_grep',
		},
	}
	vim.g.dashboard_default_executive = 'telescope'
	vim.g.dashboard_custom_section = custom_section

	use({
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		cond = require('config.firenvim').not_run,
	})
end
