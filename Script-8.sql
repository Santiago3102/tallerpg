/*
 * 1. Usando el comando DISTINCT (consultar por internet como funciona) mostrar
 * solo la lista de propiedades que han sido visitadas.
 * 2. ¿Cuáles son las personas con el sueldo más alto y el más bajo?
 * 3. ¿Cuanto se debe pagar laboralmente por cada sucursal?
 * 4. ¿Cuál es el máximo, mínimo y el promedio del salario de los empleados?
 * 5. Mostrar por cada sucursal, por cada cargo y por el sexo, el número de personas
 * y el pago total del salario.
 */

 /*
 * 6. Cuál es el cliente que más ha visitado propiedades para alquiler? 
 */

select c.clientno, c.fname, c.lname
from client c 
join viewing v on c.clientno = v.clientno
group by c.clientno, c.fname, c.lname 
having count(*) = (select max(contar)
                         from( select clientno, count(clientno) as contar 
                         from viewing 
                         group by clientno) 
                         )
        

select b.branchno, count(branchno)
from branch b 
group by 
b.branchno 

select s.branchno, count(branchno)
from staff s 
group by 
s.branchno



select b.branchno, count(branchno)
from branch b 
join staff s on b.branchno = s.branchno
join propertyforrent p on b.branchno = p.branchno
group by b.branchno




select b.branchno, count(b.branchno ) as empleados_sucursal
from branch b 
join staff s on b.branchno = s.branchno
group by b.branchno

select p.branchno, count(branchno) as propiedas_sucursal
from propertyforrent p 
group by
p.branchno




select t1.branchno, t1.empleados_sucursal, t2.propiedas_sucursal
from (
select b.branchno, count(b.branchno ) as empleados_sucursal
from branch b 
join staff s on b.branchno = s.branchno
group by b.branchno
) t1 
join (
select p.branchno, count(branchno) as propiedas_sucursal
from propertyforrent p 
group by p.branchno
) t2 on t1.branchno = t2.branchno




select b.*, (select count(*) as empleados_sucursal
             from staff s 
             where s.branchno = b.branchno), 
             (select count(*) as propiedades_sucursal 
             from propertyforrent p 
             where p.branchno = b.branchno)
from branch b


select 
from
(select v.propertyno, count(p.propertyno ) as propiedades_mas_visitada
from viewing v 
join 
propertyforrent p on p.propertyno = v.propertyno
group by v.propertyno) t1 
full outer join
(select p.city, count(p.city)
from propertyforrent p 
group by p.city) t2

/*
 * 7. ¿Cuál es la ubicación y la propiedad más visita para arrendar?
 */

select p.propertyno, p.street, count(*) as visitas_propiedad
from propertyforrent p 
join viewing v on p.propertyno  = v.propertyno 
group by p.propertyno, p.street  
having count(*) = (select max(contar)
                         from ( select propertyno, count(propertyno) as contar 
                         from (select propertyno 
                               from viewing v2
                               except 
                               select propertyno 
                               from lease l 
                               ) 
                         group by propertyno ) 
                         )
                         
/*
 * 8. ¿Cuál es la persona que más propiedades tiene a su cargo para alquilar?
 */


select s.staffno, s.fname, s.lname 
from staff s 
join propertyforrent p  on s.staffno = p.staffno
group by s.staffno, s.fname, s.lname
having count(*) = (select max(contar)
                         from ( select s3.staffno , count(*) as contar 
                         from (select s2.staffno 
                               from staff s2
                               join propertyforrent p2 on s2.staffno = p2.staffno ) s3  
                         group by s3.staffno ) 
                         )        

                         
select s.staffno , count(*)
from staff s 
join propertyforrent p on p.staffno = s.staffno
group by s.staffno 
