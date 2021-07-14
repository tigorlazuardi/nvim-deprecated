local function set_globals()
    vim.g.ale_disable_lsp = 1
    vim.g.ale_completion_enabled = 0
    vim.g.ale_linters = { go = { "golangci-lint", "govet", "revive" } }
    vim.g.ale_go_golangci_lint_package = 1
    vim.g.ale_virtualtext_cursor = 1

    vim.g.ale_go_golangci_lint_options = "--presets bugs"
end

return function(use)
    set_globals()
    use "dense-analysis/ale"
    use {
        "nathunsmitty/nvim-ale-diagnostic",
        config = function()
            require("nvim-ale-diagnostic")

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                { underline = false, virtual_text = false, signs = true, update_in_insert = false })
        end,
    }
end
