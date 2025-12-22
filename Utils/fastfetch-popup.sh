#!/bin/bash

# =============================================================================
# Authors:      Roman Garcia Guill
# Contact:      romangarciaguill@gmail.com
# Created:      Sun 14. Dec 2025
#
# Purpose:      Launch fastfetch in a popup window 
# =============================================================================


exec kitty \
  --class fastfetch \
  --title fastfetch \
  --detach \
  fastfetch
