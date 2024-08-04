-- insert-schedule.sql

-- SQL script to insert a single official schedule into the database.
-- Execute with `psql -U postgres -d cupihorarios -f insert-schedule.sql`.

BEGIN;

INSERT INTO schedules (id, name, is_official)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', '2024-20 A', true);

END;