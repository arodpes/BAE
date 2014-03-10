
use tablasprueba;

drop table if exists Tabla1;
CREATE TABLE Tabla1
(ID INT, Valor1 VARCHAR(10));

INSERT INTO Tabla1 (ID, Valor1)
values	(1,'Primero'),
		(2,'Segundo'),
		(3,'Tercero'),
		(4,'Cuarto'),
		(5,'Quinto');

drop table if exists Tabla2;
CREATE TABLE Tabla2
(ID INT, Valor2 VARCHAR(10));

INSERT INTO Tabla2 (ID, Valor2)
values	(1,'Primero'),
		(2,'Segundo'),
		(3,'Tercero'),
		(6,'Sexto'),
		(7,'Séptimo'),
		(8,'Octavo');