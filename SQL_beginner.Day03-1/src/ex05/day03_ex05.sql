with andrey_visited as (
	select pv.pizzeria_id
	from person_visits as pv
	inner join person as p
	on pv.person_id = p.id
	where p.name = 'Andrey'
),
andrey_order as (
	select m.pizzeria_id
	from menu as m
	inner join person_order as po
	on m.id = po.menu_id
	inner join person as p
	on po.person_id = p.id
	where p.name = 'Andrey'
),
except_order(id) as (
	select av.pizzeria_id
	from andrey_visited as av
	except
	select ao.pizzeria_id
	from andrey_order as ao
)
select pz.name as pizzeria_name
from pizzeria as pz
inner join except_order as eo
on pz.id = eo.id;