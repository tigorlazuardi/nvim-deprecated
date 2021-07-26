local M = {}

function OrgImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit)
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

function M.lsp_setup()
	local present, lspconfig = pcall(require, "lspconfig")
	if not present then
		return
	end
	local capabilities = require("lsp.capabilities")
	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = true
			require("lsp.on_attach")(client, bufnr)

			vim.cmd([[
				augroup golang_format
					autocmd!
					autocmd BufWritePre *.go lua OrgImports(100)
				augroup end
			]])
		end,
		cmd = {
			"gopls", -- share the gopls instance if there is one already
			-- "-remote=auto", --[[ debug options ]] --
			-- "-remote.debug=:0",
		},
		settings = {
			gopls = {
				-- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
				analyses = { unusedparams = true, unreachable = false },
				codelenses = {
					generate = true, -- show the `go generate` lens.
					gc_details = true, --  // Show a code lens toggling the display of gc's choices.
				},
				usePlaceholders = false,
				completeUnimported = true,
				staticcheck = false, -- handled by null_ls
				matcher = "fuzzy",
				experimentalDiagnosticsDelay = "1000ms",
				symbolMatcher = "fuzzy",
				gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
			},
		},
	})
end

function M.rayxgo_setup()
	local present, go = pcall(require, "go")
	if not present then
		return
	end
	go.setup({
		goimport = "gofumports", -- goimport command
		gofmt = "gofumpt", -- gofmt cmd,
		max_line_len = 120, -- max line length in goline format
		tag_transform = false, -- tag_transfer  check gomodifytags for details
		test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
		test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
		comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
		verbose = false, -- output loginf in messages
		lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
		lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
		lsp_on_attach = require("lsp.on_attach"),
		lsp_diag_hdlr = true, -- hook lsp diag handler
		dap_debug = true, -- set to true to enable dap
		dap_debug_keymap = true, -- set keymaps for debugger
		dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
		dap_debug_vt = true, -- set to true to enable dap virtual text
	})
end

function M.golangcilsp_setup()
	if O.enable_golangcilint_langserver then
		local present, lspconfig = pcall(require, "lspconfig")
		if not present then
			return
		end
		local configs = require("lspconfig/configs")
		local projectConfigPath = vim.fn.getcwd() .. "/.golangci.yml"
		local exist = vim.fn.filereadable(projectConfigPath) ~= 0

		local cmd = { "golangci-lint", "run", "--out-format=json" }
		if exist then
			table.insert(cmd, "-c")
			table.insert(cmd, projectConfigPath)
		else
			table.insert(cmd, "-c")
			table.insert(cmd, vim.fn.stdpath("config") .. "/linter-config/.golangci.yml")
		end
		if not lspconfig.golangcilsp then
			configs.golangcilsp = {
				default_config = {
					cmd = { "golangci-lint-langserver" },
					root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
					init_options = { command = cmd },
				},
			}
		end

		lspconfig.golangcilsp.setup({ filetypes = { "go" } })
	end
end

M.efm_config = {
	{ formatCommand = "goimports", formatStdin = true },
}

return M
