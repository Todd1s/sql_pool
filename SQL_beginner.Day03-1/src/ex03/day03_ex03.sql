with woman_visits as (
	select pv.pizzeria_id
	from person_visits as pv
	inner join person as p
	on pv.person_id = p.id
	where p.gender = 'female'
),
man_visits as (
	select pv.pizzeria_id
	from person_visits as pv
	inner join person as p
	on pv.person_id = p.id
	where p.gender = 'male'
),
woman_top as (
	select f.pizzeria_id
	from woman_visits as f
	except all
	select m.pizzeria_id
	from man_visits as m
),
man_top as (
	select m.pizzeria_id
	from man_visits as m
	except all
	select f.pizzeria_id
	from woman_visits as f
),
union_top as (
	select m.pizzeria_id
	from man_top as m
	union all
	select f.pizzeria_id
	from woman_top as f
)
select pz.name as pizzeria_name
from pizzeria as pz
inner join union_top as u
on pz.id = u.pizzeria_id
order by pizzeria_name;