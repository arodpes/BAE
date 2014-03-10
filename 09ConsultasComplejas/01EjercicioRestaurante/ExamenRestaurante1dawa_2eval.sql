use Restaurante
go

select *
from comida
inner join Mesa on comida.CodMesa=mesa.CodMesa
inner join detallecomida on comida.IdComida=DetalleComida.IdComida
inner join Plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=tipoplato.CodTipoPlato


--1.- Contar cuántos platos se han servido por Tipo de Plato 
--(la descripción del Tipo de plato).
select TipoPlato,count(iddetalle) as NPlatos
from detallecomida
inner join Plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=tipoplato.CodTipoPlato
where Servido='S'
group by TipoPlato
--2.- contar las comidas servidas en las mesas, sacando todas las mesas.
select mesa.codmesa, COUNT(idcomida)
from mesa
left join Comida on mesa.CodMesa=comida.CodMesa
group by mesa.codmesa

--3.- Dar la mesa y la fecha de la comida que más platos consumió del 
--tipo de plato carnes, sacándolas todas si hay más de una. 
select top 1 with ties codmesa,fecha,comida.idcomida,COUNT(*) as Nplatos
from Comida 
inner join detallecomida on DetalleComida.IdComida=Comida.IdComida
inner join plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=TipoPlato.CodTipoPlato
where tipoplato='Carnes'
group by codmesa,fecha,comida.idcomida
order by Nplatos desc

--4.- Comidas pagadas (dando mesa y fecha) que han consumido algo de bebidas.
select  distinct CodMesa,fecha
from comida
inner join detallecomida on DetalleComida.IdComida=Comida.IdComida
inner join plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=TipoPlato.CodTipoPlato
where Pagado='S' and Agrupa='Bebida'


-- con group by
select  CodMesa,fecha
from comida
inner join detallecomida on DetalleComida.IdComida=Comida.IdComida
inner join plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=TipoPlato.CodTipoPlato
where Pagado='S' and Agrupa='Bebida'
group by CodMesa,fecha

--5.- Importe total de las comidas pagadas de las mesas que comienzan con A.
select SUM(PrecioPlato)
from comida
inner join detallecomida on DetalleComida.IdComida=Comida.IdComida
where pagado='S' and CodMesa like 'A%'

--6.- Día de la semana con mayor facturación. 1 punto
select top 1 with ties datename(dw,fecha),SUM(PrecioPlato) as Importe
from comida
inner join detallecomida on DetalleComida.IdComida=Comida.IdComida
where pagado='S' 
group by datename(dw,fecha)
order by Importe desc

--7.- Tipo de plato (dando la descripción del tipo de plato) que no sea 
--bebida y que menos veces se ha pedido.
select top 1 with ties TipoPlato,COUNT(iddetalle) nveces  
from detallecomida 
inner join plato on plato.CodPlato=DetalleComida.CodPlato
inner join TipoPlato on plato.CodTipoPlato=TipoPlato.CodTipoPlato
where Agrupa<>'Bebida'
group by TipoPlato
order by nveces asc
--8.- Para cada plato, dando su nombre y sacándolos todos, indicar el 
--nº de comidas en las que ha aparecido.
select Plato,COUNT(distinct detallecomida.idcomida) as Ncomidas
from Plato
left join detallecomida on plato.CodPlato=DetalleComida.codplato
group by Plato

--9.- Dar las comidas pendientes de pagar (dando mesa y fecha) 
--con todos sus platos servidos. (1 punto)
select codMesa,fecha
from Comida
where pagado ='N' and 
      'S' = all (select servido from DetalleComida as d
                 where d.IdComida=comida.IdComida)
--10.- Comidas (dando mesa y fecha) que sólo han consumido bebidas. (1 punto)
select codMesa,fecha
from Comida
where 'Bebida'= all(select agrupa from TipoPlato
					inner join Plato on 
					   tipoplato.CodTipoPlato=plato.CodTipoPlato
					inner join detallecomida on
						detallecomida.CodPlato=plato.CodPlato
					where comida.IdComida=DetalleComida.idcomida)	   
--11.- Calcular el plato con mayor diferencia entre lo que se cobró y 
--el precio actual (de la tabla Plato).
select top 1 with ties plato,ABS(precioplato-precio) as dif
from detallecomida 
inner join plato on plato.CodPlato=DetalleComida.CodPlato
order by dif desc
--12.- Sacar la estadística por días, incluyendo nº platos 
--(incluyendo bebidas), 
--el nº de comidas realizadas y el importe de los platos 
--(incluyendo bebidas) (1 punto)
select c.fecha,COUNT(*) as TotPlatos, 
       COUNT(distinct c.IdComida) as TotComidas, 
       sum(d.PrecioPlato) as ImporteTotal
from comida as c
inner join DetalleComida as d
on c.IdComida=d.IdComida
group by c.Fecha

