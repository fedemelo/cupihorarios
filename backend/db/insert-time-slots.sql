-- insert-time-slots.sql

-- SQL script to create time slots for each day of the week, according to the usual slots offered by CupiTaller.
-- Execute with `psql -U postgres -d cupihorarios -f insert-time-slots.sql`.

BEGIN;

-- MONDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'MONDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'MONDAY');

-- TUESDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'TUESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'TUESDAY');

-- WEDNESDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'WEDNESDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'WEDNESDAY');

-- THURSDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'THURSDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'THURSDAY');

-- FRIDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'FRIDAY');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'FRIDAY');

-- SATURDAY
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Saturday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Saturday');

-- SUNDAY
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Sunday');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Sunday');

END;