--previo
use mundo;
go

select p.Name as País, c.Name as Ciudad
from country as p ,city as c
where p.Name='Spain';
go

select p.Name as País, c.Name as Ciudad
from country as p ,city as c
where p.Name='Spain'
and (p.Code=c.CountryCode);
go

--inner join
use mundo;
go

select p.Name as País, c.Name as Ciudad
from country as p
inner join city as c
	on p.Code=c.CountryCode
where p.Name='Spain';
go

select p.Code,p.Name as País, c.CountryCode,c.Name as Ciudad
from country as p
inner join city as c
	on p.Code=c.CountryCode
go

--autocombinación
select p1.Name as País1, p2.Name as País2
from country as p1
inner join country as p2
	on p1.Code<>p2.Code
where p1.Region='Southern Europe' and 
		p2.Region='Southern Europe' ;
go

--group by
select P.Name as Pais,count(*) as NIdiomas
from Country as p
inner join Countrylanguage as l
		on p.code=l.CountryCode
group by p.Name
order by NIdiomas desc;
go
	
--ciudades y el idioma de su país.

select c.Name as ciudad,l.Language as Idioma
from City as c
inner join Country as p
	on p.Code=c.CountryCode
inner join CountryLanguage as l
	on l.CountryCode=p.Code;
go
