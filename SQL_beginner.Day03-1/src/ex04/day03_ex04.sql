with woman_order as (
	select m.pizzeria_id
	from menu m
	inner join person_order as po
	on m.id = po.menu_id
	inner join person as p
	on po.person_id = p.id
	where p.gender = 'female'
),
man_order as (
	select m.pizzeria_id
	from menu m
	inner join person_order as po
	on m.id = po.menu_id
	inner join person as p
	on po.person_id = p.id
	where p.gender = 'male'
),
woman_top as (
	select f.pizzeria_id
	from woman_order as f
	except
	select m.pizzeria_id
	from man_order as m
),
man_top as (
	select m.pizzeria_id
	from man_order as m
	except
	select f.pizzeria_id
	from woman_order as f
),
union_top as (
	select m.pizzeria_id
	from man_top as m
	union
	select f.pizzeria_id
	from woman_top as f
)
select pz.name as pizzeria_name
from pizzeria as pz
inner join union_top as u
on pz.id = u.pizzeria_id
order by pizzeria_name;