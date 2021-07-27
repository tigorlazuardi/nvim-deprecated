local function globals()
	vim.g.auto_session_pre_save_cmds = { "tabdo NvimTreeClose", "tabdo ToggleTermCloseAll", "tabdo TroubleClose" }
end

return function(use)
	globals()
	use({
		"rmagatti/auto-session",
		config = function()
			local opts = {
				log_level = "info",
				auto_session_enable_last_session = false,
				auto_session_root_dir = vim.fn.stdpath("config") .. "/sessions/",
				auto_session_enabled = true,
				auto_save_enabled = true,
				auto_restore_enabled = false,
				auto_session_suppress_dirs = nil,
			}

			require("auto-session").setup(opts)
		end,
	})
end
