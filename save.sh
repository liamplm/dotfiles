#!/bin/bash

set -eu

# i3
cp -r /usr/share/regolith/i3 .

# NVim Custom configs
cp -r ~/.config/nvim/lua/custom/* nvim/lua/custom/
# diff -r ~/.config/nvim nvim

# Polybar
cp -r ~/.config/polybar/grayblocks/* polybar/

# Gnome terminals
dconf dump /org/gnome/terminal/legacy/profiles:/ > all-gnome-terminal-profiles.dconf
dconf dump /org/gnome/terminal/legacy/profiles:/:ec9cfc03-11da-4c9f-9b29-263a2f4733e9/ > gnome-terminal-profile.dconf

# TMux
cp ~/.tmux.conf .

# ZSH
cp ~/.zshrc .

# Dunst
cp ~/.config/dunst/dunstrc .
