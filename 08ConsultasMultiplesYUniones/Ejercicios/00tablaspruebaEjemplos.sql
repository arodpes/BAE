use tablasprueba
go
select id,valor1 from tabla1;
select id,valor2 from tabla2;
go
--tablas cruzadas
select t1.id,valor1,t2.id,valor2
from tabla1 as t1,tabla2 as t2;
go

--inner join
select t1.id,t1.valor1,t2.id,t2.valor2
from tabla1 as t1
inner join tabla2 as t2
	on t1.id=t2.id;
go

--naturan join (mysql)
--select t1.id,t1.valor,t2.id,t2.valor
--from tabla1 as t1
--natural join tabla2 as t2

--left outer join
select t1.id,valor1,t2.id,valor2
from tabla1 as t1
left outer join tabla2 as t2
	on t1.id=t2.id;
go

select t1.id,valor1,t2.id,valor2
from tabla1 as t1
left join tabla2 as t2
	on t1.id=t2.id;
go

--right outer join
select t1.id,valor1,t2.id,valor2
from tabla1 as t1
right outer join tabla2 as t2
	on t1.id=t2.id;
go

select t1.id,valor1,t2.id,valor2
from tabla1 as t1
right join tabla2 as t2
	on t1.id=t2.id;
go

--full join
select t1.id,valor1,t2.id,valor2
from tabla1 as t1
full join tabla2 as t2
	on t1.id=t2.id;
go


--cross join
select t1.id,valor1,t2.id,valor2
from tabla1 as t1
cross join tabla2 as t2;
go