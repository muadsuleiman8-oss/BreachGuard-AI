#!/bin/bash

# BreachGuard AI - Emergency Isolation Script
# Version: 0.1 (Prototype)

PID=$1

if [ -z "$PID" ]; then
  echo "Usage: ./isolate.sh <PID>"
  exit 1
fi

echo "[!] Isolating process with PID: $PID"

# Stop the process
kill -STOP $PID

# Log the action
echo "$(date) - Process $PID isolated" >> breachguard.log

echo "[+] Process $PID has been isolated successfully."
