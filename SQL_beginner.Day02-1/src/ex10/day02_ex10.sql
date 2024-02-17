Select person_name1, person_name2, query1.common_address
from 
	(select person.name as person_name1, address as common_address
	from person) as query1
	inner join
	(select person.name as person_name2, address as common_address
	from person) as query2
	on query1.common_address = query2.common_address 
	and query1.person_name1 < query2.person_name2
order by person_name1, person_name2, common_address;