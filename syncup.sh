#!/bin/bash

rclone sync -v /run/media/codl/mybook-3T/borg-20170406/ s3:codl-backup/borg-20170406
