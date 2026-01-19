#!/bin/bash

LOG_FILE="alerts.log"
SAFE_LOG="safe_mode.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "$TIMESTAMP SAFE MODE ACTIVATED: Limiting system impact" >> $SAFE_LOG

# Limit CPU usage for heavy processes
for pid in $(ps -eo pid,pcpu --sort=-pcpu | awk 'NR>1 && $2>80 {print $1}'); do
  renice +10 -p $pid
  echo "$TIMESTAMP Reniced process $pid" >> $SAFE_LOG
done

# Temporary network slowdown (basic protection)
tc qdisc add dev eth0 root netem delay 100ms 2>/dev/null
