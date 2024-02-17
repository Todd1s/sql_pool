with top_order as (
	select pz.name as name, count(m.pizzeria_id)
	from person_order as po
	inner join menu as m
	on po.menu_id = m.id
	inner join pizzeria as pz
	on m.pizzeria_id = pz.id
	group by m.pizzeria_id, pz.name
	order by count desc, name
),
top_visits as (
	select pz.name as name, count(pv.pizzeria_id)
	from person_visits as pv
	inner join pizzeria as pz
	on pv.pizzeria_id = pz.id
	group by pizzeria_id, pz.name
	order by count desc, name
), 
union_top as (
	select *
	from top_order
	union all
	select *
	from top_visits
	order by count desc
)
select name, sum(count) as total_count
from union_top
group by name
order by total_count desc, name;