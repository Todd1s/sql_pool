with query1 as 
	(
		select date(generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)) 
			as missing_date
	),  
	query2 as 
	(
		select visit_date
		from person_visits
		where person_id = 1 or person_id = 2
	)
select missing_date
from query1
	left join query2
	on query1.missing_date = query2.visit_date
where query2.visit_date is null;