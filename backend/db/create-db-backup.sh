FILE="cupihorarios-backup.sql"
BACKUP_DIR="./backups"

# Create the backup and compress it with gzip.
pg_dump -U postgres cupihorarios > $BACKUP_DIR/$FILE
gzip $BACKUP_DIR/$FILE
