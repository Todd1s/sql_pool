select generated_date as missing_date
from person_visits right join v_generated_dates
on person_visits.visit_date = v_generated_dates.generated_date
where visit_date is null
order by missing_date;