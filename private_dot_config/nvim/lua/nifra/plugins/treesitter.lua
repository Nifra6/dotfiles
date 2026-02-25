-- NOTE: tree-sitter is horse shit, at least in terms of configuration in nvim

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.kitty = {
    install_info = {
        url = "https://github.com/OXY2DEV/tree-sitter-kitty",
        files = { "src/parser.c" },
        branch = "main",
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "master",
        main = "nvim-treesitter.configs",
        opts = {
            auto_install = false,
            ignore_install = { "latex" },
            ensure_installed = {
                "bash",
                "bibtex",
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "hyprlang",
                "java",
                "javadoc",
                "json",
                "kitty",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "matlab",
                "python",
                "regex",
                "requirements",
                "ssh_config",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
                "zathurarc",
                -- "zsh",
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
