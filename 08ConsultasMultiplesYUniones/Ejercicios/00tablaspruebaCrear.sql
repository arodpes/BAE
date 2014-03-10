--tablas genéricas
--create database tablasprueba;
--go
use tablasprueba;
go
IF object_id('Tabla1', 'U') IS NOT NULL DROP TABLE [Tabla1]
IF object_id('Tabla2', 'U') IS NOT NULL DROP TABLE [Tabla2]
go

CREATE TABLE Tabla1
(ID INT, Valor1 VARCHAR(10));
go
INSERT INTO Tabla1 (ID, Valor1)
values	(1,'Primero'),
		(2,'Segundo'),
		(3,'Tercero'),
		(4,'Cuarto'),
		(5,'Quinto');
GO
CREATE TABLE tabla2
(ID INT, Valor2 VARCHAR(10));
go
INSERT INTO Tabla2 (ID, Valor2)
values	(1,'Primero'),
		(2,'Segundo'),
		(3,'Tercero'),
		(6,'Sexto'),
		(7,'Séptimo'),
		(8,'Octavo');
GO
