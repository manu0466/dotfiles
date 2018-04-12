#!/usr/bin/env sh

sleep 3;
export DISPLAY=":0.0"
export XAUTHORITY="/home/manu/.Xauthority"
MOUSE_ID=$(/usr/bin/xinput list | grep "Logitech MX Master" | cut -d '=' -f 2 | cut -d '[' -f 1 | sed -n 1p)
/usr/bin/xinput set-prop $MOUSE_ID 'Coordinate Transformation Matrix' 2.0 0.0 0.0 0.0 2.0 0.0 0.0 0.0 1.0
