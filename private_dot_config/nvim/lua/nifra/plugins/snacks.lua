---@diagnostic disable: undefined-global, undefined-doc-name
return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            lazygit = { enabled = true },
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
