local function lsp_setup()
    require'lspconfig'.yamlls.setup { on_attach = require('lsp.on_attach') }
end

return { lsp_setup = lsp_setup }
