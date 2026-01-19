#!/bin/bash

source config.conf

if [ "$SAFE_MODE" = "ON" ]; then
  echo "[SAFE MODE] Active - No automatic isolation"
  exit 1
fi

exit 0
