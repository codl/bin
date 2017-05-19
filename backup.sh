#!/bin/bash

borg create -vsp -C zlib "::{hostname}-home-{now:%Y-%m-%dT%H:%M}" /home/codl
borg prune -vs --list -H 24 -d 31 -w 8 -m 24 -y 999 -P '{hostname}'
