#!/bin/bash

# BreachGuard AI - Rollback Script
# Version: 0.1

PID=$1

echo "[!] Rollback initiated"

# Re-enable network
nmcli networking on

# Resume process if PID provided
if [ -n "$PID" ]; then
  kill -CONT $PID
  echo "$(date) - Rollback executed for PID $PID" >> breachguard.log
  echo "[+] Process $PID resumed"
else
  echo "$(date) - Rollback executed (network only)" >> breachguard.log
fi

echo "[+] Network restored successfully"
