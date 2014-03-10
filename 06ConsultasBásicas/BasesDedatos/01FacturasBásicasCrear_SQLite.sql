create table FAC_T_Articulo
(		
	CodArticulo 	integer,
	NombreArticulo	varchar(50),
	PrecioActual	numeric(10,2)
);



create table FAC_T_Cliente
(		
	CodCliente 		integer,
	NombreCliente	varchar(60),
	DatosCliente	varchar(60),
	FechaAlta		datetime ,
	FechaNacimiento	datetime 
);


--cargar datos

insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 1,'Antonio','C-uno nº 3','2012-01-03','1970-04-15');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 2,'Juan','C-la hornera nº 7' ,'2012-05-22','1982-06-29' );
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 3,'María','C-el pino nº 7','2010-05-22','1960-06-05');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 7,'Ana','C-el monte nº 6','2012-10-15','1963-12-26');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 12,'Juana','C-la estaca nº 77','2009-05-23','1963-12-15');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 22,'Los Espacios S.L.','Rambla nº 17','2012-04-15',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 33,'La Reserva S.A.','Puerto nº 66','2011-12-23',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 66,'TITSA','Intercambiador','2012-08-14',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 99,'Contado','Sin datos','2010-01-23',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 80,'Juana María','C-La hoguera 23','2010-10-23','1963-12-26');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 81,'Fernando','Av Los Majuelos 7','2010-01-15','1968-11-02');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 82,'Isabel','Finca España','2011-12-17','1975-05-14');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 83,'Ana Luisa','C-la una nº 34','2012-06-24','1950-05-26');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 84,'Francisco Javier','','2010-07-15',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 85,'María Luisa','C-La laguna nº 77','2011-06-18',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 86,'Antonio Juan','','2010-01-19','1980-12-12');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 87,'José','','2011-12-03',null);
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 88,'Mauricio',null,'2012-08-14','1980-06-15');
insert into FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 89,'Elena','Sin datos','2010-01-23',null);


insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 22,'llave ajustable 200mm',12.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 25,'llave allen 1.5',6.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 28,'llave combinada 6',5.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 36,'martillo bellota',10.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 37,'martillo ebanista',13.20 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 39,'destornillador plano',1.55 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 40,'destornillador philips',2.25 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 46,'tenaza',2.34 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 50,'mordaza bloqueable',10.25 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 60,'alicate pelacables',10.15 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 75,'alicate corte diagonal',13.20 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 80,'taladro sin cable especial',102.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 90,'taladro atornillador sin cable',145.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 98,'taladro con cable',76.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 105,'destornillador eléctrico sin cable',80.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 110,'sierra de calar',12.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 120,'sierra circular',112.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 150,'lijadora orbital',110.00 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 300,'tornillo 3mm',0.20 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 310,'tuerca 3mm',0.10 );
insert into FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 888,'tornillo redondo',23.50 );
