local M = {}

M.method = require('null-ls').methods.FORMATTING
M.filetypes = { 'toml' }
M.generator = require('null-ls').formatter({
	command = 'toml-fmt',
	to_stdin = true,
})

return M
