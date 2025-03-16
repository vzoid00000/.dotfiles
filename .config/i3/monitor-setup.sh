#!/bin/bash

if xrandr | grep -q "HDMI-1 connected"; then
    xrandr --output HDMI-1 --primary --auto --output eDP-1 --off
else
    xrandr --output eDP-1 --primary --auto --output HDMI-1 --off
fi

