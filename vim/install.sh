#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../utils.sh

echo "Setting up directory..."
safe_mkdir $HOME/.config/scripts
echo "Coping files..."
cp $DIR/vimrc $HOME/.vimrc

DEPENDENCIES=('vim')
AUR_DEPENDENCIES=('vim-plug')
install_dependencies ${DEPENDENCIES[@]} ${AUR_DEPENDENCIES[@]}

