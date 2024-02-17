create view v_price_with_discount as
select p.name as name, m.pizza_name as pizza_name, 
	m.price as price, round((m.price - m.price * 0.1),0) as discount_price
from person as p
	inner join person_order as po
	on p.id = po.person_id
	inner join menu as m
	on po.menu_id = m.id
order by name, pizza_name;