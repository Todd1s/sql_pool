select coalesce(u.name, 'not defined') as name,
	coalesce(u.lastname, 'not defined') as lastname,
	b.type as type,
	sum(b.money) as volume,
	coalesce(c.name, 'not defined') as currency_name,
	coalesce(c.rate_to_usd, 1) as last_rate_to_usd,
	sum(b.money)*coalesce(c.rate_to_usd, 1) as total_volume_in_usd
from "user" as u
	full join balance as b
	on u.id = b.user_id
	full join currency as c
	on b.currency_id = c.id
group by coalesce(u.name, 'not defined'), 
	coalesce(u.lastname, 'not defined'), 
	b.type,
	coalesce(c.name, 'not defined'),
	coalesce(c.rate_to_usd, 1)
order by name desc, lastname, type;