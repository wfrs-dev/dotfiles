#!/usr/bin/env sh
echo "" > ~/.cache/conky-status
exec conky -c ~/.config/conky/conky.lua > ~/.cache/conky-status 2> /dev/null
