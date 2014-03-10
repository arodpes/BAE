--create database AlquilerCoches;
--go
use AlquilerCoches;
go
if object_id('ALQ_Alquiler') is not null
  drop table ALQ_Alquiler;
  go
if object_id('ALQ_Cliente') is not null
  drop table ALQ_Cliente;
  go
if object_id('ALQ_Coche') is not null
  drop table ALQ_Coche;
  go
if object_id('ALQ_tipoCoche') is not null
  drop table ALQ_tipoCoche;
  go



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
   
go

insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 1,'Econ�mico',25.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 2,'Ejecutivo',56.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 3,'Furgoneta',70.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 4,'Todo terreno',75.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 66,'Nuevo tipo de coche',22.50 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 67,'Nuevo tipo de coche',22.50 )
go

insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '2354-HBC','Ford KA 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '3216-BHF','Seat Ibita 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '3256-GDF','Opel Corsa 5 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '4589-HBD','Volkswagen Polo 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5567 HGT','Peque�o golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5568 HGT','Peque�o golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5599 HGT','Peque�o golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '7863-FGG','Volvo S60 5 puertas',2 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '7865-BTG','Land Rover Discovery',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '8763-GLH','Opel Combo',3 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '8999-HBC','Volvo XC90',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9567-CCD','Land Rover Discovery',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9743-GLH','Opel Vectra 5 puertas',2 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9803-HBB','Renault Kangoo',3 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9876-GGF','Opel Vectra 5 puertas',2 )
go

insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '05679340L','p�rez','david','c/galicia n� 32','Ene 30 1985 12:00AM','Ene 30 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '07865988B','hern�ndez','pedro','Rambla n� 7','Oct 10 1990 12:00AM','Oct 10 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '13455656N','ruiz','mar�a','c/fuerteventura n� 9','Mar 21 1980 12:00AM','Mar 21 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '23432988J','ramos','mar�a','c/lanzarote n� 99','Mar 22 1980 12:00AM','Mar 22 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '23446456A','gonz�lez','jos�','c/cinco de mayo n� 7','Oct 14 1990 12:00AM','Oct 14 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43005006C','rodr�guez','juan','C/x n� 6','Ene  2 1960 12:00AM','Ene  2 1982 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43554430C','gonz�lez','samuel','c/principal n� 54','Ene 30 1985 12:00AM','May 30 2008 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43566789M','fern�ndez','jes�s','c/la mancha n� 8','Ene 28 1985 12:00AM','Ene 28 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45567678D','rodr�guez','juana','C/seis n� 8','Oct 12 1990 12:00AM','Oct 12 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45667443T','gonz�lez','alberto','c/alborada n� 7','Mar 17 1980 12:00AM','Mar 17 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45678901G','p�rez','ana','C/una n� 5','Ene  1 1960 12:00AM','Ene  1 1982 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '54377890W','p�rez','mar�a','Avenida Primera n� 6','Oct 11 1990 12:00AM','Oct 11 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56008986F','p�rez','juana','c/el hierro n� 6','Mar 18 1980 12:00AM','Mar 18 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56321789X','fern�ndez','pedro','c/la gomera n� 8','Mar 19 1980 12:00AM','Mar 19 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56999678C','hern�ndez','josefa','c/primero de junio n� 7','Oct 13 1990 12:00AM','Oct 13 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '65783450T','ramos','carmen','c/madrid n� 75','Ene 27 1985 12:00AM','Ene 27 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '67544345S','rojas','ana','c/la palma n� 77','Ene 25 1985 12:00AM','Ene 25 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '67655432N','rojas','fernando','c/gran canaria n� 9','Mar 20 1980 12:00AM','Mar 20 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '75655499N','p�rez','fernando','c/ofra n� 3','Ene 29 1985 12:00AM','Ene 29 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '76523986L','ruiz','marta','c/la graciosa n� 66','Ene 26 1985 12:00AM','Ene 26 2007 12:00AM' )
go

insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '05679340L','8763-GLH','Feb  8 2011 12:00AM','Feb 11 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '07865988B','3216-BHF','Ene  3 2011 12:00AM','Ene  4 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '13455656N','2354-HBC','Feb  1 2011 12:00AM','Feb  4 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '13455656N','3216-BHF','Feb 14 2011 12:00AM','Feb 17 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23432988J','3256-GDF','Feb  2 2011 12:00AM','Feb  4 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23432988J','4589-HBD','Feb 15 2011 12:00AM','Feb 18 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23446456A','9743-GLH','Ene  7 2011 12:00AM','Ene 10 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '43005006C','3256-GDF','Ene  2 2011 12:00AM','Ene  5 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '43566789M','9876-GGF','Feb  6 2011 12:00AM','Feb  9 2011 12:00AM',54.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','7863-FGG','Ene  5 2011 12:00AM','Ene  8 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','7865-BTG','Feb 10 2011 12:00AM','Feb 13 2011 12:00AM',78.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','9876-GGF','Feb 17 2011 12:00AM','Feb 20 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45667443T','8763-GLH','Ene  8 2011 12:00AM','Ene 11 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45678901G','2354-HBC','Ene  1 2011 12:00AM','Ene  4 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','4589-HBD','Ene  4 2011 12:00AM','Ene  7 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','7863-FGG','Feb 16 2011 12:00AM','Feb 25 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','9803-HBB','Feb  9 2011 12:00AM','Feb 12 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56008986F','9803-HBB','Ene  9 2011 12:00AM','Ene 16 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56321789X','2354-HBC','Feb 12 2011 12:00AM','Feb 15 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56321789X','7865-BTG','Ene 10 2011 12:00AM','Ene 13 2011 12:00AM',72.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','8999-HBC','Feb 11 2011 12:00AM','Feb 14 2011 12:00AM',75.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','9743-GLH','Feb 18 2011 12:00AM','Mar  3 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','9876-GGF','Ene  6 2011 12:00AM','Ene  7 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '65783450T','7863-FGG','Feb  5 2011 12:00AM','Feb  8 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67544345S','3216-BHF','Feb  3 2011 12:00AM','Feb  6 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67655432N','3256-GDF','Feb 13 2011 12:00AM','Feb 16 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67655432N','8999-HBC','Ene 11 2011 12:00AM','Ene 14 2011 12:00AM',75.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '75655499N','9743-GLH','Feb  7 2011 12:00AM','Feb 14 2011 12:00AM',54.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '76523986L','4589-HBD','Feb  4 2011 12:00AM','Feb  7 2011 12:00AM',22.00 )
go