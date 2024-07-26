-- insert-time-slots.sql

-- SQL script to create time slots for each day of the week, according to the usual slots offered by CupiTaller.
-- Execute with `psql -U postgres -d cupihorarios -f insert-time-slots.sql`.

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
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'SATURDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'SATURDAY');

-- SUNDAY
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'SUNDAY');
-- INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'SUNDAY');
