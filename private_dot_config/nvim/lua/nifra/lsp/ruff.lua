vim.lsp.config("ruff", {
    cmd = { "ruff", "server" }, -- Will use venv ruff first if available
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    capabilities = { offsetEncoding = { "utf-16" } },
    settings = {},
})
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            local caps = client.server_capabilities
            caps.definitionProvider = false
            caps.referencesProvider = false
            caps.renameProvider = false
            caps.hoverProvider = false
        end
    end,
    desc = "LSP: Disable hover capability from Ruff",
})
