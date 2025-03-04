#!/usr/bin/env bash

STATUS_PATH=".config/hypr/scripts/touchpad/touchpadStatus"
STATE=$(cat "$STATUS_PATH")

if [[ "$STATE" == "true" ]]; then
  hyprctl keyword '$touchpad_state' "true" -r
elif [[ "$STATE" == "false" ]]; then
  hyprctl keyword '$touchpad_state' "false" -r
fi
