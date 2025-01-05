#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/grayblocks"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q main -c "$DIR"/config.ini &
# polybar -q top -c "$DIR"/preview.ini &

if type "xrandr"; then
    MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
    # FISR_MONITOR=`$MONITORS | head -1`
    # echo "First $FISR_MONITOR"
    # echo "Monitors: /$MONITORS/"
    # if [[ $FISR_MONITOR != *"HDMI"* ]]; then
    #     echo "should reverse"
    #     MONITOR=$MONITORS | tac
    # fi
    echo $MONITORS
    for m in $MONITORS; do
        echo $m
 
        if [[ $m == *"HDMI"* ]]; then
            # Set DPI and height for any HDMI monitors
            MONITOR=$m POLYBAR_DPI=96 POLYBAR_HEIGHT=35 POLYBAR_TRAY_MAXSIZE=16 polybar -q top -c "$DIR"/preview.ini &
        else
            # Default settings for other monitors
            MONITOR=$m POLYBAR_DPI=144 POLYBAR_HEIGHT=45 POLYBAR_TRAY_MAXSIZE=23 polybar -q top -c "$DIR"/preview.ini &
        fi

        # MONITOR=$m POLYBAR_DPI=96 POLYBAR_HEIGHT=45 polybar -q top -c "$DIR"/preview.ini &
        sleep 0.5
    done
else
  polybar -q top -c "$DIR"/preview.ini &
fi
