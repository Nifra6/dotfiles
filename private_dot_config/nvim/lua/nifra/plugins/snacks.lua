---@diagnostic disable: undefined-global, undefined-doc-name
return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                width = 40,
                preset = {
                    keys = {
                        {
                            icon = "󰱼 ",
                            key = "f",
                            desc = "Find File",
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        {
                            icon = "󱎸 ",
                            key = "g",
                            desc = "Grep Text",
                            action = ":lua Snacks.dashboard.pick('live_grep')",
                        },
                        { icon = "󰒲 ", key = "l", desc = "Open Lazy", action = ":Lazy" },
                        { icon = "󰚰 ", key = "u", desc = "Update Plugins", action = ":Lazy update" },
                        {
                            icon = "󰒓 ",
                            key = "c",
                            desc = "Configure Vim",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        { icon = "󰈆 ", key = "q", desc = "Quit Vim", action = ":qa" },
                    },
                    header = [[
██████╗ ████████╗██╗    ██╗    ██╗    ██╗   ██╗███████╗███████╗    ██╗   ██╗██╗███╗   ███╗
██╔══██╗╚══██╔══╝██║    ██║    ██║    ██║   ██║██╔════╝██╔════╝    ██║   ██║██║████╗ ████║
██████╔╝   ██║   ██║ █╗ ██║    ██║    ██║   ██║███████╗█████╗      ██║   ██║██║██╔████╔██║
██╔══██╗   ██║   ██║███╗██║    ██║    ██║   ██║╚════██║██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝   ██║   ╚███╔███╔╝    ██║    ╚██████╔╝███████║███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝    ╚═╝    ╚══╝╚══╝     ╚═╝     ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                         erm actually it's neovim ... 🤓👆]],
                },
            },
            image = { enabled = false },
            input = { enabled = true },
            lazygit = { enabled = true }, -- Add lazygit to nvim
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = {
                enabled = true,
                win = {
                    input = {
                        keys = {
                            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                            ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                            ["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
        keys = {
            {
                "<leader>lg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Git Branches",
            },
            {
                "<leader>fk",
                function()
                    Snacks.picker.keymaps()
                end,
                desc = "[K]eymaps",
            },
            {
                "<leader>fh",
                function()
                    Snacks.picker.help()
                end,
                desc = "[H]elp Pages",
            },
            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "[F]iles",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "[G]rep files",
            },
            {
                "<leader>fd",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "[D]iagnostics",
            },
            {
                "<leader>fs",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "[S]ymbols",
            },
            -- NOTE: LSP - Go to...
            {
                "gd",
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = "[G]oto [D]efinition",
            },
            {
                "<leader>gd",
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = "[D]efinition",
            },
            {
                "gr",
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = "[G]oto [R]eferences",
            },
            {
                "<leader>gr",
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = "[R]eferences",
            },
            {
                "<leader>sd",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "[D]ocument Symbols",
            },
            {
                "<leader>sw",
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = "[W]orkspace Symbols",
            },
        },
    },
}
