return function(use)
    vim.g.dashboard_default_executive = 'telescope'
    vim.cmd([[
        nmap <Leader>ss :<C-u>SessionSave<CR>
        nmap <Leader>sl :<C-u>SessionLoad<CR>
    ]])

    use {
        'glepnir/dashboard-nvim',
        -- config = function()
        --     vim.cmd([[autocmd VimEnter * if @% == "" | Dashboard | endif]])
        -- end,
    }
end
