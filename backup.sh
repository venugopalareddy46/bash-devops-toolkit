#!/bin/bash

# ==========================================
#          BACKUP AUTOMATION SCRIPT
# ==========================================

BACKUP_DIR="$HOME/bash-devops-toolkit/backups"
LOG_DIR="$HOME/bash-devops-toolkit/logs"
LOG_FILE="$LOG_DIR/backup.log"

# ------------------------------------------
# Create required directories
# ------------------------------------------

mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

# ------------------------------------------
# Check required argument
# ------------------------------------------

if [ $# -ne 1 ]; then
    echo "Usage: $0 /home/bash-backup"
    echo "Example: $0 /home/venu/data"
    exit 1
fi

SOURCE_DIR="$1"

# ------------------------------------------
# Check source directory
# ------------------------------------------

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory does not exist: $SOURCE_DIR"
    echo "$(date) - Backup FAILED - Directory does not exist: $SOURCE_DIR" >> "$LOG_FILE"
    exit 1
fi

# ------------------------------------------
# Check tar command
# ------------------------------------------

if ! command -v tar >/dev/null 2>&1; then
    echo "ERROR: tar command is not installed."
    echo "$(date) - Backup FAILED - tar command not found" >> "$LOG_FILE"
    exit 1
fi

# ------------------------------------------
# Create timestamp
# ------------------------------------------

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_FILE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

echo "========================================"
echo "          BACKUP AUTOMATION"
echo "========================================"
echo "Source      : $SOURCE_DIR"
echo "Backup File : $BACKUP_FILE"
echo

# ------------------------------------------
# Create backup
# ------------------------------------------

echo "Creating backup..."

if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then

    echo "Backup completed successfully."
    echo "Backup file: $BACKUP_FILE"

    echo "$(date) - Backup SUCCESS - Source: $SOURCE_DIR - File: $BACKUP_FILE" >> "$LOG_FILE"

    echo "========================================"
    exit 0

else

    echo "ERROR: Backup failed."

    echo "$(date) - Backup FAILED - Source: $SOURCE_DIR" >> "$LOG_FILE"

    # Remove incomplete backup if it exists
    rm -f "$BACKUP_FILE"

    echo "========================================"
    exit 1
fi
