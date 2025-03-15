
/*
 * 9. Para mejorar los mecanismos de búsqueda se pueden crear índices para agilizar búsquedas
 * diferentes al uso de las PK. Buscar por internet como hacer esto y explicar la funcionalidad del
 * uso de índices, ventajas y desventajas de usarlos.
 * a. Crear un índice para la tabla de staff que use la concatenación de del nombre y apellido.
 * b. Crear un índice para la tabla de propertyforrent por la dirección. 
 */

-- a. Índice para Staff con concatenación de nombre y apellido

create index  idx_staff_fullname on Staff(fName, lName);

-- b. Índice para PropertyForRent por dirección

create index idx_property_address on PropertyForRent(street);

/*
 * 10. Incrementar el salario de los empleados en un 8% si laboran en la Londres, 6% en Glasgow y 5%
 * en otras ciudades. 
 */

-- Incremento del 8% para empleados en Londres

update Staff 
set salary = salary * 1.08
where branchNo in (select branchNo from Branch where city = 'London');

-- Incremento del 6% para empleados en Glasgow

update Staff 
set salary = salary * 1.06
where branchNo in (select branchNo from Branch where city = 'Glasgow');

-- Incremento del 5% para empleados en otras ciudades

update Staff 
set salary = salary * 1.05
where branchNo in (select branchNo from Branch where city not in ('London', 'Glasgow'));


/*
 * 11. Cambiar la palabra ‘Flat’ por ‘Apartamento’ y ‘House’ por ‘Casa’ en donde se encuentre.
 */

-- Cambiar 'Flat' por 'Apartamento'

update PropertyForRent
set type = 'Apartamento'
where type = 'Flat';

update PropertyForRent
set type = 'Apartamento'
where type = 'flat';

-- Cambiar 'House' por 'Casa'

update PropertyForRent
set type = 'Casa'
where type = 'House';

update PropertyForRent
set type = 'Casa'
where type = 'house';

/*
 * 12. Eliminar de la tabla de visitas el cliente CR56 que estuvo conoció la propiedad PG4. ¿Se pudo
 * borrar, si no se dejó explicar el por qué? Y luego hacer lo requerido para eliminarla. Explique
 * todo los que realizo.
 */

delete from viewing
where clientNo = 'CR56' and propertyNo = 'PG4';

-- Algunas consultas para probar las diferentes consultas realizadas 

select * 
from viewing v 

select *
from propertyforrent p 

select *
from staff s 


