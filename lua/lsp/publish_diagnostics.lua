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
	return function(_err, result, ctx, _)
		if not result then
			return
		end
		if not ctx then
			return
		end

		local diagnostics = result.diagnostics or {}

		if vim.tbl_count(diagnostics) == 0 then
			return
		end

		local config = {
			signs = true,
			update_in_insert = false,
			virtual_text = {
				prefix = '■ ',
				spacing = 4,
				severity_limit = levels[severity] or vim.lsp.protocol.DiagnosticSeverity.Warning,
			},
		}

		for i, v in ipairs(diagnostics) do
			diagnostics[i].message = string.format('%s: %s', v.source, v.message)
		end

		local bufnr = ctx.bufnr or vim.uri_to_bufnr(result.uri)

		vim.lsp.diagnostic.save(diagnostics, bufnr, ctx.client_id)

		if not vim.api.nvim_buf_is_loaded(bufnr) then
			return
		end

		vim.lsp.diagnostic.display(diagnostics, bufnr, ctx.client_id, config)
	end
end
