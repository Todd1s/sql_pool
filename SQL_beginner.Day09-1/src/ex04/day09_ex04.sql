create function fnc_persons_female() returns table(id bigint, name varchar, age int, gender varchar,address varchar) as 
$$
select * from person where gender = 'female'
$$
language sql;

create function fnc_persons_male() returns table(id bigint, name varchar, age int, gender varchar,address varchar) as 
$$
select * from person where gender = 'male'
$$
language sql;