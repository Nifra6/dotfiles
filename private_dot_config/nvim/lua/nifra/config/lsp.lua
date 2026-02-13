-- NOTE: Load LSP list
local lsp_configs = {
    "bashls", -- Bash LSP
    "gitlab_ci_ls", -- GitLab CI plugin for yamlls
    -- "harper", -- English grammar checker
    -- "ltex", -- Grammar, style & spell checker
    "luals", -- Lua LSP
    "ruff", -- Python formatter + linter
    "tombi", -- TOML LSP
    "ty", -- Python type checker + LSP
    "yamlls", -- YAML LSP
}

-- NOTE: LSP configurations
for _, name in ipairs(lsp_configs) do
    require("nifra.lsp." .. name)
end

-- NOTE: LSP enabling
for _, name in ipairs(lsp_configs) do
    vim.lsp.enable(name)
end
