#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
MONITOR=$MAINMON polybar -c $HOME/.config/polybar/i3 main &
MONITOR=$SECMON polybar -c $HOME/.config/polybar/i3 secondary
