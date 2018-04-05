#!/usr/bin/env sh
# set -x #echo on
echo "=== CONFIGURING I3 ==="
./i3/install.sh
echo "=== I3 DONE ==="
echo

echo "=== CONFIGURING POLYBAR ==="
./polybar/install.sh
echo "=== POLYBAR DONE ==="
echo
