@echo off

set "DB_NAME=cupihorarios"

:: Cambiar al directorio del script
cd /d "%~dp0"

:: Borrar la base de datos si existe
psql -U postgres -c "DROP DATABASE IF EXISTS %DB_NAME%;"
:: Crear una nueva base de datos
psql -U postgres -c "CREATE DATABASE %DB_NAME%;"

:: Descomprimir el backup de la base de datos con la herramienta de descompresión de Windows
tar -xf .\backups\%DB_NAME%-empty.sql.gz -O | psql -U postgres -d %DB_NAME%

:: Ejecutar scripts SQL para insertar datos
psql -U postgres -d %DB_NAME% -f insert-assistants.sql
psql -U postgres -d %DB_NAME% -f insert-time-slots.sql
psql -U postgres -d %DB_NAME% -f insert-assistant-availabilities.sql
psql -U postgres -d %DB_NAME% -f insert-schedule.sql
psql -U postgres -d %DB_NAME% -f insert-scheduled-slots.sql

echo Database setup completed.
pause
