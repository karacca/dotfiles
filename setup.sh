#!/bin/bash

create_symlink() {
    local src="$1"
    local dest="$2"

    if [[ "$src" != /* ]]; then
        src="$(pwd)/$src"
    fi

    if [ -L "$dest" ]; then
        if [ "$(readlink "$dest")" = "$src" ]; then
            echo "Symlink $dest already points to $src - skipping"
            return
        fi
        echo "Backing up existing $dest"
        mv "$dest" "${dest}.backup"
    elif [ -e "$dest" ]; then
        echo "Backing up existing $dest"
        mv "$dest" "${dest}.backup"
    fi

    echo "Creating symlink for $src"
    ln -s "$src" "$dest"
}

create_symlink "alacritty/alacritty.toml" "$HOME/.alacritty.toml"
create_symlink "alacritty/theme.toml" "$HOME/.alacritty-theme.toml"
create_symlink "homebrew/Brewfile" "$HOME/Brewfile"
create_symlink "editorconfig/.editorconfig" "$HOME/.editorconfig"