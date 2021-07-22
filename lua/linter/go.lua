local M = {}
local severities = {
	error = vim.lsp.protocol.DiagnosticSeverity.Error,
	warning = vim.lsp.protocol.DiagnosticSeverity.Warning,
	refactor = vim.lsp.protocol.DiagnosticSeverity.Information,
	convention = vim.lsp.protocol.DiagnosticSeverity.Hint,
}

M.cmd = "golangci-lint"
M.stdin = true
M.args = {
	"run",
	"--out-format",
	"json",
	"-c",
	vim.fn.stdpath("config") .. "/linter-config/.golangci.yml",
}

M.stream = "stdout"
M.ignore_exitcode = true

function M.parser(output, bufnr)
	if output == "" then
		return {}
	end

	local decoded = vim.fn.json_decode(output)

	local diagnostics = {}
	local item_list = {}
	for _, issue in ipairs(decoded["Issues"]) do
		local filename = vim.fn.getcwd() .. "/" .. issue.Pos.Filename
		table.insert(item_list, {
			filename = filename,
			lnum = issue.Pos.Line,
			col = issue.Pos.Column,
			text = issue.Text,
			type = "W",
		})

		local current_file = vim.api.nvim_buf_get_name(bufnr)
		if current_file == filename then
			local sv = severities[issue.Severity] or severities.warning
			table.insert(diagnostics, {
				range = {
					["start"] = {
						line = issue.Pos.Line,
						character = issue.Pos.Column,
					},
					["end"] = {
						line = issue.Pos.Line,
						character = issue.Pos.Column,
					},
				},
				severity = sv,
				message = issue.Text,
			})
		end
	end

	vim.fn.setqflist({}, " ", {
		title = "Golangci-lint Workspace Diagnostics",
		items = item_list,
	})

	return diagnostics
end

return M
