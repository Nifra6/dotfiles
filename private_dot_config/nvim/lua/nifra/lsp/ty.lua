vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ty.toml", ".git" },
    settings = {
        -- ty = { disableLanguageServices = true }, -- To use only as type checker
    },
})
