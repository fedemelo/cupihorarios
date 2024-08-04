# CupiHorarios API

CupiHorarios operates using a RESTful API built with [FastAPI](https://fastapi.tiangolo.com/), designed to generate optimal schedules for the assistants at the University of the Andes' programming support center, CupiTaller. The API considers the availability of each assistant and their contractual work hours to create schedules that aim to cover all time slots from 8:00 a.m. to 6:00 p.m., Monday to Friday.

The optimization process is powered by a Pyomo binary integer linear optimization model, aided by the GLPK solver, ensuring efficient and effective scheduling. In situations where it is impossible to cover all intended time slots due to assistants' availability, the API will generate the best possible schedule.

## Documentation

For documentation on design, refer to the documentation in the repository's wiki: [Backend Design](https://github.com/fedemelo/cupi-horarios/wiki/Backend-Design)

For documentation on the API, once the API is running, the Swagger documentation can be accessed at http://localhost:8003/v1.0.

## API Local Development Environment Setup

The API must be run using [Python 3.11.3](https://www.python.org/downloads/release/python-3113/).

All commands must be run in the `backend` directory.

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

   There are three alternatives to create the database: create an empty database, create a database with dummy data or restore a database backup. The scripts to perform these actions are located inside the `db/scripts` directory.

   E.g., to restore a database backup on a Unix machine, run the following command:

   Unix:

   ```shell
   cd backend/db/scripts
   sh restore-db-backup.sh
   ```

6. Run the server. In the `backend` directory, run the following command:

   ```shell
   python main.py
   ```

   The server will be running on http://localhost:8000/v1.0.


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