#!/bin/bash

tmp_file="/tmp/qr.png"

maim --hidecursor --select "$tmp_file"
scanresult=$(zbarimg --quiet --raw "$tmp_file" | tr -d '\n')

if [ -z "$scanresult" ]; then
	notify-send -a eses "No QR code detected"
else
	echo "$scanresult" | xclip -selection clipboard -filter
	convert $tmp_file -resize 75x75 "$tmp_file"
	notify-send -a eses -i "$tmp_file" "QR code result" "$scanresult"
fi
