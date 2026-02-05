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
        keys = {
            { "<leader>lm", "<cmd>Mason<cr>", desc = "[M]ason" },
        },
    },
    -- INFO: Auto-install
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "bash-language-server", -- bash lsp
                "bibtex-tidy", -- BibTeX formatter
                "gitlab-ci-ls", -- Gitlab CI lsp, works with yaml-ls
                -- "harper-ls", -- English grammar checker
                "prettier",
                "latexindent",
                "ltex-ls-plus",
                "lua-language-server",
                "tombi", -- TOML lsp
                "ruff", -- Python linting/formatting lsp
                "ty", -- Python type-checker lsp
                "shellcheck", -- Used by bash-ls for linting
                "shfmt", -- Used by bash-ls for formatting
                "stylua",
                "yaml-language-server", -- YAML lsp
            },
            auto_update = true,
        },
    },
}
