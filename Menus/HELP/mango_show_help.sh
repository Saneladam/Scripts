#!/bin/bash

# =============================================================================
# Authors:      Roman Garcia Guill
# Contact:      romangarciaguill@gmail.com
# Created:      Wed 19 Nov 2025
#
# Purpose:      Show MangoWM tag/layout cheatsheet via dmenu.
# =============================================================================

# Declare associative array: KEYBIND → DESCRIPTION
declare -A ScriptMap=(
    ["SUPER+CTRL+l"]="Switch layout"
    ["SUPER+CTRL+s"]="Set layout: scroller"
    ["SUPER+CTRL+t"]="Set layout: tile"
    ["SUPER+CTRL+g"]="Set layout: grid"
    ["SUPER+CTRL+d"]="Set layout: deck"
    ["SUPER+CTRL+m"]="Set layout: monocle"
    ["SUPER+CTRL+c"]="Set layout: center_tile"
    ["SUPER+CTRL+y"]="Set layout: vertical_tile"
    ["SUPER+CTRL+v"]="Set layout: vertical_scroller"
    ["SUPER+SHIFT+c"]="Center window"
)

# Build list for dmenu: "KEY  →  DESCRIPTION"
Choices=""
for Key in "${!ScriptMap[@]}"; do
    Choices+="$Key  ==>  ${ScriptMap[$Key]}\n"
done

Choice=$(printf "%b" "$Choices" | dmenu -c -l 12 -i -p "Mango: Tag & Layout Commands")

exit 0

