local M = {}

function M.lsp_setup()
    local lspconfig = require('lspconfig')
    local capabilities = require('lsp.capabilities')

    lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = function(client, buffer)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end
            client.resolved_capabilities.document_formatting = false
            require('lsp.on_attach')(client, buffer)
        end,
    }
end

M.efm_config = {
    {
        formatCommand = 'prettierd "${INPUT}"',
        formatStdin = true,
        env = {
            string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.stdpath('config') .. '/linter-config/.prettierrc.json'),
        },
    },
    {
        lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
        lintStdin = true,
        lintFormats = { '%f:%l:%c: %m' },
        lintIgnoreExitCode = true,
        formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
        formatStdin = true,
    },
}

return M
