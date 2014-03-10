use discos
go

select t.tipo,dt.iddisco
from tipo as t
left join discotipo as dt
	on t.idtipo=dt.idtipo
where dt.Id is null

select d.Titulo, i.Interprete
from disco as d
left join interprete as i
	on d.idinterprete=i.idinterprete
where i.idinterprete is null

use mundo

select p1.name,p2.name
from country as p1
cross join country as p2
where
	(p1.code<>p2.code)
	and
	(p1.region='Southern Europe')
	and
	(p2.region='Southern Europe');