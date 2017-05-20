#!/bin/bash

borg create --lock-wait 180 -vsp -C zlib "::{hostname}-home-{now:%Y-%m-%dT%H:%M}" /home/codl
borg prune --lock-wait 180 -vs --list -H 24 -d 31 -w 8 -m 24 -y 999 -P '{hostname}'
