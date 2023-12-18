#!/usr/bin/env bash

# Give some time to the monitor to start
sleep 2

# Kill current runnig bar
killall polybar

# Restart with the new config
~/.config/polybar/launch.sh

