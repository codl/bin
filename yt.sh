#!/bin/bash
FILE="$1"
COVER="$2"

duration=$(ffprobe -v 0 -show_entries format=duration -of flat "$FILE" | sed 's/format.duration="\([0-9.]\+\)"/\1/')

COVER_PARAMS='-loop 1 -r 6'
if egrep ".gif$" <<< "$COVER"; then
    COVER_PARAMS='-ignore_loop 0'
fi

ffmpeg \
    $COVER_PARAMS -i "$COVER"\
    -i "$FILE"\
    -vf scale=-1:720 -c:v libx264 -movflags +faststart\
    -c:a aac -b:a 192k\
    -t "$duration"\
    -y "/tmp/$(basename "$FILE").m4v"
