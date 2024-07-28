
-- insert-assistant-availabilities.sql

-- Execute with `psql -U postgres -d cupihorarios -f insert-assistant-availabilities.sql`


INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201913554, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700)),
    201913554,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 930)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1030)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202020609, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700)),
    202020609,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021525, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500)),
    202021525,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202011140, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700)),
    202011140,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(201922019, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700)),
    201922019,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1230),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1400),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1630),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202112020, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700)),
    202112020,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1700),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 800),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 900)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 900)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 900),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 930)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 930),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'THURSDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1030)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1030),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'TUESDAY' AND start_hour = 1100),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1200),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'MONDAY' AND start_hour = 1330),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'WEDNESDAY' AND start_hour = 1500),
    false
);

INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, remote_only) 
VALUES (
    CONCAT(202021113, ': ', (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530)),
    202021113,
    (SELECT id FROM time_slots WHERE day = 'FRIDAY' AND start_hour = 1530),
    false
);
