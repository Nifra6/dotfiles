return {
    -- NOTE: Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- TODO: Check `:help telescope.setup()`
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- NOTE: Enable Telescope extensions
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            -- NOTE: Keymaps
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[H]elp" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[K]eymaps" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[T]ext" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[D]iagnostics" })
        end,
    },
}
