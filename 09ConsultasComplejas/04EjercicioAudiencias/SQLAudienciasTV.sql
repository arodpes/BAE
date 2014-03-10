use AudienciasTV
go

--1 Cadena con mayor audiencia (en la tabla Audiencia) el 15/5/2013 
--en el Periodo 'Noche1 (20.30 a 24.00)'
set dateformat dmy
select top 1 with ties 
	cadena,fecha,valor
from Audiencia as a 
inner join Periodo as p on p.Id=a.idPeriodo
inner join Cadena as c on a.IdCadena=c.idcadena
where a.Fecha='15/5/2013' and p.periodo='Noche1 (20.30 a 24.00)'
order by Valor desc

--2 Programa de TELECINCO con m�s espectadores los jueves 
--(en audienciaprograma)
select top 1 with ties
	c.Cadena,FechaHora,espectadores,pr.programa
from AudienciaPrograma as ap
inner join Programa as pr on ap.idprograma=pr.idprograma
inner join Cadena as c on c.IdCadena=ap.IdCadena
where datename(dw,ap.fechahora)='Jueves' and c.cadena='TELECINCO'
order by espectadores desc

--3 �Cu�ntos programas tiene telecinco entre los cinco primeros del d�a
-- 8/5/2013 teniendo en cuenta el share (en audienciaprograma)?
set dateformat dmy
select Cadena,COUNT(*)
from Cadena as c
inner join (
 select top 5 with ties
 idcadena, share
 from audienciaprograma 
 where day(FechaHora)=8 and month(fechahora)=5 and year(fechahora)=2013
 order by share desc) as m5 on m5.idcadena=c.idcadena
where Cadena='Telecinco'
group by cadena

--4 �Qu� d�a de la semana tiene m�s espectadores considerando 
-- los datos de AudienciaPrograma?
select top 1 with ties datename(dw,fechahora),sum(espectadores) as tot
from AudienciaPrograma
group by datename(dw,fechahora)
order by tot desc

--5 Cinco programas con media m�s alta de espectadores (en audienciaprograma)
--que aparezcan dos o m�s veces
select top 5 with ties
  programa, avg(espectadores) as media
from AudienciaPrograma as ap
inner join Programa as pr on ap.IdPrograma=pr.idprograma
group by programa
having COUNT(*)>=2
order by media desc

--6 Cu�l fue la audiencia (en la tabla audiencia) en el periodo 
-- que comienza por Noche2 de la cadena con el programa m�s visto 
-- en n�mero de espectadores (de la tabla audienciaPrograma) el d�a 9/5/2013
set dateformat dmy
select Cadena,valor
from audiencia as a
inner join Cadena as c on c.idCadena=a.IdCadena
inner join periodo as p on p.Id=a.idPeriodo
where c.idCadena in (
	select top 1 with ties 
		idcadena
	from AudienciaPrograma as ap
	where day(FechaHora)=9 and month(fechahora)=5 and year(fechahora)=2013
	order by Espectadores desc )
and Fecha='9/5/2013' and p.Periodo like 'Noche2%'

--7 Total de espectadores acumulados seg�n la tabla audienciaprograma
-- de cada Operador, dando todos los operadores e incluyendo titularidad
select t.titularidad,o.Operador,SUM(espectadores)
from titularidad as t
inner join Operador as o on o.IdTitularidad=t.id
inner join cadena as c on c.idOperador=o.id
left join Audienciaprograma as a on a.IdCadena=c.idCadena
group by t.titularidad,o.Operador

--8 �En qu� periodo, cadena y fecha est� el valor m�ximo de audiencia
-- (tabla audiencia), de una cadena que tenga al menos tres
-- programas en audienciaprograma en el mismo d�a
select top 1 with ties
p.periodo,c.cadena,a.fecha,valor
from Audiencia as a
inner join Cadena as c on c.idCadena=a.IdCadena
inner join periodo as p on p.Id=a.idPeriodo
where a.IdCadena in
	(select IdCadena
	from audienciaprograma as ap
	where day(ap.fechahora)=day(a.fecha)
	group by IdCadena
	having COUNT(*)>=3)
order by Valor desc

--9 �En qu� hora (sin minutos) hay mayor media de espectadores seg�n 
--audienciaprograma?
select top 1 with ties
	DATEPART(hour,fechahora),AVG(espectadores) as media
from audienciaprograma
group by DATEPART(hour,fechahora)
order by media desc

--10 Para cada fecha indicar qu� Empresa es la 
--n� uno de audiencia en el periodo 'Total d�a' (tabla audiencia).
select fecha,
	(select top 1 with ties 
		cadena
		from audiencia as a
		inner join Periodo as p on a.idperiodo=p.id
		inner join Cadena as c on c.idCadena=a.IdCadena
		where periodo = 'Total d�a' and aud.Fecha=a.Fecha
		order by valor desc) as cad
from audiencia aud
group by fecha
order by Fecha asc
	
--11 �Cu�ntos programas diferentes tiene cada empresa, d�ndolas todas, en 
--AudienciaPrograma?
select operador, count(distinct programa) as nprogramas
from operador as o
inner join Cadena as c on c.idOperador=o.id
left join AudienciaPrograma as ap on ap.IdCadena=c.idCadena
left join Programa as p on p.IdPrograma=ap.idprograma
group by operador

--12 Para qu� d�a del mes hay m�s de 4 cadenas distintas en audienciaprograma

select datepart(day,fechahora) as dia,COUNT(distinct IdCadena)as ncad
from audienciaprograma
group by datepart(day,fechahora)
having COUNT(distinct IdCadena)>4