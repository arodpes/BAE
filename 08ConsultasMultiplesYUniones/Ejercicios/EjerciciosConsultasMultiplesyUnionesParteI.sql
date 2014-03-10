--Base de datos Mundo
use Mundo
go
--1. Para todos los países mostrar el nombre y las ciudades más 
--importantes.
select p.Name as Pais,c.name as Ciudad
from Country as p
inner join City as c
	on c.countrycode=p.code;
go

--2.	Para todos los países de Europa, contar cuántas ciudades 
--y sumar la población de las ciudades.
select p.Name as Pais,COUNT(*) as NCiudades,
	sum(c.population) as PoblCiudades
from Country as p
inner join City as c
	on c.countrycode=p.code
where Continent='Europe'
group by p.Name;
go
--3. Cuántos hablantes hay por lengua en América del sur.
select region from country
group by region;

select Language,sum(l.percentage*p.population/100) as Hablantes
--select p.name,Language,l.percentage*p.population/100
from Country as p
inner join CountryLanguage as l
	on l.countrycode=p.code
where Region='South America'
group by Language
order by hablantes desc;
go

--4.	Pares de países diferentes que ambos hablen Español.
select p1.Name,p2.Name
from	(Country as p1
		inner join CountryLanguage as l1
			on l1.CountryCode=p1.code)
	cross join
		(Country as p2
		inner join CountryLanguage as l2
			on l2.CountryCode=p2.code)
where l1.Language='Spanish' and l2.Language='Spanish'
		and p1.name<p2.name;--a menor para que no se repitan
go

select p1.Name
from	Country as p1
		inner join CountryLanguage as l1
			on l1.CountryCode=p1.code
where l1.Language='Spanish'


		
--5. 10 Ciudades con más habitantes indicando el nombre del país 
--donde están.
select  top 10 with ties
	c.name as Ciudad, p.Name as País,c.population as nHab
from Country as p
inner join City as c
	on c.countrycode=p.code
order by Nhab desc;
go

--6. Países que no tengan más de 2 idiomas.

select p.Name as país,count(*) as Idiomas
from Country as p
inner join CountryLanguage as l
	on l.countrycode=p.code
group by p.Name
having COUNT(*) <=2;
go


--Base de datos Videojuegos
use Videojuegos
go
--1. Para los juegos que contengan FIFA dar las plataformas en 
--las que funciona y sus desarrolladores y distribuidores
select j.Juego,p.plataforma,d.desarrollador,di.distribuidor
--,tipo
from Juego as j
inner join Juegoplataforma as jp
	on j.idjuego=jp.IdJuego
inner join Plataforma as p
	on p.IdPlataforma=jp.idplataforma
inner join Distribuidor as di
	on di.iddistribuidor=jp.iddistribuidor
inner join desarrollador as d
	on d.iddesarrollador=jp.iddesarrollador
--inner join tipo as t
--	on t.idtipo=j.idtipo
where j.Juego like '%FIFA%'

--2.	Nombre de clientes que hayan votado juegos de la 
--plataforma PC

select c.Nombre as cliente
from cliente as c
inner join Puntuacion as p
	on c.id=p.idcliente
inner join juegoplataforma as jp
	on jp.id=p.idjuegoplataforma
inner join Plataforma as pl
	on pl.idplataforma=jp.idplataforma
where plataforma='PC'
group by C.Nombre;
go

--3. Para cada juego de tipo Simulación dar en cuántas plataformas 
--funciona.

select j.Juego,COUNT(distinct jp.IdPlataforma) as NPlataformas
from Juego as j
inner join Juegoplataforma as jp
	on j.idjuego=jp.IdJuego
inner join Tipo as t
	on t.IdTipo=j.IdTipo
where tipo='Simulación'
group by j.Juego;
go

--4. Clientes que no hayan puntuado

select c.Nombre
from cliente as c
left join puntuacion as p
	on p.Idcliente=c.id
where p.id is null;
go

--5. Videojuegos sin puntuación.

select j.Juego
from Juego as j
inner join JuegoPlataforma as jp
	on j.IdJuego=jp.IdJuego
left join puntuacion as p
	on p.idjuegoplataforma=jp.Id
where p.Id is null
group by j.Juego;

--6. Dando todos los videojuegos. 
--Hallar la media de las puntuaciones 
--recibidas y cuántas.

select j.Juego,
	avg(puntuacion) as media, COUNT(p.id) as Npunt
from Juego as j
inner join JuegoPlataforma as jp
	on j.IdJuego=jp.IdJuego
left join puntuacion as p
	on p.idjuegoplataforma=jp.Id
group by j.Juego
--having count(p.id)<>0;	
go

--Base de Datos Empresas informáticas
use empresasinformaticas
go
--1.	Número de Facturas por tienda
select t.Nombretienda,  count(f.Nfactura)
from Tienda as t
inner join Factura as f
	on t.IdTienda=f.idTienda
group by t.Nombretienda;
go

--2.	Componentes para los que alguna vez el preciaplicado 
--sea menor que el precio.
select c.descripcion as Componente--, fc.precioaplicado,c.precio
from componente as c
inner join FacturaComponente as fc
	on c.clave=fc.CodComponente
where fc.precioaplicado<c.precio
group by c.descripcion;
go

--3.	Modificar precio aplicado en facturas de cliente Ana 
--disminuyéndolo en un 10%.
update facturacomponente
	set precioaplicado=precioaplicado*0.9
--select fc.codcomponente, precioaplicado
from FacturaComponente as fc
inner join factura as f
	on f.nfactura=fc.nfactura
where Cliente='Ana';
go

--4.	6 componentes que más se han vendido en cantidad, sacando
--los empates
select top 6 with ties
	c.descripcion as componente, sum(cantidad) as Totcantidad
from componente as c
inner join facturacomponente as fc
	on c.clave=fc.CodComponente
group by c.descripcion
order by Totcantidad desc;
go

--5.	Artículos sin ventas
select c.descripcion as Componente--,fc.CodComponente
from componente as c
left join facturacomponente as fc
	on c.clave=fc.CodComponente
where fc.codcomponente is  null;
go

--6.	Borrar los artículos sin ventas del tipo BROTHER: FAX.
delete componente
--select c.descripcion as Componente
from componente as c
inner join tipocomponente as tc
	on c.CodTipo=tc.CodTipo
left join FacturaComponente as fc
	on fc.codcomponente=c.clave
where fc.Id is null and tc.tipo='BROTHER: FAX'


--Base de datos Discos
use discos
go
--1. Número de discos por tipo sacando los que no tienen 
--ninguno.

select t.Tipo,COUNT(dt.IdDisco)
from tipo as t
left join discotipo as dt
	on t.idtipo=dt.idtipo
group by t.Tipo;

--2. Cliente, Título e Intérprete de todos los 
--discos votados.
select c.nombre,titulo,interprete
from cliente as c
inner join puntuacion as p
	on p.idcliente=c.id
inner join disco as d
	on d.IdDisco=p.iddisco
inner join interprete as i
	on d.idinterprete=i.idinterprete
group by c.nombre,titulo,interprete;--hay repeticiones
go

--3. Intérpretes que hayan interpretado discos de tipo 
--que contenga Rock.

select Interprete--,count(*)
from Interprete as i
inner join disco as d
	on i.idinterprete=d.idinterprete
inner join discotipo as dt
	on dt.IdDisco=d.IdDisco
inner join tipo as t
	on t.idtipo=dt.idtipo
where tipo like '%rock%'
group by Interprete;
go

--4. Pares de clientes que hayan nacido en décadas 
--diferentes.

select c1.Nombre as cliente1 ,c2.nombre as cliente2
--,c1.fechanacimiento
--,substring(right(str(year(c1.fechanacimiento)),2),1,1)
--,c2.fechanacimiento
--,substring(right(str(year(c2.fechanacimiento)),2),1,1)
from cliente as c1
cross join Cliente as c2
where
substring(right(str(year(c1.fechanacimiento)),2),1,1)<>
substring(right(str(year(c2.fechanacimiento)),2),1,1);
go

--5. Título, Tipo e intérprete de discos sin puntuaciones.

select titulo,tipo,interprete,p.id
from disco as d
inner join interprete as i
	on i.IdInterprete=d.IdInterprete
inner join DiscoTipo as dt
	on dt.iddisco=d.iddisco
inner join tipo as t
	on t.idtipo=dt.idtipo
left join Puntuacion as p
	on d.IdDisco=p.iddisco
where p.id is null;
go

--6. 3 Intérpretes con mayor número de puntuaciones, 
--incluyendo empates.

select top 3 with ties
	interprete,count(p.id) as npunt
from interprete as i
inner join disco as d
	on i.idinterprete=d.idinterprete
inner join Puntuacion as p
	on p.iddisco=d.IdDisco
group by interprete
order by npunt desc;
go


