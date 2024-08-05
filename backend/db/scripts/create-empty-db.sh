#!/bin/bash

# Delete the database if it exists and create a new one based on the cupihorarios-empty schema.

cd "$(dirname "$0")"

DB_NAME="cupihorarios"
BACKUP_DIR="../backups"

psql -U postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"
psql -U postgres -c "CREATE DATABASE \"$DB_NAME\";"
gunzip -c ${BACKUP_DIR}/${DB_NAME}-empty.sql.gz | psql -U postgres $DB_NAME