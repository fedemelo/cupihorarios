#!/bin/bash

# Create a backup of the cupihorarios database and compress it with gzip.

cd "$(dirname "$0")"
DB_NAME="cupihorarios"
FILE="${DB_NAME}-empty.sql"
BACKUP_DIR="../backups"

pg_dump -U postgres $DB_NAME > $BACKUP_DIR/$FILE
gzip $BACKUP_DIR/$FILE
