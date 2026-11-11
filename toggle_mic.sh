#!/bin/bash

# 1. Toggle mute on EasyEffects virtual source and hardware Built-in Audio Pro (Node 60)
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
wpctl set-mute 60 toggle

# 2. Check if the default source is now muted
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
    # Turn LED ON (Muted)
    brightnessctl -d "platform::micmute" set 1 2>/dev/null || true
else
    # Turn LED OFF (Unmuted)
    brightnessctl -d "platform::micmute" set 0 2>/dev/null || true
fi