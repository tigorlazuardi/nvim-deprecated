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

		local ns = vim.api.nvim_create_namespace('what-would-you-do')

		-- vim.diagnostic.save(diagnostics, bufnr, ctx.client_id)
		vim.diagnostic.set(ns, bufnr, diagnostics, nil)

		vim.diagnostic.show(ns, bufnr, diagnostics, nil)
		-- vim.diagnostic.display(diagnostics, bufnr, ctx.client_id, config)
	end
end
