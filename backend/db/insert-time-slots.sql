-- insert-time-slots.sql

-- SQL script to create time slots for each day of the week, according to the usual slots offered by CupiTaller.
-- Execute with `psql -U postgres -d cupihorarios -f insert-time-slots.sql`.

-- MONDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Monday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Monday');

-- TUESDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Tuesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Tuesday');

-- WEDNESDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Wednesday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Wednesday');

-- THURSDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Thursday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Thursday');

-- FRIDAY
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 800, 900, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 900, 930, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 930, 1030, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1030, 1100, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1100, 1200, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1200, 1230, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1230, 1330, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1330, 1400, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1400, 1500, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1500, 1530, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1530, 1630, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1630, 1700, 'Friday');
INSERT INTO time_slots (id, start_hour, end_hour, day) VALUES (uuid_generate_v4(), 1700, 1800, 'Friday');

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
