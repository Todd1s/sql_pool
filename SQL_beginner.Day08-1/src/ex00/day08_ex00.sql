-- сессия 1
begin; -- начинаем транзакцию
update pizzeria
set rating = 5
where name = 'Pizza Hut'; -- установили новое значение
select * from pizzeria; -- смотрим что получилось
commit; --коммитим

--сессия 2
select * from pizzeria; -- смотрим после внесения изменений в сессии 1, но до коммита
select * from pizzeria; -- смотрим после коммита сессии 1
