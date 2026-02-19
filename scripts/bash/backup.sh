#!/bin/bash
# =====================================================
# Backup Script - Enterprise Lab
# Author: Your Name
# Description:
#   This script creates a compressed backup of the web
#   server directory and stores it in /backup.
#   A log file is generated for monitoring purposes.
# =====================================================

# Variables
SOURCE="/var/www/html"
DEST="/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="web_backup_$DATE.tar.gz"
LOG_FILE="/var/log/backup.log"

echo "----------------------------------------" >> "$LOG_FILE"
echo "Backup started at $DATE" >> "$LOG_FILE"

# Check if source directory exists
if [ ! -d "$SOURCE" ]; then
    echo "ERROR: Source directory not found: $SOURCE" >> "$LOG_FILE"
    exit 1
fi

# Create backup directory if it does not exist
if [ ! -d "$DEST" ]; then
    mkdir -p "$DEST"
    echo "Backup directory created: $DEST" >> "$LOG_FILE"
fi

# Create compressed archive (use -C to avoid absolute path warning)
tar -czf "$DEST/$BACKUP_NAME" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")" 2>> "$LOG_FILE"

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_NAME" >> "$LOG_FILE"
else
    echo "Backup FAILED!" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"
    exit 1
fi

# Delete backups older than 7 days
find "$DEST" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \; 2>> "$LOG_FILE"
echo "Old backups cleaned (older than 7 days)" >> "$LOG_FILE"

echo "Backup process completed successfully" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

exit 0