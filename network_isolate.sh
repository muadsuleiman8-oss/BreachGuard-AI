#!/bin/bash

# BreachGuard AI - Network Isolation Script
# Version: 0.1 (Prototype)

echo "[!] Network isolation activated"

# Disable network interface
nmcli networking off

# Log event
echo "$(date) - Network isolated due to suspicious activity" >> breachguard.log

echo "[+] Network has been isolated successfully."
