Select COALESCE(person.name, '-') as person_name, 
	person_visits.visit_date, 
	COALESCE(pizzeria.name, '-') as pizzeria_name
from person
	full join 
	(
		select *
		from person_visits
		Where visit_date = '2022-01-01' or visit_date = '2022-01-02' or visit_date = '2022-01-03'
	) as person_visits
	on person.id = person_visits.person_id
	full join pizzeria
	on person_visits.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name;