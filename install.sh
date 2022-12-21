DOTFILES_DIR=$(pwd)
# symlinks for zsh and bash
ZSH_FILE="$HOME/.zshrc"
BASH_FILE="$HOME/.bashrc"
if [ ! $ZSH_FILE ]; then
   echo "Creating symlink for zshrc"
   ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

if [ ! $BASH_FILE ]; then
   echo "Creating symlink for bashrc"
   ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
fi

# create symlinks for neovim
echo "Creating symlink for neovim"
NVIM_DIR="$HOME/.config/nvim"

if [ ! -d $NVIM_DIR ]; then
	mkdir $NVIM_DIR
fi

cd $NVIM_DIR 
cp -rsf "$DOTFILES_DIR/nvim/" ..
# create symlinks for Kitty
echo "Creating symlink for kitty"
KITTY_DIR="$HOME/.config/kitty"

if [ ! -d $KITTY_DIR ]; then
	mkdir $KITTY_DIR
fi

cd $KITTY_DIR 
cp -rsf "$DOTFILES_DIR/kitty/" ..
