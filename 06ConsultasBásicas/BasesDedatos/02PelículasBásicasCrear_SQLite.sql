  
create table Peliculas
(
	Id int,
	Titulo nvarchar(100),
	Director nvarchar(100),
	Agno int ,
	FechaCompra datetime,
	precio numeric(6,2)
);



  
create table Socios
(
	NIFNIE char(9) ,
	Apellidos varchar(50),
	Nombre varchar(100),
	Direccion varchar(100),
	Telefono char(9) ,
	FechaDeAlta datetime 
);






 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (1, 'Rashomon','Akira Kurosawa',1951,'2012-01-01',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (2, 'Forrest Gump','Robert Zemeckis',1994,'2012-02-01',20);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (3, 'La Fiera de mi Ni�a','Howard HawksI',1938,'2012-03-01',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (4, 'L''atalante','Jean Vigo',1934,'2012-05-04',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (5, 'Persona','Ingmar Bergman',1966,'2012-01-06',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (6, 'Memorias de Africa','Sydney Pollack',1985,'2012-06-01',15);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (7, 'Gandhi','R. Attenborough',1982,'2011-01-01',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (8, 'Titanic','James Cameron',1997,'2010-01-01',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (9, 'El Golpe','George Roy Hill',1973,'2011-07-05',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (10, 'El Halc�n Malt�s','John Huston',1941,'2012-04-01',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (11, 'El Paciente Ingles','Anthony Minghella',1996,'2012-02-01',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (12, 'La Parada de los Monstruos','Tod Browning',1936,'2012-02-01',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (13, 'Pulp Fiction','Quentin Tarantino',1994,'2012-01-05',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (14, 'Intolerancia','David W. Griffith',1916,'2012-01-06',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (15, 'La Ley del Silencio','Elia Kazan',1954,'2012-01-07',20);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (16, 'La Fuerza Del Cari�o','James L. Brooks',1983,'2010-01-01',18);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (17, 'Los Cuentos de Tokyo','Yasujiro Ozu',1953,'2012-06-05',11);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (18, 'Con Faldas y a lo Loco','Billy Wilder',1959,'2012-10-09',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (19, 'Shakespeare In Love','John Madden',1998,'01/01/2011',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (20, 'La Palabra','Carl Theodor Dreyer',1954,'01/01/2013',3);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (21, 'Amanecer','F. W. Murnau',1927,'01/05/2013',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (22, 'Los Intocables de Eliot Ness','Brian De Palma',1987,'04/06/2012',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (23, 'Love Story','Arthur Hiller',1970,'02/05/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (24, 'Roma, Ciudad Abierta','Roberto Rossellini',1945,'22/04/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (25, 'La Huelga','S. M. Eisenstein',1924,'31/01/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (26, 'Fellini 8 1/2','Federico Fellini',1963,'16/05/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (27, 'V�rtigo / De entre los Muertos','Alfred Hitchcock',1958,'14/03/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (28, 'Sed de Mal','Orson Welles.',1958,'01/07/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (29, 'Espartaco','Stanley Kubrick',1960,'22/05/2010',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (30, 'El Gabinete Del Doctor Caligari','Robert Wiene',1919,'01/01/2000',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (31, 'Melod�as de Broadway','Vincente Minnelli',1953,'05/12/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (32, 'Pasi�n de Los Fuertes','John Ford',1946,'01/12/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (33, 'Moby Dick','John Huston',1956,'01/06/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (34, 'El Padrino II','Francis Ford Coppola',1974,'05/01/2012',3);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (35, 'Cita en San Luis','Vincente Minelli.',1944,'01/05/2012',19.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (36, 'El Intendente Sansho','Kenji Mizoguchi',1954,'04/06/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (37, 'Andrei Rubliov','Andrei Tarkovski',1966,'01/01/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (38, 'En Busca Del Arca Perdida','Steven Spielberg',1980,'05/11/2012',9.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (39, 'La Vida es Bella','Roberto Benigni',1998,'31/01/2012',9.95);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (40, 'Grease','Randal Kleiser',1978,'18/05/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (41, 'Fresas Salvajes','Ingmar Bergman',1956,'27/04/2012',7.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (42, 'Carta de una Desconocida','Max Oph�ls',1948,'30/05/2012',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (43, 'Monsieur Verdoux','Charles Chaplin',1946,'06/07/2012',17.25);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (44, 'Cuentos de la Luna P�lida','Kenji Mizoguchi',1953,'01/01/2009',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (45, 'La Pasi�n de Juana de Arco','Carl Theodor Dreyer',1928,'15/08/2012',15.8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (46, 'Murieron Con Las Botas Puestas','Raoul Walsh',1941,'01/06/2012',12.6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (47, 'El A�o Pasado en Marienbad','Alain Resnais',1961,'01/09/2012',7.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (48, '1492, la Conquista del Paraiso','Ridley Scott',1992,'01/11/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (49, 'Los Diez Mandamientos','Cecil B. De Mille',1956,'16/07/2012',8.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (50, 'Braveheart','Mel Gibson',1995,'01/01/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (51, 'El Cid','Anthony Mann',1961,'01/01/2012',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (52, 'Pickpocket','Robert Bresson',1959,'01/01/2012',13.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (53, 'Casablanca','Michael Curtiz',1942,'01/07/2012',13);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (54, 'Gladiator','Ridley Scott',2000,'01/08/2012',15.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (55, 'Jules y Jim','Francois Truffaut',1961,'16/01/2012',16.3);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (56, 'Tibur�n','Steven Spielberg',1975,'25/01/2012',16.3);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (57, 'La Reina de �frica','',1951,'25/03/2012',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (58, 'R�o Bravo','Howard Hawks',1959,'01/12/2012',3.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (59, 'Avaricia','Erich Von Stroheim',1923,'15/01/2012',5.45);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (60, 'La Quimera del Oro','Charles Chaplin',1925,'19/01/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (61, 'Mujeres al Borde de un Ataque de Nervios','Pedro Almod�var',1987,'23/01/2012',9.95);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (62, 'La Regla del Juego','Jean Renoir',1939,'01/01/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (63, 'Ha Nacido una Estrella','George Cukor',1954,'01/01/2012',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (64, 'La Lista de Schlinder','Steven Spielberg',1993,'01/01/2012',17.8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (65, 'El Acorazado Potemkin','S. M. Eisenstein',1925,'01/01/2012',14);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (66, 'La Strada','Federico Fellini',1954,'01/12/2012',4.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (67, 'Robin de Los Bosques','Michael Curtiz',1938,'06/11/2012',13);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (68, 'Mary Poppins','Robert Stevenson',1964,'05/12/2012',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (69, 'Breve Encuentro','David Lean',1945,'01/01/2012',9.95);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (70, 'El Padrino I','Francis Ford Coppola',1972,'09/01/2012',7.85);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (71, 'El Mago de Oz','',1939,'01/05/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (72, 'La Aventura','Michelangelo Antonioni',1960,'09/01/2012',4.45);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (73, 'Toro Salvaje','Martin Scorsese',1980,'01/06/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (74, 'Los Ni�os del Para�so','Marcel Carn�',1945,'12/01/2012',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (75, 'Doctor Zhivago','David Lean',1965,'23/05/2012',3.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (76, 'Lawrence de Arabia','David Lean',1962,'18/09/2012',19.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (77, 'Al Final de la Escapada','Jean Luc Godard',1959,'23/11/2012',20);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (78, 'Historias de Filadelfia','George Cukor',1940,'14/01/2012',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (79, 'Aleluya','King Vidor',1929,'19/05/2012',10.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (80, 'Narciso Negro','Michael Powell, Emeric Pressburger',1946,'01/06/2013',11);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (81, 'Apocalypse Now','Francis Ford Coppola',1979,'01/04/2012',14);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (82, 'Con la Muerte en los Talones','Alfred Hitchcock',1959,'01/01/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (83, 'Centauros del Desierto','John Ford',1956,'12/01/2012',18);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (84, 'La Novia de Frankestein','James Whale',1935,'19/01/2012',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (85, 'El Maquinista de la General','Buster Keaton',1926,'21/01/2012',13);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (86, 'Chinatown','Roman Polanski',1974,'01/08/2012',6.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (87, 'El Cantor de Jazz','Alan Crosland',1927,'01/03/2012',7.70);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (88, 'La Guerra de Las Galaxias','George Lucas',1977,'01/08/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (89, 'Las Zapatillas Rojas',null,1948,'01/03/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (90, 'El Perro Andaluz','Luis Bu�uel',1929,'01/02/2012',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (91, 'El Ladr�n de Bicicletas','Vittorio de Sica',1948,'16/02/2012',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (92, 'Cenizas y Diamantes','Andrej Wajda',1958,'21/06/2012',6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (93, 'American Beauty','Sam Mendes',1999,'05/12/2012',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (94, 'Instinto Basico','Paul Verhoeven',1992,'19/07/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (95, 'Fuego en el Cuerpo','Lawrence Kasdan',1981,'12/05/2011',17);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (96, 'Ghost','Jerry Zucker',1990,'01/06/2012',19.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (97, 'Horizontes Perdidos','Frank Capra',1937,'09/01/2012',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (98, 'Matrix','Andy/Larry Wachowsky',1999,'01/12/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (99, 'El Se�or de los Anillos I,II,III','Peter Jackson',2001,'01/11/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (100, 'Gilda','Charles Vidor',1946,'01/10/2012',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (101, 'El Vampiro de D�sseldorf','Fritz Lang',1931,'01/09/2012',6.7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (102 ,'A Vida o Muerte','E. Pressburger, Michael Powell',1946,'08/01/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (103 ,'�Qu� Bello Es Vivir!','Frank Capra',1946,'31/01/2012',3.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (104 ,'La Tierra','Alexander Dovzhenko',1930,'15/01/2010',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (105 ,'La Naranja Mecanica','Stanley Kubrick',1971,'01/01/2009',5.95);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (106 ,'El S�ptimo Sello','Ingmar Bergman',1956,'01/01/2008',17);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (107 ,'Amarcord','Fedrico Fellini',1974,'01/01/2008',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (108 ,'La Gata sobre el Tejado de Zinc','Richard Brooks',1958,'01/01/2010',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (109 ,'Luces de la Ciudad','Charles Chaplin',1930,'01/01/2003',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (110 ,'Blade Runner','Ridley Scott',1982,'01/09/2012',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (111 ,'Ser o No Ser','Ernst Lubistch',1942,'06/01/2012',18.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (112 ,'La Gran Ilusi�n','Jean Renoir',1937,'08/01/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (113 ,'E. T. el Extraterrestre','Steven Spielberg',1982,'01/07/2012',9.98);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (114 ,'Grupo Salvaje','Sam Peckinpah',1969,'01/09/2012',4.15);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (115 ,'La Noche del Cazador','Charles Laughton',1955,'01/11/2012',12);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (116 ,'Cadena Perpetua','Frank Darabont',1994,'01/12/2012',13);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (117 ,'39 Escalones','Alfred Hitchcock',1935,'15/11/2010',16);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (118 ,'La Dolce Vita','Federico Fellini',1960,'01/05/2008',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (119 ,'Cadenas Rotas','David Lean',1946,'01/06/2011',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (120 ,'Te Querr� Siempre','Roberto Rossellini',1953,'04/01/2012',4.75);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (121 ,'Doce Del Patibulo','Robert Aldrich',1967,'18/01/2012',9.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (122 ,'El Nombre de la Rosa','J. J. Annaud',1986,'11/01/2012',12.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (123 ,'Viridiana','Luis Bu�uel',1961,'06/07/2012',10.5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (124 ,'Psicosis','Alfred Hitchcok',1961,'01/06/2012',7.6);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (125 ,'Mi Querida Se�orita',null,1971,'05/01/2009',20);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (126 ,'Los Siete Samur�is','Akira Kurosawa',1954,'06/01/2009',19);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (127 ,'La Diligencia','John Ford',1939,'01/06/2008',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (128 ,'2001 Odisea del Espacio','Stanley Kubrick',1969,'01/10/2012',6.75);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (129 ,'Tiempos Modernos','Charles Chaplin',1936,'19/01/2012',5);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (130 ,'Cantando Bajo la Lluvia',null,1952,'10/10/2012',14);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (131 ,'El Tercer Hombre','Carol Reed',1949,'11/10/2011',12.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (132 ,'El Silencio de los Corderos','Jonathan Demme',1991,'05/06/2011',9.99);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (133 ,'El Ultimo Tango en Paris','Bernardo Bertolucci',1973,'04/06/2012',9.95);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (134 ,'El Crep�sculo de los Dioses','Billy Wilder',1950,'01/06/2012',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (135 ,'Lo que el Viento se Llev�','V�ctor Fleming',1939,'09/01/2008',10.4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (136 ,'Ciudadano Kane','Orson Welles',1941,'01/01/2005',9);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (137 ,'El Esp�ritu de la Colmena','Victor Erice',1973,'04/10/2012',7);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (138 ,'Perdici�n','Billy Wilder',1944,'31/12/2012',4);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (139 ,'Sopa de Ganso','Leo McCarey',1933,'07/09/2011',10);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (140 ,'Eva Al Desnudo','Joseph L. Mankiewicz',1950,'05/06/2007',8);
 insert into Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (141 ,'Sombrero de Copa','Mark Sandrich',1935,'01/01/2005',3.5);

 
 

insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('27194787R','P�rez Rodr�guez','Antonio','C/La Luna n� 45','922654545','01/02/2002');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('43996453Y','Medina Mart�nez','Fernando','C/Los Pilares n�21','922620901','01/05/2008');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('67385963B','Gonz�lez Hern�ndez','Juan','C/El Sol n�78','922342312','05/09/2010');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('69241320G','Fern�ndez Armas','Jos�','C/Del Islote n�43','822182813','06/08/2012');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('71197567D','Garc�a Santana','Claudia','C/Fern�ndez n�12','922865295','14/05/2009');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('72794799Y','Hern�ndez Delgado','Adri�n','C/La ola','922683063','16/04/2012');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('77754689S','P�rez P�rez','Mar�a','C/Primera n� 7','922804567','16/04/2012');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('90085870E','Armas Santos','Rosa','Avda. Roma','922053496','15/03/2008');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('X5363526H','P�rez Rodr�guez','Teresa','C/La Luna n�45','922654545','16/04/2007');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y0662510D','Santos Mart�n','Sara','C/El Quijote n�65','822035853','23/05/2008');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y2113806M','Mart�nez Abreu','Carlos','C/Las hogueras n�3','922729710','16/09/2010');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z1674471F','Delgado Campos','Pepe','C/El Rosal n� 8','922580181','23/12/2009');
insert into Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z9874858C','Rodr�guez Heredia','Celia','Plaza Francia','822601369','12/09/2010');

