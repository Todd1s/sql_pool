select pizza_name, 
	(
		select name
		from pizzeria
		where pizzeria.id = menu.pizzeria_id
	) as pizzeria_name, price
from menu
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_id;