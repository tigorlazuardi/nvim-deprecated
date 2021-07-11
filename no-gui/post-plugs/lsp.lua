vim.lsp.handlers["textDocument/codeAction"] = require"lsputil.codeAction".code_action_handler
vim.lsp.handlers["textDocument/references"] = require"lsputil.locations".references_handler
vim.lsp.handlers["textDocument/definition"] = require"lsputil.locations".definition_handler
vim.lsp.handlers["textDocument/declaration"] = require"lsputil.locations".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require"lsputil.locations".typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require"lsputil.locations".implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require"lsputil.symbols".document_handler
vim.lsp.handlers["workspace/symbol"] = require"lsputil.symbols".workspace_handler

local chain_complete_list = {
    default = {
        {complete_items = {"lsp", "snippet"}}, {complete_items = {"path"}, triggered_only = {"/"}},
        {complete_items = {"buffers"}}
    },
    string = {{complete_items = {"path"}, triggered_only = {"/"}}},
    comment = {{complete_items = {"path"}, triggered_only = {"/"}}, {complete_items = {"buffers"}}}
}

local on_attach = function(client, bufnr)
    require("completion").on_attach({
        matching_strategy_list = {"exact", "substring", "fuzzy"},
        chain_complete_list = chain_complete_list
    })
    require"lsp_signature".on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

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

require"lspinstall".setup() -- important after configs

local function setup_server()
    local servers = require"lspinstall".installed_servers()
    for _, server in pairs(servers) do
        require"lspconfig"[server].setup {on_attach = on_attach, flags = {debounce_text_changes = 150}}
    end
end

setup_server()

require("lspinstall").post_install_hook = function()
    setup_server()
    vim.cmd("bufdo e")
end

--[[ ----------------------------------- sumneko -------------------------------------

local lualibs = {}
local luapaths = vim.split(package.path, ";")
table.insert(luapaths, "lua/?.lua")
table.insert(luapaths, "lua/?/init.lua")

local function addLuaPath(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        lualibs[p] = true
    end
end

addLuaPath("$VIMRUNTIME")
addLuaPath("~/.config/nvim")

 ]]
