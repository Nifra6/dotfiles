return {
    -- NOTE: Show indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
            },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
    },
    -- NOTE: Comment utils
    {
        "numToStr/Comment.nvim",
        keys = function()
            local api = require("Comment.api")
            local keys = { { "<leader>ccc", api.toggle.linewise.current, desc = "[C]urrent line" } }
            return keys
        end,
        opts = {
            -- add any options here
            --mappings.basi)c
        },
        lazy = false,
    },
}
