#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-10'

wallpapersPath=~/personal/wallpapers

sel=$(ls $wallpapersPath | rofi \
    -dmenu \
    -theme ${dir}/${theme}.rasi
)

if [[ -z $sel ]]; then
    exit 0
fi

wll=$wallpapersPath/$sel

echo '$wllcache = '$wll > ~/.cache/wallpaper/wllcache.conf

# wal -i $wll

swww img $wll --transition-type none
wpg -s $wll
sleep 1
wpg -a $wll
cp ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/colors/colors-rofi.rasi
killall waybar
waybar
wal -aR

#Other apps
zathura-pywal
pywal-discord -t default
