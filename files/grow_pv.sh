#!/bin/bash

set -e

#
# GROWPART for greater partitions in all disks
#

# /dev/sda\n/dev/sdb\n...
pvdisks=$( pvs --noheadings | awk '{print $1}' | sed 's/^\(.*\)[0-9]\+/\1/g' | sort -du )
while read -r disk_dev # /dev/sda
do
    partition_num=$( pvs --noheadings | fgrep "$disk_dev" | sort | tail -1 | awk '{print $1}' | sed 's/^.*\([0-9]\+\)/\1/g')
    (
        set -x
        growpart "$disk_dev" "$partition_num" || true
        pvresize "${disk_dev}${partition_num}" || true
    )
done < <(printf '%s\n' "$pvdisks")
