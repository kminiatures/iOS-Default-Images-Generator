#!/bin/bash

# Usage
# -------------------------------------------
usage() { echo "usage: $0 src_image bg_color [dst_dir]"; exit 1; }
[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "./dst"


# Directories
# -------------------------------------------
ICONDIR=$3/icon
SCREENDIR=$3/screen
eval mkdir -p "$ICONDIR"
eval mkdir -p "$SCREENDIR"


# Show progress
# -------------------------------------------
set -x


# App Icons
# -------------------------------------------
function icon(){
  convert -background none \
    "$1" -resize $2   "$ICONDIR/$3"
}

icon "$1" 57x57     Icon-iPhone-57.png        # iPhone iOS 5/6
icon "$1" 114x114   Icon-iPhone-57@2x.png
icon "$1" 60x60     Icon-iPhone-60.png        # iPhone iOS7
icon "$1" 120x120   Icon-iPhone-60@2x.png
icon "$1" 180x180   Icon-iPhone-60@3x.png
icon "$1" 72x72     Icon-iPad72.png           # iPad iOS 5/6
icon "$1" 144x144   Icon-iPad72@2x.png
icon "$1" 76x76     Icon-iPad-76.png          # iPad iOS7
icon "$1" 152x152   Icon-iPad-76@2x.png
icon "$1" 167x167   Icon-iPad-Pro-83.5@2x.png # iPad Pro
icon "$1" 29x29     Icon-Settings-29.png      # Setting
icon "$1" 58x58     Icon-Settings-29@2x.png
icon "$1" 87x87     Icon-Settings-29@3x.png
icon "$1" 40x40     Icon-Spotlight-40.png     # Spotlight
icon "$1" 80x80     Icon-Spotlight-40@2x.png
icon "$1" 120x120   Icon-Spotlight-40@3x.png
icon "$1" 50x50     Icon-Small-50.png         # 50
icon "$1" 100x100   Icon-Small-50@2x.png
icon "$1" 512x512   iTunesArtwork.png         # AppStore
icon "$1" 1024x1024 iTunesArtwork@2x.png


# App Launch Images
# -------------------------------------------
function launch_image(){
  convert "$1" -background $2 -gravity center \
    -resize $3 -extent $4  "$SCREENDIR/$5"
}

# iPhone
launch_image "$1" $2 256x256   320x480   Default~iphone.png
launch_image "$1" $2 256x256   320x480   Default~iphone.png
launch_image "$1" $2 512x512   640x960   Default@2x~iphone.png
launch_image "$1" $2 512x512   640x1136  Default-568h@2x~iphone.png
# # iPad
launch_image "$1" $2 512x512   768x1024  Default-Portrait~ipad.png
launch_image "$1" $2 1024x1024 1536x2048 Default-Portrait@2x~ipad.png
launch_image "$1" $2 512x512   1024x768  Default-Landscape~ipad.png
launch_image "$1" $2 1024x1024 2048x1536 Default-Landscape@2x~ipad.png
