-- Autocompletion: LSP, snippets, and plugin sources.
return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ["<Enter>"] = { "accept", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            completion = {
                trigger = { show_in_snippet = false },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    python = { "lsp", "snippets" },
                    tex = { "omni", "snippets" }, -- VimTeX completion is in omni
                    lua = { inherit_defaults = true, "lazydev" },
                },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
        },
    },
}
