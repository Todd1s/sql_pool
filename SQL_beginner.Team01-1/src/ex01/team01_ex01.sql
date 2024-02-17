insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

--отбираем значение currency.update где дата меньше balance.update и получаем ставку на эту дату
--первое условие:
--need to find a nearest rate_to_usd of currency at the past (t1)
create or replace function cur_rate(
	name_cur text,
	currence_upd date,
	balancd_upd date
)
returns table(last_rate numeric)
as $$
		select c.rate_to_usd -- получение ставки
		from currency as c
		where c.updated in (
			select max(c.updated) --получение даты
			from balance as b
			inner join currency as c
			on b.currency_id = c.id
			where c.name = $1 and c.updated <= $3
		) and c.name = $1;	
$$ 
language sql;
--отбираем значение currency.update где дата идет сразу после balance.update и получаем ставку на эту дату
--второе условие:
--if t1 is empty (means no any rates at the past) then find a nearest rate_to_usd of currency at the future (t2)
create or replace function cur_rate_next(
	name_cur text,
	currence_upd date,
	balancd_upd date
)
returns table(last_rate numeric)
as $$	
		select c.rate_to_usd -- получение ставки
		from currency as c
		where c.updated in (
			select min(c.updated) --получение даты
			from balance as b
			inner join currency as c
			on b.currency_id = c.id
			where c.name = $1 and c.updated > $3
		) and c.name = $1;
$$ 
language sql;

--итоговая таблица с третьим условием
--третье условие
--use t1 OR t2 rate to calculate a currency in USD format
select distinct coalesce(u.name, 'not defined') as name,
	coalesce(u.lastname, 'not defined') as lastname,
	c.name as currency_name,
	(b.money * (case --умножаем ставку на баланс кошелька
		when (select * from cur_rate(name_cur := c.name, currence_upd := c.updated::DATE, balancd_upd := b.updated::DATE)) is not null then
		(select * from cur_rate(name_cur := c.name, currence_upd := c.updated::DATE, balancd_upd := b.updated::DATE))
		else (select * from cur_rate_next(name_cur := c.name, currence_upd := c.updated::DATE, balancd_upd := b.updated::DATE))
	end)) as currency_in_usd
from "user" as u
	full join balance as b
	on u.id = b.user_id
	inner join currency as c
	on b.currency_id = c.id	
order by name desc, lastname, currency_name;