#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

(sleep 2; polybar example) &
#(sleep 2; polybar tray) &

for m in $( bspc query -M --names ); do
    index=$((index + 1))
    export P_BSPWM_WINDOW_CMD="tail ${HOME}/.cache/bspwm_windows_${index}.txt"

    MONITOR=$m polybar --reload right &
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload center &
done
