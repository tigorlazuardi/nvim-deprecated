local M = {}
local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")

M.method = methods.FORMATTING

M.filetypes = { "sh", "zsh", "bash" }

M.generator = helpers.formatter_factory({
	command = "beautysh",
	args = { "-" },
	to_stdin = true,
})

return M
