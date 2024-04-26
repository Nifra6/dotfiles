return {

    -- NOTE: Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("tokyonight-night")
        end,
        opts = { transparent = true },
    },

    -- NOTE: Welcome page
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            local logo = [[
██████╗ ████████╗██╗    ██╗    ██╗    ██╗   ██╗███████╗███████╗    ██╗   ██╗██╗███╗   ███╗
██╔══██╗╚══██╔══╝██║    ██║    ██║    ██║   ██║██╔════╝██╔════╝    ██║   ██║██║████╗ ████║
██████╔╝   ██║   ██║ █╗ ██║    ██║    ██║   ██║███████╗█████╗      ██║   ██║██║██╔████╔██║
██╔══██╗   ██║   ██║███╗██║    ██║    ██║   ██║╚════██║██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝   ██║   ╚███╔███╔╝    ██║    ╚██████╔╝███████║███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝    ╚═╝    ╚══╝╚══╝     ╚═╝     ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                         erm actually it's neovim ... 🤓👆]]
            logo = string.rep("\n", 8) .. logo .. "\n\n"
            require("dashboard").setup({
                -- config
                theme = "doom",
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        { action = "Telescope find_files", desc = " Chercher un fichier", icon = "󰱼 ", key = "f" },
                        { action = "Telescope live_grep", desc = " Chercher un texte", icon = "󱎸 ", key = "g" },
                        { action = "Lazy", desc = " Ouvrir Lazy", icon = "󰒲 ", key = "l" },
                        { action = "Lazy update", desc = " Mettre à jour", icon = "󰚰 ", key = "u" },
                        { action = "qa", desc = " Quitter", icon = "󰈆 ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "NeoVim a chargé "
                                .. stats.loaded
                                .. " sur "
                                .. stats.count
                                .. " plugins en "
                                .. ms
                                .. " ms",
                            "👉👈 •⩊• 👉👈",
                        }
                    end,
                },
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- NOTE: Notifications and command line input
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "hrsh7th/nvim-cmp",
        },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
        keys = {
            { "<leader>n", "<Cmd>Noice<CR>", desc = "[N]otifications" },
        },
    },

    -- NOTE: Status line
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "tokyonight",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            extensions = { "neo-tree", "lazy" },
        },
    },

    -- NOTE: File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>t", "<Cmd>Neotree toggle<CR>", desc = "Neo[T]ree" },
        },
    },
    -- NOTE: Layout
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {

            left = {
                -- Neo-tree filesystem always takes half the screen height
                {
                    title = "Neo-Tree",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "filesystem"
                    end,
                    size = { height = 0.5 },
                },
                {
                    title = "Neo-Tree Git",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "git_status"
                    end,
                    pinned = true,
                    open = "Neotree position=right git_status",
                },
            },
        },
    },
    -- NOTE: Keymaps help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup()
            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>cc"] = { name = "[C]omment", _ = "which_key_ignore" },
                ["<leader>cs"] = { name = "[S]ymbols", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]iagnostic", _ = "which_key_ignore" },
                ["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
                ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
            })
        end,
    },
}
