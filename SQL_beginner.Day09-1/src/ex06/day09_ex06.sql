--только уникальные пиццерии
create function fnc_person_visits_and_eats_on_date(
	pperson text default 'Dmitriy', 
 	pprice numeric default 500, 
 	pdate date default '2022-01-08'
) 
returns table(pizzeria_name varchar) 
as $$
begin 
	return QUERY
	select Distinct pz.name
	from person as p
	inner join person_visits as pv
	on p.id = pv.person_id
	inner join pizzeria as pz
	on pv.pizzeria_id = pz.id
	inner join menu as m
	on pz.id = m.pizzeria_id
	where p.name = $1 and m.price < $2 and pv.visit_date = $3;
end;
$$
language plpgsql;

--удалить функцию
drop function fnc_person_visits_and_eats_on_date(text, numeric, date);

-- пиццерии с именами
create function fnc_person_visits_and_eats_on_date(
	pperson text default 'Dmitriy', 
 	pprice numeric default 500, 
 	pdate date default '2022-01-08'
) 
returns table(pizzeria_name varchar, 
				person_name varchar, 
				price numeric,
				visit_date date) 
as $$
begin 
	return QUERY
	select pz.name, p.name, m.price, pv.visit_date 
	from person as p
	inner join person_visits as pv
	on p.id = pv.person_id
	inner join pizzeria as pz
	on pv.pizzeria_id = pz.id
	inner join menu as m
	on pz.id = m.pizzeria_id
	where p.name = $1 and m.price < $2 and pv.visit_date = $3;
end;
$$
language plpgsql;