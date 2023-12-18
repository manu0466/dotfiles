#!/usr/bin/env sh

# Get the current directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install() {
    echo "Installing $1"
    
    # Install dotfiles
    rm -rf $HOME/.config/$1
    ln -s $DIR/$1 $HOME/.config/$1
}

install alacritty
install i3
install picom
install polybar
install rofi
install tmux
