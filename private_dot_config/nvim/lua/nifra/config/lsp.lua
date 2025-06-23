-- NOTE: Lua: LuaLS
vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = {
                version = "LuaJIT",
            },
        },
    },
}

-- NOTE: Python: Ruff
vim.lsp.config("ruff", {
    cmd = { "ruff", "server" }, -- Will use venv ruff first if available
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    capabilities = { offsetEncoding = { "utf-16" } },
    settings = {},
})
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            local caps = client.server_capabilities
            caps.definitionProvider = false
            caps.referencesProvider = false
            caps.renameProvider = false
            caps.hoverProvider = false
        end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
})

-- NOTE: Python: Pyright
vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        pyright = {
            disableOrganizeImports = true
        },
        python = {
            analysis = {
                ignore = { "*" }
            },
        },
    },
})

-- INFO: TOML: Taplo
vim.lsp.config("taplo", {
    cmd = { "taplo", "lsp", "stdio" },
    filetypes = { "toml" }
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
vim.lsp.enable("luals")
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")
vim.lsp.enable("taplo")
