local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local M = {}

M.misspell = h.make_builtin({
	method = DIAGNOSTICS,
	filetypes = { "markdown", "text" },
	generator_opts = {
		command = "misspell",
		args = { "-source=text" },
		to_stdin = true,
		format = "line",
		on_output = function(line)
			local row, col, message = line:match(":(%d+):(%d+): (.*)")
			local end_col = col
			local severity = 3

			return {
				message = message,
				row = row,
				col = col,
				end_col = end_col,
				severity = severity,
				source = "misspell",
			}
		end,
	},
	factory = h.generator_factory,
})

return M
