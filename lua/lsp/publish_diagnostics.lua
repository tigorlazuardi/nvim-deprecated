---comment
---@param severity string
---@return function
return function(severity)
	severity = severity:lower()
	local levels = {
		warning = vim.lsp.protocol.DiagnosticSeverity.Warning,
		info = vim.lsp.protocol.DiagnosticSeverity.Information,
		error = vim.lsp.protocol.DiagnosticSeverity.Error,
		hint = vim.lsp.protocol.DiagnosticSeverity.Hint,
	}
	return function(_, _, params, client_id, _)
		local config = {
			underline = true,
			signs = true,
			update_in_insert = true,
			virtual_text = {
				prefix = '■ ',
				spacing = 4,
				severity_limit = levels[severity] or vim.lsp.protocol.DiagnosticSeverity.Warning,
			},
		}
		local uri = params.uri
		local bufnr = vim.uri_to_bufnr(uri)

		if not bufnr then
			return
		end

		local diagnostics = params.diagnostics

		for i, v in ipairs(diagnostics) do
			diagnostics[i].message = string.format('%s: %s', v.source, v.message)
		end

		vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

		if not vim.api.nvim_buf_is_loaded(bufnr) then
			return
		end

		vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
	end
end