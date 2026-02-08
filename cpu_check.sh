#!/bin/bash
top -bn1 | awk '/Cpu/ {print "CPU Usage:", 100-$8 "%"}'
