#!/bin/bash

borg create --lock-wait 180 -vsp -C zlib --exclude-caches "::{hostname}-home-{now:%Y-%m-%dT%H:%M}" /home/codl
borg prune --lock-wait 180 -vs --list -H 23 -d 30 -m 23 -y 999 -P '{hostname}'
