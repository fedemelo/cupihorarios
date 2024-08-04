-- insert-assistants.sql

-- Execute with `psql -U postgres -d cupihorarios -f insert-assistants.sql`


BEGIN;

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (202021525, 'f.melo', 'Federico', 'Melo Barrero', 12, true, 'Fede');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (202021113, 'd.fuquen', 'David Alejandro', 'Fuquen Florez', 12, false, 'Dave');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (202112020, 's.martinezn', 'Santiago', 'Martínez Novoa', 12, true, 'Santi');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (202011140, 'm.ruizg', 'Mariana', 'Ruiz Giraldo', 12, false, 'Maru');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (202020609, 'g.ardila', 'Gabriel Eduardo', 'Ardila Carrillo', 12, false, 'Ardilla');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (201914782, 'jd.vasquezh', 'Juan David', 'Vasquez Hernández', 12, false, 'Juanda');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (201922019, 'n.carvajalc', 'Nicolás', 'Carvajal Chaves', 23, false, 'Nico');

INSERT INTO assistants (code, login, first_names, last_names, hired_hours, is_admin, nickname)
VALUES (201913554, 'am.ochoat', 'Andrés Martín', 'Ochoa Toro', 23, false, 'Andrés');

END;