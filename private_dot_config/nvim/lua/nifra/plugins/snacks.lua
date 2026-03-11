-- UI enhancements: picker, dashboard, notifier, and more.
return {
    {
        "folke/snacks.nvim",
        priority = 900,
        lazy = false,
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
            explorer = { enabled = true },
            image = { enabled = false },
            indent = {
                enabled = true,
                indent = { char = "▍" },
                scope = { char = "▍", underline = true },
            },
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
                            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                            ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                            ["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        },
                    },
                },
            },
            terminal = {},
        },
        keys = {
            -- NOTE: Open terminal
            {
                "<leader>$",
                function()
                    Snacks.terminal()
                end,
                desc = "[T]erminal",
            },
            -- NOTE: File explorer
            {
                "<leader>e",
                function()
                    Snacks.explorer()
                end,
                desc = "[E]xplorer",
            },
            -- NOTE: Find ...
            {
                "<leader>fd",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "[D]iagnostics",
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
                "<leader>fh",
                function()
                    Snacks.picker.help()
                end,
                desc = "[H]elp Pages",
            },
            {
                "<leader>fk",
                function()
                    Snacks.picker.keymaps()
                end,
                desc = "[K]eymaps",
            },
            {
                "<leader>fs",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "[S]ymbols",
            },
            {
                "<leader>ft",
                function()
                    Snacks.picker.todo_comments()
                end,
                desc = "[T]odo",
            },
            {
                "<leader>fu",
                function()
                    Snacks.picker.undo()
                end,
                desc = "[U]ndo history",
            },
            -- NOTE: Open git repository
            {
                "<leader>gg",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "[G]it Repo",
                mode = { "n", "v" },
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
            --  NOTE: Lazygit
            {
                "<leader>lg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazy[G]it",
            },
            -- NOTE: Close buffer
            {
                "<leader>q",
                function()
                    Snacks.bufdelete()
                end,
                desc = "[Q]uit current buffer",
            },
        },
    },
}
