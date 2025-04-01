-- 1. Mostrar la información de todos los clientes.

SELECT * FROM Client;


-- 2. Mostrar el nombre, el apellido, la fecha de nacimiento del empleado y la edad a la fecha (número de años).

SELECT 
    fname AS nombre, 
    lname AS apellido, 
    CASE 
        WHEN EXTRACT(YEAR FROM DOB) > EXTRACT(YEAR FROM CURRENT_DATE) 
        THEN DOB - INTERVAL '100 years' 
        ELSE DOB 
    END AS fecha_nacimiento_corregida,
    CASE 
        WHEN EXTRACT(YEAR FROM DOB) > EXTRACT(YEAR FROM CURRENT_DATE) 
        THEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, DOB - INTERVAL '100 years')) 
        ELSE EXTRACT(YEAR FROM AGE(CURRENT_DATE, DOB)) 
    END AS edad
FROM Staff;


-- 3. Mostrar el nombre y el apellido en minúsculas.

SELECT 
    LOWER(fname) AS nombre_minuscula, 
    LOWER(lname) AS apellido_minuscula
FROM Staff;


-- 4. Mostrar el nombre y el apellido con las iniciales en mayúsculas.

SELECT 
    INITCAP(fname) AS nombre_inicial_mayuscula, 
    INITCAP(lname) AS apellido_inicial_mayuscula
FROM Staff;


-- 5. Listar los clientes quienes solo están interesados en apartamentos

SELECT * 
FROM Client
WHERE prefType = 'Flat';


-- 6. Listar los clientes que pueden pagar más de 420 al mes.

SELECT *
FROM Client
WHERE maxRent > 420;


-- 7. Listar todos los empleados, además mostrar una nueva columna con el valor de cuanto se debe pagar por el año.

SELECT 
    staffNo,
    fname,
    lname,
    position,
    salary,
    salary * 12 AS salario_anual
FROM Staff;


-- 8. Mostrar la información de todos los propietarios o dueños de propiedades pero que aparezcan los nombres de los campos en español.

SELECT 
    ownerNo AS numero_propietario,
    fname AS nombre,
    lName AS apellido,
    address AS direccion,
    telNo AS telefono
FROM PrivateOwner;


-- 9. Mostrar toda la información de los clientes, pero los nombres deben aparecer en un solo campo (concatenación).

SELECT 
    clientNo,
    fname || ' ' || lname AS nombre_completo,
    telNo,
    prefType,
    maxRent
FROM Client;


-- 10. Hacer los ejercicios de unión, diferencia, intersección de esta presentación y del libro guía.

-- Unión: Todos los clientes y propietarios con sus nombres y apellidos

SELECT fname, lname FROM Client
UNION
SELECT fname, lname FROM PrivateOwner;


-- Intersección: Nombres que existen tanto en clientes como en propietarios

SELECT fname FROM Client
INTERSECT
SELECT fname FROM PrivateOwner;


-- Diferencia: Nombres de clientes que no son propietarios

SELECT fname FROM Client
EXCEPT
SELECT fname FROM PrivateOwner;


-- Ejemplo de JOIN: Mostrar propiedades con información de sus dueños

SELECT p.propertyNo, p.street, p.city, o.fname, o.lname
FROM PropertyForRent p
JOIN PrivateOwner o ON p.ownerNo = o.ownerNo;


-- Ejemplo de JOIN múltiple: Propiedades, empleados y sucursales

SELECT p.propertyNo, p.street, p.city, s.fname AS staff_name, b.city AS branch_city
FROM PropertyForRent p
LEFT JOIN Staff s ON p.staffNo = s.staffNo
JOIN Branch b ON p.branchNo = b.branchNo;


SELECT c.clientno, c.fname, c.lname, propertyno, v.clientno, v."comment" 
FROM client c 
NATURAL JOIN viewing v 


SELECT b.city, p.city, b.branchno, p.branchno, b.street, p.street
FROM branch b 
NATURAL JOIN propertyforrent p  
/* No sirvió, pues todas las columnas iguales debe tener elementos iguales para poder mostrar algo, 
 * cuando hay tantas columnas iguales no muestra nada, pues debe ser comun en todos los campos. }
 * Por este motivo, no se recomienda su uso. 
*/

SELECT p.staffno, s.staffno
FROM propertyforrent p  
JOIN staff s on p.staffno = s.staffno


select s.staffno, p.staffno, p.propertyno
from propertyforrent p 
left outer join staff s on p.staffno = s.staffno
/* Selecciona todo lo que tenga valores en comun y tambien los que tiene valores nulos, para asi mostrar todos 
 * los registros segun se requiera. 
 */

 

Select ClientNo
From Viewing t1
except
Select ClientNo
From (Select Clientno, PropertyNo
      From PropertyForRent
      Cross Join (Select ClientNo
                  From Viewing)
      Where Rooms = 3
      except
      Select ClientNo, PropertyNo
      From Viewing)
      
      

              
select clientno
from (select v.clientno
      from viewing v)
except 
select clientno
from (select * 
      from (select clientno
            from viewing)
            cross join propertyforrent
            where rooms = 3)
      except 
      select clientno
      from viewing 
      
      
Select count(*) as NroPropiedades, sum(rent) as ValorRenta
From PropertyForRent pfr
Where rent > 400    

select *, (select AVG(s.salary)
           from staff s), (s.salary - (select AVG(s.salary)
           from staff s)) as diferenciaSalario 
from staff s 
where (select AVG(st.salary) from staff st) > s.salary

 

Select BranchNo, Count(*) As NroEmpleados, Sum(salary) As SalarioAPagar
From Staff
Group By BranchNo

select * 
from branch b
join staff s on (b.branchno = s.branchno )
 		      