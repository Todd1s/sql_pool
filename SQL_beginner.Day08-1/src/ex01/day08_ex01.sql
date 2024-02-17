--сессия 1
SHOW TRANSACTION ISOLATION LEVEL; --смотрим уровень изоляции
begin;
select * from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 4 where name = 'Pizza Hut';--изменяем рейтинг на 4
commit; --коммитим
select * from pizzeria where name = 'Pizza Hut'; --смотрим изменения
--сессия 2
begin;
select * from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 3.6 where name = 'Pizza Hut';--изменяем рейтинг на 3.6
commit; --коммитим
select * from pizzeria where name = 'Pizza Hut'; --смотрим изменения