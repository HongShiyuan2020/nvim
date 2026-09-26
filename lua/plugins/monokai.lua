return {
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local monokai = require("monokai")
            monokai.setup({
                palette = monokai.classic,
            })
            vim.cmd([[colorscheme monokai]])
        end,
    },
}
