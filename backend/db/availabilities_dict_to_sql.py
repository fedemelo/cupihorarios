from os import path


Andres = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 0,
          'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 0,
          'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
          'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
          'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 1,
          'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
          'Lun, 12:30-13:30': 1, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
          'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
          'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 1,
          'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 1, 'Vie, 15:00-15:30': 1,
          'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 1, 'Vie, 15:30-16:30': 1,
          'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 1, 'Vie, 16:30-17:00': 1,
          'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 1, 'Vie, 17:00-18:00': 0}

Camilo = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
          'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
          'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 1, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
          'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 1, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
          'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 1,
          'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
          'Lun, 12:30-13:30': 1, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
          'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
          'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 1,
          'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 1, 'Vie, 15:00-15:30': 1,
          'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 1, 'Vie, 15:30-16:30': 1,
          'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 1, 'Vie, 16:30-17:00': 1,
          'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 1, 'Vie, 17:00-18:00': 1}

Federico = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
            'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
            'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
            'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
            'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 0,
            'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
            'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
            'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 1, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
            'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 1,
            'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 1,
            'Lun, 15:30-16:30': 0, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
            'Lun, 16:30-17:00': 0, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
            'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

Mariana = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
           'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
           'Lun, 9:30-10:30': 1, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
           'Lun, 10:30-11:00': 1, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
           'Lun, 11:00-12:00': 1, 'Mar, 11:00-12:00': 0, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 1,
           'Lun, 12:00-12:30': 1, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 1,
           'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
           'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
           'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 0,
           'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 1, 'Mie, 15:00-15:30': 0, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
           'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 1, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
           'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
           'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

Nicolas = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 1, 'Mie, 8:00-9:00': 1, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 1,
           'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 0,
           'Lun, 9:30-10:30': 1, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
           'Lun, 10:30-11:00': 1, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
           'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 0, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 1,
           'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 1,
           'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
           'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
           'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 0,
           'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 1, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
           'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 1, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
           'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
           'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

Santiago = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 1, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
            'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
            'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
            'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
            'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 0,
            'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 0,
            'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 0,
            'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 1, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
            'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 0,
            'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
            'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 1,
            'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 1,
            'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 1}

Mario = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 1, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 1,
         'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 1, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 1,
         'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 1,
         'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 1,
         'Lun, 11:00-12:00': 1, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 0,
         'Lun, 12:00-12:30': 1, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 0,
         'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
         'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
         'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 0,
         'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
         'Lun, 15:30-16:30': 0, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 1,
         'Lun, 16:30-17:00': 0, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
         'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

assistants = [Andres, Camilo, Federico, Mariana, Nicolas, Santiago, Mario]
assistant_codes = [201913554, 201820147, 202021525,
                   202011140, 201922019, 202112020, 194821525]
days_mapping = {'Lun': 'MONDAY', 'Mar': 'TUESDAY',
                'Mie': 'WEDNESDAY', 'Jue': 'THURSDAY', 'Vie': 'FRIDAY'}


sql_template = """
INSERT INTO assistant_availabilities (id, assistant_code, time_slot_id, virtual_only) 
VALUES (uuid_generate_v4(), {}, (SELECT id FROM time_slots WHERE day = '{}' AND start_hour = {}), false);
"""

sql_script = """
-- insert-assistant-availabilities.sql

-- Execute with `psql -U postgres -d cupihorarios -f insert-assistant-availabilities.sql`

"""


for assistant in assistants:
    for time_slot, availability in assistant.items():
        day, hour = time_slot.split(', ')
        start_hour = int(hour.split('-')[0].replace(':', ''))
        code = assistant_codes[assistants.index(assistant)]
        day = days_mapping[day]
        if availability:
            sql_script += sql_template.format(code, day, start_hour)


current_dir = path.dirname(path.abspath(__file__))
sql_script_path = path.join(current_dir, 'insert-assistant-availabilities.sql')
with open(sql_script_path, 'w') as f:
    f.write(sql_script)
