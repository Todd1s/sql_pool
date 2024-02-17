drop function fnc_persons_female(), fnc_persons_male();

create function fnc_persons(pgender text default 'female') returns table(id bigint, name varchar, age int, gender varchar,address varchar) as 
$$
select * from person where gender = $1
$$
language sql;