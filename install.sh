#!/bin/sh
# Check if we're running in Bash, and switch if necessary
if [ -z "$BASH_VERSION" ]; then
    echo "Not in bash, switching to it.\n\n"
    exec bash "$0" "$@"
fi



DOTFILES_DIR=$(pwd)
dir_create_symlink() {
    # for .config directories
  local dir="$1"
  local dest="$2"

  echo "Creating symlink for $dir"
  if [ ! -d "$dest" ]; then
    mkdir -p "$dest"
  fi

  ln -sf "$DOTFILES_DIR/$dir" "$dest"
}

# symlinks for zsh and bash
DOTFILES=(.zshrc .bashrc)
for file in "${DOTFILES[@]}"; do
if [ ! $HOME/$file ]; then
  echo "Creating symlink for $file"
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"

else 
  echo "$file already exists"
fi
done

DOTFILE_DIRS=("nvim" "kitty")
for dir in "${DOTFILE_DIRS[@]}"; do
  dir_create_symlink "$dir" "$HOME/.config/$dir"
done
