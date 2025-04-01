select c.clientno, c.fname, c.lname
from client c 
join viewing v on c.clientno = v.clientno
group by c.clientno 
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





