create view v_generated_dates as 
select date(generate_series('2022-01-01'::date,'2022-01-31'::date, '1 day'::interval)) as generated_date
order by generated_date;