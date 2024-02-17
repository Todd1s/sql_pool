insert into menu 
select max(id)+1, 
	(select id from pizzeria where name = 'Dominos'),
	'sicilian pizza',
	900
from menu;