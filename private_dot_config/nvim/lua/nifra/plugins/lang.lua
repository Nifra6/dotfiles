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
    },
    --[[ {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        event = "VeryLazy",
        ft = "python",
        keys = {
            { "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select [V]irtual environment", ft = "python" },
        },
    }, ]]
}
