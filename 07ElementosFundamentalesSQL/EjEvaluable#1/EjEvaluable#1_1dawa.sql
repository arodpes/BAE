--1 crear base de datos
--create database Movies
--go

--2  crear tabla peliculas
use Movies;
go
if object_id('Peliculas') is not null
  drop table Peliculas;
  go
  
create table Peliculas
(
	Id int IDENTITY primary key,
	Titulo nvarchar(100) NOT NULL,
	Director nvarchar(100) default 'Desconocido',
	Agno int NULL,
	FechaCompra datetime,
	precio numeric(6,2) default 0
);
go

--3 crear tabla socios
if object_id('Socios') is not null
  drop table Socios;
  go
  
create table Socios
(
	NIFNIE char(9) primary key,
	Apellidos varchar(50) NOT NULL,
	Nombre varchar(100) not null,
	Direccion varchar(100) default 'Desconocida',
	Telefono char(9) not null,
	FechaDeAlta datetime default getdate()
);
go


--4 insertar registros para trabajar
use Movies;
go

set dateformat dmy

 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Rashomon','Akira Kurosawa',1951,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Forrest Gump','Robert Zemeckis',1994,'01/02/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Fiera de mi Niña','Howard HawksI',1938,'01/03/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'L''atalante','Jean Vigo',1934,'04/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Persona','Ingmar Bergman',1966,'06/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Memorias de Africa','Sydney Pollack',1985,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Gandhi','R. Attenborough',1982,'01/01/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Titanic','James Cameron',1997,'01/01/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Golpe','George Roy Hill',1973,'05/07/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Halcón Maltés','John Huston',1941,'01/04/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Paciente Ingles','Anthony Minghella',1996,'01/02/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Parada de los Monstruos','Tod Browning',1936,'01/02/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Pulp Fiction','Quentin Tarantino',1994,'05/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Intolerancia','David W. Griffith',1916,'06/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Ley del Silencio','Elia Kazan',1954,'07/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Fuerza Del Cariño','James L. Brooks',1983,'01/01/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Los Cuentos de Tokyo','Yasujiro Ozu',1953,'05/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Con Faldas y a lo Loco','Billy Wilder',1959,'09/10/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Shakespeare In Love','John Madden',1998,'01/01/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Palabra','Carl Theodor Dreyer',1954,'01/01/2013')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Amanecer','F. W. Murnau',1927,'01/05/2013')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Los Intocables de Eliot Ness','Brian De Palma',1987,'04/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Love Story','Arthur Hiller',1970,'02/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Roma, Ciudad Abierta','Roberto Rossellini',1945,'22/04/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Huelga','S. M. Eisenstein',1924,'31/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Fellini 8 1/2','Federico Fellini',1963,'16/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Vértigo / De entre los Muertos','Alfred Hitchcock',1958,'14/03/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Sed de Mal','Orson Welles.',1958,'01/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Espartaco','Stanley Kubrick',1960,'22/05/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Gabinete Del Doctor Caligari','Robert Wiene',1919,'01/01/2000')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Melodías de Broadway','Vincente Minnelli',1953,'05/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Pasión de Los Fuertes','John Ford',1946,'01/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Moby Dick','John Huston',1956,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Padrino II','Francis Ford Coppola',1974,'05/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cita en San Luis','Vincente Minelli.',1944,'01/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Intendente Sansho','Kenji Mizoguchi',1954,'04/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Andrei Rubliov','Andrei Tarkovski',1966,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'En Busca Del Arca Perdida','Steven Spielberg',1980,'05/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Vida es Bella','Roberto Benigni',1998,'31/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Grease','Randal Kleiser',1978,'18/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Fresas Salvajes','Ingmar Bergman',1956,'27/04/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Carta de una Desconocida','Max Ophüls',1948,'30/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Monsieur Verdoux','Charles Chaplin',1946,'06/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cuentos de la Luna Pálida','Kenji Mizoguchi',1953,'01/01/2009')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Pasión de Juana de Arco','Carl Theodor Dreyer',1928,'15/08/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Murieron Con Las Botas Puestas','Raoul Walsh',1941,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Año Pasado en Marienbad','Alain Resnais',1961,'01/09/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( '1492, la Conquista del Paraiso','Ridley Scott',1992,'01/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Los Diez Mandamientos','Cecil B. De Mille',1956,'16/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Braveheart','Mel Gibson',1995,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Cid','Anthony Mann',1961,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Pickpocket','Robert Bresson',1959,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Casablanca','Michael Curtiz',1942,'01/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Gladiator','Ridley Scott',2000,'01/08/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Jules y Jim','Francois Truffaut',1961,'16/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Tiburón','Steven Spielberg',1975,'25/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Reina de África','John Huston',1951,'25/03/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Río Bravo','Howard Hawks',1959,'01/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Avaricia','Erich Von Stroheim',1923,'15/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Quimera del Oro','Charles Chaplin',1925,'19/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Mujeres al Borde de un Ataque de Nervios','Pedro Almodóvar',1987,'23/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Regla del Juego','Jean Renoir',1939,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Ha Nacido una Estrella','George Cukor',1954,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Lista de Schlinder','Steven Spielberg',1993,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Acorazado Potemkin','S. M. Eisenstein',1925,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Strada','Federico Fellini',1954,'01/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Robin de Los Bosques','Michael Curtiz',1938,'06/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Mary Poppins','Robert Stevenson',1964,'05/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Breve Encuentro','David Lean',1945,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Padrino I','Francis Ford Coppola',1972,'09/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Mago de Oz','Victor Fleming',1939,'01/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Aventura','Michelangelo Antonioni',1960,'09/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Toro Salvaje','Martin Scorsese',1980,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Los Niños del Paraíso','Marcel Carné',1945,'12/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Doctor Zhivago','David Lean',1965,'23/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Lawrence de Arabia','David Lean',1962,'18/09/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Al Final de la Escapada','Jean Luc Godard',1959,'23/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Historias de Filadelfia','George Cukor',1940,'14/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Aleluya','King Vidor',1929,'19/05/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Narciso Negro','Michael Powell, Emeric Pressburger',1946,'01/06/2013')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Apocalypse Now','Francis Ford Coppola',1979,'01/04/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Con la Muerte en los Talones','Alfred Hitchcock',1959,'01/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Centauros del Desierto','John Ford',1956,'12/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Novia de Frankestein','James Whale',1935,'19/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Maquinista de la General','Buster Keaton',1926,'21/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Chinatown','Roman Polanski',1974,'01/08/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Cantor de Jazz','Alan Crosland',1927,'01/03/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Guerra de Las Galaxias','George Lucas',1977,'01/08/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Las Zapatillas Rojas',default,1948,'01/03/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Perro Andaluz','Luis Buñuel',1929,'01/02/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Ladrón de Bicicletas','Vittorio de Sica',1948,'16/02/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cenizas y Diamantes','Andrej Wajda',1958,'21/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'American Beauty','Sam Mendes',1999,'05/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Instinto Basico','Paul Verhoeven',1992,'19/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Fuego en el Cuerpo','Lawrence Kasdan',1981,'12/05/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Ghost','Jerry Zucker',1990,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Horizontes Perdidos','Frank Capra',1937,'09/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Matrix','Andy/Larry Wachowsky',1999,'01/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Señor de los Anillos I,II,III','Peter Jackson',2001,'01/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Gilda','Charles Vidor',1946,'01/10/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Vampiro de Düsseldorf','Fritz Lang',1931,'01/09/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'A Vida o Muerte','E. Pressburger, Michael Powell',1946,'08/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( '¡Qué Bello Es Vivir!','Frank Capra',1946,'31/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Tierra','Alexander Dovzhenko',1930,'15/01/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Naranja Mecanica','Stanley Kubrick',1971,'01/01/2009')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Séptimo Sello','Ingmar Bergman',1956,'01/01/2008')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Amarcord','Fedrico Fellini',1974,'01/01/2008')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Gata sobre el Tejado de Zinc','Richard Brooks',1958,'01/01/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Luces de la Ciudad','Charles Chaplin',1930,'01/01/2003')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Blade Runner','Ridley Scott',1982,'01/09/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Ser o No Ser','Ernst Lubistch',1942,'06/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Gran Ilusión','Jean Renoir',1937,'08/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'E. T. el Extraterrestre','Steven Spielberg',1982,'01/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Grupo Salvaje','Sam Peckinpah',1969,'01/09/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Noche del Cazador','Charles Laughton',1955,'01/11/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cadena Perpetua','Frank Darabont',1994,'01/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( '39 Escalones','Alfred Hitchcock',1935,'15/11/2010')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Dolce Vita','Federico Fellini',1960,'01/05/2008')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cadenas Rotas','David Lean',1946,'01/06/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Te Querré Siempre','Roberto Rossellini',1953,'04/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Doce Del Patibulo','Robert Aldrich',1967,'18/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Nombre de la Rosa','J. J. Annaud',1986,'11/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Viridiana','Luis Buñuel',1961,'06/07/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Psicosis','Alfred Hitchcok',1961,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Mi Querida Señorita',default,1971,'05/01/2009')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Los Siete Samuráis','Akira Kurosawa',1954,'06/01/2009')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'La Diligencia','John Ford',1939,'01/06/2008')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( '2001 Odisea del Espacio','Stanley Kubrick',1969,'01/10/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Tiempos Modernos','Charles Chaplin',1936,'19/01/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Cantando Bajo la Lluvia',default,1952,'10/10/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Tercer Hombre','Carol Reed',1949,'11/10/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Silencio de los Corderos','Jonathan Demme',1991,'05/06/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Ultimo Tango en Paris','Bernardo Bertolucci',1973,'04/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Crepúsculo de los Dioses','Billy Wilder',1950,'01/06/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Lo que el Viento se Llevó','Víctor Fleming',1939,'09/01/2008')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Ciudadano Kane','Orson Welles',1941,'01/01/2005')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Espíritu de la Colmena','Victor Erice',1973,'04/10/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Perdición','Billy Wilder',1944,'31/12/2012')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Sopa de Ganso','Leo McCarey',1933,'07/09/2011')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Eva Al Desnudo','Joseph L. Mankiewicz',1950,'05/06/2007')
 insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'Sombrero de Copa','Mark Sandrich',1935,'01/01/2005')
 go
 
 
set dateformat dmy;
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('27194787R','Pérez Rodríguez','Antonio','C/La Luna nº 45','922654545','01/02/2002');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('43996453Y','Medina Martínez','Fernando','C/Los Pilares nº21','922620901','01/05/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('67385963B','González Hernández','Juan','C/El Sol nº78','922342312','05/09/2010');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('69241320G','Fernández Armas','José','C/Del Islote nº43','822182813','06/08/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('71197567D','García Santana','Claudia','C/Fernández nº12','922865295','14/05/2009');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('72794799Y','Hernández Delgado','Adrián','C/La ola','922683063','16/04/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('77754689S','Pérez Pérez','María','C/Primera nº 7','922804567','16/04/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('90085870E','Armas Santos','Rosa','Avda. Roma','922053496','15/03/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('X5363526H','Pérez Rodríguez','Teresa','C/La Luna nº45','922654545','16/04/2007');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y0662510D','Santos Martín','Sara','C/El Quijote nº65','822035853','23/05/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y2113806M','Martínez Abreu','Carlos','C/Las hogueras nº3','922729710','16/09/2010');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z1674471F','Delgado Campos','Pepe','C/El Rosal nº 8','922580181','23/12/2009');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z9874858C','Rodríguez Heredia','Celia','Plaza Francia','822601369','12/09/2010');
go

--4 insertar fila en tabla peliculas
insert Peliculas ( Titulo,Director,Agno,FechaCompra)  values ( 'El Cuarto Mandamiento','Orson Welles',1942,getdate())

--5 insertar fila en la tabla socios
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z9886079V','González González','Laura',default,'922836107',null);

--6 modificar pelicula 39 Escalones
update peliculas 
	set FechaCompra=DATEADD(day,20,fechacompra)
	where Titulo='39 Escalones'
select Titulo,Director,Agno,FechaCompra
from peliculas
where titulo='39 Escalones'

--7 modificar socio
update Socios 
	set direccion='C/Esmeralda nº 7',
		telefono='822098098'
	where NIFNIE='72794799Y';

select NIFNIE,Apellidos, Nombre, 
	Direccion,Telefono,FechaDeAlta
	from socios
	where NIFNIE='72794799Y';

--8 borrar peliculas agno 1935
delete from peliculas where agno=1935

--9.- Mostar tilulo y agno de todas las peliculas
select Titulo,Agno
from peliculas
--10.- Mostrar Titulo y año en que se celebra 
--el 25 aniversario de todas las películas, ordenado por 
--el aniversario descendente y Titulo
select Titulo,Agno+25 as aniversario
from peliculas
order by aniversario desc, titulo asc
--11.- Mostar Titulo y Director de películas 
--posteriores a 1960 y que se hayan comprado 
--en el año 2012.
select Titulo,Director,FechaCompra
from peliculas
where (Agno >1960) and (DATEPART(year,fechacompra)=2012)
--12.- Mostrar películas compradas entre los 
--meses de abril y junio.
select Titulo,Director,Agno,FechaCompra
from peliculas
where DATEPART(MONTH ,fechacompra) between 4 and 6;

--13.- Mostrar los socios con primer carácter 
--del NIFNIE numérico.
select NIFNIE,Apellidos, Nombre, 
	Direccion,Telefono,FechaDeAlta
	from socios
	where substring(NIFNIE,1,1) in ('0','1','2','3','4','5','6','7','8','9')
select NIFNIE,Apellidos, Nombre, 
	Direccion,Telefono,FechaDeAlta
	from socios
	where NIFNIE like '[0-9]%'
--14.- Mostrar los apellidos y nombre 
--(en una única columna, separados por una coma y denominando a la columna 
--nombre completo) y el mes de alta de todos los socios.
select Apellidos + ', '+Nombre as 'Nombre Completo', 
	datename(MONTH ,FechaDeAlta) as 'Mes de alta'
	from socios;
--15.- Mostrar los socios que cumplen años de ser socios en abril
--o cuyo teléfono comience por 822
select NIFNIE,Apellidos, Nombre, 
	Direccion,Telefono,FechaDeAlta
	from socios
	where	(datename(MONTH,FechaDeAlta)='Abril') or 
			(SUBSTRING(telefono,1,3)='822');

--16.- Mostar todas las películas con director 
--que contenga 'We' y de año posterior a 1945.
select Titulo,Director,Agno,FechaCompra
from peliculas
where (director like '%We%') and (Agno>1945);

--17.- Mostrar los socios que tengan un 4 en el quinto carácter y 
--un 8 o un 9 en el séptimo del NIFNIE usando like.
select NIFNIE,Apellidos, Nombre, 
	Direccion,Telefono,FechaDeAlta
	from socios
	where NIFNIE like '____[4]_[89]%';
--18.- Mostrar el nombre, apellidos, NIFNIE y meses 
--de antigüedad hoy de todos los socios, ordenados por apellido y nombre
select Nombre,Apellidos,NIFNIE,
	datediff(month,FechaDeAlta,GETDATE()) as 'meses antigüedad'
	from socios
	order by Apellidos,Nombre;
--19.- Mostrar todos los datos de las películas 
--ordenados por agno y Titulo, posteriores a 1970
select Titulo,Director,Agno,FechaCompra
from peliculas
where Agno >1970
order by Agno,Titulo
--20.- Borrar toda la tabla socios de manera rápida 
--(no con delete)
--truncate table socios;







