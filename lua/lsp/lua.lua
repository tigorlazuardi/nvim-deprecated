local M = {}

function M.lsp_setup()
    local capabilities = require('lsp.capabilities')

    require'lspconfig'.sumneko_lua.setup(
        require'lua-dev'.setup({
            library = { vimruntime = true, types = true, plugins = true },
            lspconfig = {
                cmd = { 'lua-language-server' },
                capabilities = capabilities,
                on_attach = require('lsp.on_attach'),
            },
        }))
end

local formatCmd = string.format('lua-format -i --config="%s"', vim.fn
                                    .stdpath('config') ..
                                    '/linter-config/luaformat.yaml')

M.efm_config = { { formatCommand = formatCmd, formatStdin = true } }

return M
