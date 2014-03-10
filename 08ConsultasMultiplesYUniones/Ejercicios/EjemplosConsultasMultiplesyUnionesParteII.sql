use discos
go
sp_helpconstraint puntuacion
go

--insert tabla con foreign key
set dateformat dmy
go
insert into puntuacion
(id,idcliente,iddisco,puntuacion,fecha)
values
(9997,999,999,8,'12/01/2014');
GO
select id
from cliente
where id=999;
go

--insert tabla con foreign key valores null
set dateformat dmy
go
insert into puntuacion
(id,idcliente,iddisco,puntuacion,fecha)
values
(9997,null,null,8,'12/01/2014');
GO

select id,idcliente,iddisco,puntuacion,fecha
from puntuacion
where id=2;
go

update puntuacion
	set idcliente=999
	where id=2;
go


-- borrar registro referenciado
select id,nombre
from cliente
where id=5;
select id,idcliente,iddisco,puntuacion,fecha
from puntuacion
where id=2;

delete cliente
where id=5;
go

--modificar id cliente
update cliente
	set id=999
where id=5;
go

--buscar nombre de la restricción
sp_helpconstraint puntuacion
go

-- desactivar restricción
alter table puntuacion
	nocheck constraint FK_puntuacioncliente;
go

--actualizar cliente
update cliente
	set id=999
where id=5;
go
select id,nombre
from cliente
where id=999;
go



--activar restricción
alter table puntuacion
	check constraint FK_puntuacioncliente;
go

select id,Idcliente, puntuacion
from puntuacion
where idcliente=5;
go

--borrar restricción
alter table puntuacion
  drop constraint FK_puntuacioncliente;
go

--crearla de nuevo
alter table puntuacion
add constraint FK_puntuacioncliente
foreign key (idcliente)
references cliente (id);
go

--crearla con nocheck y activarla
alter table puntuacion
with nocheck
add constraint FK_puntuacioncliente
foreign key (idcliente)
references cliente (id);
go
alter table puntuacion
	check constraint FK_puntuacioncliente;
go

--actualizar registros y crear la restricción
update puntuacion
	set idcliente=999
where idcliente=5;
go
alter table puntuacion
  drop constraint FK_puntuacioncliente;
go 
alter table puntuacion
add constraint FK_puntuacioncliente
foreign key (idcliente)
references cliente (id);
go
select id, idcliente,puntuacion
from puntuacion
where idcliente=999;
go


--permitir borrado y actualización en cascada
alter table puntuacion
  drop constraint FK_puntuacioncliente;
go 
alter table puntuacion
add constraint FK_puntuacioncliente
foreign key (idcliente)
references cliente (id)
on update cascade
on delete cascade;
go

--comprobar update en cascada

--miramos los datos
select id,nombre
from cliente
where id=999;
go
select id, idcliente,puntuacion
from puntuacion
where idcliente=999;
go

--modificamos el cliente
update cliente
	set id=998
where id=999;
go

--miramos los datos de nuevo
select id,nombre
from cliente
where id=998;
go
select id, idcliente,puntuacion
from puntuacion
where idcliente=998;
go

--comprobar borrado en cascada
delete cliente
where id=998;
go

--miramos los datos de nuevo
select id,nombre
from cliente
where id=998;
go
select id, idcliente,puntuacion
from puntuacion
where idcliente=998;
go