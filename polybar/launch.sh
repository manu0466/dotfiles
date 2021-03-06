#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

s_dpi=$(xrdb -query | grep Xft.dpi | cut -d "	" -f 2)

if [[ $s_dpi ]]; then
    echo "Xft.dpi Founded in xrdb: $s_dpi"
else
    echo "Xft.dpi value not found in xrbd using fallback value 96"
    s_dpi=96
fi

if type "xrandr"; then
  primary=$(xrandr --query | grep "primary" | cut -d" " -f1)
  #primary="DP-1"
  #primary="eDP-1"
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    bar="none"
    if [ "$m" == "$primary" ]; then
      bar="main"
    else
      bar="secondary"
    fi
    HOME=$HOME DPI=$s_dpi MONITOR=$m polybar --reload $bar -c $HOME/.config/polybar/bars.conf &
  done
else
  polybar --reload example &
fi

echo "Bars launched..."
echo "Dpi: $s_dpi"
