local run = function() vim.api.nvim_command("colorscheme edge") end

return function(use)
    vim.cmd([[
        let g:edge_style = 'aura'
        let g:edge_enable_italic = 1
        let g:edge_disable_italic_comment = 1
    ]])
    use "dracula/vim"
    use {"sainnhe/edge", config = run}
end
