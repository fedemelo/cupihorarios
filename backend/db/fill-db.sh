#!/bin/bash

# Fill the database with initial data.
# Delete the database if it exists and create a new one based on the cupihorarios-empty schema.

cd "$(dirname "$0")"

DB_NAME="cupihorarios"

psql -U postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"
psql -U postgres -c "CREATE DATABASE \"$DB_NAME\";"
gunzip -c ./backups/${DB_NAME}-empty.sql.gz | psql -U postgres $DB_NAME

psql -U postgres -d $DB_NAME -f insert-assistants.sql
psql -U postgres -d $DB_NAME -f insert-time-slots.sql
psql -U postgres -d $DB_NAME -f insert-assistant-availabilities.sql
psql -U postgres -d $DB_NAME -f insert-schedule.sql
psql -U postgres -d $DB_NAME -f insert-scheduled-slots.sql
