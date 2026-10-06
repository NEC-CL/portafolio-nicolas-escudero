-- Parte I. N:N mediante tabla intermedia con clave compuesta.
CREATE TABLE peliculas (id integer PRIMARY KEY,nombre varchar(255),anno integer);
CREATE TABLE tags (id integer PRIMARY KEY,tag varchar(32));
CREATE TABLE pelicula_tag (
    pelicula_id integer REFERENCES peliculas(id),
    tag_id integer REFERENCES tags(id),
    PRIMARY KEY (pelicula_id,tag_id)
);
INSERT INTO peliculas VALUES (1,'Película Uno',2020),(2,'Película Dos',2021),
(3,'Película Tres',2022),(4,'Película Cuatro',2023),(5,'Película Cinco',2024);
INSERT INTO tags VALUES (1,'Drama'),(2,'Aventura'),(3,'Comedia'),(4,'Familiar'),(5,'Suspenso');
INSERT INTO pelicula_tag VALUES (1,1),(1,2),(1,3),(2,4),(2,5);
-- Parte II. Tipos y nombres según el diagrama proporcionado.
CREATE TABLE preguntas (id integer PRIMARY KEY,pregunta varchar(255),respuesta_correcta varchar);
CREATE TABLE usuarios (id integer PRIMARY KEY,nombre varchar(255),edad integer);
CREATE TABLE respuestas (
    id integer PRIMARY KEY,
    respuesta varchar(255),
    usuario_id integer REFERENCES usuarios(id),
    pregunta_id integer REFERENCES preguntas(id)
);
INSERT INTO preguntas VALUES
(1,'¿Cuánto es 2 + 2?','4'),(2,'¿Capital de Chile?','Santiago'),
(3,'¿Lenguaje de este curso?','Python'),(4,'¿Cuánto es 3 + 3?','6'),
(5,'¿Motor de base de datos utilizado?','PostgreSQL');
INSERT INTO usuarios VALUES (1,'Ana',20),(2,'Bruno',21),(3,'Carla',22),(4,'Diego',23),(5,'Elena',24);
INSERT INTO respuestas VALUES (1,'4',1,1),(2,'4',2,1),(3,'Santiago',3,2),
(4,'Java',4,3),(5,'7',5,4);
