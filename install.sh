#!/usr/bin/env sh

# Get the current directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install() {
    # Generic config path
    config_path=$DIR/$1
    
    # Get the host specific config path
    hostname=$(cat /etc/hostname)
    host_config_path=$DIR/$1-$hostname
    
    if [ -d $host_config_path ]; then
        echo "Installing $1 for $hostname"
        rm -rf $HOME/.config/$1
        ln -s $host_config_path $HOME/.config/$1
    elif [ -d $config_path ]; then
        echo "Installing $1"
        rm -rf $HOME/.config/$1
        ln -s $config_path $HOME/.config/$1
    else
        echo "Can't find $1 config dir"
    fi
}

install alacritty
install i3
install picom
install polybar
install rofi
install tmux
install wired
install autorandr
