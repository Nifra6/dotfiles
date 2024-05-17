return {
    -- NOTE: Show indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "3.5.4", -- FIX: 3.6.0 broken
        main = "ibl",
        event = { "BufNewFile", "BufReadPre" },
        opts = {
            indent = { char = "▍" },
            scope = {
                enabled = true,
            },
            viewport_buffer = { min = 100 },
        },
    },
    -- NOTE: Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = { "BufNewFile", "BufReadPre" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            sign_priority = 8,
        },
    },
    -- NOTE: Git indications
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufNewFile", "BufReadPre" },
        opts = {
            signs = {
                add = { text = "▍" },
                change = { text = "▍" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▍" },
                untracked = { text = "▍" },
            },
        },
    },
    -- NOTE: Comment and uncomment
    {
        "numToStr/Comment.nvim",
        event = { "BufNewFile", "BufReadPost" },
        opts = {
            opleader = { line = "<Leader>cc", block = "<Leader>cb" },
            toggler = { line = "<Leader>ccc", block = "<Leader>cbc" },
        },
    },
    -- NOTE: Harpoon files to have easy access
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { settings = { save_on_toggle = true } },
        keys = function()
            local harpoon = require("harpoon")
            local keys = {
                {
                    "<leader>h",
                    function()
                        harpoon:list():add()
                    end,
                    desc = "[H]arpoon File",
                },
                {
                    "<leader>m",
                    function()
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon [M]enu",
                },
                {
                    "<leader>&",
                    function()
                        harpoon:list():select(1)
                    end,
                    desc = "Harpoon [1]",
                },
                {
                    "<leader>é",
                    function()
                        harpoon:list():select(2)
                    end,
                    desc = "Harpoon [2]",
                },
                {
                    '<leader>"',
                    function()
                        harpoon:list():select(3)
                    end,
                    desc = "Harpoon [3]",
                },
                {
                    "<leader>'",
                    function()
                        harpoon:list():select(4)
                    end,
                    desc = "Harpoon [4]",
                },
            }
            return keys
        end,
    },
}
