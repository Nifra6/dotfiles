return {
    -- NOTE: Auto pairs
    {
        "nvim-mini/mini.pairs",
        event = { "BufNewFile", "BufReadPost" },
        version = false,
        opts = {},
    },
    -- NOTE: Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            sign_priority = 8,
        },
    },
    -- NOTE: Highlight colors
    {
        "catgoose/nvim-colorizer.lua",
        event = { "BufNewFile", "BufReadPost" },
        opts = {
            lazy_load = true,
            options = { parsers = { css = true } },
        },
    },
    -- NOTE: Git indications
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufNewFile", "BufReadPost" },
        opts = {
            signcolumn = false,
            numhl = true,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 0,
                ignore_whitespace = true,
            },
        },
        keys = {
            {
                "<leader>b",
                function()
                    require("gitsigns").toggle_current_line_blame()
                end,
                desc = "[B]lame",
            },
        },
    },
    -- NOTE: Harpoon files to have easy access
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { settings = { save_on_toggle = true } },
        keys = function()
            local keys = {
                {
                    "<leader>h",
                    function()
                        require("harpoon"):list():add()
                    end,
                    desc = "[H]arpoon File",
                },
                {
                    "<leader>m",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon [M]enu",
                },
            }
            for i = 1, 9 do
                table.insert(keys, {
                    "<leader>" .. i,
                    function()
                        require("harpoon"):list():select(i)
                    end,
                    desc = "Harpoon [" .. i .. "]",
                })
            end
            return keys
        end,
    },
}
