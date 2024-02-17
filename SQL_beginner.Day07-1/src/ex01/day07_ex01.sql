select (select name from person where id = person_id), 
	count(person_id) as count_of_visits
from person_visits
group by person_id
order by count_of_visits desc, person_id
limit 4;