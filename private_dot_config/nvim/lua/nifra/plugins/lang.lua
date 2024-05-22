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
    -- NOTE: Python : select virtual environment
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        ft = "python",
        opts = {
            dap_enabled = false,
            name = ".venv",
            parents = 0,
            anaconda_base_path = os.getenv("HOME") .. "/Applications/miniconda3",
            anaconda_envs_path = os.getenv("HOME") .. "/Applications/miniconda3/envs",
        },
        keys = {
            { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select [V]env" },
        },
    },
}
