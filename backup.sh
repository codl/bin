#!/bin/bash

BLOCK_DEVICE="/dev/disk/by-label/mybook-3T"
PATHS="/home/codl"

udisksctl mount --block-device "$BLOCK_DEVICE" > /dev/null 2>&1
if [[ $? != 0 && ! -d /run/media/codl/mybook-3T ]]; then
    echo "Couldn't mount $BLOCK_DEVICE, exiting." 1>&2
    exit 1
fi

source /home/codl/.profile.credentials
borg create "::$(hostname -s)-home-{utcnow:%Y-%m-%dT%H:%M:%S}" /home/codl

sync
udisksctl unmount --block-device "$BLOCK_DEVICE" > /dev/null 2>&1
