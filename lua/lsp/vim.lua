local M = {}

function M.lsp_setup()
    require('lspconfig').vimls.setup {}
end

return M
