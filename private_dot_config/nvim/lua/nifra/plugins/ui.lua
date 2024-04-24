return {
    -- NOTE: Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- NOTE: Welcome page
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            local logo = [[
  ▄▄    ▄ ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ 
 █  █  █ █   █       █   ▄  █ █      █  █ █  █   █  █▄█  █
 █   █▄█ █   █    ▄▄▄█  █ █ █ █  ▄   █  █▄█  █   █       █
 █       █   █   █▄▄▄█   █▄▄█▄█ █▄█  █       █   █       █
 █  ▄    █   █    ▄▄▄█    ▄▄  █      █       █   █       █
 █ █ █   █   █   █   █   █  █ █  ▄   ██     ██   █ ██▄██ █
 █▄█  █▄▄█▄▄▄█▄▄▄█   █▄▄▄█  █▄█▄█ █▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█]]
            logo = string.rep("\n", 8) .. logo .. "\n\n"
            require("dashboard").setup({
                -- config
                theme = "doom",
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        { action = "Telescope find_files", desc = " Find File", icon = "󰱼 ", key = "f" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = "qa", desc = " Quit", icon = "󰈆 ", key = "q" },
                    },
                },
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    -- NOTE: Notifications and command line input
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {},
    },
    -- NOTE: Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = "tokyonight" } },
    },
}
