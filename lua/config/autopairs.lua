local run = function()
    require'nvim-autopairs'.setup({
        check_ts = true,
        disable_filetype = { 'TelescopePrompt' },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
    })
end

return function(use)
    use { 'windwp/nvim-autopairs', config = run }
end
