#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../utils.sh

echo "Setting up directory..."
safe_mkdir $HOME/.config/scripts
echo "Coping files..."
cp $DIR/mouse.sh $HOME/.config/scripts/mouse.sh
cp $DIR/mouse-udev-receiver.sh $HOME/.config/scripts/mouse-udev-receiver.sh


DEPENDENCIES=('at' 'xorg-xinput')
AUR_DEPENDENCIES=()
install_dependencies ${DEPENDENCIES[@]} ${AUR_DEPENDENCIES[@]}

echo "Configuring mouse..."
sudo systemctl enable atd
sudo systemctl start atd
echo "ACTION==\"add\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"c52b\", RUN+=\"$HOME/.config/scripts/mouse-udev-receiver.sh\"" | sudo tee /etc/udev/rules.d/81-mx-master.rules
sudo udevadm control --reload
$HOME/.config/scripts/mouse.sh
