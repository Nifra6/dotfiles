#!/usr/bin/env bash

compl_dir="$HOME/.config/zsh/completions"
mkdir -p "$compl_dir"

declare -A cli=(
    [chezmoi]="chezmoi completion zsh"
    [pip]="pip completion --zsh"
    [prek]="prek util generate-shell-completion zsh"
    [ruff]="ruff generate-shell-completion zsh"
    [ty]="ty generate-shell-completion zsh"
    [uv]="uv generate-shell-completion zsh"
    [uvx]="uvx --generate-shell-completion zsh"
)

echo "Generates zsh completions"
for tool in "${!cli[@]}"; do
    cmd=${cli[$tool]}
    if command -v "$tool" >/dev/null; then
        if eval "$cmd" >"$compl_dir/_$tool.tmp"; then
            mv "$compl_dir/_$tool.tmp" "$compl_dir/_$tool"
            echo "󰏖 $tool"
        else
            rm -f "$compl_dir/_$tool.tmp"
            echo "󱧖 Completion for $tool have failed."
        fi
    else
        echo "󱧖 $tool is not available."
    fi
done

rm -f ~/.zcompdump*
