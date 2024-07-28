-- insert-assistants.sql

-- Execute with `psql -U postgres -d cupihorarios -f insert-assistants.sql`


BEGIN;

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (202021525, 'f.melo', 'Federico', 'Melo Barrero', 12, 'Fede');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (202021113, 'd.fuquen', 'David Alejandro', 'Fuquen Florez', 12, 'Dave');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (202112020, 's.martinezn', 'Santiago', 'Martinez Novoa', 12, 'Santi');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (202011140, 'm.ruizg', 'Mariana', 'Ruiz Giraldo', 12, 'Maru');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (202020609, 'g.ardila', 'Gabriel Eduardo', 'Ardila Carrillo', 12, 'Ardilla');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (201922019, 'n.carvajalc', 'Nicolas', 'Carvajal Chaves', 24, 'Nico');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, nickname)
VALUES (201913554, 'am.ochoat', 'Andres Martin', 'Ochoa Toro', 24, 'Andres');


END;