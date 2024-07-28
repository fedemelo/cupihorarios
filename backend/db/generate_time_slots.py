from os import path

intro = """-- insert-time-slots.sql

-- SQL script to create time slots for each day of the week, according to the usual slots offered by CupiTaller.
-- Execute with `psql -U postgres -d cupihorarios -f insert-time-slots.sql`.

BEGIN;
"""

sql_script_name = "insert-time-slots.sql"

sql_template = """
INSERT INTO time_slots (id, start_hour, end_hour, day)
VALUES (
    '{3}',
    {1},
    {2},
    '{0}'
);
"""

times = [(800, 900),
         (900, 930),
         (930, 1030),
         (1030, 1100),
         (1100, 1200),
         (1200, 1230),
         (1230, 1330),
         (1330, 1400),
         (1400, 1500),
         (1500, 1530),
         (1530, 1630),
         (1630, 1700),
         (1700, 1800)]

with open(path.join(path.dirname(__file__), sql_script_name), "w") as f:
    for day in ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"]:
        for start_hour, end_hour in times:
            id = f"{day.title()}, {start_hour // 100:02}:{start_hour % 100:02}-{end_hour // 100:02}:{end_hour % 100:02}"
            f.write(sql_template.format(day, start_hour, end_hour, id))
