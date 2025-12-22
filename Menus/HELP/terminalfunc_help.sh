#!/bin/bash

# =============================================================================
# Authors:      Roman Garcia Guill
# Contact:      romangarciaguill@gmail.com
# Created:      Fri 21 Nov 2025
# 
# Purpose:      Show terminal functionalities cheatsheet via dmenu.
# =============================================================================

# Declare associative array: KEYBIND → DESCRIPTION
declare -A ScriptMap=(
    ["fastfetch"]="prints the computer specifications"
    ["astroterm"]="prints the real-time constellations"
    ["pokeget"]="print a pokemon"
    ["crontab -e"]="goes to the cron configuration file"
    ["curl wttr.in"]="shows the weather report (see output customization)"
    ["ollama run"]="coder - guru - nuclear"
)

# Build list for dmenu: "KEY  →  DESCRIPTION"
Choices=""
for Key in "${!ScriptMap[@]}"; do
    Choices+="$Key  ==>  ${ScriptMap[$Key]}\n"
done

Choice=$(printf "%b" "$Choices" | dmenu -c -l 50 -i -p "Terminal: Commands")

exit 0

