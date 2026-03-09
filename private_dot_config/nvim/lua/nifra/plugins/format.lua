-- Code formatting: per-filetype formatters, format-on-save.
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format()
                end,
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
            formatters_by_ft = {
                bash = { "shfmt" },
                bib = { "bibtex-tidy" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "ruff_organize_imports", "ruff_format" },
                sh = { "shfmt" },
                tex = { "latexindent" },
                toml = { "tombi" },
                yaml = { lsp_format = "prefer" },
            },
        },
    },
}
