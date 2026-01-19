#!/bin/bash

# BreachGuard AI - Alert System
# Version: 0.1 (Prototype)

MESSAGE=$1

if [ -z "$MESSAGE" ]; then
  MESSAGE="Suspicious activity detected"
fi

echo "[ALERT] $MESSAGE"

# Log alert
echo "$(date) - ALERT: $MESSAGE" >> breachguard.log
