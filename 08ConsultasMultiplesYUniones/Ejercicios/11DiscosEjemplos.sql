--inner join
use discos;
go

select titulo,interprete
from disco as d
inner join interprete as i
	on d.IdInterprete=i.IdInterprete;
go



--left outer join
use discos;
go
select Interprete,titulo
from interprete as i
left outer join disco as d
	on i.idinterprete=d.idinterprete
where d.idinterprete is null;
go

--right outer join
select nombre,puntuacion
from puntuacion as p
right outer join Cliente as c
	on c.id=p.Idcliente

where puntuacion is null

--full join
select interprete,titulo
from disco as d
full join interprete as i
	on d.idinterprete=i.IdInterprete;

--otro join
select interprete,titulo
from disco as d
inner join interprete as i
	on Interprete>titulo; 
	
--múltiples tablas
select d.Titulo,i.interprete,t.Tipo
from Disco as d
inner join DiscoTipo as dt
	on d.iddisco=dt.iddisco
inner join Tipo as t
	on t.idtipo=dt.idtipo
inner join Interprete as i
	on d.idinterprete=i.IdInterprete;
go

--multiples tablas con left join
select d.Titulo,i.interprete,t.Tipo
from tipo as t
left join DiscoTipo as dt
	on t.idtipo=dt.idtipo
left join Disco as d
	on d.iddisco=dt.iddisco
left join Interprete as i
	on d.idinterprete=i.IdInterprete;
go

--full join y paréntesis
select d.Titulo,i.interprete,t.Tipo
from tipo as t
left join (DiscoTipo as dt
			inner join Disco as d
			on d.iddisco=dt.iddisco)
	on t.idtipo=dt.idtipo
full join Interprete as i
	on d.idinterprete=i.IdInterprete;
go

--update
select puntuacion,interprete,tipo
from tipo as t
inner join DiscoTipo as dt
	on t.idtipo=dt.idtipo
inner join Disco as d
	on d.iddisco=dt.iddisco
inner join Interprete as i
	on d.idinterprete=i.IdInterprete
inner join puntuacion as p
	on p.iddisco=d.iddisco
where Interprete='Boney M.';


update puntuacion
	set puntuacion=5
from tipo as t
inner join DiscoTipo as dt
	on t.idtipo=dt.idtipo
inner join Disco as d
	on d.iddisco=dt.iddisco
inner join Interprete as i
	on d.idinterprete=i.IdInterprete
inner join puntuacion as p
	on p.iddisco=d.iddisco
where Interprete='Boney M.' and tipo='Pop';
go

--delete
delete puntuacion
from tipo as t
inner join DiscoTipo as dt
	on t.idtipo=dt.idtipo
inner join Disco as d
	on d.iddisco=dt.iddisco
inner join Interprete as i
	on d.idinterprete=i.IdInterprete
inner join puntuacion as p
	on p.iddisco=d.iddisco
where Interprete='Boney M.' and tipo='Pop';
go



