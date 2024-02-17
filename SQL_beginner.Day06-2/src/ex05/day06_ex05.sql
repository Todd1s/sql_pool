comment on table person_discounts is 'Let''s expand our data model to involve a new business feature. Every person wants to see a personal discount and every business wants to be closer for clients.';
comment on column person_discounts.id is 'it''s coulumn with unique id of row';
comment on column person_discounts.person_id is 'it''s coulumn with persons id who ordered pizza (it''s aggregated state by person_id and pizzeria_id columns)';
comment on column person_discounts.pizzeria_id is 'it''s coulumn with pizzeria id where persons bought pizza (it''s aggregated state by person_id and pizzeria_id columns)';
comment on column person_discounts.discount is 'it''s coulumn with personal discount on next rule: if “amount of orders” = 1 then “discount” = 10.5  else if “amount of orders” = 2 then  “discount” = 22 else  “discount” = 30';
