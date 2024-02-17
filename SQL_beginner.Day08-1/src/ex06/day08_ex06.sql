--сессия 1
begin transaction isolation level repeatable read;
select sum(rating) from pizzeria; --смотрим сумму рейтингов для пиццерий
select sum(rating) from pizzeria; --смотрим сумму рейтингов после коммита во второй сессии
commit;
select sum(rating) from pizzeria; --смотрим сумму рейтингов после коммита
--сессия 2
begin transaction isolation level repeatable read;
update pizzeria set rating = 5 where name = 'Pizza Hut'; --обновляем рейтинг пиццы хат после просмотра в первой сессии
commit; -- коммитим после обнолвения
select sum(rating) from pizzeria; -- смотрим сумму рейтингов после простомтра в первой сессии