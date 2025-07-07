vim.lsp.config("tombi", {
    cmd = { "tombi", "lsp" },
    filetypes = { "toml" },
    root_markers = { "tombi.toml", "pyproject.toml", ".git" },
})
