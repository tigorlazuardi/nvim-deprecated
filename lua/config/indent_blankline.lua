return function(use)
    vim.g.indent_blankline_filetype_exclude = { "dashboard", "NvimTree" }
    use "lukas-reineke/indent-blankline.nvim"
end
