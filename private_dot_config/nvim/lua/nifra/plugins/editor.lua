return {
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
    -- NOTE: Highlight colors
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            user_default_options = { rgb_fn = true },
        },
    },
    -- NOTE: Git indications
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufNewFile", "BufReadPre" },
        opts = { signcolumn = false, numhl = true },
    },
    -- NOTE: Comment and uncomment
    {
        "numToStr/Comment.nvim",
        event = { "BufNewFile", "BufReadPost" },
        opts = {
            mappings = {
                basic = true,
                extra = false,
            },
            opleader = { line = "<Leader>cc", block = "<Leader>cb" },
            toggler = { line = "<Leader>cc" },
        },
    },
    -- NOTE: Refactor code
    {
        "ThePrimeagen/refactoring.nvim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        opts = { show_success_message = true },
        keys = {
            { "<leader>r", "", desc = "[R]efactor", mode = { "n", "x" } },
            {
                "<leader>rr",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = { "n", "x" },
                desc = "Select [R]efactor",
                { expr = true },
            },
            {
                "<leader>ri",
                function()
                    require("refactoring").refactor("Inline Variable")
                end,
                mode = { "n", "x" },
                desc = "[I]nline Variable",
                { expr = true },
            },
            {
                "<leader>rI",
                function()
                    require("refactoring").refactor("Inline Function")
                end,
                mode = { "n", "x" },
                desc = "[I]nline Function",
                { expr = true },
            },
            {
                "<leader>rb",
                function()
                    require("refactoring").refactor("Extract Block")
                end,
                mode = { "n", "x" },
                desc = "Extract [B]lock",
                { expr = true },
            },
            {
                "<leader>rB",
                function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                mode = { "n", "x" },
                desc = "Extract [B]lock to File",
                { expr = true },
            },
            {
                "<leader>rf",
                function()
                    require("refactoring").refactor("Extract Function")
                end,
                mode = { "n", "x" },
                desc = "Extract [F]unction",
                { expr = true },
            },
            {
                "<leader>rF",
                function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                mode = { "n", "x" },
                desc = "Extract [F]unction To File",
                { expr = true },
            },
            {
                "<leader>rv",
                function()
                    require("refactoring").refactor("Extract Variable")
                end,
                mode = { "n", "x" },
                desc = "Extract [V]ariable",
                { expr = true },
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
    -- NOTE: Auto pairs
    {
        "echasnovski/mini.pairs",
        config = true,
        event = { "BufNewFile", "BufReadPost" },
        version = false,
        opts = {
            mappings = {
                ["("] = { neigh_pattern = "[^\\]%W" },
                ["["] = { neigh_pattern = "[^\\]%W" },
                ["{"] = { neigh_pattern = "[^\\]%W" },
                ['"'] = { neigh_pattern = "[^\\]%W" },
            },
        },
    },
}
