#!/bin/bash

###
### pacman
###

# Update system and package databases
sudo pacman -Syu

# Terminal utilities
sudo pacman -S --needed alacritty ttf-hack-nerd zsh btop
yay -S --needed neovim-git

# Desktop
sudo pacman -S --needed hyprland hyprpaper waybar swaync

# Programs
sudo pacman -S --needed thunar fuzzel grimblast

# Audio tools
sudo pacman -S --needed easyeffects # https://forum.manjaro.org/t/how-to-make-linux-sound-great/146143

###
### zsh plugins
###

# Oh-My-Zsh installation and plugin setup
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh custom plugins directory
ZSH_CUSTOM="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"

# Install Zsh plugins
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM}/plugins/zsh-autocomplete
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM}/plugins/zsh-bat

# Reload Zsh configuration
echo "Reloading Zsh..."
source ~/.zshrc
echo "Setup complete! Restart your terminal to ensure everything is loaded."
