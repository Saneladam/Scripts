#!/bin/bash

# This script sets the theme for various applications based on the argument passed.
# Usage: ./theme.sh [dark|light]

if [ "$1" = "dark" ]; then
    echo "Setting dark theme..."
    ## Set dark theme settings here

    # Nvim
    cp ~/.config/nvim/lua/dark.lua ~/.config/nvim/lua/theme.lua
    # Kitty
    cp ~/.config/kitty/dark-theme.conf ~/.config/kitty/current-theme.conf
    kitty @ set-colors --all ~/.config/kitty/current-theme.conf
    echo "Dark theme set successfully."
#######################################################################################
elif [ "$1" = "light" ]; then
    echo "Setting light theme..."
    # Set light theme settings here

    # Nvim
    cp ~/.config/nvim/lua/light.lua ~/.config/nvim/lua/theme.lua
    # Kitty
    cp ~/.config/kitty/light-theme.conf ~/.config/kitty/current-theme.conf
    kitty @ set-colors --all ~/.config/kitty/current-theme.conf
    echo "Light theme set successfully."
#######################################################################################
else
    echo "Select a valid theme: 'dark' or 'light'."
fi
