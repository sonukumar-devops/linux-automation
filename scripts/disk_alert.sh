#!/bin/bash

THRESHOLD=80
ALERTED=0

df -hP | awk 'NR>1 {gsub(/%/, "", $5); if ($5 > threshold) print $6, $5 "%"}' threshold=$THRESHOLD | while read mount usage; do
echo "Alert: Disk ushge on $mount is $usage"
done

if [[ $Alerted -eq 1 ]]; then
	exit 1
	els
	echo "All disks are under threshold"
	exit 0
fi
