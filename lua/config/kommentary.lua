local run = function()
    require("kommentary.config").configure_language("default", { prefer_single_line_comments = true })
end

return function(use)
    use { "b3nj5m1n/kommentary", config = run }
end
