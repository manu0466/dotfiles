#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../utils.sh

echo "Setting up directory..."
safe_mkdir $HOME/.config/polybar
echo "Coping files..."
cp  $DIR/launch.sh $HOME/.config/polybar
cp  $DIR/config $HOME/.config/polybar


DEPENDENCIES=('noto-fonts' 'ttf-roboto' 'ttf-font-awesome' 'zvbi')
AUR_DEPENDENCIES=('ttf-unifont' 'nerd-fonts-jetbrains-mono' 'polybar')
install_dependencies ${DEPENDENCIES[@]} ${AUR_DEPENDENCIES[@]}

# ip link show | grep BROADCAST | cut -d":" -f2 | tr -d ' '
