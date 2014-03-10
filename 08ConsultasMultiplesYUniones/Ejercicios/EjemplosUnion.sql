
select titulo, 'D' as tipo
from discos.dbo.disco
union
select juego , 'V' as tipo
from videojuegos.dbo.juego;
go

use tablasprueba
go

select id,valor1
from Tabla1
union
select id,valor2
from Tabla2;
go

select id,valor1
from Tabla1
union all
select id,valor2
from Tabla2;
go
