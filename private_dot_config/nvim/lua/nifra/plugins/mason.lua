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
            auto_update = true,
            ensure_installed = {
                "bash-language-server", -- Bash LSP
                "bibtex-tidy", -- BibTeX formatter
                "gitlab-ci-ls", -- Gitlab CI LSP
                -- "harper-ls", -- English grammar checker
                "latexindent", -- LaTeX formatter
                "lua-language-server", -- Lua LSP
                "prettier", -- Many languages formatter
                "ruff", -- Python formatter + linter
                "shellcheck", -- Bash linter
                "shfmt", -- Bash formatter
                "stylua", -- Lua formatter
                "tombi", -- TOML LSP
                "ty", -- Python type checker + LSP
                "yaml-language-server", -- YAML LSP
            },
        },
    },
}
