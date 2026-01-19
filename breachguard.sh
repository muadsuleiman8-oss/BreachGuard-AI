#!/bin/bash

# BreachGuard AI - Unified Response Engine
# Version: 0.1 (Prototype)

PID=$1

if [ -z "$PID" ]; then
  echo "Usage: ./breachguard.sh <PID>"
  exit 1
fi

echo "[!] BreachGuard AI activated for PID: $PID"

# Alert
bash alert.sh "Suspicious process detected (PID: $PID)"

# Isolate process
bash isolate.sh $PID

# Isolate network
bash network_isolate.sh

echo "[+] BreachGuard AI response completed"
