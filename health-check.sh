#!/bin/bash

# ==========================================
#        SERVER HEALTH CHECK
# ==========================================

LOG_DIR="$HOME/bash-devops-toolkit/logs"
LOG_FILE="$LOG_DIR/health-check.log"

mkdir -p "$LOG_DIR"

echo "========================================"
echo "         SERVER HEALTH CHECK"
echo "========================================"
echo "Date/Time : $(date)"
echo

CRITICAL=0

# ------------------------------------------
# Function to check usage
# ------------------------------------------

check_usage() {
    local NAME="$1"
    local VALUE="$2"

    if [ "$VALUE" -lt 70 ]; then
        echo "$NAME Usage : $VALUE% - NORMAL"

    elif [ "$VALUE" -le 90 ]; then
        echo "$NAME Usage : $VALUE% - WARNING"

    else
        echo "$NAME Usage : $VALUE% - CRITICAL"
        CRITICAL=1
    fi
}

# ------------------------------------------
# CPU Usage
# ------------------------------------------

CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}' | cut -d. -f1)

if [ -z "$CPU_USAGE" ]; then
    CPU_USAGE=0
fi

check_usage "CPU" "$CPU_USAGE"

# ------------------------------------------
# Memory Usage
# ------------------------------------------

MEMORY_USAGE=$(free | awk '/Mem:/ {
    printf "%.0f", ($3/$2)*100
}')

check_usage "Memory" "$MEMORY_USAGE"

# ------------------------------------------
# Disk Usage
# ------------------------------------------

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

check_usage "Disk" "$DISK_USAGE"

# ------------------------------------------
# Server Uptime
# ------------------------------------------

echo
echo "Uptime      : $(uptime -p)"

# ------------------------------------------
# Service Checks
# ------------------------------------------

echo
echo "Service Status:"
echo "----------------------------------------"

SERVICES=("ssh" "docker" "nginx")

for SERVICE in "${SERVICES[@]}"
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE : RUNNING"
    else
        echo "$SERVICE : STOPPED"
        CRITICAL=1
    fi
done

# ------------------------------------------
# Final Status
# ------------------------------------------

echo
echo "========================================"

if [ "$CRITICAL" -eq 1 ]; then
    echo "Overall Status : CRITICAL"
    echo "========================================"

    echo "$(date) - Health Check: CRITICAL" >> "$LOG_FILE"

    exit 2
else
    echo "Overall Status : HEALTHY"
    echo "========================================"

    echo "$(date) - Health Check: HEALTHY" >> "$LOG_FILE"

    exit 0
fi
