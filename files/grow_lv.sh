#!/bin/bash

MOUNTPOINT="$1" # E.g.: /var
EXTEND="$2"     # E.g.: +100%FREE or 1G

if [ -z "$MOUNTPOINT" ]||[ -z "$EXTEND" ]
then
    echo >&2 "Usage:   $0 <mountpoint> <extension>"
    echo >&2 "Example: $0 /var 3G"
    exit 1
fi

set -e

#
# Find dev-mappers and extend LVs
#
mountinfo=$(df -l --output=source "$MOUNTPOINT")
lvinfo=$(echo "$mountinfo" | tail -1 | xargs lvs --noheadings)

lv_name=$(echo "$lvinfo" | awk '{print $1}')
vg_name=$(echo "$lvinfo" | awk '{print $2}')

echo "$EXTEND" | grep -q '%' && flag="-l" || flag="-L"
(set -x; lvextend -r $flag "$EXTEND" "/dev/$vg_name/$lv_name")
