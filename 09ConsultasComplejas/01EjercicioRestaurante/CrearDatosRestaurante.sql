--create database Restaurante
--go

--creación de tablas
use Restaurante;
go


if object_id('DetalleComida') is not null
  drop table DetalleComida;
  go
if object_id('Comida') is not null
  drop table Comida;
  go
if object_id('Mesa') is not null
  drop table Mesa;
  go
if object_id('Plato') is not null
  drop table Plato;
  go
if object_id('TipoPlato') is not null
  drop table TipoPlato;
  go




create table Mesa
(CodMesa char(3) primary key);

create table Plato
(CodPlato integer primary key,
 Plato varchar(150) not null,
 Precio numeric (6,2) not null check(Precio >0),
 CodTipoPlato integer not null);

create table TipoPlato
(CodTipoPlato integer primary key,
 TipoPlato varchar(100) not null,
 Agrupa varchar(10) not null check(Agrupa in ('Plato','Bebida')));

create table Comida
(IdComida integer identity primary key,
 Fecha datetime not null,
 CodMesa char(3) not null,
 Pagado char(1) not null check(Pagado in ('S','N')) default 'N');

create table DetalleComida
(IdDetalle integer identity primary key,
 IdComida integer not null,
 CodPlato integer not null,
 PrecioPlato numeric (6,2) not null check(PrecioPlato >0),
 Servido char(1) not null check(Servido in ('S','N')) default 'N');

go

--foreign key
alter table Plato
 add constraint Fk_Plato_TipoPlato
 foreign key (CodTipoPlato)
 references TipoPlato(CodTipoPlato);
 
alter table Comida
 add constraint Fk_Comida_Mesa
 foreign key (CodMesa)
 references Mesa(CodMesa);

alter table DetalleComida
 add constraint Fk_DetalleComida_Comida
 foreign key (IdComida)
 references Comida(IdComida);

alter table DetalleComida
 add constraint Fk_DetalleComida_Plato
 foreign key (CodPlato)
 references Plato(CodPlato);
 go

--Insertar Mesa
insert into Mesa values ('A01');
insert into Mesa values ('A02');
insert into Mesa values ('A03');
insert into Mesa values ('A04');
insert into Mesa values ('A05');
insert into Mesa values ('A06');
insert into Mesa values ('A07');
insert into Mesa values ('A08');
insert into Mesa values ('B01');
insert into Mesa values ('B02');
insert into Mesa values ('B03');
insert into Mesa values ('B04');
insert into Mesa values ('B05');
insert into Mesa values ('C01');
insert into Mesa values ('C02');
insert into Mesa values ('C03');
insert into Mesa values ('C04');
go
--Insertar TipoPlato
insert into TipoPlato values ( 1 ,'Entrantes fríos', 'Plato');
insert into TipoPlato values ( 2 ,'Entrantes Calientes', 'Plato');
insert into TipoPlato values ( 3 ,'Pasta y Arroces', 'Plato');
insert into TipoPlato values ( 4 ,'Pescados y Mariscos', 'Plato');
insert into TipoPlato values ( 5 ,'Carnes', 'Plato');
insert into TipoPlato values ( 6 ,'Los postres', 'Plato');
insert into TipoPlato values ( 7 ,'Cerveza', 'Bebida');
insert into TipoPlato values ( 8 ,'Cavas', 'Bebida');
insert into TipoPlato values ( 9 ,'Agua y zumos', 'Bebida');
insert into TipoPlato values ( 10 ,'Bebidas calientes', 'Bebida');
go

--Insertar Plato
insert into Plato values ( 0 ,'Servicio de Pan y Mantequilla', 1, 1);
insert into Plato values ( 1 ,'Pan tostado con tomate y jamón ibérico de bellota', 6, 1);
insert into Plato values ( 2 ,'Ensalada César', 9, 1);
insert into Plato values ( 3 ,'Gazpacho de mangas', 6, 1);
insert into Plato values ( 4 ,'Ensalada de bacalao con vinagreta española', 11, 1);
insert into Plato values ( 5 ,'Salmón marinado al eneldo con salsa de mostaza', 12, 1);
insert into Plato values ( 6 ,'Tabla de embutidos ibéricos con rúcula y tomates cherry', 13.5, 1);
insert into Plato values ( 7 ,'Filetes de arenque marinados sobre un lecho de patatas cocidas con manzana Goleen y salsa de curry', 11, 1);
insert into Plato values ( 8 ,'Foie mi-cuit de pato sobre pan tostado con sésamo y salsa de moras', 11, 1);
insert into Plato values ( 9 ,'Crema de mariscos con corona de nata', 6, 2);
insert into Plato values ( 10 ,'Ensalada templada de verduras rebozadas con reducción de balsámic', 9, 2);
insert into Plato values ( 11 ,'Verduritas de la huerta a la plancha con aliño de vinagre balsámico y aceite Hojiblanca', 9, 2);
insert into Plato values ( 12 ,'Colas de langostinos y manzanas en tempura', 12, 2);
insert into Plato values ( 13 ,'Foie de pato dorado en la sartén con pera caramelizada y salsa al Pedro Ximénez', 11.5, 2);
insert into Plato values ( 14 ,'Nido de pasta con langostinos y calabacines en salsa de champán', 11, 3);
insert into Plato values ( 15 ,'Tortellini a la carbonara y crujiente de puerro', 9, 3);
insert into Plato values ( 16 ,'Arroz caldoso con bogavante (Minimo 2 personas - Precio por persona)', 23, 3);
insert into Plato values ( 17 ,'Paella de pescado y marisco (Minimo 2 personas - Precio por persona)', 13, 3);
insert into Plato values ( 18 ,'Filetes de salmonetes al horno con majada de cilantro y cebolla confitada', 13, 4);
insert into Plato values ( 19 ,'Centro de bacalao en su punto de sal con ajos tostados y pimientos del piquillo', 14.5, 4);
insert into Plato values ( 20 ,'Salmón rojo a la plancha con verduritas de la huerta', 15, 4);
insert into Plato values ( 21 ,'Lenguado relleno de gambas y gratinado con salsa Mornay', 16, 4);
insert into Plato values ( 22 ,'Lomo de merluza con gulas y gratinado con salsa holandesa', 19.5, 4);
insert into Plato values ( 23 ,'Langosta rellena de aguacate y gratinada con salsa holandesa', 19.5, 4);
insert into Plato values ( 24 ,'Magret de pato sobre un lecho de patatas salteadas con frutos del bosque y coulis de moras', 12, 5);
insert into Plato values ( 25 ,'Entrecot fresco a la parrilla con mantequilla Café de Paris', 13.5, 5);
insert into Plato values ( 26 ,'Centro de solomillo a la parrilla con verduritas torneadas y salsa a elección', 16.5, 5);
insert into Plato values ( 27 ,'Chateaubriand con dos salsas (mín. 2 personas - Precio por persona)', 16.5, 5);
insert into Plato values ( 28 ,'Dueto de solomillo de ternera lechal y de buey con salsa al vino tinto y bearnesa', 17, 5);
insert into Plato values ( 29 ,'Chuletillas de cordero lechal con lecho de panaderas y ali- oli artesano', 15.5, 5);
insert into Plato values ( 30 ,'Solomillo con medallón de foie de pato, manzana caramelizada y reducción de Pedro Ximénez', 19, 5);
insert into Plato values ( 31 ,'Tiras de pluma ibérica salteadas con champiñones y setas al brandy', 16, 5);
insert into Plato values ( 32 ,'La fondue de solomillo y magret de pato con trilogía de salsas (mín. 2 personas - Precio por persona)', 20, 5);
insert into Plato values ( 33 ,'Mousse de chocolate Black & White con virutas de chocolate y almendras', 5.5, 6);
insert into Plato values ( 34 ,'Crêpes con salsa de naranja, helado de vainilla y chantilly', 6.5, 6);
insert into Plato values ( 35 ,'Hojaldre caliente de manzana sobre un espejo de crema inglesa', 5, 6);
insert into Plato values ( 36 ,'Semifrído de manga sobre bizcocho de especies', 5, 6);
insert into Plato values ( 37 ,'Crema catalana quemada y cristales de glucosa', 5, 6);
insert into Plato values ( 38 ,'La fondue de chocolate con fruta fresca y frutos secos (mín. 2 personas - Precio por persona)', 6, 6);
insert into Plato values ( 39 ,'Mousse de toffee con salsa de chocolate caliente', 5.5, 6);
insert into Plato values ( 40 ,'Selección de quesos europeos', 6, 6);
insert into Plato values ( 41 ,'Tropical Pils de barril 0,3', 3, 7);
insert into Plato values ( 42 ,'Tropical Pils de barril 0,4', 4, 7);
insert into Plato values ( 43 ,'Guinness de barril 0,25', 2.5, 7);
insert into Plato values ( 44 ,'Guinness de barril 0,5', 4.5, 7);
insert into Plato values ( 45 ,'Fürstenberg Pils de barril 0,2', 2.5, 7);
insert into Plato values ( 46 ,'Fürstenberg Pils de barril 0,4', 4, 7);
insert into Plato values ( 47 ,'Franziskaner Weissbier 0,5', 4.5, 7);
insert into Plato values ( 48 ,'Dorada 0,33', 3, 7);
insert into Plato values ( 49 ,'Dorada, sin alcohol 0,33', 2.5, 7);
insert into Plato values ( 50 ,'Freixenet Cordon Negro Mini', 5, 8);
insert into Plato values ( 51 ,'Freixenet Carta Nevada', 18, 8);
insert into Plato values ( 52 ,'Freixenet Cordon Negro', 22, 8);
insert into Plato values ( 53 ,'Veuve Cliquot Ponsardin Brut', 54, 8);
insert into Plato values ( 54 ,'Krug Gran Cuvée', 249, 8);
insert into Plato values ( 55 ,'Coca Cola', 2.5, 9);
insert into Plato values ( 56 ,'Coca Cola Zero', 2.5, 9);
insert into Plato values ( 57 ,'Fanta Naranja', 2.5, 9);
insert into Plato values ( 58 ,'Fanta Limón', 2.5, 9);
insert into Plato values ( 59 ,'Sprite', 2.5, 9);
insert into Plato values ( 60 ,'Finley: Tonic Water', 2.5, 9);
insert into Plato values ( 61 ,'Firgas sin gas 0,5', 3.5, 9);
insert into Plato values ( 62 ,'Firgas con gas 0,5', 3.5, 9);
insert into Plato values ( 63 ,'Zumo Manzana', 2.5, 9);
insert into Plato values ( 64 ,'Zumo Maracuyá', 2.5, 9);
insert into Plato values ( 65 ,'Zumo Naranja', 2.5, 9);
insert into Plato values ( 66 ,'Zumo Piña', 2.5, 9);
insert into Plato values ( 67 ,'Zumo Tomate', 2.5, 9);
insert into Plato values ( 68 ,'Espresso', 1, 10);
insert into Plato values ( 69 ,'Cortado', 1, 10);
insert into Plato values ( 70 ,'Café con leche', 1.5, 10);
insert into Plato values ( 71 ,'Latte macchiato', 2.5, 10);
insert into Plato values ( 72 ,'Té', 1.5, 10);
insert into Plato values ( 73 ,'Cappuccino', 1.5, 10);
insert into Plato values ( 74 ,'Cacao', 2, 10);
insert into Plato values ( 75 ,'Carajillo', 3.5, 10);
insert into Plato values ( 76 ,'Irish coffee', 6, 10);
go

--formato de inserción de Comida y DetalleComida
set dateformat dmy;
go

insert into Comida values ('19/02/2012','B01','N');
go

insert into Comida values ('19/02/2012','A03','N');
go

DECLARE @identity integer;
insert into Comida values ('18/02/2012','A01','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,2,9,'S');
insert into DetalleComida values (@identity,5,12,'S');
insert into DetalleComida values (@identity,9,6,'S');
insert into DetalleComida values (@identity,14,11,'S');
insert into DetalleComida values (@identity,15,9,'S');
insert into DetalleComida values (@identity,13,11.5,'S');
insert into DetalleComida values (@identity,41,3,'S');
insert into DetalleComida values (@identity,65,2.5,'S');
insert into DetalleComida values (@identity,62,3.5,'S');
insert into DetalleComida values (@identity,61,3.5,'S');
insert into DetalleComida values (@identity,55,2.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('18/02/2012','A02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,6,13.5,'S');
insert into DetalleComida values (@identity,12,12,'S');
insert into DetalleComida values (@identity,15,9,'S');
insert into DetalleComida values (@identity,55,2.5,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,49,2.5,'S');
insert into DetalleComida values (@identity,69,1,'S');
insert into DetalleComida values (@identity,69,1,'S');
go
DECLARE @identity integer;
insert into Comida values ('18/02/2012','A03','N');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,1,6,'S');
insert into DetalleComida values (@identity,31,16,'S');
insert into DetalleComida values (@identity,18,13,'S');
insert into DetalleComida values (@identity,33,5.5,'N');
insert into DetalleComida values (@identity,34,6.5,'N');
insert into DetalleComida values (@identity,52,22,'S');
go
DECLARE @identity integer;
insert into Comida values ('18/02/2012','A04','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,2,9,'S');
insert into DetalleComida values (@identity,9,6,'S');
insert into DetalleComida values (@identity,19,14.5,'S');
insert into DetalleComida values (@identity,36,5,'S');
insert into DetalleComida values (@identity,42,4,'N');
insert into DetalleComida values (@identity,42,4,'N');
insert into DetalleComida values (@identity,68,1,'S');
go
DECLARE @identity integer;
insert into Comida values ('18/02/2012','A05','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,3,6,'S');
insert into DetalleComida values (@identity,6,13.5,'S');
insert into DetalleComida values (@identity,17,13,'S');
insert into DetalleComida values (@identity,14,11,'S');
insert into DetalleComida values (@identity,24,12,'S');
insert into DetalleComida values (@identity,32,20,'S');
insert into DetalleComida values (@identity,27,16.5,'S');
insert into DetalleComida values (@identity,33,5.5,'S');
insert into DetalleComida values (@identity,35,5,'S');
insert into DetalleComida values (@identity,36,5,'S');
insert into DetalleComida values (@identity,38,6,'S');
insert into DetalleComida values (@identity,63,2.5,'S');
insert into DetalleComida values (@identity,55,2.5,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,48,3.5,'S');
insert into DetalleComida values (@identity,48,3.5,'S');
insert into DetalleComida values (@identity,66,2.5,'S');
insert into DetalleComida values (@identity,48,3.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('18/02/2012','A06','N');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,40,6,'N');
insert into DetalleComida values (@identity,22,22.5,'N');
insert into DetalleComida values (@identity,37,5,'N');
insert into DetalleComida values (@identity,59,3,'N');
insert into DetalleComida values (@identity,76,6,'N');
go
DECLARE @identity integer;
insert into Comida values ('19/02/2012','A03','N');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,2,9,'S');
insert into DetalleComida values (@identity,1,6,'S');
insert into DetalleComida values (@identity,8,11,'S');
insert into DetalleComida values (@identity,56,3.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('19/02/2012','B02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,15,9,'S');
insert into DetalleComida values (@identity,14,11,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,1,6,'S');
insert into DetalleComida values (@identity,39,5.5,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,47,5,'S');
go
DECLARE @identity integer;
insert into Comida values ('19/02/2012','C02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,2,9,'S');
insert into DetalleComida values (@identity,3,6,'S');
insert into DetalleComida values (@identity,19,14.5,'S');
insert into DetalleComida values (@identity,21,16,'S');
insert into DetalleComida values (@identity,20,15,'S');
insert into DetalleComida values (@identity,25,13.5,'S');
insert into DetalleComida values (@identity,58,2.5,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,49,2.5,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,74,2,'S');
insert into DetalleComida values (@identity,75,3.5,'S');
insert into DetalleComida values (@identity,70,1.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('19/02/2012','B01','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,2,9,'S');
insert into DetalleComida values (@identity,11,9,'S');
insert into DetalleComida values (@identity,13,11.5,'S');
insert into DetalleComida values (@identity,54,249,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
insert into DetalleComida values (@identity,75,3.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('17/02/2012','B02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,4,11,'S');
insert into DetalleComida values (@identity,14,11,'S');
insert into DetalleComida values (@identity,23,19.5,'S');
insert into DetalleComida values (@identity,29,15.5,'S');
insert into DetalleComida values (@identity,20,15,'S');
insert into DetalleComida values (@identity,38,6,'S');
insert into DetalleComida values (@identity,34,6.5,'S');
insert into DetalleComida values (@identity,55,2.5,'S');
insert into DetalleComida values (@identity,63,2.5,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,44,4.5,'S');
insert into DetalleComida values (@identity,68,1,'S');
insert into DetalleComida values (@identity,70,1.5,'S');
insert into DetalleComida values (@identity,38,6,'S');
go
DECLARE @identity integer;
insert into Comida values ('17/02/2012','A04','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,1,6,'S');
insert into DetalleComida values (@identity,3,6,'S');
insert into DetalleComida values (@identity,3,6,'S');
insert into DetalleComida values (@identity,10,9,'S');
insert into DetalleComida values (@identity,15,9,'S');
insert into DetalleComida values (@identity,16,23,'S');
insert into DetalleComida values (@identity,33,5.5,'S');
insert into DetalleComida values (@identity,49,2.5,'S');
insert into DetalleComida values (@identity,54,249,'S');
insert into DetalleComida values (@identity,61,3.5,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
insert into DetalleComida values (@identity,69,1,'S');
insert into DetalleComida values (@identity,16,23,'S');
go
DECLARE @identity integer;
insert into Comida values ('17/02/2012','C03','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,6,13.5,'S');
insert into DetalleComida values (@identity,23,19.5,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,57,2.5,'S');
insert into DetalleComida values (@identity,76,6,'S');
go
DECLARE @identity integer;
insert into Comida values ('17/02/2012','A03','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,70,1.5,'S');
insert into DetalleComida values (@identity,73,1.5,'S');
insert into DetalleComida values (@identity,69,1,'S');
insert into DetalleComida values (@identity,69,1,'S');
go
DECLARE @identity integer;
insert into Comida values ('16/02/2012','B02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,24,12,'S');
insert into DetalleComida values (@identity,7,11,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,44,4.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('16/02/2012','A03','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,4,11,'S');
insert into DetalleComida values (@identity,20,15,'S');
insert into DetalleComida values (@identity,25,13.5,'S');
insert into DetalleComida values (@identity,29,15.5,'S');
insert into DetalleComida values (@identity,38,6,'S');
insert into DetalleComida values (@identity,54,249,'S');
insert into DetalleComida values (@identity,62,3.5,'S');
insert into DetalleComida values (@identity,59,2.5,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
insert into DetalleComida values (@identity,38,6,'S');
go
DECLARE @identity integer;
insert into Comida values ('16/02/2012','C01','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,1,6,'S');
insert into DetalleComida values (@identity,30,19,'S');
insert into DetalleComida values (@identity,31,16,'S');
insert into DetalleComida values (@identity,20,15,'S');
insert into DetalleComida values (@identity,14,11,'S');
insert into DetalleComida values (@identity,22,19.5,'S');
insert into DetalleComida values (@identity,35,5,'S');
insert into DetalleComida values (@identity,36,5,'S');
insert into DetalleComida values (@identity,34,6.5,'S');
insert into DetalleComida values (@identity,34,6.5,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,55,2.5,'S');
insert into DetalleComida values (@identity,49,2.5,'S');
insert into DetalleComida values (@identity,58,2.5,'S');
insert into DetalleComida values (@identity,58,2.5,'S');
insert into DetalleComida values (@identity,69,1,'S');
insert into DetalleComida values (@identity,70,1.5,'S');
go
DECLARE @identity integer;
insert into Comida values ('15/02/2012','B02','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,8,11,'S');
insert into DetalleComida values (@identity,18,13,'S');
insert into DetalleComida values (@identity,21,16,'S');
insert into DetalleComida values (@identity,48,3,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,56,2.5,'S');
insert into DetalleComida values (@identity,74,2,'S');
go
DECLARE @identity integer;
insert into Comida values ('15/02/2012','A03','S');
 set @identity =SCOPE_IDENTITY();
insert into DetalleComida values (@identity,0,1,'S');
insert into DetalleComida values (@identity,9,6,'S');
insert into DetalleComida values (@identity,22,19.5,'S');
insert into DetalleComida values (@identity,30,19,'S');
insert into DetalleComida values (@identity,32,20,'S');
insert into DetalleComida values (@identity,38,6,'S');
insert into DetalleComida values (@identity,47,4.5,'S');
insert into DetalleComida values (@identity,45,2.5,'S');
insert into DetalleComida values (@identity,54,249,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
insert into DetalleComida values (@identity,72,1.5,'S');
go

