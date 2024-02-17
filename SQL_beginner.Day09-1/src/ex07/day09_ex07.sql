create function func_minimum(VARIADIC arr numeric[]) 
returns numeric as $$
select min($1[i]) from generate_subscripts($1, 1) g(i);
$$ language sql;