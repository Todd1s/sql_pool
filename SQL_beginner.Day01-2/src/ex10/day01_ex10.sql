select person.name as person_name, 
	menu.pizza_name as pizza_name, 
	pizzeria.name as pizzeria_name
from person
	inner join person_order
	on person.id = person_order.person_id
	inner join menu
	on person_order.menu_id = menu.id
	inner join pizzeria
	on menu.pizzeria_id = pizzeria.id
order by person_name, pizza_name, pizzeria_name;