local function run()
    vim.cmd([[
        imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand-or-jump)'         : '<C-j>'
        smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand-or-jump)'         : '<C-j>'

        " Jump forward or backward
        imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    ]])
end

return function(use) use { "hrsh7th/vim-vsnip-integ", requires = "hrsh7th/vim-vsnip", config = run } end
