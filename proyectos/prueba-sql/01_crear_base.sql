\set ON_ERROR_STOP on
\encoding UTF8
-- Crear una base NUEVA. Si existe, este script se detiene sin borrarla.
CREATE DATABASE "prueba_fundamentos_nicolas_407";
\connect "prueba_fundamentos_nicolas_407"
SELECT current_database() AS base_de_datos;
