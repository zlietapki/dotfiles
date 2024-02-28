#!/usr/bin/env bash

ln -sf $PWD/.bashrc $HOME/.bashrc
ln -sf $PWD/.profile $HOME/.profile
ln -sf $PWD/.dircolors $HOME/.dircolors

# .config
mkdir -p ~/.config/bat
ln -sf $PWD/.config/bat/config $HOME/.config/bat/config

mkdir -p ~/.config/htop
ln -sf $PWD/.config/htop/htoprc $HOME/.config/htop/htoprc

mkdir -p ~/.config/imv
ln -sf $PWD/.config/imv/config $HOME/.config/imv/config

mkdir -p ~/.config/kitty
ln -sf $PWD/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $PWD/.config/kitty/theme.conf $HOME/.config/kitty/theme.conf

mkdir -p ~/.config/nnn
ln -sf $PWD/.config/nnn/fcolors.bash $HOME/.config/nnn/fcolors.bash
mkdir -p ~/.local/bin
ln -sf $PWD/.local/bin/nnn $HOME/.local/bin/nnn

ln -sf $PWD/.config/hypr $HOME/.config/hypr
