select pz.name, 
	count(po.menu_id) as count_of_orders,
	round(avg(m.price)) as average_price,
	max(m.price) as max_price,
	min(m.price) as min_price
from pizzeria as pz
inner join menu as m
on pz.id = m.pizzeria_id
inner join person_order as po
on m.id = po.menu_id
group by pz.name
order by pz.name;