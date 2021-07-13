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
            on_attach = function(client, bufnr)
                local chain_complete_list = {
                    -- LuaFormatter off
                    default = {
                        {complete_items = {"lsp", "snippet"}},
                        {complete_items = {"path"}, triggered_only = {"/"}},
                        {complete_items = {"buffers"}},
                    },
                    -- LuaFormatter on
                    string = { { complete_items = { "path" }, triggered_only = { "/" } } },
                    comment = { { complete_items = { "path", "buffers" } } },
                }

                require("completion").on_attach({
                    matching_strategy_list = { "exact", "substring", "fuzzy" },
                    chain_complete_list = chain_complete_list,
                })
                require"lsp_signature".on_attach()
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local function buf_set_option(...)
                    vim.api.nvim_buf_set_option(bufnr, ...)
                end
                buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
                -- Mappings
                local opts = { noremap = true, silent = true }
                buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                -- Replaced by telescope
                -- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
                buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
                -- Replaced by telescope
                -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
                buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
                buf_set_keymap("n", "<leader>wl",
                    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
                buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
                buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                -- Replaced by telescope
                -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                buf_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
                buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
                buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
                -- uses telescope instead
                -- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

                -- Set some keybinds conditional on server capabilities
                if client.resolved_capabilities.document_formatting then
                    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                elseif client.resolved_capabilities.document_range_formatting then
                    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                end

                -- Set autocommands conditional on server_capabilities
                if client.resolved_capabilities.document_highlight then
                    vim.api.nvim_exec([[
                    augroup lsp_document_highlight
                        autocmd!
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                    augroup END
                    ]], false)
                end
            end,
        },
    }))
end

local function lspinstallconf()
    local on_attach = function(client, bufnr)
        local chain_complete_list = {
            default = { { complete_items = { "lsp", "snippet" } }, { complete_items = { "path", "buffers" } } },
            string = { { complete_items = { "path" }, triggered_only = { "/" } } },
            comment = { { complete_items = { "path", "buffers" } } },
        }

        require("completion").on_attach({
            matching_strategy_list = { "exact", "substring", "fuzzy" },
            chain_complete_list = chain_complete_list,
        })
        require"lsp_signature".on_attach()
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
        -- Mappings
        local opts = { noremap = true, silent = true }
        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        -- Replaced by telescope
        -- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        -- Replaced by telescope
        -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        -- Replaced by telescope
        -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
        -- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        -- buf_set_keymap("i", "<c-j>", "<Plug>(completion_next_source)", {silent = true})
        -- buf_set_keymap("i", "<c-k>", "<Plug>(completion_prev_source)", {silent = true})

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec([[
        augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
        end
    end
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
                on_attach = on_attach,
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

    vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = "right",
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        keymaps = {
            close = "<Esc>",
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            rename_symbol = "r",
            code_actions = "a",
        },
        lsp_blacklist = {},
    }
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
    set_globals()
    --
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall", config = lspinstallconf }
    use "ray-x/lsp_signature.nvim"
    use { "nvim-lua/completion-nvim" }
    use { "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix", config = lsputilsconf }
    use "steelsojka/completion-buffers"
    use { "folke/lua-dev.nvim", config = luadev_setup }
    use { "folke/lsp-colors.nvim", config = set_lsp_colors }
    use { "onsails/lspkind-nvim", config = set_lspkind }
    -- use { "simrat39/symbols-outline.nvim", config = set_symbols_outline }
end
