#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../utils.sh

echo "Setting up directory..."
safe_mkdir $HOME/.i3
echo "Coping files..."
cp -r $DIR $HOME/.i3

DEPENDENCIES=()
AUR_DEPENDENCIES=('python-pywal')
install_dependencies ${DEPENDENCIES[@]} ${AUR_DEPENDENCIES[@]}

wal -i $HOME/.i3/wallpaper.jpg -n
