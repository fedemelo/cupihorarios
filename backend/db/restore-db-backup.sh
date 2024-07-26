#!/bin/bash

# Restore a backup of the postgres database in the ./backups/cupihorarios-backup.sql.gz file.
# Delete the database if it exists.

cd "$(dirname "$0")"

DB_NAME="cupihorarios"

psql -U postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"
psql -U postgres -c "CREATE DATABASE \"$DB_NAME\";"
gunzip -c ./backups/${DB_NAME}-backup.sql.gz | psql -U postgres $DB_NAME
