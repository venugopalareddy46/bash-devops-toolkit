#!/bin/bash

# ==========================================
#        SERVICE MONITORING SCRIPT
# ==========================================

LOG_DIR="$HOME/bash-devops-toolkit/logs"
LOG_FILE="$LOG_DIR/service-check.log"

mkdir -p "$LOG_DIR"

SERVICES=("nginx" "ssh" "docker")

echo "========================================"
echo "         SERVICE STATUS CHECK"
echo "========================================"
echo "Date/Time : $(date)"
echo

FAILED=0

for SERVICE in "${SERVICES[@]}"
do
    echo -n "$SERVICE : "

    # Check whether service exists
    if ! systemctl list-unit-files | grep -q "^${SERVICE}.service"; then
        echo "NOT INSTALLED"
        echo "$(date) - $SERVICE : NOT INSTALLED" >> "$LOG_FILE"
        continue
    fi

    # Check whether service is running
    if systemctl is-active --quiet "$SERVICE"; then
        echo "RUNNING"
        echo "$(date) - $SERVICE : RUNNING" >> "$LOG_FILE"
    else
        echo "STOPPED"
        echo "$(date) - $SERVICE : STOPPED" >> "$LOG_FILE"
        FAILED=1

        read -p "Do you want to restart $SERVICE? (y/n): " ANSWER

        if [[ "$ANSWER" =~ ^[Yy]$ ]]; then

            if sudo systemctl restart "$SERVICE"; then
                echo "$SERVICE : RESTARTED"
                echo "$(date) - $SERVICE : RESTARTED" >> "$LOG_FILE"
            else
                echo "$SERVICE : RESTART FAILED"
                echo "$(date) - $SERVICE : RESTART FAILED" >> "$LOG_FILE"
            fi
        fi
    fi
done

echo
echo "========================================"

if [ "$FAILED" -eq 0 ]; then
    echo "Overall Status : ALL SERVICES OK"
    echo "$(date) - Overall Status: ALL SERVICES OK" >> "$LOG_FILE"
    echo "========================================"
    exit 0
else
    echo "Overall Status : SERVICE ISSUE DETECTED"
    echo "$(date) - Overall Status: SERVICE ISSUE DETECTED" >> "$LOG_FILE"
    echo "========================================"
    exit 1
fi
