local M = {}
local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")
-- local null_ls = require("null-ls")

M.method = methods.DIAGNOSTICS

M.filetypes = { "go" }

local exist = vim.fn.filereadable(vim.fn.getcwd() .. "/.golangci.yml") ~= 0
local args = {}
if exist then
	args = {
		"--out-format=json",
		"run",
		"-c",
		vim.fn.getcwd() .. "/.golangci.yml",
	}
else
	args = {
		"--out-format=json",
		"run",
		"-c",
		vim.fn.stdpath("config") .. "/linter-config/.golangci.yml",
	}
end

M.generator = helpers.generator_factory({
	command = "golangci-lint",
	args = args,
	to_stdin = true,
	to_stderr = true,
	format = "json",
	on_output = function(params)
		if not params.output then
			return nil
		end

		local decoded = params.output

		if decoded["Issues"] == nil or type(decoded["Issues"]) == "userdata" then
			return nil
		end

		local diagnostics = {}
		local item_list = {}
		for _, issue in ipairs(decoded["Issues"]) do
			local filename = vim.fn.getcwd() .. "/" .. issue.Pos.Filename
			table.insert(item_list, {
				filename = filename,
				lnum = issue.Pos.Line,
				col = issue.Pos.Column - 1,
				text = issue.Text,
				type = "W",
			})

			local current_file = vim.api.nvim_buf_get_name(params.bufnr)
			if current_file == filename then
				table.insert(diagnostics, {
					row = issue.Pos.Line,
					col = issue.Pos.Column,
					source = issue.FromLinter,
					message = issue.Test,
					severity = 2,
				})
			end
		end

		vim.fn.setqflist({}, " ", {
			title = "Golangci-lint Workspace Diagnostics",
			items = item_list,
		})

		return diagnostics
	end,
})

return M
