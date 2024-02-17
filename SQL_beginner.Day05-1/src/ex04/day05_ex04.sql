create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO off;

SET enable_indexonlyscan = true;

EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 1 and pizza_name = 'cheese pizza';