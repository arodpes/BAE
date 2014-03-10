use EmpresasInformaticas;
go

--left outer join
select descripcion,nfactura
from componente as c
left outer join facturacomponente as fc
	on c.clave=fc.CodComponente
where nfactura is null

--right outer join
select descripcion,nfactura
from facturacomponente as fc
right outer join componente as c
	on c.clave=fc.CodComponente
where nfactura is null

--cross join
select nombretienda,tipo
from tienda
cross join TipoComponente
where tipo like 'brother%';

--cross join implícito
select nombretienda,tipo
from tienda,TipoComponente
where tipo like 'brother%';

--group by
select t.NombreTienda,sum(fc.cantidad*fc.precioaplicado)
from Tienda as t
inner join Factura as f
	on f.idtienda=t.idtienda
inner join FacturaComponente as fc
	on fc.NFactura=f.NFactura
group by t.NombreTienda;


	

