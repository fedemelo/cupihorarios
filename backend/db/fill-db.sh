#!/bin/bash

# Fill the database with initial data.
# Delete the database if it exists and create a new one based on the cupihorarios-empty schema.
cd "$(dirname "$0")"

psql -U postgres -c "DROP DATABASE IF EXISTS \"cupihorarios\";"
psql -U postgres -c "CREATE DATABASE \"cupihorarios\";"
gunzip -c ./backups/cupihorarios-empty.sql.gz | psql -U postgres cupihorarios

psql -U postgres -d cupihorarios -f insert-assistants.sql
psql -U postgres -d cupihorarios -f insert-time-slots.sql
psql -U postgres -d cupihorarios -f insert-assistant-availabilities.sql