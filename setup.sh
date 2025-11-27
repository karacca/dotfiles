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
create_symlink "cursor/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
create_symlink "cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
create_symlink "editorconfig/.editorconfig" "$HOME/.editorconfig"
create_symlink "git/.gitconfig" "$HOME/.gitconfig"
create_symlink "git/.gitignore" "$HOME/.gitignore"
create_symlink "homebrew/Brewfile" "$HOME/Brewfile"
create_symlink "zsh/.zshrc" "$HOME/.zshrc"

git config --global core.excludesfile ~/.gitignore

if [ ! -f "$HOME/.hushlogin" ]; then
  touch "$HOME/.hushlogin"
fi
