#!/usr/bin/env bash

WARN=75
HIGH=80
CRIT=85

last_level=0

while true; do
    TEMP=$(sensors | awk '/Package id 0:/ {gsub(/\+|°C/,"",$4); print int($4)}')

    if (( TEMP >= CRIT && last_level != 3 )); then
        notify-send -u critical "🔥 CPU" "Temperatura crítica: ${TEMP}°C, apagando..."
        last_level=3
        sleep 3 && systemctl poweroff

    elif (( TEMP >= HIGH && last_level != 2 )); then
        notify-send -u normal "⚠ CPU" "Temperatura alta: ${TEMP}°C"
        last_level=2

    elif (( TEMP >= WARN && last_level != 1 )); then
        notify-send "CPU" "Temperatura: ${TEMP}°C"
        last_level=1

    elif (( TEMP < WARN-5 )); then
        last_level=0
    fi

    sleep 2
done
