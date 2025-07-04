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
    },
    -- NOTE: Command line input and documentation borders
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = { enabled = true }, -- Noice floating window for commands
            presets = {
                bottom_search = false, -- Search same place than the command line
                command_palette = true, -- Command line at the top
                lsp_doc_border = true, -- Add border around documentation hover
            },
        },
    },
    -- NOTE: Buffer tabs
    {
        "akinsho/bufferline.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
        keys = {
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
