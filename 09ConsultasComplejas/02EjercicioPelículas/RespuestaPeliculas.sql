
use peliculas
go

--1.- Mostrar para todos los pr�stamos, el t�tulo, el director, 
-- los apellidos y nombre del cliente, el tipo de pel�cula, y la fecha 
-- de pr�stamo
select 
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	t.tipo,
	p.fechaprestamo

from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
inner join tipopelicula as t
	on t.idtipo=pl.idtipo
go


--2.- Pr�stamos de pel�culas de pa�s US, tipo Actualidad y 
-- efectuadas el mes de noviembre.
-- Dar nombre de cliente, fecha de pr�stamo y t�tulo de la pel�cula.

select 
	pl.titulo,pl.director,pl.pais,
	c.apellidos, c.nombre,
	t.tipo,
	p.fechaprestamo
from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
inner join tipopelicula as t
	on t.idtipo=pl.idtipo

where pl.pais='US' and tipo='Actualidad' and 
	DATEname(month, p.fechaprestamo)='Noviembre'
go
-- 3.- Dar para todos los clientes con a�o de alta mayor que 
-- el a�o 1990. 
-- Indicar DNI, nombre y apellidos 
-- del cliente (en unico campo de salida) y n� de pr�stamos realizados.
select c.Nombre+' '+c.Apellidos as nombrecompleto,
	c.DNICliente,count(p.idprestamo) as nprestamos
from clientes as c
left join prestamo as p
	on c.idcliente=p.idcliente
where 
	DATEpart(year, c.fechaalta)>1990 
group by c.Nombre+' '+c.Apellidos,
	c.DNICliente

--4.- Mostrar el t�tulo, el director, 
-- los apellidos y nombre del cliente, el tipo de pel�cula, 
--y la fecha 
--  del pr�stamo siguiente en orden de fecha al de fecha 
-- 2012-07-30

select top 1 with ties
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	t.tipo,
	p.fechaprestamo

from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
inner join tipopelicula as t
	on t.idtipo=pl.idtipo
where p.fechaprestamo > convert(datetime,'30-07-2012')
order by  p.fechaprestamo
go

--5.- Para cada tipo de pel�cula dar el N�mero de pr�stamo e 
-- importe (diferencia en d�as entre fechaprestamo
-- y fecha devolucion) multiplicado por el preciodiaefectuado. 
select 
	t.tipo,COUNT(idprestamo) as nprestamos,
	sum(datediff(day,p.FechaPrestamo,p.FechaDevolucion)*p.PrecioDiaEfectuado)
		as importetotal
from prestamo as p
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
inner join tipopelicula as t
	on t.idtipo=pl.idtipo
group by t.tipo
go

--6.- Clientes sin pr�stamos, dando dombre, apellidos y DNICliente
select c.Nombre+' '+c.Apellidos as nombrecompleto,
	c.DNICliente,count(p.idprestamo) as nprestamos
from clientes as c
left join prestamo as p
	on c.idcliente=p.idcliente
group by c.Nombre+' '+c.Apellidos,
	c.DNICliente
having COUNT(p.idprestamo)=0
go

--7.- Pr�stamos de clientes (dar nombre de cliente, fecha de pr�stamo y 
-- t�tulo de la pel�cula) sin pr�stamos en el a�o 2013

select 
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	p.fechaprestamo

from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
where p.idcliente not in 
			--la lista de clientes que han tenido pr�stamos en 2013
	(select idcliente from Prestamo
	 where DATEPART(year,fechaprestamo)=2013) 
go

--8.- Pr�stamos de pel�culas (dar nombre de cliente, fecha de pr�stamo y 
-- t�tulo de la pel�cula) con m�s de 2 alquileres en 2012.
select 
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	p.fechaprestamo

from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
where 
	--pr�stamos de la pel�cula p.idpelicula en 2012
	(select count(idprestamo) from Prestamo
	 where DATEPART(year,fechaprestamo)=2012
	 and p.idPelicula=prestamo.idpelicula)>2 
go
--9.- N�mero de pr�stamos por mes por su nombre, pero ordenados 
--por meses correlativos (Enero, febrero, marzo,...)
select datename(month,fechaprestamo), 
	COUNT(idprestamo) as nprestamos
from prestamo
group by datename(month,fechaprestamo)
		,datepart(month,fechaprestamo)
order by datepart(month,fechaprestamo)


--10.- Pel�cula alquilada m�s veces, dando t�tulo y tipo
select top 1 with ties 
select
	pl.titulo, t.tipo, COUNT(idprestamo) as nveces
from prestamo as p
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
inner join tipopelicula as t
	on t.idtipo=pl.idtipo
group by pl.titulo, t.tipo
order by  COUNT(idprestamo) desc
go

--11.- Pr�stamos no devueltos en plazo (dar nombre de cliente, 
-- fecha de pr�stamo y 
-- t�tulo de la pel�cula)
select 
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	p.fechaprestamo,p.FechaDevolucion
from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
where datediff(DAY,p.FechaPrestamo,p.FechaDevolucion)>
		p.diasprestamoefectuado
go

--12.- Pel�culas alquiladas por un cliente con pel�culas
-- pendientes de devoluci�n. Dar nombre de cliente, 
-- fecha de pr�stamo y 
-- t�tulo de la pel�cula.
select 
	pl.titulo,pl.director,
	c.apellidos, c.nombre,
	p.fechaprestamo
from prestamo as p
inner join clientes as c
	on c.idcliente=p.idcliente
inner join peliculas as pl
	on p.idpelicula=pl.idpelicula
where p.idcliente in 
	-- clientes con alguna pel�cula pendiente
	(select idcliente from Prestamo
	 where FechaDevolucion is null) 
go

