#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80

# Get CPU usage (percentage)
CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print int(100 - $8)}')

# Get Memory usage (percentage)
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')

ALERT=0

if [[ $CPU_USAGE -gt $CPU_THRESHOLD ]]; then
    echo "ALERT: CPU usage is high: ${CPU_USAGE}%"
    ALERT=1
else
    echo "CPU usage is OK: ${CPU_USAGE}%"
fi

if [[ $MEM_USAGE -gt $MEM_THRESHOLD ]]; then
    echo "ALERT: Memory usage is high: ${MEM_USAGE}%"
    ALERT=1
else
    echo "Memory usage is OK: ${MEM_USAGE}%"
fi

if [[ $ALERT -eq 1 ]]; then
    exit 1
else
    exit 0
fi
