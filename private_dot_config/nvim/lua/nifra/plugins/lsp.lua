return {
    -- NOTE: LSP Configuration & Plugins
    {
        "neovim/nvim-lspconfig",
        event = { "BufNewFile", "BufReadPre" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim", opts = {} },
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            -- NOTE: Attach LSP to the buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc .. " (LSP)" })
                    end

                    -- NOTE: Go to ...
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("<leader>gd", require("telescope.builtin").lsp_definitions, "[D]efinition")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("<leader>gD", vim.lsp.buf.declaration, "[D]eclaration")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("<leader>gr", require("telescope.builtin").lsp_references, "[R]eferences")
                    map("<S-j>", require("telescope.builtin").lsp_references, "References")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>gi", require("telescope.builtin").lsp_implementations, "[I]mplementation")
                    map("<leader>gt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")

                    -- NOTE: Symbols
                    map("<leader>sr", vim.lsp.buf.rename, "[R]ename symbol")
                    map("<leader>sd", require("telescope.builtin").lsp_document_symbols, "[D]ocument Symbols")
                    map("<leader>sw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")

                    -- NOTE: Code actions
                    map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

                    -- NOTE: Documentation
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    -- NOTE: Highlight references of the word under your cursor
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        local highlight_augroup =
                            vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end

                    -- NOTE: Inlay hints
                    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            -- NOTE: Detach LSP from the buffer
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
                end,
            })

            -- NOTE: Extend NeoVim capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- NOTE: Enable language servers
            local servers = {
                lua_ls = { settings = { Lua = { completion = { callSnippet = "Replace" } } } },
                marksman = {},
                matlab_ls = {
                    settings = { matlab = { installPath = "$HOME/Applications/Matlab/" } },
                    single_file_support = true,
                },
                pyright = {
                    settings = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                -- Ignore all files for analysis to exclusively use Ruff for linting
                                ignore = { "*" },
                            },
                        },
                    },
                },
                ruff = {
                    on_attach = function(client, _)
                        if client.name == "ruff" then
                            -- Disable hover in favor of Pyright
                            client.server_capabilities.hoverProvider = false
                        end
                    end,
                },
                taplo = {},
            }

            -- NOTE: Install other tools (linters, formatters, ...)
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "beautysh", -- Used to format sh, bash
                "markdownlint", -- Used to lint Markdown
                "prettier", -- Used to format Markdown
                "shellcheck", -- Used to format sh, bash
                "stylua", -- Used to format Lua code
                "typos", -- Used to lint typos
            })

            require("mason").setup()
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            -- NOTE: Override explicitly set values
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
