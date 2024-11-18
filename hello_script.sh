#!/bin/bash

LOG_FILE="/tmp/hello.log"

while true; do
    echo "Hello, world!" >> "$LOG_FILE"
    sleep 60
done
