with selected_id(id) as (
	select id as menu_id
	from menu
	where id not in (select menu_id from person_order)
	order by menu_id
)
select pizza_name, price, name as pizzeria_name
from pizzeria as pz
inner join menu as m
on pz.id = m.pizzeria_id
inner join selected_id as si
on m.id = si.id
order by pizza_name, price;