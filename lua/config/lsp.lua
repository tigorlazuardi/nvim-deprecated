local function luadev_setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
    }
    require"lspconfig".sumneko_lua.setup(require"lua-dev".setup({
        library = {
            vimruntime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        -- pass any additional options that will be merged in the final lsp config
        lspconfig = {
            cmd = { "lua-language-server" },
            capabilities = capabilities,
            on_attach = require("config.on_attach"),
        },
    }))
end

local function lspinstallconf()
    local function setup_servers()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = { "documentation", "detail", "additionalTextEdits" },
        }
        require"lspinstall".setup()
        local servers = require"lspinstall".installed_servers()
        for _, server in pairs(servers) do
            require"lspconfig"[server].setup {
                on_attach = require("config.on_attach"),
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
            }
        end
    end

    setup_servers()

    -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
    require"lspinstall".post_install_hook = function()
        setup_servers() -- reload installed servers
        vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
    end
end

local lsputilsconf = function()
    vim.lsp.handlers["textDocument/codeAction"] = require"lsputil.codeAction".code_action_handler
    vim.lsp.handlers["textDocument/references"] = require"lsputil.locations".references_handler
    vim.lsp.handlers["textDocument/definition"] = require"lsputil.locations".definition_handler
    vim.lsp.handlers["textDocument/declaration"] = require"lsputil.locations".declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = require"lsputil.locations".typeDefinition_handler
    vim.lsp.handlers["textDocument/implementation"] = require"lsputil.locations".implementation_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = require"lsputil.symbols".document_handler
    vim.lsp.handlers["workspace/symbol"] = require"lsputil.symbols".workspace_handler
end

local function set_globals()
    vim.g.completion_enable_auto_paren = 0
    vim.g.completion_auto_change_source = 1
    vim.g.completion_enable_auto_signature = 0
    vim.api.nvim_set_keymap("i", "<c-y>", "<Plug>(completion_confirm_completion)", { silent = true })
    vim.api.nvim_set_keymap("i", "<c-space>", "<Plug>(completion_trigger)", { silent = true })
    vim.g.completion_confirm_key = ""
end

-- local function set_symbols_outline()
--     vim.api.nvim_set_keymap("n", "gs", ":SymbolsOutline<cr>", { silent = true, noremap = true })
-- end

local function set_lsp_colors()
    require("lsp-colors").setup({ Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981" })
end

local function set_lspkind()
    require("lspkind").init({})
end

return function(use)
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall", config = lspinstallconf }
    use "ray-x/lsp_signature.nvim"
    use { "nvim-lua/completion-nvim", setup = set_globals }
    use { "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix", config = lsputilsconf }
    use "steelsojka/completion-buffers"
    use { "folke/lua-dev.nvim", config = luadev_setup }
    use { "folke/lsp-colors.nvim", config = set_lsp_colors }
    use { "onsails/lspkind-nvim", config = set_lspkind }
end
