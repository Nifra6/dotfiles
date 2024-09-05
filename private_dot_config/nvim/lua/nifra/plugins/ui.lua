return {
    -- NOTE: Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("tokyonight-moon")
        end,
        opts = { transparent = true },
    },
    -- NOTE: Nicer help
    {
        "OXY2DEV/helpview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- NOTE: Welcome page
    {
        "nvimdev/dashboard-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = {
                        [[]],
                        [[]],
                        [[]],
                        [[]],
                        [[]],
                        [[]],
                        [[]],
                        [[]],
                        [[██████╗ ████████╗██╗    ██╗    ██╗    ██╗   ██╗███████╗███████╗    ██╗   ██╗██╗███╗   ███╗]],
                        [[██╔══██╗╚══██╔══╝██║    ██║    ██║    ██║   ██║██╔════╝██╔════╝    ██║   ██║██║████╗ ████║]],
                        [[██████╔╝   ██║   ██║ █╗ ██║    ██║    ██║   ██║███████╗█████╗      ██║   ██║██║██╔████╔██║]],
                        [[██╔══██╗   ██║   ██║███╗██║    ██║    ██║   ██║╚════██║██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║]],
                        [[██████╔╝   ██║   ╚███╔███╔╝    ██║    ╚██████╔╝███████║███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║]],
                        [[╚═════╝    ╚═╝    ╚══╝╚══╝     ╚═╝     ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                        [[                                                         erm actually it's neovim ... 🤓👆]],
                        [[]],
                        [[]],
                    },
                    center = {
                        { action = "Telescope find_files", desc = " Find File", icon = "󰱼 ", key = "f" },
                        { action = "Telescope live_grep", desc = " Grep Text", icon = "󱎸 ", key = "g" },
                        { action = "Lazy", desc = " Open Lazy", icon = "󰒲 ", key = "l" },
                        { action = "Lazy update", desc = " Update Plugins", icon = "󰚰 ", key = "u" },
                        {
                            action = "cd ~/.config/nvim | Telescope find_files",
                            desc = " Configure Vim",
                            icon = "󰒓 ",
                            key = "c",
                        },
                        { action = "qa", desc = " Quit Vim", icon = "󰈆 ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        local status = require("lazy.status")
                        local updates = status.has_updates()
                                and "There is " .. status.updates() .. " updates availables"
                            or ""
                        return {
                            "",
                            "Lazy.nvim loaded "
                                .. stats.loaded
                                .. " out of "
                                .. stats.count
                                .. " plugins in "
                                .. ms
                                .. " ms",
                            "👉👈",
                            updates, -- FIXME: Don't work yet because ... check happen after VimEnter ?
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
    -- NOTE: Notifications and command line input
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
    },
    -- NOTE: Buffer tabs
    {
        "akinsho/bufferline.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle [P]in" },
            { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete [O]ther Buffers" },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the [R]ight" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the [L]eft" },
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        opts = {
            options = {
                close_command = function(n)
                    require("mini.bufremove").delete(n, false)
                end,
                right_mouse_command = function(n)
                    require("mini.bufremove").delete(n, false)
                end,
                left_mouse_command = "buffer %d",
                middle_mouse_command = "BufferLineTogglePin",
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                    },
                },
                separator_style = "slope",
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
            vim.api.nvim_create_autocmd("BufAdd", {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
    -- NOTE: Status line
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },
        opts = {
            options = {
                theme = "tokyonight-moon",
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
    -- NOTE: Diagnostics
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = { { "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", desc = "[D]iagnostics" } },
        config = true,
    },
    -- NOTE: Keymaps help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 200
        end,
        opts = {
            spec = {
                { "<leader>b", group = "[B]uffers", icon = "󰓩 " },
                { "<leader>b_", hidden = true },
                { "<leader>c", group = "[C]ode", icon = " " },
                { "<leader>c_", hidden = true },
                { "<leader>f", group = "[F]ind", icon = "󱁴 " },
                { "<leader>f_", hidden = true },
                { "<leader>g", group = "[G]o to", icon = "󰁔 " },
                { "<leader>g_", hidden = true },
                { "<leader>l", group = "[L]azy", icon = " " },
                { "<leader>l_", hidden = true },
                { "<leader>s", group = "[S]ymbols", icon = " " },
                { "<leader>s_", hidden = true },
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
}
