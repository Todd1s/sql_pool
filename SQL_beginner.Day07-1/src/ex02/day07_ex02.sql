with top_order as (
	select pz.name as name, count(m.pizzeria_id), 'order' as action_type
	from person_order as po
	inner join menu as m
	on po.menu_id = m.id
	inner join pizzeria as pz
	on m.pizzeria_id = pz.id
	group by m.pizzeria_id, pz.name
	order by count desc, name
	limit 3
),
top_visits as (
	select pz.name as name, count(pizzeria_id), 'visit' as action_type
	from person_visits as pv
	inner join pizzeria as pz
	on pv.pizzeria_id = pz.id
	group by pizzeria_id, pz.name
	order by count desc, name
	limit 3
)
	select *
	from top_order
	union
	select *
	from top_visits
	order by action_type, count desc;