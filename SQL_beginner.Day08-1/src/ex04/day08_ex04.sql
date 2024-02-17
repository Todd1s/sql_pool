--сессия 1
begin transaction isolation level serializable;
select * from pizzeria where name = 'Pizza Hut'; --смотрим таблицу до обновления
select * from pizzeria where name = 'Pizza Hut'; --смотрим таблицу после обновления и коммита
commit; --коммитим
select * from pizzeria where name = 'Pizza Hut'; -- смотрим таблицу
--сессия 2
begin transaction isolation level serializable;
update pizzeria set rating = 3.0 where name = 'Pizza Hut'; -- обновляем после просмотра в первой сессии
commit; -- коммитим после обновления
select * from pizzeria where name = 'Pizza Hut'; -- смотрим после коммита и просмотра в первой сессии