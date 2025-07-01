vim.lsp.config("harper", {
    cmd = { "harper-ls", "--stdio" },
    filetypes = { "lua", "text", "markdown", "python", "shellscript", "toml" },
})
