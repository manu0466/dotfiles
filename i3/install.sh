#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../utils.sh

echo "Setting up directory..."
safe_mkdir $HOME/.i3
echo "Coping files..."
cp $DIR/config $HOME/.i3/
cp $DIR/wallpaper.jpg $HOME/.i3/

DEPENDENCIES=('network-manager-applet' 'nitrogen' 'pavucontrol', 'dunst')
AUR_DEPENDENCIES=('python-pywal' 'volctl' 'twmn-git')
install_dependencies ${DEPENDENCIES[@]} ${AUR_DEPENDENCIES[@]}

wal -i $HOME/.i3/wallpaper.jpg -n
# Seting up dunst
mkdir $HOME/.config/dunst
cp $DIR/dunstrc $HOME/.config/dunst/.
