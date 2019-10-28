#!/bin/bash

O_SIZES=(512 384 192 152 144 128 96 72)
IN_FILE=${1:-shrike.svg}

for i in ${O_SIZES[@]}; do
	inkscape -w $i -h $i --export-png="icon-${i}x${i}.png" --export-background-opacity=0 --without-gui $IN_FILE
done
exit 0
