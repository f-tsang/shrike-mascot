#!/bin/bash

IN_FILE=${1:-shrike.svg}
COLOUR=${2:-#FFFFFF}

inkscape --without-gui --export-png="apple-touch-icon.png" --export-background=$COLOUR -w180 -h180  $IN_FILE

exit 0
