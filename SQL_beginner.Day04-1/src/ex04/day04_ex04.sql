create view v_symmetric_union as
with r as (
	select person_id
	from person_visits
	where visit_date = '2022-01-02'
),
s as (
	select person_id
	from person_visits
	where visit_date = '2022-01-06'
),
except_r_s (person_id) as (
	select r.person_id
	from r
	except
	select s.person_id 
	from s
),
except_s_r(person_id) as (
	select s.person_id
	from s
	except
	select r.person_id 
	from r
)
select person_id
from except_r_s
union
select person_id
from except_s_r
order by person_id;
