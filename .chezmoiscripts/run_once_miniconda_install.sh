#!/bin/sh

MINICONDA_DIR="$HOME/Applications/miniconda3"

if [ ! -d "$MINICONDA_DIR" ]; then
    mkdir -p "$MINICONDA_DIR"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$MINICONDA_DIR"/miniconda.sh
    zsh "$MINICONDA_DIR"/miniconda.sh -b -u -p "$MINICONDA_DIR"
    rm "$MINICONDA_DIR"/miniconda.sh
    echo "Dotfiles: Miniconda installed at $MINICONDA_DIR"
fi
