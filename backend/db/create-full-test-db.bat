@echo off

set "DB_NAME=cupihorarios"

:: Ruta de 7-Zip. Modificar en caso de que no esté instalado en la ruta predeterminada
set "ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

:: Cambiar al directorio del script
cd /d "%~dp0"

:: Borrar la base de datos si existe
psql -U postgres -c "DROP DATABASE IF EXISTS %DB_NAME%;"
:: Crear una nueva base de datos
psql -U postgres -c "CREATE DATABASE %DB_NAME%;"

:: Extraer el archivo gzip usando 7-Zip
"%ZIP_PATH%" e -so .\backups\%DB_NAME%-empty.sql.gz > .\backups\%DB_NAME%-empty.sql

:: Cargar el archivo SQL extraído en la base de datos
psql -U postgres -d %DB_NAME% -f .\backups\%DB_NAME%-empty.sql

:: Ejecutar scripts SQL para insertar datos
psql -U postgres -d %DB_NAME% -f insert-assistants.sql
psql -U postgres -d %DB_NAME% -f insert-time-slots.sql
psql -U postgres -d %DB_NAME% -f insert-assistant-availabilities.sql
psql -U postgres -d %DB_NAME% -f insert-schedule.sql
psql -U postgres -d %DB_NAME% -f insert-scheduled-slots.sql

echo Database setup completed.
pause
