--1 crear base de datos
create database Facturas
go

use Facturas
go

--2 crear tabla FAC_T_Articulos
if object_id('FAC_T_Articulo') is not null
  drop table FAC_T_Articulo;
  go

create table FAC_T_Articulo
(		
	CodArticulo 	integer primary key,
	NombreArticulo	varchar(50) not null unique,
	TipoArticulo	varchar(50),
	PrecioActual	numeric(10,2) not null
);

--3 crear tabla FAC_T_Cliente
if object_id('FAC_T_Cliente') is not null
  drop table FAC_T_Cliente;
  go

create table FAC_T_Cliente
(		
	CodCliente 		integer primary key,
	NombreCliente	varchar(60) not null,
	DatosCliente	varchar(60) default 'Desconocido',
	Municipio		varchar(50),
	FechaAlta		datetime default getdate(),
	FechaNacimiento	datetime null
);

--cargar datos
set dateformat  dmy
go
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 1,'Antonio','C/uno n� 3','S/C Tenerife','01/03/2012','15/04/1970')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 2,'Juan','C/la hornera n� 7','S/C Tenerife' ,'22/05/2012','29/06/1982' )
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 3,'Mar�a','C/el pino n� 7','La Laguna','22/05/2010','15/06/1960')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 7,'Ana','C/el monte n� 6','S/C Tenerife','15/10/2012','26/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 12,'Juana','C/la estaca n� 77','S/C Tenerife','23/05/2009','15/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 22,'Los Espacios S.L.','Rambla n� 17','S/C Tenerife','15/04/2012',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 33,'La Reserva S.A.','Puerto n� 66','S/C Tenerife','23/12/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 66,'TITSA','Intercambiador','La Laguna','14/08/2012',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 99,'Contado','Sin datos','S/C Tenerife','23/1/2010',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 80,'Juana Mar�a','C/La hoguera 23','S/C Tenerife','23/10/2010','26/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 81,'Fernando','Av Los Majuelos 7','S/C Tenerife','15/1/2010','2/11/1968')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 82,'Isabel','Finca Espa�a','La Laguna','17/12/2011','14/5/1975')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 83,'Ana Luisa','C/la una n� 34','S/C Tenerife','24/6/2012','26/05/1950')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 84,'Francisco Javier',default,'Tacoronte','15/7/2010',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 85,'Mar�a Luisa','C/La laguna n� 77','S/C Tenerife','18/6/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 86,'Antonio Juan',default,'S/C Tenerife','19/1/2010','12/12/1980')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 87,'Jos�',default,'Adeje','3/12/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 88,'Mauricio',default,'S/C Tenerife','14/8/2012','15/06/1980')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  values ( 89,'Elena','Sin datos','La Laguna','23/1/2010',null)
go

insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 22,'llave ajustable 200mm','Herramienta',12.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 25,'llave allen 1.5','Herramienta',6.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 28,'llave combinada 6','Herramienta',5.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 36,'martillo bellota','Herramienta',10.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 37,'martillo ebanista','Herramienta especializada',13.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 39,'destornillador plano','Herramienta',1.55 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 40,'destornillador philips','Herramienta',2.25 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 46,'tenaza','Herramienta especializada',2.34 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 50,'mordaza bloqueable','Accesorios',10.25 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 60,'alicate pelacables','Herramienta especializada',10.15 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 75,'alicate corte diagonal','Herramienta especializada',13.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 80,'taladro sin cable especial','Herramienta el�ctrica',102.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 90,'taladro atornillador sin cable','Herramienta el�ctrica',145.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 98,'taladro con cable','Herramienta el�ctrica',76.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 105,'destornillador el�ctrico sin cable','Herramienta el�ctrica',80.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 110,'sierra de calar','Herramienta el�ctrica',12.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 120,'sierra circular','Herramienta el�ctrica',112.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 150,'lijadora orbital','Herramienta el�ctrica',110.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 300,'tornillo 3mm','Torniller�a',0.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 310,'tuerca 3mm','Torniller�a',0.10 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  values ( 888,'tornillo redondo','Torniller�a',23.50 )
go

--4.- Insertar una fila en la tabla FAC_T_Articulo
--CodArticulo: 205
--NombreArticulo: Sierra circular especial
--TipoArticulo: Herramienta el�ctrica
--PrecioActual: 158,50
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,TipoArticulo,PrecioActual )  
values ( 205,'Sierra circular especial','Herramienta el�ctrica',158.50 );


--5.- Insertar una fila en la tabla FAC_T_Cliente
--CodCliente: 45
--NombreCliente: Laura Gonz�lez Gonz�lez
--DatosCliente: C/La Marina n� 3
--Municipio: S/C Tenerife
--FechaAlta: valor por defecto
--FechaNacimiento: 25/09/1990
set dateformat dmy
insert FAC_T_Cliente 
 (CodCliente,NombreCliente,DatosCliente,Municipio,FechaAlta,FechaNacimiento )  
 values ( 45,'Laura Gonz�lez Gonz�lez','C/La Marina n� 3'
 ,'S/C Tenerife',default,'25/09/1990');

--6.- Modificar el precio de los art�culos con  precio menor o igual 
--que 5 euros, increment�ndolos un 10% su valor.
update FAC_T_Articulo
	set PrecioActual=PrecioActual*1.1
	where precioactual<=5

--7.- Modificar la Direccion y el tel�fono del cliente Laura Gonz�lez Gonz�lez. 
--Los datos nuevos ser�n:
--DatosCliente: C/Esmeralda n� 7
--FechaNacimiento: 29/09/1990
set dateformat dmy
update FAC_T_Cliente
	set datoscliente='C/Esmeralda n� 7',
		FechaNacimiento='29/09/1990'
	where nombrecliente='Laura Gonz�lez Gonz�lez';
select codcliente,nombrecliente,datoscliente,fechaalta,FechaNacimiento
from FAC_T_Cliente
where nombrecliente='Laura Gonz�lez Gonz�lez';

--8.- Borrar todos los art�culos de precio menos que 1 euro.
delete from FAC_T_Articulo
where PrecioActual<1;

--9.- Mostar nombre y precio de todos los art�culos.
select nombrearticulo,precioactual from FAC_T_Articulo;

--10.- Mostrar Nombre y Datos de los clientes que cumplen a�os en junio, 
--ordenados por el n�mero de a�os que cumplen de manera ascendente, 
--mostrando adem�s la fecha de nacimiento en formato dia, mes y a�o y el n� 
--de a�os que cumple.
select nombrecliente,datoscliente,convert(varchar, fechanacimiento, 103),
DATEDIFF(year,fechanacimiento,getdate())+1
from FAC_T_Cliente
where datename(m,fechanacimiento)='junio'
order by DATEDIFF(year,fechanacimiento,getdate()) asc;

--11.- Mostar c�digo, nombre y precio de los art�culos de precio entre 10 y 50 
--euros (ambos inclusive), ordenados por el precio de manera descendente.
select codarticulo,nombrearticulo,PrecioActual
from FAC_T_Articulo
where PrecioActual between 10 and 50
order by precioactual desc;

--12.- Mostrar clientes dados de alta en enero, marzo, abril o junio.
select codcliente, nombrecliente,datoscliente,FechaAlta,FechaNacimiento
from  FAC_T_Cliente
where DATENAME(month,fechaalta) in ('enero','marzo','abril','junio');

--13.- Mostrar los art�culos que contengan un n�mero en su nombre.
select codarticulo,nombrearticulo,PrecioActual
from FAC_T_Articulo
where nombrearticulo like '%[0-9]%';

--14.- Mostrar en un �nico campo el codcliente unido con dos guiones y 
--detr�s el nombre completo de los clientes, denominando a la columna 
--datos cliente, junto al a�o de alta del mismo.
select ltrim(str(codcliente))+'--'+nombrecliente as 'datos cliente',
	DATEPART(year,FechaAlta)
from  FAC_T_Cliente;

--15.- Mostrar los clientes que cumplen a�os de ser clientes en mayo 
--y que tengan fecha de nacimiento.
select codcliente, nombrecliente,datoscliente,FechaAlta,FechaNacimiento
from  FAC_T_Cliente
where (DATENAME(MONTH,FechaAlta)='mayo') and 
	FechaNacimiento is not null;

--16-.- Mostar todos los art�culos con nombre que contenga 'destornillador' 
--y de precio superior a 2 euros.
select codarticulo,nombrearticulo,PrecioActual
from FAC_T_Articulo
where (NombreArticulo like '%destornillador%') and (precioactual>2);

--17.- Mostrar los clientes cuyo mes de alta sea enero, marzo o mayo 
select codcliente, nombrecliente,datoscliente,FechaAlta,FechaNacimiento
from  FAC_T_Cliente
where DATENAME(month,fechaalta) in ('enero','marzo','mayo');

--18.- Mostrar el nombrecompleto, codcliente y meses de antig�edad hoy de 
--todos los clientes, ordenados por nombrecompleto.
select	codcliente, nombrecliente,
		datediff(month,FechaAlta,GETDATE()) as 'meses diferencia'
from  FAC_T_Cliente
order by nombrecliente;

--19.- Mostrar el nombrecompleto y el d�a de la semana en que se dio 
--de alta cada cliente, ordenados por la fecha de alta de forma ascendente.
select	codcliente, nombrecliente,
		datename(dw,FechaAlta) as 'dia semana'
from  FAC_T_Cliente
order by fechaalta asc;


--20.- Mostrar la estructura de la tabla clientes.
exec sp_help 'FAC_T_cliente'
exec sp_columns FAC_T_cliente

--21.- Contar cu�ntos clientes tenemos.
select COUNT(*) 
from FAC_T_Cliente;

--22.- Contar cu�ntos clientes tenemos con fecha de 
--nacimiento.
select COUNT(FechaNacimiento) 
from FAC_T_Cliente;
--23.- Media del precio de los art�culos que su 
--tipo contenga Herramienta.
select AVG(PrecioActual)
from FAC_T_Articulo
where TipoArticulo like '%herramienta%';
--24.- Mostrar ordenados los Tipos de art�culo que tenemos.
select tipoarticulo
from FAC_T_Articulo
group by tipoarticulo
order by tipoarticulo;
--25.- Contar cu�ntos art�culos tenemos de cada tipo 
--de art�culo, ordenados por el n� de art�culos de mayor a menor.
select tipoarticulo, COUNT(*) as nart
from FAC_T_Articulo
group by tipoarticulo
order by nart desc;
--26.- Media de precios para cada tipo de art�culo de los que tengamos 
--m�s de 2.
select tipoarticulo, avg(precioactual)as prec
from FAC_T_Articulo
group by tipoarticulo
having COUNT(*) >2
order by prec desc;
--27.- Dos municipio con m�s clientes.
select top 2 municipio,COUNT(*) as ncli
from FAC_T_Cliente
group by municipio
order by ncli desc;
--28.- Tipos de art�culo con precio m�s alto.
select  tipoarticulo, max(precioactual)as mprec
from FAC_T_Articulo
group by tipoarticulo
order by mprec desc;
--29.- Para cada municipio contar los clientes con 
--fecha de nacimiento y los que no la tienen en la tabla.
select municipio,COUNT(FechaNacimiento) as confecha,
		count(*)-count(fechanacimiento) as sinfecha
from FAC_T_Cliente
group by Municipio
order by municipio;
--30.- Cu�ntos clientes cumplen a�o en cada mes. 
--Sacar los meses ordenados.
select datename(month,fechanacimiento),count(*) as nclientes
from FAC_T_Cliente
where fechanacimiento is not null
group by datename(month,fechanacimiento),datepart(month,fechanacimiento)
order by datepart(month,fechanacimiento);