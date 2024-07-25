#!/bin/bash

cd "$(dirname "$0")"
FILE="cupihorarios-backup.sql"
BACKUP_DIR="./backups"

# Create a backup of the db to the ./backups/cupihorarios-backup.sql.gz file and compress it with gzip.
pg_dump -U postgres cupihorarios > $BACKUP_DIR/$FILE
gzip $BACKUP_DIR/$FILE
