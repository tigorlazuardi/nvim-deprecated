return function(use)
    vim.cmd([[
        let g:edge_style = 'aura'
        let g:edge_enable_italic = 1
        let g:edge_disable_italic_comment = 1
    ]])
    use {
        "maaslalani/nordbuddy",
        config = function()
            require("nordbuddy").colorscheme({
                underline_option = "none",
                italic = true,
                italic_comments = false,
                minimal_mode = false
            })
        end
    }
    use { "dracula/vim", as = "dracula" }
    use { "sainnhe/edge" }
end
