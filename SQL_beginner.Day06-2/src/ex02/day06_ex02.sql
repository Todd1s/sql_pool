select p.name as name, 
	m.pizza_name as pizza_name, 
	m.price as price, 
	round(m.price - m.price * pd.discount / 100) as discount_price, 
	pz.name as pizzeria_name
from person_order as po
	inner join menu as m
	on m.id = po.menu_id
	inner join person as p
	on p.id = po.person_id
	inner join person_discounts as pd
	on p.id = pd.person_id and m.pizzeria_id = pd.pizzeria_id
	inner join pizzeria as pz
	on m.pizzeria_id = pz.id	 
order by name, pizza_name;