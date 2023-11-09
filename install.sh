#!/usr/bin/env sh

# Get the current directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install alacritty configurations
rm -rf $HOME/.config/alacritty
ln -s $DIR/alacritty $HOME/.config/alacritty

# Install i3 configurations
rm -rf $HOME/.config/i3
ln -s $DIR/i3 $HOME/.config/i3

# Install picom configurations
rm -rf $HOME/.config/picom
ln -s $DIR/picom $HOME/.config/picom

# Install polybar configurations
rm -rf $HOME/.config/polybar
ln -s $DIR/polybar $HOME/.config/polybar

# Install rofi configurations
rm -rf $HOME/.config/rofi
ln -s $DIR/rofi $HOME/.config/rofi

# Install tmux
rm -rf $HOME/.config/tmux
ln -s $DIR/tmux $HOME/.config/tmux
