local function lsp_setup()
    local lspconfig = require('lspconfig')
    lspconfig.efm.setup {
        cmd = { 'efm-langserver', '-c', _G.CONFIG_PATH .. '/efm/config.yaml' },
        on_attach = function()
            vim.cmd([[
                augroup formatter
                    autocmd!
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
                augroup end
            ]])
        end,
        flags = { debounce_text_changes = 150 },
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'go', 'lua', 'yaml', 'markdown' },
        init_options = { documentFormatting = true, codeAction = true },
    }
end

return { lsp_setup = lsp_setup }
