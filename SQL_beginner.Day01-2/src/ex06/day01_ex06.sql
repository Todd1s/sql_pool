select order_date as action_date, 
	(	
		select name
		from person
		where person_order.person_id = person.id
	) as person_name
from person_order
intersect
select visit_date, 
	(	
		select name
		from person
		where person_visits.person_id = person.id
	) as person_name
from person_visits
order by action_date, person_name desc;