local M = {}

function M.lsp_setup()
    require'lspconfig'.yamlls.setup { on_attach = require('lsp.on_attach') }
end

M.efm_config = {
    {
        lintCommand = "yamllint -f parsable -",
        lintStdin = true,
    },
}

return M
