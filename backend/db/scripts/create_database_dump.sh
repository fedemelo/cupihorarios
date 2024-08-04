#!/bin/bash

DB_NAME="cupihorarios"
BACKUP_DIR="../backups"
DUMP_FILE="postgres_dump.sql"
POSTGRES_USER="postgres"

cd "$(dirname "$0")"

psql -U $POSTGRES_USER -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"
psql -U $POSTGRES_USER -c "CREATE DATABASE \"$DB_NAME\";"

# Restore the empty database from the backup
gunzip -c ${BACKUP_DIR}/${DB_NAME}-empty.sql.gz | psql -U $POSTGRES_USER $DB_NAME

psql -U $POSTGRES_USER -d $DB_NAME -f insert-assistants.sql
psql -U $POSTGRES_USER -d $DB_NAME -f insert-time-slots.sql

# Create a dump of the database
pg_dump -U $POSTGRES_USER -d $DB_NAME > ${BACKUP_DIR}/${DUMP_FILE}

echo "Database dump created at ${BACKUP_DIR}/${DUMP_FILE}"
