local M = {}
local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")

M.method = methods.FORMATTING

M.filetypes = { "go" }

M.generator = helpers.formatter_factory({
	command = "gofumpt",
	to_stdin = true,
})

return M
