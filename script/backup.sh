#!/bin/bash

source config/backup.conf

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create backup destination if missing
mkdir -p "$BACKUP_DEST"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DEST/backup_$TIMESTAMP.tar.gz"

echo "Creating backup of $SOURCE_DIR..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup saved to $BACKUP_FILE"

