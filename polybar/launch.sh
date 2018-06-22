#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

s_dpi=$(xrdb -query | grep Xft.dpi | cut -d "	" -f 2)

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    DPI=$s_dpi MONITOR=$m polybar --reload top &
  done
else
  polybar --reload example &
fi

echo "Bars launched..."
echo "Dpi: $s_dpi"
