#!/usr/bin/env bash

ln -sf $PWD/.bashrc $HOME/.bashrc
ln -sf $PWD/.profile $HOME/.profile
ln -sf $PWD/.dircolors $HOME/.dircolors

# bat
mkdir -p ~/.config/bat
ln -sf $PWD/.config/bat/config $HOME/.config/bat/config

# htop
mkdir -p ~/.config/htop
ln -sf $PWD/.config/htop/htoprc $HOME/.config/htop/htoprc

# imv
mkdir -p ~/.config/imv
ln -sf $PWD/.config/imv/config $HOME/.config/imv/config

# kitty
mkdir -p ~/.config/kitty
ln -sf $PWD/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $PWD/.config/kitty/theme.conf $HOME/.config/kitty/theme.conf

# nnn
mkdir -p ~/.config/nnn
ln -sf $PWD/.config/nnn/fcolors.bash $HOME/.config/nnn/fcolors.bash
mkdir -p ~/.local/bin
ln -sf $PWD/.local/bin/nnn $HOME/.local/bin/nnn

# hyprland
ln -sf $PWD/.config/hypr $HOME/.config/hypr

# oh-my-bash
rm -r $HOME/.oh-my-bash/custom/completions
ln -sf $PWD/.oh-my-bash/custom/completions $HOME/.oh-my-bash/custom/
