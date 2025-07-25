return {
    -- NOTE: Completions for neovim config editing
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        },
    },
    -- NOTE: Completions engine
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",
                ["<Enter>"] = { "accept", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
            sources = {
                default = { "lazydev", "omni", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
