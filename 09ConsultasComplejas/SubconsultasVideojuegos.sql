--subconsultas videojuegos
use videojuegos;
go

--Como tabla
--suma del número de puntuaciones de cada tipo de juego
select tipo, sum(npunt)
from tipo as t
inner join 
	(select Juego,idtipo, COUNT(*) as npunt
	from puntuacion as p
	inner join juegoplataforma as jp
		on p.idjuegoplataforma=jp.id
	inner join juego as j
		on j.idjuego=jp.idjuego
	group by Juego,idtipo) as jcuenta
	on t.IdTipo=jcuenta.idtipo
group by tipo;
go
	
--campos
--distribuidor y desarrollador con más juegos.
select
	(select top 1 Desarrollador as desarr
		from Desarrollador as d
		inner join juegoplataforma as jp
			on d.IdDesarrollador=jp.IdDesarrollador
		group by d.Desarrollador
		order by count(distinct idjuego) desc) as desa,
	(select top 1 Distribuidor as distrib
		from Distribuidor as d
		inner join juegoplataforma as jp
			on d.IdDistribuidor=jp.IdDistribuidor
		group by d.Distribuidor
		order by count(distinct idjuego) desc) as distri
	
--Where valor
--puntuaciones, dando juego, plataforma y nombre del 
--cliente con puntuación
--mayor que la media de las puntuaciones

select Juego, Plataforma,nombre,puntuacion
from cliente as c
inner join puntuacion as p
	on c.id=p.idcliente
inner join juegoplataforma as jp
	on p.idjuegoplataforma=jp.Id
inner join juego as j
	on j.idjuego=jp.idjuego
inner join Plataforma as pl
	on pl.IdPlataforma=jp.idplataforma
where Puntuacion > 
	(select avg(puntuacion) from puntuacion)

--exists con enlace de campos
--juegos/plataforma cuyo distribuidor no exista en otro 
--juego
select distribuidor, juego,plataforma
from distribuidor as d
inner join juegoplataforma as jp
	on d.iddistribuidor=jp.iddistribuidor
inner join juego as j
	on j.idjuego=jp.IdJuego
inner join Plataforma as p
	on jp.IdPlataforma=p.idplataforma
where not exists
(select juego
from distribuidor as d2
inner join juegoplataforma as jp2
	on d2.iddistribuidor=jp2.iddistribuidor
inner join juego as j2
	on j2.idjuego=jp2.idjuego
	where j2.idjuego <> j.idjuego
		and d2.IdDistribuidor=d.iddistribuidor);
go


--Where in
--Juegos con tipo que tengan más de 1000 juegos
select Juego 
from Juego
where idtipo in 
	(select t.idtipo
	from tipo as t
	inner join Juego as j
		on j.IdTipo=t.IdTipo
	group by t.idtipo
	having count(*) >1000)

--Where in
--clientes que han votado a los 10 juegos con mayor 
--puntuación media
select nombre
from cliente as c
inner join puntuacion as p
	on c.id=p.idcliente
inner join JuegoPlataforma as jp
	on p.idjuegoplataforma=jp.Id
where jp.idjuego in 
	(select top 10 jp1.idjuego
	 from puntuacion as p1
	 inner join juegoplataforma as jp1
		on p1.idjuegoplataforma=jp1.id
	 group by jp1.idjuego
	 order by avg(puntuacion) desc)
group by Nombre;
go

--where any/some
--juego con distribuidor igual a alguno de los del juego 
--FIFA 10: Ultimate Team
select distribuidor, juego
from distribuidor as d
inner join juegoplataforma as jp
	on d.iddistribuidor=jp.iddistribuidor
inner join juego as j
	on j.idjuego=jp.IdJuego
where distribuidor = any
(select distribuidor
from distribuidor as d2
inner join juegoplataforma as jp2
	on d2.iddistribuidor=jp2.iddistribuidor
inner join juego as j2
	on j2.idjuego=jp2.idjuego
	where j2.juego = 'FIFA 10: Ultimate Team')
group by distribuidor,juego;
go
		
--where all
--juego programado por el mismo desarrollador en todas 
--las plataformas
select desarrollador, juego
from desarrollador as d
inner join juegoplataforma as jp
	on d.iddesarrollador=jp.iddesarrollador
inner join juego as j
	on j.idjuego=jp.IdJuego
where desarrollador = all
		(select desarrollador
		from desarrollador as d2
		inner join juegoplataforma as jp2
			on d2.iddesarrollador=jp2.iddesarrollador
		inner join juego as j2
			on j2.idjuego=jp2.idjuego
		where j2.IdJuego=j.idjuego)
group by desarrollador, juego;
go

--campos enlazados
--para cada juego/plataforma dar el nombre del juego, 
--la plataforma y el número total de juegos de esa 
--plataforma.
select Juego, Plataforma, 
	(select COUNT(distinct idjuego)
		from juegoplataforma as jp2
		where jp2.IdPlataforma=jp.idplataforma) as Ntotal
from juego as j
inner join JuegoPlataforma as jp
	on j.IdJuego=jp.IdJuego
inner join Plataforma as p
	on p.idplataforma=jp.idplataforma
	
	



