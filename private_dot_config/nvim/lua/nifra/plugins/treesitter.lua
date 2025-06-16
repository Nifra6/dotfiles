return {
    -- NOTE: Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "git_config",
                "gitignore",
                "hyprlang",
                "java",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "matlab",
                "python",
                "requirements",
                "ssh_config",
                "toml",
                "typst",
                "vim",
                "vimdoc",
                "yaml",
                "zathurarc",
                "zig",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            })
        end,
    },
}
