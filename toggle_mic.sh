#!/bin/bash

# 1. Toggle the microphone mute state
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# 2. Query the new state (returns "Muted: yes" or "Muted: no")
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")

# 3. Synchronize the physical LED brightness state
if [ "$MUTED" = "MUTED" ]; then
    brightnessctl -d "platform::micmute" set 1
else
    brightnessctl -d "platform::micmute" set 0
fi
