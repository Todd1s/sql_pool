create table person_audit
(
	created timestamp with time zone not null default current_timestamp,
	type_event char(1) not null default 'I',
	row_id bigint not null,
	name varchar not null,
	age integer not null,
	gender varchar not null,
	address varchar not null,
	constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

insert into person_audit(row_id, name, age, gender, address)
select id, name, age, gender, address
from person;

Create or replace function fnc_trg_person_insert_audit() returns trigger as $trg_person_insert_audit$ 
	begin
		if (TG_OP = 'INSERT') then
			insert into person_audit Select now(), 'I', NEW.*;
		end if;
		return null;
	end;
$trg_person_insert_audit$ language plpgsql;

create trigger trg_person_insert_audit
	after insert on person
	for each row execute function fnc_trg_person_insert_audit();

