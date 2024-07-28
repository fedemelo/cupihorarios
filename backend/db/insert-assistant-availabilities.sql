
-- insert-assistant-availabilities.sql

-- Execute with `psql -U postgres -d cupihorarios -f insert-assistant-availabilities.sql`


BEGIN;

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201913554, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202020609, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021525, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202011140, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 201922019, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202112020, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 900), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 930), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1030), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500), false);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (uuid_generate_v4(), 202021113, (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530), false);


END;