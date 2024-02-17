select p.name, count(pv.pizzeria_id) as count_of_visits
from person_visits as pv
inner join person as p
on pv.person_id = p.id
group by p.name
having count(pv.pizzeria_id) > 3;
