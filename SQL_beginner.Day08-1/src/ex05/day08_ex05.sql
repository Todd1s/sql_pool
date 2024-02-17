--сессия 1
begin;
select sum(rating) from pizzeria; --смотрим сумму рейтингов для пиццерий
select sum(rating) from pizzeria; --смотрим сумму рейтингов после коммита во второй сессии
commit;
select sum(rating) from pizzeria; --смотрим сумму рейтингов после коммита
--сессия 2
begin;
update pizzeria set rating = 1 where name = 'Pizza Hut'; --обновляем рейтинг пиццы хат после просмотра в первой сессии
commit; -- коммитим после обнолвения
select sum(rating) from pizzeria; -- смотрим сумму рейтингов после простомтра в первой сессии