#!/usr/bin/env bash

STATUS_PATH=".config/hypr/scripts/touchpad/touchpadStatus"
STATE=$(cat "$STATUS_PATH")

if [[ "$STATE" == "true" ]]; then
  hyprctl keyword '$touchpad_state' "false" -r
  echo "false" > "$STATUS_PATH"
  notify-send -u normal "Disabling touchpad"
elif [[ "$STATE" == "false" ]]; then
  hyprctl keyword '$touchpad_state' "true" -r
  echo "true" > "$STATUS_PATH" 
  notify-send -u normal "Enabling touchpad"
fi
