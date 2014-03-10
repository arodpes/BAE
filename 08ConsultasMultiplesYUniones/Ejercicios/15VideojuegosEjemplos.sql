use videojuegos;
go

select c.id,Nombre,p.id,p.idcliente,puntuacion
from cliente as c
left join puntuacion as p
	on c.id=p.idcliente
	
where p.idcliente is null

--group by

select j.Juego, sum(p.puntuacion) as Spunt
from Juego as j
inner join JuegoPlataforma as jp
	on j.IdJuego=jp.Idjuego
inner join puntuacion as p
	on p.idjuegoplataforma=jp.id
group by j.Juego
order by Spunt desc;
