#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
LOG_FILE="alerts.log"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "$TIMESTAMP WARNING: High CPU usage detected: $CPU_USAGE%" >> $LOG_FILE
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "$TIMESTAMP WARNING: High Memory usage detected: $MEM_USAGE%" >> $LOG_FILE
fi
