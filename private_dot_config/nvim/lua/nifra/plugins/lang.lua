return {
    -- NOTE: LaTeX : specialized plugin
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_format_enabled = 1
        end,
        keys = {
            {
                "<leader>cp",
                "<Cmd>VimtexCompile<Enter>",
                desc = "[P]rint the document",
                ft = "tex",
            },
        },
    },
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
    -- NOTE: Markdown : preview in vim
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- NOTE: Python : select virtual environment
    {
        "linux-cultist/venv-selector.nvim",
        branch = "regexp",
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
    -- NOTE: Quarto: official plugin
    {
        "quarto-dev/quarto-nvim",
        ft = "quarto",
        keys = {
            {
                "<leader>cp",
                "<Cmd>QuartoPreview<Enter>",
                desc = "[P]review in browser",
                ft = "quarto",
            },
        },
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- NOTE: Typst : preview in browser
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "0.3.*",
        keys = {
            {
                "<leader>cp",
                "<Cmd>TypstPreview<Enter>",
                desc = "[P]review in browser",
                ft = "typst",
            },
        },
        build = function()
            require("typst-preview").update()
        end,
    },
}
