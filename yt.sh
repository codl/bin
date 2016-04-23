#!/bin/bash
FILE="$1"
COVER="$2"

duration=$(ffprobe -v 0 -show_entries format=duration -of flat "$FILE" | sed 's/format.duration="\([0-9.]\+\)"/\1/')

ffmpeg \
    -loop 1 -r 6 -i "$COVER"\
    -i "$FILE"\
    -vf scale=-1:720 -c:v libx264\
    -c:a aac -b:a 192k\
    -t "$duration"\
    -y "/tmp/$(basename "$FILE").m4v"

