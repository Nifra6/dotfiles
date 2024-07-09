return {
    -- NOTE: Auto completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "micangl/cmp-vimtex",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },
                -- NOTE: Keymaps
                mapping = cmp.mapping.preset.insert({
                    -- NOTE: Accept completion
                    ["²"] = cmp.mapping.confirm({ select = true }),
                    ["<Enter>"] = cmp.mapping.confirm({ select = true }),
                    -- NOTE: Scroll completion
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    -- NOTE: Abort completion
                    ["<C-Backspace>"] = cmp.mapping.abort(),
                    -- NOTE: Navigate snippet
                    --  If you have a snippet that's like:
                    --  function $name($args)
                    --    $body
                    --  end
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
                -- NOTE: Sources of information for cmp (need the plugins as dependencies)
                sources = {
                    { name = "nvim_lsp" }, -- LSP
                    { name = "luasnip" }, -- Snippets
                    { name = "path" }, -- Path
                    { name = "vimtex" }, -- Vimtex
                },
            })
        end,
    },
}
