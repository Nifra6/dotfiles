return {
    -- NOTE: Auto format code
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = true,
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
            formatters_by_ft = {
                css = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                lua = { "stylua" },
                toml = { "taplo" },
                python = { "ruff_format" },
            },
        },
    },
}
