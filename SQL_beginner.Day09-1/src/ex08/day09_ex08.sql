create function fnc_fibonacci(integer default 10) 
returns table(fibo integer) as $$
with recursive fibbon(n1, n2) as 
(
	select 0, 1
	union all
	select n2, n1 + n2
	from fibbon
	where n2 < $1
)
select n1 as fibo
from fibbon;
$$ language sql;