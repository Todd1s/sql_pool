SET ENABLE_SEQSCAN TO OFF;

explain analyze select m.pizza_name, pz.name as pizzeria_name
from pizzeria as pz
inner join menu as m
on pz.id = m.pizzeria_id;