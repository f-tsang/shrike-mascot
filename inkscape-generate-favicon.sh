#!/bin/bash

O_SIZES=(32 16)
IN_FILE=${1:-shrike.svg}
O_FILE=${2:-favicon.ico}

function finish {
	for i in ${O_SIZES[@]}; do
		rm "${i}.png"
	done
}
trap finish EXIT

for i in ${O_SIZES[@]}; do
	inkscape -w $i -h $i --export-png="${i}.png" --export-background-opacity=0 --without-gui $IN_FILE
done
convert $(printf '%s.png ' "${O_SIZES[@]}") $O_FILE

exit 0
