insert into person_order
select max(id)+1, 
	(select id from person where name = 'Denis'),
	(select id from menu where pizza_name = 'sicilian pizza'),
	'2022-02-24'
from person_order;

insert into person_order
select max(id)+1, 
	(select id from person where name = 'Irina'),
	(select id from menu where pizza_name = 'sicilian pizza'),
	'2022-02-24'
from person_order;