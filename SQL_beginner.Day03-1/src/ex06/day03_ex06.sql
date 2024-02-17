with pizza_list as (
	select m.pizza_name as pizza_name, 
	pz.name as pizzeria_name,
	m. price as price
	from pizzeria as pz
	inner join menu as m
	on pz.id = m.pizzeria_id
)
select q1.pizza_name, q1.pizzeria_name as pizzeria_name_1, 
	q2.pizzeria_name as pizzeria_name_2, q1.price
	from pizza_list as q1
	inner join pizza_list as q2
	on q1.pizza_name = q2.pizza_name and q1.price = q2.price
	where q1.pizzeria_name < q2.pizzeria_name;