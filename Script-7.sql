select *
from estudiantes 

select * 
from profesores 

select * 
from cursos

select * 
from inscripciones 

select * 
from clases

/*
 * Lista los docentes con sus respectivos estudiantes, las asignaturas que estas cursando, el horario (de la clase) 
y su calificación (de cada estudiante). Los nombres de las docentes y estudiantes deben están en mayúsculas 
y concatenados (apellidos + nombres), deben renombrar los campos de salida para diferencia el nombre del 
docente del estudiante, 
 */

select UPPER(p.nombre||' '||p.apellido) as profesor, UPPER(e.nombre||' '||e.apellido) as estudiante, c2.nombre, c.horario, i.calificacion  
from profesores p 
join clases c on c.profesor_id = p.profesor_id
join cursos c2 on c2.curso_id = c.curso_id
join inscripciones i on i.curso_id = c2.curso_id
join estudiantes e on e.estudiante_id = i.estudiante_id

/*
 * Hacer dos consultas por separado que listen todos los docentes a los que no se les ha asignado clases. Una 
usando EXISTS y la segunda por otro método pero que no tenga IN o EXISTS. 
 */

select p.profesor_id, p.nombre, p.apellido, p.especialidad
from  Profesores p
where not exists (
    select  1 
    from  Clases c 
    where  c.profesor_id = p.profesor_id
);

/*
 * 
Listar la información de los estudiantes, el curso (asignatura), los créditos y el valor calculado de nota por 
créditos que llamaran NotaXCreditos, de aquellos cuya nota esta entre 7.5 y 8.9. 
 */

select  p.profesor_id, p.nombre, p.apellido, p.especialidad
from  Profesores p
left  join Clases c on  p.profesor_id = c.profesor_id
where c.profesor_id is  null ;

select  
    e.estudiante_id, e.nombre, e.apellido, e.email, c.nombre AS curso, c.descripcion, c.creditos,
    i.calificacion, (i.calificacion * c.creditos) AS NotaXCreditos
from Estudiantes e
join Inscripciones i on e.estudiante_id = i.estudiante_id
join Cursos c on i.curso_id = c.curso_id
where i.calificacion between 7.5 and 8.9
order by e.estudiante_id, c.nombre;
 
/*
 * Listar todos los correos usados en la institución. 
 */

select p.email 
from profesores p 
union 
select e.email 
from estudiantes e 

