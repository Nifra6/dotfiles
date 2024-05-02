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
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
                theme = "doom",
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        { action = "Telescope find_files", desc = " Chercher un fichier", icon = "󰱼 ", key = "f" },
                        { action = "Telescope live_grep", desc = " Chercher un texte", icon = "󱎸 ", key = "t" },
                        { action = "Lazy", desc = " Ouvrir Lazy", icon = "󰒲 ", key = "l" },
                        { action = "Lazy update", desc = " Mettre à jour", icon = "󰚰 ", key = "u" },
                        {
                            action = "cd ~/.config/nvim | Telescope find_files",
                            desc = " Configurer Neovim",
                            icon = "󰒓 ",
                            key = "c",
                        },
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
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end
        end,
    },
    -- FIXME: Notifications and command line input
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
    },
    -- NOTE: Buffer tabs
    {
        "akinsho/bufferline.nvim",
        config = true,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                    },
                },
            },
        },
    },
    -- NOTE: Status line
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },
        opts = {
            options = {
                theme = "tokyonight",
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            extensions = { "lazy", "mason", "neo-tree", "trouble" },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { { "harpoon2", icon = "󱡅 " }, "branch" },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        path = 1,
                        symbols = { modified = "󰏫 ", readonly = "󰌾 ", newfile = "󰎔 ", unnamed = "󰡯 " },
                    },
                    "diff",
                    "diagnostics",
                },
                lualine_x = { "encoding", "fileformat", { "filetype", icon_only = true } },
                lualine_y = { "progress", "location" },
                lualine_z = { { "datetime", icon = "󰅐 ", style = "%H:%M" } },
            },
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
    -- NOTE: Diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>cd",
                function()
                    require("trouble").toggle("workspace_diagnostics")
                end,
                desc = "[D]iagnostics",
            },
        },
    },
    -- NOTE: Keymaps help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 200
        end,
        config = function()
            require("which-key").setup()
            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>g"] = { name = "[G]o to", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]ymbols", _ = "which_key_ignore" },
                ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
            })
        end,
    },
}
