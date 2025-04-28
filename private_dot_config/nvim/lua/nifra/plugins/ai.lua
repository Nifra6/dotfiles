return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            opts = {
                language = "French",
            },
            strategies = {
                chat = {
                    adapter = "ollama_felix",
                },
                inline = {
                    adapter = "ollama_felix",
                },
                cmd = {
                    adapter = "ollama_felix",
                },
            },
            adapters = {
                ollama_felix = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "INRIA - Felix",
                        env = {
                            url = "https://felix.loria.fr:11434",
                        },
                        headers = {
                            ["Content-Type"] = "application/json",
                            ["Authorization"] = "Bearer ${api_key}",
                        },
                        schema = { model = { default = "codestral:latest" } },
                        parameters = {
                            sync = true,
                        },
                    })
                end,
            },
        },
    },
}
