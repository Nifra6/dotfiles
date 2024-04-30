return {
    -- FIXME: Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "0.1.x",
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
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require("telescope").setup({
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                -- defaults = {
                --   mappings = {
                --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                --   },
                -- },
                -- pickers = {}
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[H]elp" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[K]eymaps" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
            -- vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[S]elect Telescope" })
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[G]rep" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[D]iagnostics" })
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[R]esume" })
            vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

            -- Shortcut for searching your Neovim configuration files
            -- vim.keymap.set("n", "<leader>sn", function()
            --     builtin.find_files({ cwd = vim.fn.stdpath("config") })
            -- end, { desc = "[N]eovim files" })
        end,
    },
    -- NOTE: Harpoon files to have easy access
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
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
                {
                    "<leader>(",
                    function()
                        harpoon:list():select(5)
                    end,
                    desc = "Harpoon [5]",
                },
                {
                    "<leader>-",
                    function()
                        harpoon:list():select(6)
                    end,
                    desc = "Harpoon [6]",
                },
                {
                    "<leader>è",
                    function()
                        harpoon:list():select(7)
                    end,
                    desc = "Harpoon [7]",
                },
                {
                    "<leader>_",
                    function()
                        harpoon:list():select(8)
                    end,
                    desc = "Harpoon [8]",
                },
            }
            return keys
        end,
    },
}
