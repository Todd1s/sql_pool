create or replace function fnc_trg_person_update_audit() returns trigger as $trg_person_update_audit$
	begin
		if (TG_OP = 'UPDATE') then
			insert into person_audit select now(), 'U', NEW.*;
		end if;
		return null;
	end;
$trg_person_update_audit$ language plpgsql;

Create trigger trg_person_update_audit
	after update on person
	for each row execute function fnc_trg_person_update_audit();