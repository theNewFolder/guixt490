#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars are in one config file and you want to launch them in this plasma,
# use
# polybar main

# Otherwise, you can launch bars this way too
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar main &

echo "Polybar launched..."
