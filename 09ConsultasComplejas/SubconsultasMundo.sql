--subconsultas mundo
use mundo;
go

--Como tabla
--nº de ciudades y nº de idiomas de un país.
select Name, nleng,ncity
from country as c
inner join (select countrycode, count(*) as Nleng
			from countrylanguage
			group by countrycode
			) as nl
	on nl.countrycode=c.code
inner join (select countrycode,count(*) as Ncity
			from city
			group by CountryCode
			) as nc 
	on nc.CountryCode=c.Code

--con campos correlacionados
select Name 
		,(select  count(*) as Nleng
		from countrylanguage
		where countrycode =c.code
		) as nleng
		,(select count(*) as Ncity
		from city
		where CountryCode =c.code) as nciud
from country as c

--campos
--país con más habitantes y ciudad con más habitantes
select top 1 Name as paismas
		,(select top 1 name
		from city
		order by population desc) as ciudadmas
from Country
order by Population desc;
go

--otra forma
select
		(select top 1 Name 
		from Country
		order by Population desc) as paismas	
		,(select top 1 name
		from city
		order by population desc) as ciudadmas;
go


--Where valor
--Países con población más alta que el 50% de la mayor
select name
from country
where Population > 
	((select MAX(population) from country)*0.5);
go

--de los del mismo continente
select name,population
from country as c
where Population > 
	((select MAX(population) 
	    from country as c1
		where c1.Continent=c.Continent)
	 *0.5);
go

--exists y campos enlazados
--paises con idioma con más del 70% de la población.
select name 
from country as c
where exists (select language 
				from CountryLanguage as l
				where c.code=l.countrycode
					and Percentage>70);
go



--Where in
--países con alguno de los idiomas hablados en japón
select p.name
from country as p
inner join countrylanguage as l
	on l.CountryCode=p.code
where l.language in (select Language
					from country as p
					inner join countrylanguage as l
						on l.CountryCode=p.code
					where p.name='japan')
group by p.name;
go
--Brunei sale dos veces

--where any/some
--País población menor que alguna de las ciudades de españa.
select name
from Country
where population < any (select c.population 
						from city as c
						inner join Country as p
							on p.code=c.countrycode
						where p.name='Spain');
go


select name
from Country
where population < all (select c.population 
						from city as c
						inner join Country as p
							on p.code=c.countrycode
						where p.name='Spain');
go
--where all
--países con población mayor que todos los países europeos
select name
from country
where population > all (select p.population
						from Country as p
						where p.Continent='Europe');
go

select name
from country
where population > (select max(p.population)
						from Country as p
						where p.Continent='Europe');
go


--campos enlazados
--ciudad e idioma con más población por país 
select name, 
	(select top 1 Language 
		from CountryLanguage
		where country.code=CountryLanguage.CountryCode
		order by percentage desc) as IdiomaMas,
	(select top 1 Name 
		from City
		where country.code=City.CountryCode
		order by population desc) as CiudadMas	
from country
order by name;
go