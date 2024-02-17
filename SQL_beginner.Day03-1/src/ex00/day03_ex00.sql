select m.pizza_name, m.price, 
	pz.name as pizzeria_name, 
	pv.visit_date as visit_date
from person as p
	inner join person_visits as pv
	on pv.person_id = p.id
	inner join pizzeria as pz
	on pv.pizzeria_id = pz.id
	inner join menu as m
	on pz.id = m.pizzeria_id
where p.name = 'Kate' and m.price between 800 and 1000
order by m.pizza_name, m.price, pizzeria_name;