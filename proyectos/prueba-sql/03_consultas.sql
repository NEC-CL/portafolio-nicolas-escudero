-- 3. LEFT JOIN mantiene películas sin tags; count(tag_id) devuelve cero.
SELECT p.id,p.nombre,count(pt.tag_id) AS cantidad_tags FROM peliculas p
LEFT JOIN pelicula_tag pt ON pt.pelicula_id=p.id GROUP BY p.id,p.nombre ORDER BY p.id;
-- 6. Aciertos por usuario, incluyendo cero.
SELECT u.id,u.nombre,count(r.id) FILTER (WHERE r.respuesta=p.respuesta_correcta) AS correctas
FROM usuarios u LEFT JOIN respuestas r ON r.usuario_id=u.id
LEFT JOIN preguntas p ON p.id=r.pregunta_id GROUP BY u.id,u.nombre ORDER BY u.id;
-- 7. Usuarios distintos que acertaron cada pregunta, incluyendo cero.
SELECT p.id,p.pregunta,count(DISTINCT r.usuario_id) AS usuarios_correctos FROM preguntas p
LEFT JOIN respuestas r ON r.pregunta_id=p.id AND r.respuesta=p.respuesta_correcta
GROUP BY p.id,p.pregunta ORDER BY p.id;
-- 8. Modificar la FK para habilitar cascada y borrar el primer usuario.
ALTER TABLE respuestas DROP CONSTRAINT respuestas_usuario_id_fkey;
ALTER TABLE respuestas ADD CONSTRAINT respuestas_usuario_id_fkey
FOREIGN KEY(usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE;
DELETE FROM usuarios WHERE id=1;
SELECT count(*) AS respuestas_del_usuario_eliminado FROM respuestas WHERE usuario_id=1;
-- 9. Impedir edades inferiores a 18.
ALTER TABLE usuarios ADD CONSTRAINT edad_adulta CHECK (edad>=18);
-- 10. Añadir email único a la tabla existente.
ALTER TABLE usuarios ADD COLUMN email varchar(255) UNIQUE;
