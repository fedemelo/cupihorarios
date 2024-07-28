# CupiHorarios

CupiHorarios is a RESTful API, built with FastAPI, that generates optimal schedules for the assistants of the University of the Andes' programming support center, CupiTaller. The schedule is generated based on the availability of the assistants and the number of hours they should work proportionally to their contract, striving to cover all time slots from 8:00 a.m. to 6:00 p.m. from Monday to Friday.

## Caveats

It may happen that due to the availability of the assistants, it is impossible to generate a schedule that covers all intended time slots. In such case, the best possible schedule will be generated.

## Design

1. [User Stories](https://github.com/fedemelo/cupi-horarios/wiki/User-Stories)
3. [Backend Design](https://github.com/fedemelo/cupi-horarios/wiki/Backend-Design)

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

5. Create the database.

   There are three alternatives to create the database: creating an empty database, create an database with dummy data or restore a database backup. The scripts to perform these actions are located in the `db` directory, and are, respectively, `create-empty-db.sh`, `create-full-test-db.sh` and `restore-db-backup.sh`.

   E.g., to restore a database backup, run the following command:

   Unix:

   ```shell
   cd backend/db
   sh restore-db-backup.sh
   ```

   There's also a script to save a backup of the current database, `save-db-backup.sh`.

   Windows:

   The scripts are not compatible with Windows. Instead of running a script, commands on the script must be run manually in the `db` directory.

   For example, to restore a database backup, run the following commands:

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


## Setting up Postgres

If Postgres is not installed in the local machine, the server will fail to establish a connection to a database and be unable to run.

The application was built with Postgres 14. To install it and start the service:

Mac:
```shell
brew install postgresql@14
brew services restart postgresql@14
```

After installing Postgres, the service might still fail as it is designed to run with a specific database user and password. In order to create a new role in Postgres, run the following commands:

Unix:

```shell
psql -U $(whoami) -d postgres
CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD 'postgres';
```

In the example above, a role `postgres` with password `postgres` is created. After that, the application should start correctly and the scripts should work as well.