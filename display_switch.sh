#!/bin/bash

# Target your existing layout file
LAYOUT_FILE="$HOME/.config/hypr/conf/monitors.conf"
STATE_FILE="/tmp/hypr_display_state"

# 1. Dynamically get monitors
# INTERNAL is always the first monitor
INTERNAL=$(hyprctl monitors all | grep "Monitor" | awk '{print $2}' | sed -n '1p')
# EXTERNAL is the second monitor, but ONLY if it's connected (status: yes)
EXTERNAL=$(hyprctl monitors all | grep "Monitor" | awk '{print $2}' | sed -n '2p')
# EXIT SILENTLY if no external monitor is connected
if [ -z "$EXTERNAL" ]; then
    exit 0
fi

# 2. Dynamically calculate internal display width to prevent 0x0 coordinate overlaps
WIDTH=$(hyprctl monitors all -j | jq -r ".[] | select(.name==\"$INTERNAL\") | .width")
# Fallback to standard 1920 width if JSON parse fails
[ -z "$WIDTH" ] || [ "$WIDTH" == "null" ] && WIDTH=1920

# 3. GRANULAR STEP-SCALING: Look up the precise pixel width of the TV/Monitor
EXT_WIDTH=$(hyprctl monitors all -j | jq -r ".[] | select(.name==\"$EXTERNAL\") | .width" 2>/dev/null)
if [ -z "$EXT_WIDTH" ] || [ "$EXT_WIDTH" == "null" ] || [ "$EXT_WIDTH" == "" ]; then
    EXT_WIDTH=$(hyprctl monitors all | grep -A 2 "$EXTERNAL" | grep -oE '[0-9]+x[0-9]+' | head -n 1 | cut -dx -f1)
fi

# Apply the fine-grained scaling layout blocks based on screen widths
SCALE=1
if [ ! -z "$EXT_WIDTH" ] && [ "$EXT_WIDTH" -gt 3200 ]; then
    SCALE=2        # 4K Ultra-HD Screen -> 200% Scale
elif [ ! -z "$EXT_WIDTH" ] && [ "$EXT_WIDTH" -gt 2560 ]; then
    SCALE=1.75     # Sub-4K / Wide Panels -> 175% Scale
elif [ ! -z "$EXT_WIDTH" ] && [ "$EXT_WIDTH" -gt 2160 ]; then
    SCALE=1.5      # Standard 1440p / 2K Display -> 150% Scale
elif [ ! -z "$EXT_WIDTH" ] && [ "$EXT_WIDTH" -gt 1920 ]; then
    SCALE=1.25     # High-Density FHD+ Screen -> 125% Scale
else
    SCALE=1        # Standard 1080p Screen -> 100% Scale
fi

# Initialize state tracker if it doesn't exist
[ ! -f "$STATE_FILE" ] && echo "0" > "$STATE_FILE"
STATE=$(cat "$STATE_FILE")

case $STATE in
    0)
        # MODE 1: EXTEND (Forces highest refresh rate for laptop, highest resolution/refresh for TV)
        echo "monitor=$INTERNAL,highrr,0x0,1" > "$LAYOUT_FILE"
        echo "monitor=$EXTERNAL,highres,${WIDTH}x0,$SCALE" >> "$LAYOUT_FILE"
        
        hyprctl reload
        
        for i in {1..5}; do hyprctl dispatch moveworkspacetomonitor "$i" "$INTERNAL"; done
        for i in {6..10}; do hyprctl dispatch moveworkspacetomonitor "$i" "$EXTERNAL"; done
        
        notify-send "Display Mode" "Extended Desktop to TV (Scale: ${SCALE}x)" -i display
        echo "1" > "$STATE_FILE"
        ;;
    1)
        # MODE 2: DUPLICATE / MIRROR (TV matches laptop)
        echo "monitor=$INTERNAL,highrr,0x0,1" > "$LAYOUT_FILE"
        echo "monitor=$EXTERNAL,highres,auto,1,mirror,$INTERNAL" >> "$LAYOUT_FILE"
        
        hyprctl reload
        
        for i in {1..10}; do hyprctl dispatch moveworkspacetomonitor "$i" "$INTERNAL"; done
        
        notify-send "Display Mode" "Mirrored to TV Screen" -i display
        echo "2" > "$STATE_FILE"
        ;;
    2)
        # MODE 3: LAPTOP ONLY (TV off)
        echo "monitor=$INTERNAL,highrr,0x0,1" > "$LAYOUT_FILE"
        echo "monitor=$EXTERNAL,disable" >> "$LAYOUT_FILE"
        
        hyprctl reload
        
        for i in {1..10}; do hyprctl dispatch moveworkspacetomonitor "$i" "$INTERNAL"; done
        hyprctl dispatch workspace 1
        
        notify-send "Display Mode" "Laptop Display Only" -i display
        echo "3" > "$STATE_FILE"
        ;;
    3)
        # MODE 4: TV ONLY (Laptop off, TV running at max native capability)
        echo "monitor=$INTERNAL,disable" > "$LAYOUT_FILE"
        echo "monitor=$EXTERNAL,highres,0x0,$SCALE" >> "$LAYOUT_FILE"
        
        hyprctl reload
        
        for i in {1..10}; do hyprctl dispatch moveworkspacetomonitor "$i" "$EXTERNAL"; done
        hyprctl dispatch workspace 6
        
        notify-send "Display Mode" "TV Only Mode (Scale: ${SCALE}x)" -i display
        echo "0" > "$STATE_FILE"
        ;;
esac
