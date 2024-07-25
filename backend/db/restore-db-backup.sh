#!/bin/bash

# Restore a backup of the postgres database in the ./backups/cupihorarios-backup.sql.gz file.
# Delete the database if it exists.
cd "$(dirname "$0")"

psql -U postgres -c "DROP DATABASE IF EXISTS \"cupihorarios\";"
psql -U postgres -c "CREATE DATABASE \"cupihorarios\";"
gunzip -c ./backups/cupihorarios-backup.sql.gz | psql -U postgres cupihorarios