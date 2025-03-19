#!/bin/sh

# Set wallpaper for Hyprland
set_wallpaper_hyprland() {
    dir="${HOME}/.local/share/walls"
    BG="$(find "$dir" -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.webp' | shuf -n1)"
    PROGRAM="swww-daemon"
    trans_type="simple"

    if pgrep "$PROGRAM" >/dev/null; then
        swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
    else
        swww-daemon && swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
    fi
}
    set_wallpaper_hyprland

