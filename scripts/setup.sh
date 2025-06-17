#!/bin/bash

sudo pacman -Syu

cd libs/
sudo pacman -S --needed $(cat hyprland.txt)
sudo pacman -S --needed $(cat utils.txt)
sudo pacman -S --needed $(cat audio.txt)
sudo pacman -S --needed $(cat fonts.txt)
sudo pacman -S --needed $(cat drivers.txt)

cd /opt
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

cd ~/scripts/libs
yay -S --needed $(cat yay.txt)
 
alias ls='exa --icons --color=auto'
