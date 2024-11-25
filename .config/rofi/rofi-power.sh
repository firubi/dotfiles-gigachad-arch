#!/bin/bash

entries=" Lock\n⇠ Logout\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|rofi -dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  lock)
    exec hyprlock;;
  logout)
    hyprctl dispatch exit;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
