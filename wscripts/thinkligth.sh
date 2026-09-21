#!/usr/bin/env bash

THINKLIGHT="/sys/class/leds/tpacpi::thinklight/brightness"

current=$(cat "$THINKLIGHT")

if [ "$current" -eq 1 ]; then
    echo 0 | sudo tee "$THINKLIGHT" >/dev/null
else
    echo 1 | sudo tee "$THINKLIGHT" >/dev/null
fi
