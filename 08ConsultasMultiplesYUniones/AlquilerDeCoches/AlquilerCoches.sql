use AlquilerCoches;

--ALQ_TipoCoche:
--codTipo integer				(clave)
--DescripcionTipo varchar(100)
--PrecioDia numeric(10,2)

create table ALQ_tipoCoche
(CodTipo integer primary key,
 DescripcionTipo varchar(100),
 PrecioDia numeric(10,2));

--ALQ_Coche:
--Matricula  varchar(10)			(clave)
--DescripcionEstado  varchar(100)
--codTipo integer
--Foreing key del campo codTipo  con el campo codTipo de la tabla ALQ_TipoCoche
create table ALQ_Coche
(Matricula  varchar(10) primary key,
 DescripcionEstado  varchar(100),
 codTipo integer,
 constraint FK_ALQ_Coche_TipoCoche
   foreign key (codTipo)
   references ALQ_tipoCoche(CodTipo));

--ALQ_Cliente:
--DNICliente varchar(9)			(clave)
--Apellidos varchar(50)
--Nombre varchar(100)
--DatosCliente varchar(100)
--FechaNacimiento datetime
--FechaCarnet datetime

create table ALQ_Cliente
(DNICliente varchar(9) primary key,
 Apellidos varchar(50),
 Nombre varchar(100),
 DatosCliente varchar(100),
 FechaNacimiento datetime,
 FechaCarnet datetime)


--ALQ_Alquiler:
--DNICliente varchar(9)			(clave)
--Matricula varchar(10)			(clave)
--FechaInicio datetime			(clave)
--FechaFinal datetime
--PrecioDiaEfectuado numeric(10,2)
--Foreing key del campo DNICliente  con el campo DNICliente de la tabla ALQ_Cliente
--Foreing key del campo Matricula con el campo Matricula de la tabla ALQ_Coche

Create table ALQ_Alquiler
(DNICliente varchar(9),
 Matricula varchar(10),
 FechaInicio datetime,
 FechaFinal datetime,
 PrecioDiaEfectuado numeric(10,2),
 primary key (DNICliente, Matricula,FechaInicio),
 constraint FK_ALQ_Alquiler_Cliente
   foreign key (DNICliente)
   references ALQ_Cliente(DNICliente),
 constraint FK_ALQ_Alquiler_Coche
   foreign key (Matricula)
   references ALQ_Coche(Matricula));

--1.- Alquileres de cliente pedro Fernández
select A.matricula,A.FechaInicio
from ALQ_Alquiler as A
inner join ALQ_Cliente as C
		on A.DNICliente=c.DNICliente
where (c.Apellidos='Fernández') and (c.Nombre='Pedro')
-- 2354-HBC	2011-02-12 00:00:00.000
-- 7865-BTG	2011-01-10 00:00:00.000


--2.- Alquileres en todo terreno de juana rodríguez
Select A.matricula,A.FechaInicio
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
where (T.DescripcionTipo='Todo terreno') and 
(cl.Apellidos='Rodríguez') and (cl.Nombre='Juana')
-- 7865-BTG	2011-02-10 00:00:00.000

--3.- Total de alquileres por tipo
Select t.DescripcionTipo, count(*) 
as 'Nº de alquileres'
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo;
--Económico	12
--Ejecutivo	9
--Furgoneta	4
--Todo terreno	4

--4.- Días de alquiler por tipo (dando su descripción)
Select t.DescripcionTipo, 
SUM(datediff(DAY,a.FechaInicio,a.FechaFinal)) 
as 'Nº de días'
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo
--Económico	33
--Ejecutivo	45
--Furgoneta	16
--Todo terreno	12

-- ver todos 
Select t.DescripcionTipo, a.FechaInicio,a.FechaFinal,datediff(DAY,a.FechaInicio,a.FechaFinal)
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo

--5.- Días de alquiler por matrícula
Select a.Matricula, 
SUM(datediff(DAY,a.FechaInicio,a.FechaFinal)) as 'Nº de días'
from ALQ_Alquiler as A
group by a.Matricula

--2354-HBC	9
--3216-BHF	7
--3256-GDF	8
--4589-HBD	9
--7863-FGG	15
--7865-BTG	6
--8763-GLH	6
--8999-HBC	6
--9743-GLH	23
--9803-HBB	10
--9876-GGF	7

--6.- Importe de cada alquiler, dando el nombre y 
--apellidos del cliente, matrícula, fecha inicio y fecha final
Select A.matricula,A.FechaInicio,a.FechaFinal,
cl.Apellidos,cl.Nombre,
datediff(DAY,a.FechaInicio,a.FechaFinal)*a.PrecioDiaEfectuado as total,
datediff(DAY,a.FechaInicio,a.FechaFinal) as ndias,
a.PrecioDiaEfectuado
	as importe
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente

--agrupando
Select A.matricula,
--datediff(DAY,a.FechaInicio,a.FechaFinal)*a.PrecioDiaEfectuado,
--datediff(DAY,a.FechaInicio,a.FechaFinal) as ndias,
--a.PrecioDiaEfectuado
SUM(datediff(DAY,a.FechaInicio,a.FechaFinal)*a.PrecioDiaEfectuado)
,AVG(a.PrecioDiaEfectuado)

from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
group by a.matricula
--8763-GLH	2011-02-08 00:00:00.000	2011-02-11 00:00:00.000	pérez	david	210.00
--3216-BHF	2011-01-03 00:00:00.000	2011-01-04 00:00:00.000	hernández	pedro	23.00
--2354-HBC	2011-02-01 00:00:00.000	2011-02-04 00:00:00.000	ruiz	maría	75.00
--3216-BHF	2011-02-14 00:00:00.000	2011-02-17 00:00:00.000	ruiz	maría	75.00
--3256-GDF	2011-02-02 00:00:00.000	2011-02-04 00:00:00.000	ramos	maría	50.00
--4589-HBD	2011-02-15 00:00:00.000	2011-02-18 00:00:00.000	ramos	maría	75.00
--9743-GLH	2011-01-07 00:00:00.000	2011-01-10 00:00:00.000	gonzález	josé	168.00
--3256-GDF	2011-01-02 00:00:00.000	2011-01-05 00:00:00.000	rodríguez	juan	69.00
--9876-GGF	2011-02-06 00:00:00.000	2011-02-09 00:00:00.000	fernández	jesús	162.00
--7863-FGG	2011-01-05 00:00:00.000	2011-01-08 00:00:00.000	rodríguez	juana	168.00
--7865-BTG	2011-02-10 00:00:00.000	2011-02-13 00:00:00.000	rodríguez	juana	234.00
--9876-GGF	2011-02-17 00:00:00.000	2011-02-20 00:00:00.000	rodríguez	juana	168.00
--8763-GLH	2011-01-08 00:00:00.000	2011-01-11 00:00:00.000	gonzález	alberto	210.00
--2354-HBC	2011-01-01 00:00:00.000	2011-01-04 00:00:00.000	pérez	ana	69.00
--4589-HBD	2011-01-04 00:00:00.000	2011-01-07 00:00:00.000	pérez	maría	75.00
--7863-FGG	2011-02-16 00:00:00.000	2011-02-25 00:00:00.000	pérez	maría	504.00
--9803-HBB	2011-02-09 00:00:00.000	2011-02-12 00:00:00.000	pérez	maría	210.00
--9803-HBB	2011-01-09 00:00:00.000	2011-01-16 00:00:00.000	pérez	juana	490.00
--2354-HBC	2011-02-12 00:00:00.000	2011-02-15 00:00:00.000	fernández	pedro	75.00
--7865-BTG	2011-01-10 00:00:00.000	2011-01-13 00:00:00.000	fernández	pedro	216.00
--8999-HBC	2011-02-11 00:00:00.000	2011-02-14 00:00:00.000	hernández	josefa	225.00
--9743-GLH	2011-02-18 00:00:00.000	2011-03-03 00:00:00.000	hernández	josefa	728.00
--9876-GGF	2011-01-06 00:00:00.000	2011-01-07 00:00:00.000	hernández	josefa	56.00
--7863-FGG	2011-02-05 00:00:00.000	2011-02-08 00:00:00.000	ramos	carmen	168.00
--3216-BHF	2011-02-03 00:00:00.000	2011-02-06 00:00:00.000	rojas	ana	75.00
--3256-GDF	2011-02-13 00:00:00.000	2011-02-16 00:00:00.000	rojas	fernando	75.00
--8999-HBC	2011-01-11 00:00:00.000	2011-01-14 00:00:00.000	rojas	fernando	225.00
--9743-GLH	2011-02-07 00:00:00.000	2011-02-14 00:00:00.000	pérez	fernando	378.00
--4589-HBD	2011-02-04 00:00:00.000	2011-02-07 00:00:00.000	ruiz	marta	66.00

--7.- Total alquileres por cliente, dando DNI, 
--nombre y apellidos
Select cl.DNICliente,cl.Apellidos,cl.Nombre,
       COUNT(*) as 'Nº de alquileres',
	   sum(datediff(DAY,a.FechaInicio,a.FechaFinal)
	    *a.PrecioDiaEfectuado) as 'PrecioTotal',
       sum(datediff(DAY,a.FechaInicio,a.FechaFinal)) as ndias       
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
group by cl.DNICliente,cl.Apellidos,cl.Nombre

--05679340L	pérez	david	1
--07865988B	hernández	pedro	1
--13455656N	ruiz	maría	2
--23432988J	ramos	maría	2
--23446456A	gonzález	josé	1
--43005006C	rodríguez	juan	1
--43566789M	fernández	jesús	1
--45567678D	rodríguez	juana	3
--45667443T	gonzález	alberto	1
--45678901G	pérez	ana	1
--54377890W	pérez	maría	3
--56008986F	pérez	juana	1
--56321789X	fernández	pedro	2
--56999678C	hernández	josefa	3
--65783450T	ramos	carmen	1
--67544345S	rojas	ana	1
--67655432N	rojas	fernando	2
--75655499N	pérez	fernando	1
--76523986L	ruiz	marta	1


--8.- DNI, nombre y apellidos de clientes sin alquiler
Select cl.DNICliente,cl.Apellidos,cl.Nombre
from ALQ_Cliente as Cl
left join ALQ_Alquiler as A
		on A.DNICliente=cl.DNICliente
where a.DNICliente is null
--43554430C	gonzález	samuel

--9.- Coches sin alquiler
Select C.matricula,a.matricula
from ALQ_Coche as C
left join ALQ_Alquiler as A
		on A.Matricula=C.Matricula
where A.Matricula is null
--9567-CCD

--10.- Días de alquiler por coche y cliente 
--(DNI, nombre y apellidos)
Select A.matricula,cl.DNICliente,cl.Apellidos,cl.Nombre,
       sum(datediff(DAY,a.FechaInicio,a.FechaFinal))as Ndias
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
group by A.matricula,cl.DNICliente,cl.Apellidos,cl.Nombre

--8763-GLH	05679340L	pérez	david	3
--3216-BHF	07865988B	hernández	pedro	1
--2354-HBC	13455656N	ruiz	maría	3
--3216-BHF	13455656N	ruiz	maría	3
--3256-GDF	23432988J	ramos	maría	2
--4589-HBD	23432988J	ramos	maría	3
--9743-GLH	23446456A	gonzález	josé	3
--3256-GDF	43005006C	rodríguez	juan	3
--9876-GGF	43566789M	fernández	jesús	3
--7863-FGG	45567678D	rodríguez	juana	3
--7865-BTG	45567678D	rodríguez	juana	3
--9876-GGF	45567678D	rodríguez	juana	3
--8763-GLH	45667443T	gonzález	alberto	3
--2354-HBC	45678901G	pérez	ana	3
--4589-HBD	54377890W	pérez	maría	3
--7863-FGG	54377890W	pérez	maría	9
--9803-HBB	54377890W	pérez	maría	3
--9803-HBB	56008986F	pérez	juana	7
--2354-HBC	56321789X	fernández	pedro	3
--7865-BTG	56321789X	fernández	pedro	3
--8999-HBC	56999678C	hernández	josefa	3
--9743-GLH	56999678C	hernández	josefa	13
--9876-GGF	56999678C	hernández	josefa	1
--7863-FGG	65783450T	ramos	carmen	3
--3216-BHF	67544345S	rojas	ana	3
--3256-GDF	67655432N	rojas	fernando	3
--8999-HBC	67655432N	rojas	fernando	3
--9743-GLH	75655499N	pérez	fernando	7
--4589-HBD	76523986L	ruiz	marta	3

--11.- Días de alquiler por tipo (dando su descripción) 
--y cliente(DNI, nombre y apellidos)
Select t.DescripcionTipo,cl.DNICliente,cl.Apellidos,cl.Nombre,
       sum(datediff(DAY,a.FechaInicio,a.FechaFinal))as Ndias
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo,cl.DNICliente,cl.Apellidos,cl.Nombre

--Furgoneta	05679340L	pérez	david	3
--Económico	07865988B	hernández	pedro	1
--Económico	13455656N	ruiz	maría	6
--Económico	23432988J	ramos	maría	5
--Ejecutivo	23446456A	gonzález	josé	3
--Económico	43005006C	rodríguez	juan	3
--Ejecutivo	43566789M	fernández	jesús	3
--Ejecutivo	45567678D	rodríguez	juana	6
--Todo terreno	45567678D	rodríguez	juana	3
--Furgoneta	45667443T	gonzález	alberto	3
--Económico	45678901G	pérez	ana	3
--Económico	54377890W	pérez	maría	3
--Ejecutivo	54377890W	pérez	maría	9
--Furgoneta	54377890W	pérez	maría	3
--Furgoneta	56008986F	pérez	juana	7
--Económico	56321789X	fernández	pedro	3
--Todo terreno	56321789X	fernández	pedro	3
--Ejecutivo	56999678C	hernández	josefa	14
--Todo terreno	56999678C	hernández	josefa	3
--Ejecutivo	65783450T	ramos	carmen	3
--Económico	67544345S	rojas	ana	3
--Económico	67655432N	rojas	fernando	3
--Todo terreno	67655432N	rojas	fernando	3
--Ejecutivo	75655499N	pérez	fernando	7
--Económico	76523986L	ruiz	marta	3

--12.- Importe alquiler por tipo de coche
--(dando su descripción) y cliente(DNI, nombre y apellidos)
Select t.DescripcionTipo,cl.DNICliente,cl.Apellidos,cl.Nombre,
       sum(datediff(DAY,a.FechaInicio,a.FechaFinal)*
       a.PrecioDiaEfectuado)as Importe
from ALQ_Alquiler as A
inner join ALQ_Cliente as Cl
		on A.DNICliente=cl.DNICliente
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo,cl.DNICliente,cl.Apellidos,cl.Nombre

--Furgoneta	05679340L	pérez	david	210.00
--Económico	07865988B	hernández	pedro	23.00
--Económico	13455656N	ruiz	maría	150.00
--Económico	23432988J	ramos	maría	125.00
--Ejecutivo	23446456A	gonzález	josé	168.00
--Económico	43005006C	rodríguez	juan	69.00
--Ejecutivo	43566789M	fernández	jesús	162.00
--Ejecutivo	45567678D	rodríguez	juana	336.00
--Todo terreno	45567678D	rodríguez	juana	234.00
--Furgoneta	45667443T	gonzález	alberto	210.00
--Económico	45678901G	pérez	ana	69.00
--Económico	54377890W	pérez	maría	75.00
--Ejecutivo	54377890W	pérez	maría	504.00
--Furgoneta	54377890W	pérez	maría	210.00
--Furgoneta	56008986F	pérez	juana	490.00
--Económico	56321789X	fernández	pedro	75.00
--Todo terreno	56321789X	fernández	pedro	216.00
--Ejecutivo	56999678C	hernández	josefa	784.00
--Todo terreno	56999678C	hernández	josefa	225.00
--Ejecutivo	65783450T	ramos	carmen	168.00
--Económico	67544345S	rojas	ana	75.00
--Económico	67655432N	rojas	fernando	75.00
--Todo terreno	67655432N	rojas	fernando	225.00
--Ejecutivo	75655499N	pérez	fernando	378.00
--Económico	76523986L	ruiz	marta	66.00

--13.- Lista de tipos de coche por su descripción 
--ordenados de mayor a menor según lo que se ha ganado con 
--ellos.
Select t.DescripcionTipo , 
SUM(datediff(DAY,a.FechaInicio,a.FechaFinal)
       *a.PrecioDiaEfectuado) as 'Importe total'
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo
order by [Importe total] desc

--Ejecutivo	2500.00
--Furgoneta	1120.00
--Todo terreno	900.00
--Económico	802.00

--14.- Alquileres con precio diferente al actual, 
--dando matrícula, DNI, la fecha de inicio, 
--el nº de días, el importe facturado, 
--el importe con los precios actuales y la diferencia
Select A.matricula,a.DNICliente,A.FechaInicio,
datediff(DAY,a.FechaInicio,a.FechaFinal) as Ndias,
datediff(DAY,a.FechaInicio,a.FechaFinal)*a.PrecioDiaEfectuado 
as ImporteFacturado,
datediff(DAY,a.FechaInicio,a.FechaFinal)*t.PrecioDia 
as ImportePrecioActual,
datediff(DAY,a.FechaInicio,a.FechaFinal)*a.PrecioDiaEfectuado
-datediff(DAY,a.FechaInicio,a.FechaFinal)*t.PrecioDia 
as diferencia
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
where a.PrecioDiaEfectuado<>t.PrecioDia
--3216-BHF	07865988B	2011-01-03 00:00:00.000	1	23.00	25.00	-2.00
--3256-GDF	43005006C	2011-01-02 00:00:00.000	3	69.00	75.00	-6.00
--9876-GGF	43566789M	2011-02-06 00:00:00.000	3	162.00	168.00	-6.00
--7865-BTG	45567678D	2011-02-10 00:00:00.000	3	234.00	225.00	9.00
--2354-HBC	45678901G	2011-01-01 00:00:00.000	3	69.00	75.00	-6.00
--7865-BTG	56321789X	2011-01-10 00:00:00.000	3	216.00	225.00	-9.00
--9743-GLH	75655499N	2011-02-07 00:00:00.000	7	378.00	392.00	-14.00
--4589-HBD	76523986L	2011-02-04 00:00:00.000	3	66.00	75.00	-9.00

--15.- Máximo nº de días de alquiler por tipo de coche, 
--dando su descripción
Select t.DescripcionTipo, 
max(datediff(DAY,a.FechaInicio,a.FechaFinal)) as 'Nº de días'
from ALQ_Alquiler as A
inner join ALQ_Coche as C
		on A.Matricula=C.Matricula
inner join ALQ_TipoCoche as T
		on C.CodTipo=T.CodTipo
group by t.DescripcionTipo

--Económico	3
--Ejecutivo	13
--Furgoneta	7
--Todo terreno	3

--16.- Número de alquileres por coche
Select A.Matricula  , COUNT(*) as NAlquileres
from ALQ_Alquiler as A
group by A.Matricula

--2354-HBC	3
--3216-BHF	3
--3256-GDF	3
--4589-HBD	3
--7863-FGG	3
--7865-BTG	2
--8763-GLH	2
--8999-HBC	2
--9743-GLH	3
--9803-HBB	2
--9876-GGF	3

--17.- Número de alquileres que comenzaron en el mes 
--de febrero de 2011 por cliente(DNI, nombre y apellidos)
select A.DNICliente,c.Apellidos,c.Nombre,COUNT(*) as Nalquileres
from ALQ_Alquiler as A
inner join ALQ_Cliente as C
		on A.DNICliente=c.DNICliente
where (month(a.FechaInicio)=2)and (year(a.FechaInicio)=2011)
group by A.DNICliente,c.Apellidos,c.Nombre

--05679340L	pérez	david	1
--13455656N	ruiz	maría	2
--23432988J	ramos	maría	2
--43566789M	fernández	jesús	1
--45567678D	rodríguez	juana	2
--54377890W	pérez	maría	2
--56321789X	fernández	pedro	1
--56999678C	hernández	josefa	2
--65783450T	ramos	carmen	1
--67544345S	rojas	ana	1
--67655432N	rojas	fernando	1
--75655499N	pérez	fernando	1
--76523986L	ruiz	marta	1

--18.- Edad y antigüedad de carnet de clientes en momento 
--del alquiler (DNI, nombre y apellidos)
select	A.DNICliente,c.Apellidos,c.Nombre,a.FechaInicio,
		c.FechaCarnet,
		datediff(YEAR,c.FechaNacimiento,a.FechaInicio) 
			as Edad,
		datediff(YEAR,c.FechaCarnet,a.FechaInicio) 
			as AntigüedadCarnet 
from ALQ_Alquiler as A
inner join ALQ_Cliente as C
		on A.DNICliente=c.DNICliente


--19.- Total importe de alquileres que comenzaron en el 
--mes de febrero de 2011
select sum(datediff(DAY,a.FechaInicio,a.FechaFinal)
		*a.PrecioDiaEfectuado) as ImporteFacturado
from ALQ_Alquiler as A
where (month(a.FechaInicio)=2)and (year(a.FechaInicio)=2011)

--3553.00

	
