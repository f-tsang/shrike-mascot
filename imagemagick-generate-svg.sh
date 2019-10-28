#!/bin/bash

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
