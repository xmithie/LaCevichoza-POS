#!/usr/bin/env bash
set -euo pipefail

# Este script corre dentro del init del contenedor "postgres:17".
# Restaura el dump personalizado a la DB $POSTGRES_DB.

DUMP="/init/sql/lacevichoza_db.sql"   # OJO: es dump "custom" aunque termine en .sql

if [ ! -f "$DUMP" ]; then
  echo "No se encontró $DUMP; se omite restauración inicial."
  exit 0
fi

# Espera a que PostgreSQL acepte conexiones durante el init
until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null 2>&1; do
  echo "Esperando a PostgreSQL..."
  sleep 1
done

echo "Restaurando dump en $POSTGRES_DB..."
# --no-owner: ignora propietarios del origen
# --clean --if-exists: limpia objetos si ya existieran (primer init no hará falta)
pg_restore -U "$POSTGRES_USER" \
  --clean --if-exists --no-owner \
  -d "$POSTGRES_DB" "$DUMP"

echo "Restauración completada."
