--generate one more Dmitriy visit
insert into person_visits
select max(pv.id)+1, 
	(select id from person where name = 'Dmitriy'),
	(select pz.id
		from pizzeria as pz
		inner join menu as m
		on pz.id = m.pizzeria_id
		where m.price < 800 and pz.name <> 'Papa Johns'
		limit 1),
	'2022-01-08'
from person_visits as pv;
--refresh data in our Materialized View
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;