#!/bin/bash

# NOTE: Might be due to the version of ImageMagick or WSL, but convert 
#       outputs a white background even if -background transparent is 
#       used. This script uses this behaviour to add a fuzzy white 
#       border around the image.
#
#       Version: ImageMagick 6.9.7-4 Q16 x86_64 20170114

O_FILE=${1:-shrike.png}

function finish {
	rm tmp1.png tmp2.png tmp3.png
}
trap finish EXIT

convert shrike.svg -antialias -fuzz 10% -transparent white tmp1.png
convert tmp1.png -alpha extract tmp2.png
convert tmp2.png \
	-define connected-components:mean-color=true \
	-define connected-components:area-threshold=50 \
	-connected-components 4 \
	tmp3.png
convert tmp1.png tmp3.png -alpha off -compose copy_opacity -composite $O_FILE

exit 0
