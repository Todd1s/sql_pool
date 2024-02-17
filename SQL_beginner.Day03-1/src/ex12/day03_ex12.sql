insert into person_order
select max(id)+generate_series(1, (select max(id) from person), 1), 
	generate_series(1, (select max(id) from person), 1),
	(select id from menu where pizza_name = 'greek pizza'),
	'2022-02-25'
from person_order;