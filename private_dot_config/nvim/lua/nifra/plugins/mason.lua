-- LSP/linter/formatter installer.
return {
    -- INFO: LSPs and Formatters Manager
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
    -- INFO: Auto-install of tools
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        opts = {
            auto_update = true,
            ensure_installed = {
                "bash-language-server", -- Bash LSP
                "bibtex-tidy", -- BibTeX formatter
                "debugpy", -- Python DAP
                "gitlab-ci-ls", -- Gitlab CI LSP
                -- "harper-ls", -- English grammar checker
                "latexindent", -- LaTeX formatter
                "ltex-ls-plus", -- Grammar, style & spell checker
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
