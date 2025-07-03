---@diagnostic disable: undefined-global, undefined-doc-name
return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
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
