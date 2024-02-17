create unique index idx_person_order_order_date on person_order (person_id, menu_id)
where order_date = '2022-01-01';

SET ENABLE_SEQSCAN TO off;

SET enable_indexonlyscan = true;

EXPLAIN ANALYZE SELECT person_id, menu_id
FROM person_order
WHERE person_id = 1 and menu_id = 2 and order_date = '2022-01-01';