local lsp = vim.lsp

-- NOTE: LPS Configs
lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
        },
    },
}

lsp.config("ruff", {
    cmd = { "ruff", "server" }, -- Will use venv ruff first if available
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    settings = {},
})

-- NOTE: Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
        end

        -- NOTE: Go to ...
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("<leader>gd", require("telescope.builtin").lsp_definitions, "[D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("<leader>gr", require("telescope.builtin").lsp_references, "[R]eferences")

        -- NOTE: Symbols
        map("<leader>sr", vim.lsp.buf.rename, "[R]ename symbol")
        map("<leader>sd", require("telescope.builtin").lsp_document_symbols, "[D]ocument Symbols")
        map("<leader>sw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")

        -- NOTE: Code actions
        map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

        -- NOTE: Documentation
        map("K", vim.lsp.buf.hover, "Hover Documentation")
    end,
})

-- NOTE: LPS Executions
lsp.enable("luals")
lsp.enable("ruff")
