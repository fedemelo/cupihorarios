from os import path

availabilities = {
    "non_remote": {
        "Andres": [
            {"day": "JUE", "start": "11:00", "end": "12:00"},
            {"day": "JUE", "start": "12:30", "end": "13:30"},
            {"day": "JUE", "start": "8:00", "end": "9:00"},
            {"day": "JUE", "start": "9:30", "end": "10:30"},
            {"day": "MAR", "start": "11:00", "end": "12:00"},
            {"day": "MAR", "start": "12:30", "end": "13:30"},
            {"day": "MIE", "start": "11:00", "end": "12:00"},
            {"day": "MIE", "start": "14:00", "end": "15:00"},
            {"day": "MIE", "start": "15:30", "end": "16:30"},
            {"day": "MIE", "start": "17:00", "end": "18:00"},
        ],
        "Ardilla": [
            {"day": "JUE", "start": "15:00", "end": "15:30"},
            {"day": "JUE", "start": "15:30", "end": "16:30"},
            {"day": "JUE", "start": "16:30", "end": "17:00"},
            {"day": "JUE", "start": "17:00", "end": "18:00"},
            {"day": "LUN", "start": "12:30", "end": "13:30"},
            {"day": "LUN", "start": "14:00", "end": "15:00"},
            {"day": "LUN", "start": "16:30", "end": "17:00"},
            {"day": "LUN", "start": "17:00", "end": "18:00"},
            {"day": "MAR", "start": "17:00", "end": "18:00"},
            {"day": "MIE", "start": "10:30", "end": "11:00"},
            {"day": "MIE", "start": "12:30", "end": "13:30"},
            {"day": "VIE", "start": "17:00", "end": "18:00"},
        ],
        "Fede": [
            {"day": "JUE", "start": "12:00", "end": "12:30"},
            {"day": "JUE", "start": "13:30", "end": "14:00"},
            {"day": "MAR", "start": "12:00", "end": "12:30"},
            {"day": "MIE", "start": "12:00", "end": "12:30"},
            {"day": "VIE", "start": "12:30", "end": "13:30"},
            {"day": "VIE", "start": "13:30", "end": "14:00"},
            {"day": "VIE", "start": "14:00", "end": "15:00"},
            {"day": "VIE", "start": "15:00", "end": "15:30"},
        ],
        "Maru": [
            {"day": "JUE", "start": "14:00", "end": "15:00"},
            {"day": "LUN", "start": "11:00", "end": "12:00"},
            {"day": "LUN", "start": "15:30", "end": "16:30"},
            {"day": "LUN", "start": "9:30", "end": "10:30"},
            {"day": "MAR", "start": "15:00", "end": "15:30"},
            {"day": "MAR", "start": "16:30", "end": "17:00"},
        ],
        "Nico": [
            {"day": "LUN", "start": "10:30", "end": "11:00"},
            {"day": "LUN", "start": "8:00", "end": "9:00"},
            {"day": "MAR", "start": "14:00", "end": "15:00"},
            {"day": "MAR", "start": "15:30", "end": "16:30"},
            {"day": "MAR", "start": "8:00", "end": "9:00"},
            {"day": "MIE", "start": "8:00", "end": "9:00"},
            {"day": "VIE", "start": "11:00", "end": "12:00"},
            {"day": "VIE", "start": "12:00", "end": "12:30"},
            {"day": "VIE", "start": "8:00", "end": "9:00"},
        ],
        "Santi": [
            {"day": "LUN", "start": "15:00", "end": "15:30"},
            {"day": "MAR", "start": "10:30", "end": "11:00"},
            {"day": "MAR", "start": "13:30", "end": "14:00"},
            {"day": "MAR", "start": "9:30", "end": "10:30"},
            {"day": "MIE", "start": "13:30", "end": "14:00"},
            {"day": "MIE", "start": "16:30", "end": "17:00"},
            {"day": "VIE", "start": "15:30", "end": "16:30"},
            {"day": "VIE", "start": "16:30", "end": "17:00"},
        ],
        "Dave": [
            {"day": "JUE", "start": "10:30", "end": "11:00"},
            {"day": "JUE", "start": "9:00", "end": "9:30"},
            {"day": "LUN", "start": "12:00", "end": "12:30"},
            {"day": "LUN", "start": "13:30", "end": "14:00"},
            {"day": "LUN", "start": "9:00", "end": "9:30"},
            {"day": "MAR", "start": "9:00", "end": "9:30"},
            {"day": "MIE", "start": "15:00", "end": "15:30"},
            {"day": "MIE", "start": "9:00", "end": "9:30"},
            {"day": "VIE", "start": "10:30", "end": "11:00"},
            {"day": "VIE", "start": "9:00", "end": "9:30"},
        ],
    },
    "remote": {
        "Andres": [
            {"day": "JUE", "start": "14:00", "end": "15:00"},
            {"day": "JUE", "start": "15:00", "end": "15:30"},
            {"day": "JUE", "start": "15:30", "end": "16:30"},
            {"day": "JUE", "start": "16:30", "end": "17:00"},
            {"day": "JUE", "start": "17:00", "end": "18:00"},
            {"day": "JUE", "start": "9:00", "end": "9:30"},
            {"day": "LUN", "start": "12:30", "end": "13:30"},
            {"day": "LUN", "start": "15:00", "end": "15:30"},
            {"day": "MAR", "start": "10:30", "end": "11:00"},
            {"day": "VIE", "start": "12:30", "end": "13:30"},
            {"day": "VIE", "start": "13:30", "end": "14:00"},
            {"day": "VIE", "start": "14:00", "end": "15:00"},
            {"day": "VIE", "start": "15:00", "end": "15:30"},
            {"day": "VIE", "start": "16:30", "end": "17:00"},
        ],
        "Ardilla": [
            {"day": "JUE", "start": "10:30", "end": "11:00"},
            {"day": "JUE", "start": "12:00", "end": "12:30"},
            {"day": "JUE", "start": "12:30", "end": "13:30"},
            {"day": "JUE", "start": "13:30", "end": "14:00"},
            {"day": "LUN", "start": "13:30", "end": "14:00"},
            {"day": "LUN", "start": "15:30", "end": "16:30"},
            {"day": "MAR", "start": "12:30", "end": "13:30"},
            {"day": "MAR", "start": "9:30", "end": "10:30"},
            {"day": "MIE", "start": "11:00", "end": "12:00"},
            {"day": "MIE", "start": "14:00", "end": "15:00"},
            {"day": "VIE", "start": "11:00", "end": "12:00"},
            {"day": "VIE", "start": "15:30", "end": "16:30"},
        ],
        "Fede": [
            {"day": "JUE", "start": "11:00", "end": "12:00"},
            {"day": "MAR", "start": "11:00", "end": "12:00"},
            {"day": "MAR", "start": "13:30", "end": "14:00"},
            {"day": "MIE", "start": "12:30", "end": "13:30"},
            {"day": "MIE", "start": "13:30", "end": "14:00"},
            {"day": "MIE", "start": "15:00", "end": "15:30"},
            {"day": "VIE", "start": "12:00", "end": "12:30"},
        ],
        "Maru": [
            {"day": "LUN", "start": "10:30", "end": "11:00"},
            {"day": "LUN", "start": "12:00", "end": "12:30"},
            {"day": "LUN", "start": "14:00", "end": "15:00"},
            {"day": "LUN", "start": "8:00", "end": "9:00"},
            {"day": "MAR", "start": "14:00", "end": "15:00"},
            {"day": "MAR", "start": "15:30", "end": "16:30"},
        ],
        "Nico": [
            {"day": "LUN", "start": "9:00", "end": "9:30"},
            {"day": "LUN", "start": "9:30", "end": "10:30"},
            {"day": "MAR", "start": "15:00", "end": "15:30"},
            {"day": "MAR", "start": "16:30", "end": "17:00"},
            {"day": "MAR", "start": "17:00", "end": "18:00"},
            {"day": "MAR", "start": "9:00", "end": "9:30"},
            {"day": "MIE", "start": "12:00", "end": "12:30"},
            {"day": "MIE", "start": "16:30", "end": "17:00"},
            {"day": "MIE", "start": "17:00", "end": "18:00"},
        ],
        "Santi": [
            {"day": "LUN", "start": "16:30", "end": "17:00"},
            {"day": "LUN", "start": "17:00", "end": "18:00"},
            {"day": "MAR", "start": "12:00", "end": "12:30"},
            {"day": "MAR", "start": "8:00", "end": "9:00"},
            {"day": "MIE", "start": "15:30", "end": "16:30"},
            {"day": "VIE", "start": "17:00", "end": "18:00"},
        ],
        "Dave": [
            {"day": "JUE", "start": "8:00", "end": "9:00"},
            {"day": "JUE", "start": "9:30", "end": "10:30"},
            {"day": "LUN", "start": "11:00", "end": "12:00"},
            {"day": "MIE", "start": "8:00", "end": "9:00"},
            {"day": "VIE", "start": "8:00", "end": "9:00"},
        ],
    },
}

assistant_codes = {
    "Andres": 201913554,
    "Ardilla": 202020609,
    "Fede": 202021525,
    "Maru": 202011140,
    "Nico": 201922019,
    "Santi": 202112020,
    "Dave": 202021113,
}

days_mapping = {'LUN': 'Monday', 'MAR': 'Tuesday',
                'MIE': 'Wednesday', 'JUE': 'Thursday', 'VIE': 'Friday'}


sql_template = """
INSERT INTO scheduled_slots (schedule_id, assistant_availability_id, is_remote)
VALUES ('a3bb189e-8bf9-3888-9912-ace4e6543002', 
  (SELECT id FROM assistant_availabilities WHERE assistant_code = {} AND time_slot_id =
    (SELECT id FROM time_slots WHERE day = '{}' AND start_hour = {}))
, {});
"""

sql_script = """
-- insert-scheduled-slots.sql

-- SQL script to insert an example of scheduled slots belonging to a schedule.
-- Execute with `psql -U postgres -d cupihorarios -f insert-scheduled-slots.sql`.

"""


for remote, assistants in availabilities.items():
    for assistant, slots in assistants.items():
        for slot in slots:
            day = days_mapping[slot["day"]]
            start_hour = int(slot["start"].replace(":", ""))
            is_remote = 'true' if remote == "remote" else 'false'
            sql_script += sql_template.format(
                assistant_codes[assistant], day, start_hour, is_remote)


current_dir = path.dirname(path.realpath(__file__))
with open(path.join(current_dir, "insert-scheduled-slots.sql"), "w") as f:
    f.write(sql_script)
