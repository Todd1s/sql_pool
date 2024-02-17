select person.name as name
from menu
	inner join person_order
	on menu.id = person_order.menu_id
	inner join person
	on person_order.person_id = person.id
where person.gender = 'male' 
	and person.address in ('Moscow', 'Samara') 
	and menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
order by name desc;