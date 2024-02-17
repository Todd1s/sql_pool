insert into person_visits
select max(id)+1, 
	(select id from person where name = 'Denis'),
	(select id from pizzeria where name = 'Dominos'),
	'2022-02-24'
from person_visits;

insert into person_visits
select max(id)+1, 
	(select id from person where name = 'Irina'),
	(select id from pizzeria where name = 'Dominos'),
	'2022-02-24'
from person_visits;