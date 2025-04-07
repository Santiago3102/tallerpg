-- Por color, cuanto pesan esas partes.

select color, sum(peso) as suma_peso
from Partes
group by color

-- ¿Cuántos proyectos hay por cada ciudad?

select ciudad, count(ciudad) as proyectos_por_ciudad
from Proyectos
group by ciudad 

-- ¿Por cada proyecto y por proveedor, cuantas partes se comprado y el total de partes?

select y_id, v_id, sum(cant) as cantidad_partes, count(*)
from Envios
group by y_id, v_id
order by y_id

select y_id, v_id, sum(cant) as cantidad_partes, count(*) as numero_envios,
    (select sum(cant) 
     from envios) as total_partes,
     round(
        (sum(cant)::decimal / (SELECT sum(cant)::decimal FROM envios)) * 100, 
        4
    ) as porcentaje
from Envios
group by y_id, v_id
order by y_id;


/*
 * ¿Cuál es el nombre del proyecto, la ciudad del proyecto y la cantidad de partes, del proyecto que más partes ha
 * necesitado?
 */

select e.y_id, p.proyecto, p.ciudad, sum(cant) as max_cantidad_partes
from envios e 
join proyectos p on e.y_id =p.y_id
group by e.y_id, p.proyecto, p.ciudad 
having sum(cant) = (select max(cantidad_partes)
                    from (select e2.y_id, sum(cant) as cantidad_partes
                          from envios e2
                          group by e2.y_id)) 

                          

/*
 * ¿Cuál es el nombre del proyecto, el nombre de la parte y nombre proveedor de aquellos proyectos que han usado
 * dos o más partes de diferentes proveedores?
 */

select e.y_id, e.p_id, p.proyecto, p2.parte, count(e.p_id) as mas_2_partes
from envios e 
join proyectos p on e.y_id = p.y_id 
join partes p2 on e.p_id = p2.p_id
join proveedores p3 on e.v_id = p3.v_id
group by e.y_id, e.p_id, p.proyecto, p2.parte
having count(*) >= 2 



select e.y_id, e.p_id, p.proyecto, p2.parte, p3.proveedor
from envios e
join proyectos p on e.y_id = p.y_id
join partes p2 on e.p_id = p2.p_id
join proveedores p3 on e.v_id = p3.v_id
where exists (select 1
              from envios e2
              where e2.y_id = e.y_id 
              and e2.p_id = e.p_id
              group by e2.y_id, e2.p_id
              having count(distinct e2.v_id) >= 2
              )
order by p.proyecto, p2.parte, p3.proveedor;

                         
/*
 * El status de los proveedores ha subido de la siguiente forma: los que tengan un status mayor al promedio del
 * status subirán en un valor del 20 % de su valor actual, de lo contrario subirá en 10%.
 */

select v_id, proveedor, status as status_actual, status * 1.20 as nuevo_status, 'Aumento 20%' as tipo_aumento
from  proveedores
where status > (select avg(status) from proveedores)
union all
select v_id, proveedor, status as status_actual, status * 1.10 as nuevo_status, 'Aumento 10%' as tipo_aumento
from proveedores
where status <= (select avg(status) from proveedores)
order by v_id;



