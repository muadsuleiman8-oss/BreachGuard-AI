#!/bin/bash

# BreachGuard AI - Auto Detection Prototype
# Version: 0.1

THRESHOLD_CPU=80  # CPU usage percentage to consider suspicious

echo "[!] Auto-detection started"

# Check running processes
for PID in $(ps -e -o pid=); do
    CPU=$(ps -p $PID -o %cpu= | awk '{print int($1)}')
    
    if [ "$CPU" -ge "$THRESHOLD_CPU" ]; then
        echo "[ALERT] Suspicious process detected (PID: $PID, CPU: $CPU%)"
        echo "$(date) - ALERT: PID $PID CPU $CPU%" >> breachguard.log
        
        # Trigger existing scripts
        bash alert.sh "High CPU usage detected (PID: $PID, CPU: $CPU%)"
        bash isolate.sh $PID
        bash network_isolate.sh
    fi
done

echo "[+] Auto-detection completed"
