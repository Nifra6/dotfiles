-- Syntax highlighting and parsing via Tree-sitter.

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                callback = function()
                    require("nvim-treesitter.parsers").kitty = {
                        install_info = {
                            url = "https://github.com/OXY2DEV/tree-sitter-kitty",
                        },
                    }
                end,
            })

            local parsers = {
                "bash",
                "bibtex",
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "hyprlang",
                "java",
                "javadoc",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "matlab",
                "python",
                "regex",
                "requirements",
                "ssh_config",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
                "kitty",
            }

            local installed = require("nvim-treesitter.config").get_installed()
            local to_install = vim.iter(parsers)
                :filter(function(p)
                    return not vim.tbl_contains(installed, p)
                end)
                :totable()

            if #to_install > 0 then
                require("nvim-treesitter").install(to_install)
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    -- Highlighting
                    pcall(vim.treesitter.start)
                    -- Indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
