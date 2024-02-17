select p.address, pz.name, count(po.id) as count_of_orders
from pizzeria as pz
inner join menu as m
on pz.id = m.pizzeria_id
inner join person_order as po
on m.id = po.menu_id
inner join person as p
on po.person_id = p.id
group by p.address, pz.name
order by p.address, pz.name;