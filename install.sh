#!/usr/bin/env bash

ln -sf $PWD/.bashrc $HOME/.bashrc
ln -sf $PWD/.profile $HOME/.profile
ln -sf $PWD/.dircolors $HOME/.dircolors

# anyrun
rm -r $HOME/.config/anyrun
ln -sf $PWD/.config/anyrun $HOME/.config/anyrun

# bat
rm -r $HOME/.config/bat
ln -sf $PWD/.config/bat $HOME/.config/bat

# htop
rm -r $HOME/.config/htop
ln -sf $PWD/.config/htop $HOME/.config/htop

# imv
rm -r $HOME/.config/imv
ln -sf $PWD/.config/imv $HOME/.config/imv

# kitty
rm -r $HOME/.config/kitty
ln -sf $PWD/.config/kitty $HOME/.config/kitty

# nnn
rm -r $HOME/.config/nnn
ln -sf $PWD/.config/nnn $HOME/.config/nnn

mkdir -p ~/.local/bin
ln -sf $PWD/.local/bin/nnn $HOME/.local/bin/nnn

# hyprland
rm -r $HOME/.config/hypr
ln -sf $PWD/.config/hypr $HOME/.config/hypr

# oh-my-bash
ln -sf $PWD/.oh-my-bash/custom/completions/* $HOME/.oh-my-bash/custom/completions/

# lsd
rm -r $HOME/.config/lsd
ln -sf $PWD/.config/lsd $HOME/.config/lsd

# waybar
rm -r $HOME/.config/waybar
ln -sf $PWD/.config/waybar $HOME/.config/waybar

# git
ln -sf $PWD/.gitconfig $HOME/.gitconfig

# wlogout
rm -r $HOME/.config/wlogout
ln -sf $PWD/.config/wlogout $HOME/.config/wlogout
