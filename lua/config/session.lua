local function globals()
	vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal'
	vim.g.auto_session_pre_save_cmds = { 'tabdo NvimTreeClose', 'tabdo ToggleTermCloseAll', 'tabdo TroubleClose' }
end

return function(use)
	globals()
	use({
		'rmagatti/session-lens',
		requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
		config = function()
			local autosession = require('auto-session')
			local opts = {
				log_level = 'info',
				auto_session_enable_last_session = false,
				auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
				auto_session_enabled = true,
				auto_save_enabled = true,
				auto_restore_enabled = false,
				auto_session_suppress_dirs = nil,
			}
			autosession.setup(opts)
			require('telescope').load_extension('session-lens')
			require('session-lens').setup({})

			-- Compability mode with projects nvim
			vim.cmd([[
				augroup session_save
					au!
					au VimLeave * silent! SaveSession
				augroup end
			]])
		end,
	})
end
