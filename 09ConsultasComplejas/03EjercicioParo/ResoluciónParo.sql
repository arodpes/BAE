use paro
go

--1 Municipios de la isla de Tenerife
select Municipio
from municipios as m
inner join municipiosislas as mi on mi.codmunicipio=m.codmunicipio
inner join islas as i on i.cisla=mi.cisla
where i.isla='Tenerife'
go

--2 Paro en la Industria en la Provincia de Le�n en el mes de febrero 
--de 2013
select Provincia,sum(paroindustria)
from paromes as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join provincias as p on m.codprovincia=p.codprovincia
where (p.provincia='Le�n') 
		and (datepart(month,pa.fecha)=2)
		and (datepart(year,pa.fecha)=2013)
group by p.provincia
go

select sum(paroindustria)
from paromes as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join provincias as p on m.codprovincia=p.codprovincia
where (p.provincia='Le�n') 
		and (datepart(month,pa.fecha)=2)
		and (datepart(year,pa.fecha)=2013)

go
--3 Mostrar las comunidades aut�nomas y el n� de habitantes (padr�n), 
-- orden�ndolas de mayor a menor poblaci�n
select c.ca,sum(padron)
from padron as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join provincias as p on p.codprovincia=m.codprovincia
inner join comunidadesautonomas as c on p.codca=c.codca
group by c.ca
order by sum(padron) desc
go

--4 Qu� Comunidad Aut�noma tiene mayor diferencia entre el paro 
-- mujeres en la
-- edad 25-45 y la de mujeres menores de 25, en enero de 2013. 

select top 1 with ties
	c.ca,abs(sum(pa.ParoMujerEdad25_45)-sum(pa.[ParoMujerEdadMenor25]))
from paromes as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join provincias as p on p.codprovincia=m.codprovincia
inner join comunidadesautonomas as c on p.codca=c.codca
where datepart(month,pa.fecha)=1 and datepart(year,pa.fecha)=2013
group by c.ca
order by abs(sum(pa.ParoMujerEdad25_45)-sum(pa.[ParoMujerEdadMenor25])) desc
go
--5 Comunidades aut�nomas sin islas
select Ca
from municipios as m
inner join provincias as p on p.codprovincia=m.codprovincia
inner join comunidadesautonomas as c on p.codca=c.codca
left join municipiosislas as mi on mi.codmunicipio=m.codmunicipio
where mi.cisla is null
group by ca
go

select Ca
from municipios as m
inner join provincias as p on p.codprovincia=m.codprovincia
inner join comunidadesautonomas as c on p.codca=c.codca
where m.codmunicipio not in (select CodMunicipio from MunicipiosIslas)
group by ca
go

--6 Crear una vista que muestre el nombre de la comunidad aut�noma, 
--el de la provincia y el del municipio, junto al total de paro registrado
-- a fecha 1/3/2013 
--y al padr�n. Usar esta vista para mostrar la divisi�n entre paro registrado 
--y padr�n para todas las Comunidades aut�nomas.
IF object_id('datoscompletos') IS NOT NULL DROP VIEW [datoscompletos]
go

create view datoscompletos
as
	select c.ca,p.provincia,m.municipio,pa.totalparoregistrado
			, pd.padron
	from paromes as pa
	inner join municipios as m on pa.codmunicipio=m.codmunicipio
	inner join provincias as p on p.codprovincia=m.codprovincia
	inner join comunidadesautonomas as c on p.codca=c.codca
	inner join padron as pd on pd.codmunicipio=m.codmunicipio
	where datepart(month,pa.fecha)=3 and datepart(year,pa.fecha)=2013
go

select ca, sum(totalparoregistrado)/sum(padron) as dato
from datoscompletos
group by ca
order by dato desc
go
--7 Dar los nombres de los municipios de la Comunidad aut�noma con 
--mayor paro en agricultura (en febrero de 2013).
select municipio 
from Municipios as m
inner join Provincias as p on  m.codprovincia=p.CodProvincia
where p.CodCA in (
	select top 1 with ties 
		p.codCA
	from paromes as pa
	inner join municipios as m on pa.codmunicipio=m.codmunicipio
	inner join provincias as p on m.codprovincia=p.codprovincia
	where  (datepart(month,pa.fecha)=2)
		and (datepart(year,pa.fecha)=2013)
	group by p.CodCA
	order by sum(paroagricultura) desc)
go
--8 N�mero de municipios con m�s de 200000 habitantes por Comunidad Aut�noma 
-- en el padr�n, sacando todas las Comunidades Aut�nomas
select c.CA,COUNT(pa.codmunicipio)
from comunidadesautonomas as c
left join Provincias as p on c.CodCA=p.CodCA
left join Municipios as m on m.CodProvincia=p.CodProvincia
left join (select pad.CodMunicipio
		from padron as pad
		where pad.Padron>200000) as pa
		on m.codmunicipio=pa.codmunicipio
group by c.CA

select c.CA,(select COUNT(m.codmunicipio)
	from comunidadesautonomas as ca
	inner join Provincias as p on ca.CodCA=p.CodCA
	inner join Municipios as m on m.CodProvincia=p.CodProvincia
	inner join padron as pad on pad.CodMunicipio=m.CodMunicipio
	where pad.Padron>200000 and c.codca=ca.codca) as Nmunic
from comunidadesautonomas as c

-- sin sacarlas todas
select ca.cA,COUNT(m.codmunicipio)
	from comunidadesautonomas as ca
	inner join Provincias as p on ca.CodCA=p.CodCA
	inner join Municipios as m on m.CodProvincia=p.CodProvincia
	inner join padron as pad on pad.CodMunicipio=m.CodMunicipio
	where pad.Padron>200000
	group by ca.ca

--9 Municipios con m�s parados en Servicios entre los habitantes del 
--padr�n
-- en febrero de 2013 que la media nacional de la misma divisi�n
select m.Municipio
from paromes as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join padron as pd on pd.codmunicipio=m.codmunicipio
where (datepart(month,pa.fecha)=2)
		and (datepart(year,pa.fecha)=2013)
	and
	(pa.ParoServicios/pd.padron)>
	(select AVG(pa.ParoServicios/pd.padron)
	from paromes as pa
	inner join padron as pd on pd.codmunicipio=pa.codmunicipio
	where (datepart(month,pa.fecha)=2)
		and (datepart(year,pa.fecha)=2013))


--10 Indicar para cada Comunidad Aut�noma el n� de habitantes por 
--municipio
--(padr�n dividido entre n�mero de municipios), orden�ndolas de menor a mayor
select c.ca,sum(pa.padron) as totpadron,COUNT(*)as nmunicipios,
sum(pa.padron)/COUNT(*) as ratio
from padron as pa
inner join municipios as m on pa.codmunicipio=m.codmunicipio
inner join provincias as p on p.codprovincia=m.codprovincia
inner join comunidadesautonomas as c on p.codca=c.codca
group by c.ca
order by sum(pa.padron)/COUNT(*) asc

--11 Diferencia por Comunidad Aut�noma entre el n� de parados en marzo de 2013
-- y en enero de 2013
select c.CA,
(select SUM(pa.TotalParoRegistrado)
		from paromes as pa
		inner join Municipios as m on m.CodMunicipio=pa.CodMunicipio
		inner join Provincias as p on m.CodProvincia=p.codprovincia
		where (c.codca=p.codca) and
			(datepart(month,pa.fecha)=3)
		and (datepart(year,pa.fecha)=2013)
		) 
-
(select SUM(pa.TotalParoRegistrado)
		from paromes as pa
		inner join Municipios as m on m.CodMunicipio=pa.CodMunicipio
		inner join Provincias as p on m.CodProvincia=p.codprovincia
		where (c.codca=p.codca) and
			(datepart(month,pa.fecha)=1)
		and (datepart(year,pa.fecha)=2013)
		) as DifMarzoEnero
 
from comunidadesautonomas as c

--12 Municipio con m�s habitantes de cada Comunidad Aut�noma
select c.CA,
(select top 1 with ties m.Municipio
		from padron as pad
		inner join Municipios as m on m.CodMunicipio=pad.CodMunicipio
		inner join Provincias as p on m.CodProvincia=p.codprovincia
		where p.codca=c.codca
		order by pad.Padron desc)
from comunidadesautonomas as c
