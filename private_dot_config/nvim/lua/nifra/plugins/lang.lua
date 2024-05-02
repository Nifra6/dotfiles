return {
    -- NOTE: Markdown : preview in browser
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        keys = {
            {
                "<leader>cp",
                "<Cmd>MarkdownPreview<Enter>",
                desc = "[P]review in browser",
                ft = "markdown",
            },
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    -- NOTE: Markdown : show headlines directly in editor
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = { "markdown" },
        opts = {},
    },
}
