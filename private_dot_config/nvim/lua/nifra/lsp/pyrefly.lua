vim.lsp.config("pyrefly", {
    cmd = { "pyrefly", "lsp" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "pyrefly.toml", ".git" },
    settings = {
        python = { pyrefly = { disableLanguageServices = true } },
    },
})
