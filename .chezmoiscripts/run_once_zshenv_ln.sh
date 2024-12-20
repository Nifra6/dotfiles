#!/bin/sh

TARGET="$HOME/.config/zsh/.zshenv"
LINK="$HOME/.zshenv"

ln -sf "$TARGET" "$LINK"

echo "Dotfiles: Symbolic link created: $LINK -> $TARGET"
