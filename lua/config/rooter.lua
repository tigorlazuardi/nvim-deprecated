return function(use)
    vim.cmd([[
        let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh', 'go.mod', 'init.vim', 'cargo.toml', 'package.json', 'requirements.txt']
    ]])
    use {"airblade/vim-rooter"}
end
