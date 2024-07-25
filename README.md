# CupiHorarios

CupiHorarios is a RESTful API, built with FastAPI, that generates optimal schedules for the assistants of the University of the Andes' programming support center, CupiTaller. The schedule is generated based on the availability of the assistants and the number of hours they should work proportionally to their contract, striving to cover all time slots from 8:00 a.m. to 6:00 p.m. from Monday to Friday.

## Caveats

It may happen that due to the availability of the assistants, it is impossible to generate a schedule that covers all intended time slots. In such case, the best possible schedule will be generated.

## Instructions to Set Up the Local Development Environment

The project must be run using [Python 3.11.3](https://www.python.org/downloads/release/python-3113/).

1. Create a virtual environment

   ```shell
   python -m venv venv
   ```

2. Activate the virtual environment

   Unix:

   ```shell
   source venv/bin/activate
   ```

   Windows:

   ```batch
   venv\Scripts\activate.bat
   ```

3. Install dependencies

   ```shell
   pip install -r requirements.txt
   ```

   Note for Windows users: Note that the `uvloop` package is not compatible with Windows. It must be manually removed from the ´requirements.txt´ file before running the command. Its removal will not affect the functionality of the server.

4. Install GLPK solver

    Mac:

    ```shell
    brew install glpk
    ```

    After the installation, verify that the solver is correctly installed and accessible by running the following command:

    ```shell
    which glpsol
    ```

    The output should be the path to the `glpsol` executable.

5. Create the database

   Unix:

   ```shell
   cd db
   sh restore-db-backup.sh
   ```

   Windows:

   The script is not compatible with Windows. To restore the database in a Windows machine, the following commands must be run in the `db` directory:

   ```batch
   psql -U postgres -c "DROP DATABASE IF EXISTS \"cupihorarios\";"
   psql -U postgres -c "CREATE DATABASE \"cupihorarios\";"
   "C:\Program Files\7-Zip\7z.exe" e ./backups/cupihorarios-backup.sql.gz -o./backups
   psql -U postgres -d postgres -f ./backups/cupihorarios-backup.sql
   ```

   The decompression tool used is 7-Zip, but any other tool can be used, replacing the path on the command accordingly.


6. Run the server. In the `backend` directory, run the following command:

   ```shell
   uvicorn src.main:app --reload --host 0.0.0.0 --port 8003
   ```

   The server will be running on `http://localhost:8003/v1.0`.


## Instrucciones (deprecated)

Si alguno modifica su disponibilidad, puede re generar el horario sin problema. Acá están los pasos.

1. Desde el Excel de disponibilidad (el de 2023-20 es [este](https://uniandes-my.sharepoint.com/:x:/r/personal/cupitaller_uniandes_edu_co/Documents/CupiTaller/2023-20/Disponibilidad%20asistentes.xlsx?d=w043e63795374456db0efc906c754b6c0&csf=1&web=1&e=6EnCSz)) copiar la disponibilidad. Únicamente copiar las letras, no las horas ni los días.
2. Pegar la disponibilidad en el archivo dispo_mas_reciente_del_excel.txt
3. Ejecutar el generador. Eso escribe los parámetros para el modelo en disponibilidad.txt
4. Copiar esa disponibilidad y pegarla en el modelo de Pyomo, optimizar_horarios.py, en el sitio apropiado (encima de la actual)

5. Esto son cosas para que el modelo no bote infactible. Todo eso, pa este semestre, ya está contemplado, pero el próximo me toca volverlo a mirar.
Puede que en algún horario ningún asistente pueda o que solo uno pueda, de forma que es imposible tener primario y secundario. Si eso pasa, toca decírselo al modelo. En ese caso se debe marcar en los parámetros m.ocupado_primario y m.ocupado_secundario el horario como si ya estuviese ocupado, para que el modelo no busque algo que no se puede (de lo contrario, el modelo será infactible y pues F)

En ese caso, pues van a quedar horarios vacíos, entonces toca mirar las horas. En este momento, los constraints están diseñados para un total de 48 horas de primario (en 2 horarios normales no se dan tutorías) y para 46 horas de secundario (en 2 exprés no hay secundario). Si por ejemplo la disponibilidad da para que todos los horarios tengan primario y secundario, las horas deberían ser 50 y 50 y se deberían cambiar los constraints. Las horas de primario deberían entonces sumar 50.

6. Ejecutar el modelo de Pyomo, optimizar_horarios.py
7. En horarios_pal_excel.txt, queda el horario generado. Se puede copiar y pegar directamente en el Excel (no en la pestaña de Disponibilidad, en la pestaña de Horarios)
