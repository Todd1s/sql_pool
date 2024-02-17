with name_table as 
	(
		select person.name as name, menu.pizza_name as pizza
		from menu
			inner join person_order
			on menu.id = person_order.menu_id
			inner join person
			on person_order.person_id = person.id
		where person.gender = 'female' 
			and menu.pizza_name in ('pepperoni pizza', 'cheese pizza')
	),
	group_quer as 
	(
		select name, pizza
		from name_table
		group by name, pizza
	)
select name
from group_quer
group by name
having count(name)>=2
order by name;
;

--second solution
with  order_both as
	(
		select *
		from
		(
			select person_order.person_id as person_id
			from person_order
				inner join menu
				on menu.id = person_order.menu_id
			where pizza_name = 'cheese pizza'
		) as cheese_pizza_order
		inner join
		(
			select person_order.person_id as person_id2
			from person_order
				inner join menu
				on menu.id = person_order.menu_id
			where pizza_name = 'pepperoni pizza'
		) as pepperoni_pizza_order
		on cheese_pizza_order.person_id = pepperoni_pizza_order.person_id2
	)
select distinct person.name as name
from menu
	inner join person_order
	on menu.id = person_order.menu_id
	inner join person
	on person_order.person_id = person.id
where person.gender = 'female' 
	and person_order.person_id in (select person_id from order_both)
order by name;

