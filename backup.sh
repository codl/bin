#!/bin/bash

borg create --lock-wait 180 -vsp -C zlib "::{hostname}-home-{now:%Y-%m-%dT%H:%M}" /home/codl
borg prune --lock-wait 180 -vs --list -H 12 -d 6 -w 3 -m 23 -y 999 -P '{hostname}'
