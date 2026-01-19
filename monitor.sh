#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
LOG_FILE="alerts.log"
SAFE_MODE_SCRIPT="./safe_mode.sh"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
TRIGGER_SAFE_MODE=false

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "$TIMESTAMP WARNING: High CPU usage detected: $CPU_USAGE%" >> $LOG_FILE
  TRIGGER_SAFE_MODE=true
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "$TIMESTAMP WARNING: High Memory usage detected: $MEM_USAGE%" >> $LOG_FILE
  TRIGGER_SAFE_MODE=true
fi

if [ "$TRIGGER_SAFE_MODE" = true ]; then
  echo "$TIMESTAMP ACTION: Activating Safe Mode" >> $LOG_FILE
  bash $SAFE_MODE_SCRIPT
fi bash ./alert_email.sh
