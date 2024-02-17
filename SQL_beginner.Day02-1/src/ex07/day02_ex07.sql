select pizzeria.name as pizzeria_name
from person
	inner join person_visits
	on person_visits.person_id = person.id
	inner join pizzeria
	on person_visits.pizzeria_id = pizzeria.id
	inner join menu
	on pizzeria.id = menu.pizzeria_id	
where person.name = 'Dmitriy' 
	and person_visits.visit_date = '2022-01-08' 
	and menu.price < 800;