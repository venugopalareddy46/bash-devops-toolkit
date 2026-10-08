#!/bin/bash

# ==========================================
#          DEVOPS AUTOMATION TOOL
# ==========================================

BASE_DIR="$HOME/bash-devops-toolkit"

SYSTEM_INFO="$BASE_DIR/system-info.sh"
HEALTH_CHECK="$BASE_DIR/health-check.sh"
SERVICE_CHECK="$BASE_DIR/service-check.sh"
BACKUP_SCRIPT="$BASE_DIR/backup.sh"
LOG_CLEANUP="$BASE_DIR/log-cleanup.sh"

# ==========================================
# Server Information
# ==========================================

server_information() {
    echo
    echo "Running Server Information..."
    echo

    "$SYSTEM_INFO"
}

# ==========================================
# Health Check
# ==========================================

health_check() {
    echo
    echo "Running Health Check..."
    echo

    "$HEALTH_CHECK"
}

# ==========================================
# Service Status
# ==========================================

service_status() {
    echo
    echo "Checking Services..."
    echo

    "$SERVICE_CHECK"
}

# ==========================================
# Backup
# ==========================================

backup_data() {
    echo

    read -p "Enter source directory to backup: " SOURCE_DIR

    if [ -z "$SOURCE_DIR" ]; then
        echo "ERROR: Source directory cannot be empty."
        return 1
    fi

    "$BACKUP_SCRIPT" "$SOURCE_DIR"
}

# ==========================================
# Disk Usage
# ==========================================

disk_usage() {
    echo
    echo "========================================"
    echo "             DISK USAGE"
    echo "========================================"

    df -h

    echo "========================================"
}

# ==========================================
# Memory Usage
# ==========================================

memory_usage() {
    echo
    echo "========================================"
    echo "            MEMORY USAGE"
    echo "========================================"

    free -h

    echo "========================================"
}

# ==========================================
# Process Information
# ==========================================

process_information() {
    echo
    echo "========================================"
    echo "          TOP PROCESSES"
    echo "========================================"

    ps aux --sort=-%cpu | head -11

    echo
    echo "========================================"
}

# ==========================================
# Log Cleanup
# ==========================================

log_cleanup() {
    echo

    read -p "Enter log directory: " LOG_DIRECTORY

    if [ -z "$LOG_DIRECTORY" ]; then
        echo "ERROR: Log directory cannot be empty."
        return 1
    fi

    read -p "Delete logs older than how many days? " DAYS

    if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
        echo "ERROR: Days must be a number."
        return 1
    fi

    "$LOG_CLEANUP" "$LOG_DIRECTORY" "$DAYS"
}

# ==========================================
# Main Menu
# ==========================================

while true
do
    clear

    echo "========================================"
    echo "          DEVOPS AUTOMATION"
    echo "========================================"
    echo
    echo "1. Server Information"
    echo "2. Health Check"
    echo "3. Service Status"
    echo "4. Backup"
    echo "5. Disk Usage"
    echo "6. Memory Usage"
    echo "7. Process Information"
    echo "8. Log Cleanup"
    echo "9. Exit"
    echo
    echo "========================================"

    read -p "Enter your choice: " CHOICE

    case "$CHOICE" in

        1)
            server_information
            ;;

        2)
            health_check
            ;;

        3)
            service_status
            ;;

        4)
            backup_data
            ;;

        5)
            disk_usage
            ;;

        6)
            memory_usage
            ;;

        7)
            process_information
            ;;

        8)
            log_cleanup
            ;;

        9)
            echo
            echo "Exiting DevOps Automation Tool."
            echo "Goodbye!"
            exit 0
            ;;

        *)
            echo
            echo "ERROR: Invalid choice."
            ;;

    esac

    echo
    read -p "Press Enter to return to the menu..."
done
