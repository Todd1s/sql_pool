--сессия 1
begin;
update pizzeria set rating = 5 where id = 1; --обновляем значение для ид 1
update pizzeria set rating = 5 where id = 2; -- обновляем значение для ид 2, после обновления в сессии 2
commit;
--сессия 2
begin;
update pizzeria set rating = 5 where id = 2; --обновляем значение для ид 2
update pizzeria set rating = 5 where id = 1; -- обновляем значение для ид 1, после обновления в сессии 1
commit;