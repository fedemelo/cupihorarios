
-- insert-scheduled-slots.sql

-- SQL script to insert an example of scheduled slots belonging to a schedule.
-- Execute with `psql -U postgres -d cupihorarios -f insert-scheduled-slots.sql`.

BEGIN;

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1030))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 900))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1030))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 900))
, false);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201913554 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202020609 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021525 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202011140 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 201922019 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202112020 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800))
, true);

INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = 202021113 AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800))
, true);

END;