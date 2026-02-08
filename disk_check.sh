#!bin/bash
df -h | awk '$5+0 > 80 {print "High Disk Usage:", $0}'
