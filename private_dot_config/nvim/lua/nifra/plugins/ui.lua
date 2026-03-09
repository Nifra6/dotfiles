local snacks_explorer = {
    sections = {
        lualine_a = {
            function()
                return "󰙅 File Explorer"
            end,
        },
    },
    filetypes = { "snacks_picker_list" },
}

return {
    -- NOTE: Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = true },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = { transparent_background = true },
    },
    -- NOTE: Keys screencaster
    { "nvzone/showkeys", cmd = "ShowkeysToggle" },
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
    -- NOTE: Keymaps reminders
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            delay = 1000,
            sort = { "alphanum", "group" },
            plugins = { spelling = { enabled = false } },
            spec = {
                { "<leader>b", icon = "󰜘 " },
                { "<leader>c", icon = "󰅴 ", group = "[C]ode" },
                { "<leader>ca", icon = "󱐋 " },
                { "<leader>cf", icon = "󰁨 " },
                { "<leader>e", icon = "󰙅 " },
                { "<leader>d", icon = " ", group = "[D]ebug" },
                { "<leader>db", icon = " " },
                { "<leader>dc", icon = " " },
                { "<leader>di", icon = "󰆹 " },
                { "<leader>do", icon = "󰆷 " },
                { "<leader>dO", icon = "󰆸 " },
                { "<leader>f", icon = "󰍉 ", group = "[F]ind" },
                { "<leader>fd", icon = "󰈸 " },
                { "<leader>ff", icon = "󰈔 " },
                { "<leader>fg", icon = "󰦨 " },
                { "<leader>fh", icon = "󰋖 " },
                { "<leader>fk", icon = "󰌌 " },
                { "<leader>fs", icon = " " },
                { "<leader>ft", icon = "󰄲 " },
                { "<leader>g", icon = "󱞫 ", group = "[G]o to" },
                { "<leader>gb", icon = "󱞡 " },
                { "<leader>gd", icon = " " },
                { "<leader>gG", icon = "󰊤 " },
                { "<leader>gr", icon = " " },
                { "<leader>h", icon = "󱡅 " },
                { "<leader>l", icon = "󰒲 ", group = "[L]azy" },
                { "<leader>lg", icon = "󰊢 " },
                { "<leader>lm", icon = "󰏓 " },
                { "<leader>m", icon = "󱡅 " },
                { "<leader>q", icon = " " },
                { "<leader>r", icon = "󰑕 " },
                { "<leader>t", icon = "󰈸 " },
                { "<leader>$", icon = " " },
                { "<leader>1", hidden = true },
                { "<leader>2", hidden = true },
                { "<leader>3", hidden = true },
                { "<leader>4", hidden = true },
                { "<leader>5", hidden = true },
                { "<leader>6", hidden = true },
                { "<leader>7", hidden = true },
                { "<leader>8", hidden = true },
                { "<leader>9", hidden = true },
            },
        },
    },
    -- NOTE: Buffer tabs
    {
        "akinsho/bufferline.nvim",
        event = { "BufNewFile", "BufReadPost" },
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/snacks.nvim" },
        keys = {
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        opts = {
            options = {
                close_command = function(n)
                    Snacks.bufdelete(n)
                end,
                right_mouse_command = function(n)
                    Snacks.bufdelete(n)
                end,
                left_mouse_command = "buffer %d",
                middle_mouse_command = "BufferLineTogglePin",
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "snacks_layout_box",
                        text = "󰙅 File Explorer",
                        separator = true,
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
                theme = "auto",
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            extensions = { "lazy", "mason", "neo-tree", "trouble", snacks_explorer },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { { "harpoon2", icon = "󱡅 " } },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        path = 1,
                        symbols = { modified = "󰏫 ", readonly = "󰌾 ", newfile = "󰎔 ", unnamed = "󰡯 " },
                    },
                    "diff",
                    { "diagnostics", symbols = { error = "󰅙 ", warn = "󱠇 ", info = "󰋼 ", hint = "󰸥 " } },
                },
                lualine_x = { "location", "progress" },
                lualine_y = { { "filetype", icon_only = true } },
                lualine_z = { "branch" },
            },
        },
    },
    -- NOTE: Diagnostics
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]rouble" },
            { "<leader>t", "<cmd>Trouble quickfix toggle<cr>", ft = { "bib", "tex" }, desc = "VimTeX [T]rouble" },
            { "<leader><c-t>", "<cmd>Trouble diagnostics toggle<cr>", ft = { "tex" }, desc = "LTeX [T]rouble" },
            { "<leader>t", "<cmd>Trouble toggle<cr>", ft = "trouble", desc = "[T]rouble" },
        },
        config = true,
    },
}
