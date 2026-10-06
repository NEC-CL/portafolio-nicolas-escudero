# Fundamentos de bases de datos relacionales

Requiere PostgreSQL y el cliente `psql`. Desde esta carpeta:

```console
psql -X -h localhost -p 5432 -U postgres -d postgres -v ON_ERROR_STOP=1 -f ejecutar.sql
```

Ajuste host, puerto y usuario a su instalación. El script crea una base nueva, define tablas, carga datos ficticios y ejecuta las consultas. Si la base ya existe, se detiene sin borrarla.

`DESARROLLO.pdf` explica las operaciones y sus resultados. `evidencias` contiene capturas de ejecución en pgAdmin.
