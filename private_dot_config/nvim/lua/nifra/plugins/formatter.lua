return {
    -- NOTE: Auto format code
    {
        "stevearc/conform.nvim",
        event = { "BufNewFile", "BufReadPost" },
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
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                toml = { "taplo" },
                python = { "ruff_format" },
                markdown = { "prettier" },
            },
        },
    },
}
