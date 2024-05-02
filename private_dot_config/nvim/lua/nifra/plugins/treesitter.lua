return {
    -- NOTE: Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "git_config",
                "gitignore",
                "hyprlang",
                "lua",
                "markdown",
                "markdown_inline",
                "matlab",
                "python",
                "requirements",
                "ssh_config",
                "toml",
                "vim",
                "yaml",
                "zathurarc",
            },
            auto_install = false,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
