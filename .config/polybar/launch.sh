#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch primary bar first so the tray attaches to the main monitor
MONITOR=DP-2 polybar --reload primary &
sleep 0.5
MONITOR=HDMI-0 polybar --reload secondary &