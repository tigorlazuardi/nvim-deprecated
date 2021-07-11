local run = function() require"nvim-autopairs".setup() end

return function(use) use {"windwp/nvim-autopairs", config = run} end
