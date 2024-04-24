return {
    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    -- Welcome page
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
    -- Notifications and command line input
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
}
