#!/bin/bash

# ==========================================
#           LOG CLEANUP SCRIPT
# ==========================================

LOG_DIR="$HOME/bash-devops-toolkit/logs"
LOG_FILE="$LOG_DIR/cleanup.log"

mkdir -p "$LOG_DIR"

# ------------------------------------------
# Check argument
# ------------------------------------------

if [ $# -ne 2 ]; then
    echo "Usage: $0 /home/bash-log 1"
    echo "Example: $0 ~/bash-log-test 7"
    exit 1
fi

TARGET_DIR="$1"
DAYS="$2"

# ------------------------------------------
# Check directory
# ------------------------------------------

if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory does not exist: $TARGET_DIR"
    exit 1
fi

# ------------------------------------------
# Validate days
# ------------------------------------------

if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Days must be a number."
    exit 1
fi

# ------------------------------------------
# Display information
# ------------------------------------------

echo "========================================"
echo "            LOG CLEANUP"
echo "========================================"
echo "Directory : $TARGET_DIR"
echo "Older than: $DAYS days"
echo

echo "Files matching cleanup criteria:"
echo "----------------------------------------"

find "$TARGET_DIR" -type f -name "*.log" -mtime +"$DAYS"

echo
echo "========================================"
echo

read -p "Do you want to delete these files? (y/n): " ANSWER

if [[ "$ANSWER" =~ ^[Yy]$ ]]; then

    echo
    echo "Deleting old log files..."

    find "$TARGET_DIR" \
        -type f \
        -name "*.log" \
        -mtime +"$DAYS" \
        -delete

    if [ $? -eq 0 ]; then
        echo "Log cleanup completed successfully."
        echo "$(date) - Cleanup completed - Directory: $TARGET_DIR - Older than: $DAYS days" >> "$LOG_FILE"
        exit 0
    else
        echo "ERROR: Log cleanup failed."
        echo "$(date) - Cleanup FAILED - Directory: $TARGET_DIR" >> "$LOG_FILE"
        exit 1
    fi

else

    echo "Cleanup cancelled."
    echo "$(date) - Cleanup cancelled - Directory: $TARGET_DIR" >> "$LOG_FILE"
    exit 0

fi
