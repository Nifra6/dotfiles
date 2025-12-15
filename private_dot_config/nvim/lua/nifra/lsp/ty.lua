vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", ".git" },
    settings = {
        -- ty = { disableLanguageServices = true }, -- To use only as type checker
    },
})
