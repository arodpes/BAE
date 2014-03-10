--Crear base de datos
--create database JardinBotanico2
--go
--http://www.jardinbotanico.org/parque-jardin-botanico-de-moraleja-de-enmedio/familias-de-plantas/
use JardinBotanico2
go

--eliminar tablas

if object_id('Planta') is not null
  drop table Planta;
  go
if object_id('Familia') is not null
  drop table Familia;
  go


--Crear tabla Familia
create table Familia
(		
	CodFamilia 	integer primary key,
	Familia	varchar(50) not null unique
);

--Crear tabla Planta
create table Planta
(		
	CodPlanta 	integer primary key,
	DescripcionPlanta	varchar(50) not null unique,
	CodFamilia integer,
	Precio decimal(6,2)
);



--Cargar datos
insert Familia (CodFamilia,Familia)
	values
	(1,'CYPERACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (1,'Scyrpus Holoschoenus',1,23);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (2,'Scyrpus lacustris',1,14);

insert Familia (CodFamilia,Familia)
	values
	(2,'CUCURBITACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (3,'Cucumis melo',2,4);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (4,'Cucurbita pepo',2,12);

insert Familia (CodFamilia,Familia)
	values
	(3,'PINACEAE-ABIETACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (5,'Pinus pinea',3,45);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (6,'Cedrus deodara',3,23.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (7,'Cedrus libani',3,10.40);		

insert Familia (CodFamilia,Familia)
	values
	(4,'PLATANACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (8,'Platanus hispánica',4,12.50);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (9,'Platanus orientalis ',4,14.30);

insert Familia (CodFamilia,Familia)
	values
	(5,'ROSACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (10,'Fragaria X ananassa',5,1.05);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (11,'Prunus pérsica',5,2.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (12,'Prunus avium',5,6.20);

insert Familia (CodFamilia,Familia)
	values
	(6,'RUTACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (13,'Agave americana',6,20.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (14,'Dracaena indivisa',6,3.20);

insert Familia (CodFamilia,Familia)
	values
	(7,'RUBIACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (15,'Citrus limón',7,10.20);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (16,'Citrus sinensis',7,12.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (17,'Skimmia japonica',7,17.35);
go

--1 Para todas las plantas dar su nombre y el nombre de la Familia 
--a la que pertenece.
select DescripcionPlanta, Familia
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia

--2 Contar cuántas plantas tiene cada familia, dando el nombre 
--de la familia
select  Familia, count(*) as NPlantas
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
group by Familia
--3 Plantas y Familias cuyo nombre no contenga una b (ni en 
--la planta ni en la familia)
select DescripcionPlanta, Familia
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
where (descripcionPlanta not like '%b%') and (Familia not like '%b%')
--4 A qué familia pertenece la planta 'Citrus sinensis'
select Familia
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
where DescripcionPlanta = 'Citrus sinensis'
--5 Contar cuántas plantas tiene la Familia RUBIACEAE, mostrando 
--el nombre de la Familia
select Familia, COUNT(*) as NPlantas
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
where Familia ='RUBIACEAE'
group by Familia
--6 Precio medio de cada Familia dando su nombre
select Familia, AVG(precio) as PrecioMedio
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
group by Familia

--7 Calcular el precio máximo de las plantas
select MAX(precio) as PrecioMaximo
from Planta

--8 Sumar los precios de las Familias con una R en su nombre
select Familia, SUM(precio) as SumaPrecio
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
group by Familia
having Familia like '%R%'
--9 Mostrar las familias con más plantas
select top 1 with ties Familia, count(*) as NPlantas 
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
group by Familia
order by count(*) desc
--10 Mostrar la familia con la planta más cara
select top 1 with ties Familia, MAX(Precio) as PrecioMayor 
from Planta
inner join Familia
on Planta.CodFamilia=Familia.CodFamilia
group by Familia
order by MAX(Precio) desc

