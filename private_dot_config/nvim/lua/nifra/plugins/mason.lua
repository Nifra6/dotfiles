return {
    -- INFO: LSPs and Linters Manager
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "󰄬",
                    package_pending = "󰓦",
                    package_uninstalled = "󰅖",
                },
            },
        },
    },
    -- INFO: Auto-install
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "bash-language-server",
                "harper-ls",
                "prettier",
                "latexindent",
                "ltex-ls-plus",
                "lua-language-server",
                "tombi",
                "ruff",
                "pyright",
                "markdownlint",
                "shellcheck",
                "shfmt",
                "stylua",
            },
            auto_update = true,
        },
    },
}
