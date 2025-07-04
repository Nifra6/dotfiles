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
                        { icon = "󰱼 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                        { icon = "󱎸 ", key = "g", desc = "Grep Text", action = ":Telescope live_grep" },
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
            input = { enabled = true },
            lazygit = { enabled = true }, -- Add lazygit to nvim
            notifier = {
                enabled = true,
                timeout = 3000,
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
        },
    },
}
