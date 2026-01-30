#!/bin/bash

# HDR-Toggle: A simple script to enable HDR for KDE Plasma 6 Wayland
# Written for use with an LG C3 48" monitor and an AMD RX9060XT.
# Should work for similar high-end setups.
# Created by Dimi D. Delta

# Auto-detect your HDMI port
OUTPUT=$(kscreen-doctor -o | grep "Output: " | cut -d' ' -f2 | head -n 1)
FLAG="/tmp/hdr_is_on"

if [ ! -f "$FLAG" ]; then
    # If the flag doesn't exist, turn HDR ON
    kscreen-doctor output.HDMI-A-1.hdr.enable output.HDMI-A-1.wcg.enable
    touch "$FLAG"
    notify-send "HDR" "ENABLED on $OUTPUT" -i video-display
else
    # If the flag exists, turn HDR OFF
    kscreen-doctor output.HDMI-A-1.hdr.disable output.HDMI-A-1.wcg.disable
    rm "$FLAG"
    notify-send "HDR" "DISABLED (SDR Mode)" -i video-display
fi
