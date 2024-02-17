select distinct p.name
from person as p
inner join person_order as po
on p.id = po.person_id
order by name;