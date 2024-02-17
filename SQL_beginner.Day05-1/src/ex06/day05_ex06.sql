create index idx_1 on menu (id);

SET ENABLE_SEQSCAN TO off;

SET enable_indexonlyscan = true;

EXPLAIN ANALYZE SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

before
"Sort  (cost=23.94..23.99 rows=19 width=96) (actual time=0.193..0.198 rows=19 loops=1)"
"  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
"  Sort Method: quicksort  Memory: 26kB"
"  ->  WindowAgg  (cost=23.16..23.54 rows=19 width=96) (actual time=0.105..0.141 rows=19 loops=1)"
"        ->  Sort  (cost=23.16..23.21 rows=19 width=64) (actual time=0.090..0.096 rows=19 loops=1)"
"              Sort Key: pz.rating"
"              Sort Method: quicksort  Memory: 25kB"
"              ->  Hash Join  (cost=1.43..22.75 rows=19 width=64) (actual time=0.059..0.071 rows=19 loops=1)"
"                    Hash Cond: (pz.id = m.pizzeria_id)"
"                    ->  Seq Scan on pizzeria pz  (cost=0.00..18.10 rows=810 width=40) (actual time=0.013..0.014 rows=6 loops=1)"
"                    ->  Hash  (cost=1.19..1.19 rows=19 width=40) (actual time=0.036..0.036 rows=19 loops=1)"
"                          Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                          ->  Seq Scan on menu m  (cost=0.00..1.19 rows=19 width=40) (actual time=0.018..0.025 rows=19 loops=1)"
"Planning Time: 0.257 ms"
"Execution Time: 0.251 ms"
after 
"Sort  (cost=64.80..64.85 rows=19 width=96) (actual time=0.131..0.133 rows=19 loops=1)"
"  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
"  Sort Method: quicksort  Memory: 26kB"
"  ->  WindowAgg  (cost=64.01..64.39 rows=19 width=96) (actual time=0.092..0.108 rows=19 loops=1)"
"        ->  Sort  (cost=64.01..64.06 rows=19 width=64) (actual time=0.080..0.082 rows=19 loops=1)"
"              Sort Key: pz.rating"
"              Sort Method: quicksort  Memory: 25kB"
"              ->  Nested Loop  (cost=0.29..63.61 rows=19 width=64) (actual time=0.037..0.064 rows=19 loops=1)"
"                    ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.021..0.027 rows=19 loops=1)"
"                          Heap Fetches: 19"
"                    ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.15..2.69 rows=1 width=40) (actual time=0.001..0.001 rows=1 loops=19)"
"                          Index Cond: (id = m.pizzeria_id)"
"Planning Time: 0.182 ms"
"Execution Time: 0.174 ms"