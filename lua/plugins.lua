vim.cmd([[autocmd BufWritePost plugins.lua source <afile>]])

return require("packer").startup(function(use)
    -- Let the packer manages itself
    use "wbthomason/packer.nvim"
    -- Auto cwd to workspace root
    require("config/rooter")(use)

    require("config/theme")(use)

    require("config/autopairs")(use)

    require("config/kommentary")(use)

    require("config/explorer")(use)

    require("config/formatter")(use)

    require("config/git")(use)

    require("config/golang")(use)

    require("config/lsp")(use)

    require("config/status_line")(use)

    require("config/snippets")(use)

    require("config/todo")(use)

    require("config/telescope")(use)

    require("config.terminal")(use)

    require("config.treesitter")(use)

    require("config.textobjects")(use)
end)
